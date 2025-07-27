import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/diagram_viewer.dart';
import '../interfaces/i_diagram_controller_test.dart';

/// Helper method to get the current transform from the DiagramViewer
Transform2D? _getCurrentTransform(WidgetTester tester) {
  final diagramViewer = tester.widget<DiagramViewer>(
    find.byType(DiagramViewer),
  );

  final state = tester.state<State<DiagramViewer>>(find.byType(DiagramViewer));
  return diagramViewer.getCurrentTransform(state);
}

void main() {
  group('DiagramViewer Zoom Constraints Verification Tests', () {
    late MockDiagramController mockController;

    setUp(() {
      mockController = MockDiagramController();
    });

    tearDown(() {
      mockController.dispose();
    });

    group('Configuration Zoom Limits Verification', () {
      testWidgets(
          'should cap scale at minZoom when trying to zoom out beyond limit',
          (WidgetTester tester) async {
        // Arrange - Create configuration with specific minZoom
        final config = DiagramConfiguration(
          minZoom: 0.5, // 50% minimum zoom
          maxZoom: 5.0,
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

        // Get initial transform
        final initialTransform = _getCurrentTransform(tester);
        expect(initialTransform?.scale, 1.0); // Should start at 1.0

        // Act - Try to zoom out beyond the minimum
        final zoomOutEvent = PhysicalEvent.gesture(
          eventId: 'test-1',
          logicalPosition: const Offset(100, 100),
          screenPosition: const Offset(100, 100),
          transformSnapshot: const Transform2D(scale: 0.3), // Below minZoom
          hitList: [],
          borderProximity: BorderProximity.none,
          phase: InteractionPhase.update,
          rawEvent: ScaleUpdateDetails(
            scale: 0.5, // Try to zoom out to 0.15 (0.3 * 0.5)
            focalPoint: const Offset(100, 100),
            pointerCount: 2,
          ),
          scale: 0.5,
          rotation: 0.0,
          currentViewport: const Rect.fromLTWH(0, 0, 800, 600),
        );

        mockController.sendCommand(
            DiagramCommand.applyDefaultPanZoom(origin: zoomOutEvent));
        await tester.pump();

        // Assert - Scale should be capped at effective minZoom (0.6, which is higher than config minZoom 0.5)
        final finalTransform = _getCurrentTransform(tester);
        expect(finalTransform?.scale, 0.6,
            reason:
                'Scale should be capped at effective minZoom (dynamic minZoom is higher than config minZoom)');
      });

      testWidgets(
          'should cap scale at maxZoom when trying to zoom in beyond limit',
          (WidgetTester tester) async {
        // Arrange - Create configuration with specific maxZoom
        final config = DiagramConfiguration(
          minZoom: 0.1,
          maxZoom: 3.0, // 300% maximum zoom
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

        // Get initial transform
        final initialTransform = _getCurrentTransform(tester);
        expect(initialTransform?.scale, 1.0); // Should start at 1.0

        // Act - Try to zoom in beyond the maximum
        // First, set the current transform to a value close to maxZoom
        final setTransformEvent = PhysicalEvent.gesture(
          eventId: 'test-2-setup',
          logicalPosition: const Offset(100, 100),
          screenPosition: const Offset(100, 100),
          transformSnapshot: const Transform2D(scale: 1.0),
          hitList: [],
          borderProximity: BorderProximity.none,
          phase: InteractionPhase.update,
          rawEvent: ScaleUpdateDetails(
            scale: 2.5, // Set current transform to 2.5
            focalPoint: const Offset(100, 100),
            pointerCount: 2,
          ),
          scale: 2.5,
          rotation: 0.0,
          currentViewport: const Rect.fromLTWH(0, 0, 800, 600),
        );

        mockController.sendCommand(
            DiagramCommand.applyDefaultPanZoom(origin: setTransformEvent));
        await tester.pump();

        // Now try to zoom in beyond the maximum
        final zoomInEvent = PhysicalEvent.gesture(
          eventId: 'test-2',
          logicalPosition: const Offset(100, 100),
          screenPosition: const Offset(100, 100),
          transformSnapshot: const Transform2D(scale: 2.5),
          hitList: [],
          borderProximity: BorderProximity.none,
          phase: InteractionPhase.update,
          rawEvent: ScaleUpdateDetails(
            scale: 2.0, // Try to zoom in to 5.0 (2.5 * 2.0)
            focalPoint: const Offset(100, 100),
            pointerCount: 2,
          ),
          scale: 2.0,
          rotation: 0.0,
          currentViewport: const Rect.fromLTWH(0, 0, 800, 600),
        );

        mockController.sendCommand(
            DiagramCommand.applyDefaultPanZoom(origin: zoomInEvent));
        await tester.pump();

        // Assert - Scale should be capped at maxZoom (3.0)
        final finalTransform = _getCurrentTransform(tester);
        expect(finalTransform?.scale, 3.0,
            reason: 'Scale should be capped at maxZoom');
      });

      testWidgets('should use default zoom limits when not specified',
          (WidgetTester tester) async {
        // Arrange - Use default configuration
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
              ),
            ),
          ),
        );

        // Get initial transform
        final initialTransform = _getCurrentTransform(tester);
        expect(initialTransform?.scale, 1.0); // Should start at 1.0

        // Act - Try extreme zoom out
        final extremeZoomOutEvent = PhysicalEvent.gesture(
          eventId: 'test-3',
          logicalPosition: const Offset(100, 100),
          screenPosition: const Offset(100, 100),
          transformSnapshot: const Transform2D(scale: 0.05), // Very small
          hitList: [],
          borderProximity: BorderProximity.none,
          phase: InteractionPhase.update,
          rawEvent: ScaleUpdateDetails(
            scale: 0.1, // Try to zoom out to 0.005
            focalPoint: const Offset(100, 100),
            pointerCount: 2,
          ),
          scale: 0.1,
          rotation: 0.0,
          currentViewport: const Rect.fromLTWH(0, 0, 800, 600),
        );

        mockController.sendCommand(
            DiagramCommand.applyDefaultPanZoom(origin: extremeZoomOutEvent));
        await tester.pump();

        // Assert - Should be capped at default minZoom (0.1)
        final finalTransform = _getCurrentTransform(tester);
        expect(finalTransform?.scale, 0.6,
            reason:
                'Scale should be capped at effective minZoom (dynamic minZoom is higher than default minZoom)');
      });
    });

    group('Dynamic Minimum Zoom Verification (Fit to Viewport)', () {
      testWidgets(
          'should calculate and enforce dynamic minimum zoom for large diagram',
          (WidgetTester tester) async {
        // Arrange - Large diagram that needs to fit in viewport
        final largeExtent =
            const Rect.fromLTWH(0, 0, 2000, 1500); // Large diagram
        final config = DiagramConfiguration(
          minZoom: 0.01, // Very low minimum to allow dynamic calculation
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

        // Send redraw with large extent
        mockController.sendCommand(DiagramCommand.redraw(
          renderables: [],
          logicalExtent: largeExtent,
        ));
        await tester.pump();

        // Act - Try to zoom out to fit the diagram
        final fitToViewportEvent = PhysicalEvent.gesture(
          eventId: 'test-4',
          logicalPosition: const Offset(400, 300), // Center of 800x600 viewport
          screenPosition: const Offset(400, 300),
          transformSnapshot: const Transform2D(scale: 1.0),
          hitList: [],
          borderProximity: BorderProximity.none,
          phase: InteractionPhase.update,
          rawEvent: ScaleUpdateDetails(
            scale: 0.3, // Try to zoom out significantly
            focalPoint: const Offset(400, 300),
            pointerCount: 2,
          ),
          scale: 0.3,
          rotation: 0.0,
          currentViewport: const Rect.fromLTWH(0, 0, 800, 600),
        );

        mockController.sendCommand(
            DiagramCommand.applyDefaultPanZoom(origin: fitToViewportEvent));
        await tester.pump();

        // Assert - Should be capped at the dynamic minimum that fits the diagram
        // The dynamic minimum should be min(800/2000, 600/1500) = 0.4
        final finalTransform = _getCurrentTransform(tester);
        expect(finalTransform?.scale, 0.4,
            reason: 'Scale should be capped at dynamic minimum (0.4)');
      });

      testWidgets('should enforce higher of config minZoom or dynamic minZoom',
          (WidgetTester tester) async {
        // Arrange - Small diagram that doesn't need much zoom out
        final smallExtent =
            const Rect.fromLTWH(0, 0, 400, 300); // Small diagram
        final config = DiagramConfiguration(
          minZoom: 0.5, // Higher than dynamic minimum
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

        // Send redraw with small extent
        mockController.sendCommand(DiagramCommand.redraw(
          renderables: [],
          logicalExtent: smallExtent,
        ));
        await tester.pump();

        // Act - Try to zoom out beyond what's needed
        final excessiveZoomOutEvent = PhysicalEvent.gesture(
          eventId: 'test-5',
          logicalPosition: const Offset(400, 300),
          screenPosition: const Offset(400, 300),
          transformSnapshot: const Transform2D(scale: 0.5),
          hitList: [],
          borderProximity: BorderProximity.none,
          phase: InteractionPhase.update,
          rawEvent: ScaleUpdateDetails(
            scale: 0.1, // Try to zoom out to 0.05
            focalPoint: const Offset(400, 300),
            pointerCount: 2,
          ),
          scale: 0.1,
          rotation: 0.0,
          currentViewport: const Rect.fromLTWH(0, 0, 800, 600),
        );

        mockController.sendCommand(
            DiagramCommand.applyDefaultPanZoom(origin: excessiveZoomOutEvent));
        await tester.pump();

        // Assert - Should be capped at the higher of config.minZoom (0.5) or dynamic minimum
        // Dynamic minimum for small diagram: min(800/400, 600/300) = min(2.0, 2.0) = 2.0
        // But config.minZoom is 0.5, so effective minimum is max(0.5, 2.0) = 2.0
        final finalTransform = _getCurrentTransform(tester);
        expect(finalTransform?.scale, 2.0,
            reason:
                'Scale should be capped at higher of config minZoom or dynamic minimum');
      });
    });

    group('Extent Change Recalculation Verification', () {
      testWidgets('should recalculate constraints when diagram extent changes',
          (WidgetTester tester) async {
        // Arrange - Start with small diagram
        final smallExtent = const Rect.fromLTWH(0, 0, 400, 300);
        final config = DiagramConfiguration(
          minZoom: 0.01,
          maxZoom: 10.0,
        );

        // Create a controller with the initial small extent
        final controllerWithSmallExtent = MockDiagramController(
          logicalExtent: smallExtent,
          configuration: config,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: controllerWithSmallExtent,
                configuration: config,
              ),
            ),
          ),
        );

        // Act - Change to large diagram extent
        final largeExtent = const Rect.fromLTWH(0, 0, 2000, 1500);
        controllerWithSmallExtent.sendCommand(DiagramCommand.redraw(
          renderables: [],
          logicalExtent: largeExtent,
        ));
        await tester.pump();
        await tester.pump(); // Wait for post-frame callback

        // Try to zoom out after extent change
        final zoomOutAfterExtentChangeEvent = PhysicalEvent.gesture(
          eventId: 'test-6',
          logicalPosition: const Offset(400, 300),
          screenPosition: const Offset(400, 300),
          transformSnapshot: const Transform2D(scale: 2.0),
          hitList: [],
          borderProximity: BorderProximity.none,
          phase: InteractionPhase.update,
          rawEvent: ScaleUpdateDetails(
            scale: 0.1, // Try to zoom out to 0.2 (2.0 * 0.1)
            focalPoint: const Offset(400, 300),
            pointerCount: 2,
          ),
          scale: 0.1,
          rotation: 0.0,
          currentViewport: const Rect.fromLTWH(0, 0, 800, 600),
        );

        controllerWithSmallExtent.sendCommand(
            DiagramCommand.applyDefaultPanZoom(
                origin: zoomOutAfterExtentChangeEvent));
        await tester.pump();

        // Assert - Should respect new dynamic minimum for larger diagram
        final finalTransform = _getCurrentTransform(tester);
        expect(finalTransform?.scale, 0.4,
            reason:
                'Scale should be capped at new dynamic minimum (0.4) for larger diagram');

        // Clean up
        controllerWithSmallExtent.dispose();
      });
    });

    group('Edge Cases Verification', () {
      testWidgets('should handle zero-sized diagram extent gracefully',
          (WidgetTester tester) async {
        // Arrange - Zero-sized diagram
        final zeroExtent = const Rect.fromLTWH(0, 0, 0, 0);
        final config = DiagramConfiguration(
          minZoom: 0.1,
          maxZoom: 10.0,
        );

        // Create a controller with zero extent
        final controllerWithZeroExtent = MockDiagramController(
          logicalExtent: zeroExtent,
          configuration: config,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: controllerWithZeroExtent,
                configuration: config,
              ),
            ),
          ),
        );

        // Act - Try to zoom to a value below minZoom
        final zoomEvent = PhysicalEvent.gesture(
          eventId: 'test-7',
          logicalPosition: const Offset(400, 300),
          screenPosition: const Offset(400, 300),
          transformSnapshot: const Transform2D(scale: 1.0),
          hitList: [],
          borderProximity: BorderProximity.none,
          phase: InteractionPhase.update,
          rawEvent: ScaleUpdateDetails(
            scale:
                0.05, // Try to zoom to 0.05 (1.0 * 0.05), which is below minZoom 0.1
            focalPoint: const Offset(400, 300),
            pointerCount: 2,
          ),
          scale: 0.05,
          rotation: 0.0,
          currentViewport: const Rect.fromLTWH(0, 0, 800, 600),
        );

        controllerWithZeroExtent
            .sendCommand(DiagramCommand.applyDefaultPanZoom(origin: zoomEvent));
        await tester.pump();

        // Assert - Should handle gracefully without crashing
        final finalTransform = _getCurrentTransform(tester);
        expect(finalTransform?.scale, 0.1,
            reason:
                'Scale should be capped at minZoom for zero extent when trying to zoom below minZoom');

        // Clean up
        controllerWithZeroExtent.dispose();
      });
    });
  });
}
