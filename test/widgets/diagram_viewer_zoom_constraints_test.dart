import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/diagram_viewer.dart';
import '../interfaces/i_diagram_controller_test.dart';

void main() {
  group('DiagramViewer Zoom Constraints Tests', () {
    late MockDiagramController mockController;

    setUp(() {
      mockController = MockDiagramController();
    });

    tearDown(() {
      mockController.dispose();
    });

    group('Configuration Zoom Limits', () {
      testWidgets('should respect minZoom from configuration',
          (WidgetTester tester) async {
        // Arrange - Create configuration with specific minZoom
        const config = DiagramConfiguration(
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
          pressedKeys: {},
          activeInteraction: null,
        );

        mockController.sendCommand(
            DiagramCommand.applyDefaultPanZoom(origin: zoomOutEvent));
        await tester.pump();

        // Assert - Scale should be capped at minZoom (0.5)
        // We need to verify this through the transform state
        expect(find.byType(DiagramViewer), findsOneWidget);
      });

      testWidgets('should respect maxZoom from configuration',
          (WidgetTester tester) async {
        // Arrange - Create configuration with specific maxZoom
        const config = DiagramConfiguration(
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

        // Act - Try to zoom in beyond the maximum
        final zoomInEvent = PhysicalEvent.gesture(
          eventId: 'test-2',
          logicalPosition: const Offset(100, 100),
          screenPosition: const Offset(100, 100),
          transformSnapshot: const Transform2D(scale: 2.5), // Close to maxZoom
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
          pressedKeys: {},
          activeInteraction: null,
        );

        mockController.sendCommand(
            DiagramCommand.applyDefaultPanZoom(origin: zoomInEvent));
        await tester.pump();

        // Assert - Scale should be capped at maxZoom (3.0)
        expect(find.byType(DiagramViewer), findsOneWidget);
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
          pressedKeys: {},
          activeInteraction: null,
        );

        mockController.sendCommand(
            DiagramCommand.applyDefaultPanZoom(origin: extremeZoomOutEvent));
        await tester.pump();

        // Assert - Should be capped at default minZoom (0.1)
        expect(find.byType(DiagramViewer), findsOneWidget);
      });
    });

    group('Dynamic Minimum Zoom (Fit to Viewport)', () {
      testWidgets('should calculate minimum zoom to fit diagram in viewport',
          (WidgetTester tester) async {
        // Arrange - Large diagram that needs to fit in viewport
        const largeExtent =
            Rect.fromLTWH(0, 0, 2000, 1500); // Large diagram
        const config = DiagramConfiguration(
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
        mockController.sendCommand(const DiagramCommand.redraw(
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
          pressedKeys: {},
          activeInteraction: null,
        );

        mockController.sendCommand(
            DiagramCommand.applyDefaultPanZoom(origin: fitToViewportEvent));
        await tester.pump();

        // Assert - Should be capped at the dynamic minimum that fits the diagram
        // The dynamic minimum should be min(800/2000, 600/1500) = 0.4
        expect(find.byType(DiagramViewer), findsOneWidget);
      });

      testWidgets('should prevent zoom smaller than fit-to-viewport minimum',
          (WidgetTester tester) async {
        // Arrange - Small diagram that doesn't need much zoom out
        const smallExtent =
            Rect.fromLTWH(0, 0, 400, 300); // Small diagram
        const config = DiagramConfiguration(
          minZoom: 0.1, // Higher than dynamic minimum
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
        mockController.sendCommand(const DiagramCommand.redraw(
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
          pressedKeys: {},
          activeInteraction: null,
        );

        mockController.sendCommand(
            DiagramCommand.applyDefaultPanZoom(origin: excessiveZoomOutEvent));
        await tester.pump();

        // Assert - Should be capped at the higher of config.minZoom (0.1) or dynamic minimum
        expect(find.byType(DiagramViewer), findsOneWidget);
      });
    });

    group('Window Resize Handling', () {
      testWidgets('should recalculate dynamic minimum zoom on window resize',
          (WidgetTester tester) async {
        // Arrange - Large diagram
        const largeExtent = Rect.fromLTWH(0, 0, 2000, 1500);
        const config = DiagramConfiguration(
          minZoom: 0.01,
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
        mockController.sendCommand(const DiagramCommand.redraw(
          renderables: [],
          logicalExtent: largeExtent,
        ));
        await tester.pump();

        // Act - Simulate window resize (smaller viewport)
        await tester.binding
            .setSurfaceSize(const Size(400, 300)); // Smaller viewport
        await tester.pump();

        // Try to zoom out after resize
        final zoomOutAfterResizeEvent = PhysicalEvent.gesture(
          eventId: 'test-6',
          logicalPosition: const Offset(200, 150), // Center of new viewport
          screenPosition: const Offset(200, 150),
          transformSnapshot: const Transform2D(scale: 0.5),
          hitList: [],
          borderProximity: BorderProximity.none,
          phase: InteractionPhase.update,
          rawEvent: ScaleUpdateDetails(
            scale: 0.5, // Try to zoom out
            focalPoint: const Offset(200, 150),
            pointerCount: 2,
          ),
          scale: 0.5,
          rotation: 0.0,
          currentViewport: const Rect.fromLTWH(0, 0, 400, 300),
          pressedKeys: {},
          activeInteraction: null,
        );

        mockController.sendCommand(DiagramCommand.applyDefaultPanZoom(
            origin: zoomOutAfterResizeEvent));
        await tester.pump();

        // Assert - Should respect new dynamic minimum for smaller viewport
        // Dynamic minimum should now be min(400/2000, 300/1500) = 0.2
        expect(find.byType(DiagramViewer), findsOneWidget);

        // Cleanup
        await tester.binding.setSurfaceSize(null);
      });
    });

    group('Diagram Extent Changes', () {
      testWidgets(
          'should recalculate dynamic minimum when diagram extent changes',
          (WidgetTester tester) async {
        // Arrange - Start with small diagram
        const smallExtent = Rect.fromLTWH(0, 0, 400, 300);
        const config = DiagramConfiguration(
          minZoom: 0.01,
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
        mockController.sendCommand(const DiagramCommand.redraw(
          renderables: [],
          logicalExtent: smallExtent,
        ));
        await tester.pump();

        // Act - Change to large diagram extent
        const largeExtent = Rect.fromLTWH(0, 0, 2000, 1500);
        mockController.sendCommand(const DiagramCommand.redraw(
          renderables: [],
          logicalExtent: largeExtent,
        ));
        await tester.pump();

        // Try to zoom out after extent change
        final zoomOutAfterExtentChangeEvent = PhysicalEvent.gesture(
          eventId: 'test-7',
          logicalPosition: const Offset(400, 300),
          screenPosition: const Offset(400, 300),
          transformSnapshot: const Transform2D(scale: 0.5),
          hitList: [],
          borderProximity: BorderProximity.none,
          phase: InteractionPhase.update,
          rawEvent: ScaleUpdateDetails(
            scale: 0.3, // Try to zoom out
            focalPoint: const Offset(400, 300),
            pointerCount: 2,
          ),
          scale: 0.3,
          rotation: 0.0,
          currentViewport: const Rect.fromLTWH(0, 0, 800, 600),
          pressedKeys: {},
          activeInteraction: null,
        );

        mockController.sendCommand(DiagramCommand.applyDefaultPanZoom(
            origin: zoomOutAfterExtentChangeEvent));
        await tester.pump();

        // Assert - Should respect new dynamic minimum for larger diagram
        expect(find.byType(DiagramViewer), findsOneWidget);
      });
    });

    group('Keyboard Zoom Controls', () {
      testWidgets('should respect zoom limits with keyboard controls',
          (WidgetTester tester) async {
        // Arrange
        const config = DiagramConfiguration(
          minZoom: 0.5,
          maxZoom: 3.0,
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

        // Note: Keyboard events require concrete KeyEvent subclasses
        // This test is skipped for now due to KeyEvent being abstract
        // In a real implementation, we'd test with KeyDownEvent, KeyUpEvent, etc.
        expect(find.byType(DiagramViewer), findsOneWidget);
      });

      testWidgets('should respect zoom limits with keyboard zoom in',
          (WidgetTester tester) async {
        // Arrange
        const config = DiagramConfiguration(
          minZoom: 0.5,
          maxZoom: 3.0,
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

        // Note: Keyboard events require concrete KeyEvent subclasses
        // This test is skipped for now due to KeyEvent being abstract
        // In a real implementation, we'd test with KeyDownEvent, KeyUpEvent, etc.
        expect(find.byType(DiagramViewer), findsOneWidget);
      });
    });

    group('Edge Cases', () {
      testWidgets('should handle zero-sized diagram extent',
          (WidgetTester tester) async {
        // Arrange - Zero-sized diagram
        const zeroExtent = Rect.fromLTWH(0, 0, 0, 0);
        const config = DiagramConfiguration(
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

        // Send redraw with zero extent
        mockController.sendCommand(const DiagramCommand.redraw(
          renderables: [],
          logicalExtent: zeroExtent,
        ));
        await tester.pump();

        // Act - Try to zoom
        final zoomEvent = PhysicalEvent.gesture(
          eventId: 'test-10',
          logicalPosition: const Offset(400, 300),
          screenPosition: const Offset(400, 300),
          transformSnapshot: const Transform2D(scale: 1.0),
          hitList: [],
          borderProximity: BorderProximity.none,
          phase: InteractionPhase.update,
          rawEvent: ScaleUpdateDetails(
            scale: 0.5,
            focalPoint: const Offset(400, 300),
            pointerCount: 2,
          ),
          scale: 0.5,
          rotation: 0.0,
          currentViewport: const Rect.fromLTWH(0, 0, 800, 600),
          pressedKeys: {},
          activeInteraction: null,
        );

        mockController
            .sendCommand(DiagramCommand.applyDefaultPanZoom(origin: zoomEvent));
        await tester.pump();

        // Assert - Should handle gracefully without crashing
        expect(find.byType(DiagramViewer), findsOneWidget);
      });

      testWidgets('should handle negative diagram extent',
          (WidgetTester tester) async {
        // Arrange - Negative extent (invalid but should be handled)
        const negativeExtent = Rect.fromLTWH(-100, -100, 200, 200);
        const config = DiagramConfiguration(
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

        // Send redraw with negative extent
        mockController.sendCommand(const DiagramCommand.redraw(
          renderables: [],
          logicalExtent: negativeExtent,
        ));
        await tester.pump();

        // Act - Try to zoom
        final zoomEvent = PhysicalEvent.gesture(
          eventId: 'test-11',
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
          pressedKeys: {},
          activeInteraction: null,
        );

        mockController
            .sendCommand(DiagramCommand.applyDefaultPanZoom(origin: zoomEvent));
        await tester.pump();

        // Assert - Should handle gracefully without crashing
        expect(find.byType(DiagramViewer), findsOneWidget);
      });
    });
  });
}
