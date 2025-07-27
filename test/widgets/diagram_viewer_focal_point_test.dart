import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/diagram_viewer.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/events/events.dart';
import '../interfaces/i_diagram_controller_test.dart';

void main() {
  group('DiagramViewer Focal Point Tests', () {
    late MockDiagramController mockController;

    setUp(() {
      mockController = MockDiagramController();
    });

    tearDown(() {
      mockController.dispose();
    });

    group('Pinch-to-Zoom Focal Point Stability', () {
      testWidgets('should maintain focal point during pinch-to-zoom',
          (WidgetTester tester) async {
        // Arrange - Create a diagram with objects
        final config = DiagramConfiguration(
          minZoom: 0.1,
          maxZoom: 10.0,
        );

        // Add some test objects to the controller
        final testObject1 = TestDiagramObject(
          bounds: const Rect.fromLTWH(100, 100, 50, 50),
          color: Colors.red,
          id: 'obj1',
        );
        final testObject2 = TestDiagramObject(
          bounds: const Rect.fromLTWH(200, 200, 50, 50),
          color: Colors.blue,
          id: 'obj2',
        );

        mockController.addObject(testObject1);
        mockController.addObject(testObject2);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
                configuration: config,
              ),
            ),
          ),
        );

        // Get initial transform
        final initialTransform = _getCurrentTransform(tester);
        expect(initialTransform?.scale, 1.0);

        // Define focal point (center of the viewport)
        const focalPoint = Offset(400, 300); // Center of 800x600 viewport
        const logicalFocalPoint = Offset(400, 300);

        // Act - Perform pinch-to-zoom at the focal point
        final pinchEvent = PhysicalEvent.gesture(
          eventId: 'test-pinch',
          logicalPosition: logicalFocalPoint,
          screenPosition: focalPoint,
          transformSnapshot: const Transform2D(scale: 1.0),
          hitList: [],
          borderProximity: BorderProximity.none,
          phase: InteractionPhase.update,
          rawEvent: ScaleUpdateDetails(
            scale: 2.0, // Zoom in by 2x
            focalPoint: focalPoint,
            pointerCount: 2,
          ),
          scale: 2.0,
          rotation: 0.0,
          currentViewport: const Rect.fromLTWH(0, 0, 800, 600),
        );

        mockController.sendCommand(
            DiagramCommand.applyDefaultPanZoom(origin: pinchEvent));
        await tester.pump();

        // Assert - The focal point should remain at the same screen position
        final finalTransform = _getCurrentTransform(tester);
        expect(finalTransform?.scale, 2.0);

        // The focal point should remain at the same PHYSICAL screen position
        // This is what the user actually sees and expects
        final focalPointInScreenAfterZoom =
            finalTransform!.logicalToPhysical(logicalFocalPoint);

        // The focal point should remain at the same screen coordinates
        expect(focalPointInScreenAfterZoom.dx, closeTo(focalPoint.dx, 0.1));
        expect(focalPointInScreenAfterZoom.dy, closeTo(focalPoint.dy, 0.1));
      });

      testWidgets('should maintain focal point during pinch-to-zoom out',
          (WidgetTester tester) async {
        // Arrange - Start with zoomed in state
        final config = DiagramConfiguration(
          minZoom: 0.1,
          maxZoom: 10.0,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
                configuration: config,
              ),
            ),
          ),
        );

        // First zoom in to 2x
        final zoomInEvent = PhysicalEvent.gesture(
          eventId: 'test-zoom-in',
          logicalPosition: const Offset(400, 300),
          screenPosition: const Offset(400, 300),
          transformSnapshot: const Transform2D(scale: 1.0),
          hitList: [],
          borderProximity: BorderProximity.none,
          phase: InteractionPhase.update,
          rawEvent: ScaleUpdateDetails(
            scale: 2.0,
            focalPoint: const Offset(400, 300),
            pointerCount: 2,
          ),
          scale: 2.0,
          rotation: 0.0,
          currentViewport: const Rect.fromLTWH(0, 0, 800, 600),
        );

        mockController.sendCommand(
            DiagramCommand.applyDefaultPanZoom(origin: zoomInEvent));
        await tester.pump();

        // Verify we're at 2x zoom
        final zoomedInTransform = _getCurrentTransform(tester);
        expect(zoomedInTransform?.scale, 2.0);

        // Now zoom out to 1x at the same focal point
        const focalPoint = Offset(400, 300);
        const logicalFocalPoint = Offset(400, 300);

        final zoomOutEvent = PhysicalEvent.gesture(
          eventId: 'test-zoom-out',
          logicalPosition: logicalFocalPoint,
          screenPosition: focalPoint,
          transformSnapshot: const Transform2D(scale: 2.0),
          hitList: [],
          borderProximity: BorderProximity.none,
          phase: InteractionPhase.update,
          rawEvent: ScaleUpdateDetails(
            scale: 0.5, // Zoom out by 0.5x (2.0 * 0.5 = 1.0)
            focalPoint: focalPoint,
            pointerCount: 2,
          ),
          scale: 0.5,
          rotation: 0.0,
          currentViewport: const Rect.fromLTWH(0, 0, 800, 600),
        );

        mockController.sendCommand(
            DiagramCommand.applyDefaultPanZoom(origin: zoomOutEvent));
        await tester.pump();

        // Assert - The focal point should remain at the same screen position
        final finalTransform = _getCurrentTransform(tester);
        expect(finalTransform?.scale, 1.0);

        // The focal point should remain at the same PHYSICAL screen position
        final focalPointInScreenAfterZoom =
            finalTransform!.logicalToPhysical(logicalFocalPoint);

        // The focal point should remain at the same screen coordinates
        expect(focalPointInScreenAfterZoom.dx, closeTo(focalPoint.dx, 0.1));
        expect(focalPointInScreenAfterZoom.dy, closeTo(focalPoint.dy, 0.1));
      });

      testWidgets('should maintain focal point at different screen positions',
          (WidgetTester tester) async {
        // Arrange
        final config = DiagramConfiguration(
          minZoom: 0.1,
          maxZoom: 10.0,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
                configuration: config,
              ),
            ),
          ),
        );

        // Test focal point at top-left corner
        const focalPoint = Offset(100, 100);
        const logicalFocalPoint = Offset(100, 100);

        final pinchEvent = PhysicalEvent.gesture(
          eventId: 'test-pinch-corner',
          logicalPosition: logicalFocalPoint,
          screenPosition: focalPoint,
          transformSnapshot: const Transform2D(scale: 1.0),
          hitList: [],
          borderProximity: BorderProximity.none,
          phase: InteractionPhase.update,
          rawEvent: ScaleUpdateDetails(
            scale: 1.5, // Zoom in by 1.5x
            focalPoint: focalPoint,
            pointerCount: 2,
          ),
          scale: 1.5,
          rotation: 0.0,
          currentViewport: const Rect.fromLTWH(0, 0, 800, 600),
        );

        mockController.sendCommand(
            DiagramCommand.applyDefaultPanZoom(origin: pinchEvent));
        await tester.pump();

        // Assert - The focal point should remain at the same screen position
        final finalTransform = _getCurrentTransform(tester);
        expect(finalTransform?.scale, 1.5);

        // The focal point should remain at the same PHYSICAL screen position
        final focalPointInScreenAfterZoom =
            finalTransform!.logicalToPhysical(logicalFocalPoint);

        // The focal point should remain at the same screen coordinates
        expect(focalPointInScreenAfterZoom.dx, closeTo(focalPoint.dx, 0.1));
        expect(focalPointInScreenAfterZoom.dy, closeTo(focalPoint.dy, 0.1));
      });

      testWidgets('should maintain focal point during consecutive zooms',
          (WidgetTester tester) async {
        // Arrange
        final config = DiagramConfiguration(
          minZoom: 0.1,
          maxZoom: 10.0,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
                configuration: config,
              ),
            ),
          ),
        );

        // Test focal point at center
        const focalPoint = Offset(400, 300);
        const logicalFocalPoint = Offset(400, 300);

        // First zoom: 1.0 -> 2.0
        final zoomInEvent1 = PhysicalEvent.gesture(
          eventId: 'test-consecutive-zoom-1',
          logicalPosition: logicalFocalPoint,
          screenPosition: focalPoint,
          transformSnapshot: const Transform2D(scale: 1.0),
          hitList: [],
          borderProximity: BorderProximity.none,
          phase: InteractionPhase.update,
          rawEvent: ScaleUpdateDetails(
            scale: 2.0, // Zoom in by 2x
            focalPoint: focalPoint,
            pointerCount: 2,
          ),
          scale: 2.0,
          rotation: 0.0,
          currentViewport: const Rect.fromLTWH(0, 0, 800, 600),
        );

        mockController.sendCommand(
            DiagramCommand.applyDefaultPanZoom(origin: zoomInEvent1));
        await tester.pump();

        // Verify first zoom
        final transformAfterZoom1 = _getCurrentTransform(tester);
        expect(transformAfterZoom1?.scale, 2.0);

        // Second zoom: 2.0 -> 3.0 (continuing from previous state)
        final zoomInEvent2 = PhysicalEvent.gesture(
          eventId: 'test-consecutive-zoom-2',
          logicalPosition: logicalFocalPoint,
          screenPosition: focalPoint,
          transformSnapshot: Transform2D(scale: 2.0),
          hitList: [],
          borderProximity: BorderProximity.none,
          phase: InteractionPhase.update,
          rawEvent: ScaleUpdateDetails(
            scale: 1.5, // Additional 1.5x zoom (2.0 * 1.5 = 3.0)
            focalPoint: focalPoint,
            pointerCount: 2,
          ),
          scale: 1.5,
          rotation: 0.0,
          currentViewport: const Rect.fromLTWH(0, 0, 800, 600),
        );

        mockController.sendCommand(
            DiagramCommand.applyDefaultPanZoom(origin: zoomInEvent2));
        await tester.pump();

        // Verify second zoom
        final transformAfterZoom2 = _getCurrentTransform(tester);
        expect(transformAfterZoom2?.scale, 3.0);

        // Third zoom: 3.0 -> 1.5 (zoom out)
        final zoomOutEvent = PhysicalEvent.gesture(
          eventId: 'test-consecutive-zoom-3',
          logicalPosition: logicalFocalPoint,
          screenPosition: focalPoint,
          transformSnapshot: Transform2D(scale: 3.0),
          hitList: [],
          borderProximity: BorderProximity.none,
          phase: InteractionPhase.update,
          rawEvent: ScaleUpdateDetails(
            scale: 0.5, // Zoom out by 0.5x (3.0 * 0.5 = 1.5)
            focalPoint: focalPoint,
            pointerCount: 2,
          ),
          scale: 0.5,
          rotation: 0.0,
          currentViewport: const Rect.fromLTWH(0, 0, 800, 600),
        );

        mockController.sendCommand(
            DiagramCommand.applyDefaultPanZoom(origin: zoomOutEvent));
        await tester.pump();

        // Verify third zoom
        final finalTransform = _getCurrentTransform(tester);
        expect(finalTransform?.scale, 1.5);

        // The focal point should remain at the same PHYSICAL screen position throughout all zooms
        final focalPointInScreenAfterZoom =
            finalTransform!.logicalToPhysical(logicalFocalPoint);

        // The focal point should remain at the same screen coordinates
        expect(focalPointInScreenAfterZoom.dx, closeTo(focalPoint.dx, 0.1));
        expect(focalPointInScreenAfterZoom.dy, closeTo(focalPoint.dy, 0.1));
      });

      testWidgets(
          'should maintain focal point during realistic touchpad zoom simulation',
          (WidgetTester tester) async {
        // Arrange
        final config = DiagramConfiguration(
          minZoom: 0.1,
          maxZoom: 10.0,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
                configuration: config,
              ),
            ),
          ),
        );

        // Test focal point at center
        const focalPoint = Offset(400, 300);
        const logicalFocalPoint = Offset(400, 300);

        // Simulate realistic touchpad zoom with small incremental steps
        // This is more like what actually happens on a real touchpad
        double currentScale = 1.0;
        final zoomSteps = [1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9, 2.0];

        for (int i = 0; i < zoomSteps.length; i++) {
          final stepFactor = zoomSteps[i] / (i == 0 ? 1.0 : zoomSteps[i - 1]);
          currentScale *= stepFactor;

          final zoomEvent = PhysicalEvent.gesture(
            eventId: 'test-realistic-zoom-$i',
            logicalPosition: logicalFocalPoint,
            screenPosition: focalPoint,
            transformSnapshot:
                Transform2D(scale: i == 0 ? 1.0 : zoomSteps[i - 1]),
            hitList: [],
            borderProximity: BorderProximity.none,
            phase: InteractionPhase.update,
            rawEvent: ScaleUpdateDetails(
              scale: stepFactor,
              focalPoint: focalPoint,
              pointerCount: 2,
            ),
            scale: stepFactor,
            rotation: 0.0,
            currentViewport: const Rect.fromLTWH(0, 0, 800, 600),
          );

          mockController.sendCommand(
              DiagramCommand.applyDefaultPanZoom(origin: zoomEvent));
          await tester.pump();

          // Verify the focal point remains at the same screen position after each step
          final currentTransform = _getCurrentTransform(tester);
          final focalPointInScreenAfterZoom =
              currentTransform!.logicalToPhysical(logicalFocalPoint);

          // The focal point should remain at the same screen coordinates
          expect(focalPointInScreenAfterZoom.dx, closeTo(focalPoint.dx, 0.1),
              reason:
                  'Focal point X drifted at step $i (scale: ${currentTransform.scale})');
          expect(focalPointInScreenAfterZoom.dy, closeTo(focalPoint.dy, 0.1),
              reason:
                  'Focal point Y drifted at step $i (scale: ${currentTransform.scale})');
        }

        // Final verification
        final finalTransform = _getCurrentTransform(tester);
        expect(finalTransform?.scale, closeTo(2.0, 0.01));

        final finalFocalPointInScreen =
            finalTransform!.logicalToPhysical(logicalFocalPoint);
        expect(finalFocalPointInScreen.dx, closeTo(focalPoint.dx, 0.1));
        expect(finalFocalPointInScreen.dy, closeTo(focalPoint.dy, 0.1));
      });
    });

    // TODO: Mouse wheel zoom focal point stability test
    // This test is temporarily disabled as mouse wheel zoom handling needs improvement
    // group('Mouse Wheel Zoom Focal Point Stability', () {
    //   testWidgets('should maintain focal point during mouse wheel zoom',
    //       (WidgetTester tester) async {
    //     // Implementation will be added when mouse wheel zoom is properly implemented
    //   });
    // });
  });
}

// Helper function to get current transform from DiagramViewer
Transform2D? _getCurrentTransform(WidgetTester tester) {
  final diagramViewer = tester.widget<DiagramViewer>(
    find.byType(DiagramViewer),
  );
  final state = tester.state<State<DiagramViewer>>(find.byType(DiagramViewer));
  return diagramViewer.getCurrentTransform(state);
}
