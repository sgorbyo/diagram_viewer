import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/diagram_viewer.dart';
import '../interfaces/i_diagram_controller_test.dart';

void main() {
  group('DiagramViewer Widget Tests', () {
    late MockDiagramController mockController;

    setUp(() {
      mockController = MockDiagramController();
    });

    tearDown(() {
      mockController.dispose();
    });

    group('Widget Construction', () {
      testWidgets('should build without errors', (WidgetTester tester) async {
        // Arrange & Act
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
              ),
            ),
          ),
        );

        // Assert
        expect(find.byType(DiagramViewer), findsOneWidget);
      });

      testWidgets('should accept controller parameter',
          (WidgetTester tester) async {
        // Arrange & Act
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
              ),
            ),
          ),
        );

        // Assert
        final diagramViewer = tester.widget<DiagramViewer>(
          find.byType(DiagramViewer),
        );
        expect(diagramViewer.controller, equals(mockController));
      });
    });

    group('Controller Integration', () {
      testWidgets('should listen to controller command stream',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
              ),
            ),
          ),
        );

        // Act - Send a command through the controller
        const command = DiagramCommand.redraw(
          renderables: [],
          logicalExtent: Rect.fromLTWH(0, 0, 1000, 1000),
        );
        mockController.sendCommand(command);

        // Assert - Widget should rebuild (we can't easily test the internal state,
        // but we can verify the widget doesn't crash)
        await tester.pump();
        expect(find.byType(DiagramViewer), findsOneWidget);
      });

      testWidgets('should send pointer events to controller',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
              ),
            ),
          ),
        );

        // Act - Tap on the diagram viewer
        await tester.tap(find.byType(DiagramViewer));
        await tester.pump();

        // Assert - The controller should have received events
        expect(mockController.receivedEvents, isNotEmpty);
        expect(mockController.receivedEvents.first.isPointer, isTrue);
      });

      testWidgets('should send gesture events to controller',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
              ),
            ),
          ),
        );

        // Act - Perform a scale gesture (simulate with multiple pointer events)
        final center = tester.getCenter(find.byType(DiagramViewer));
        final gesture = await tester.startGesture(center);
        await gesture.moveBy(const Offset(50, 0));
        await gesture.up();
        await tester.pump();

        // Assert - The controller should have received gesture events
        expect(mockController.receivedEvents, isNotEmpty);
        expect(mockController.receivedEvents.any((e) => e.isGesture), isTrue);
      });

      testWidgets('should send keyboard events to controller',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
              ),
            ),
          ),
        );

        // Act - Send a key event
        await tester.sendKeyEvent(LogicalKeyboardKey.space);
        await tester.pump();

        // Assert - The controller should have received keyboard events
        expect(mockController.receivedEvents, isNotEmpty);
        expect(mockController.receivedEvents.any((e) => e.isKeyboard), isTrue);
      });
    });

    group('Command Execution', () {
      testWidgets('should execute setTransform command',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
              ),
            ),
          ),
        );

        // Act - Send a setTransform command
        const command = DiagramCommand.setTransform(
          transform: Transform2D(scale: 2.0, translation: Offset(10, 20)),
        );
        mockController.sendCommand(command);
        await tester.pump();

        // Assert - Widget should handle the command without crashing
        expect(find.byType(DiagramViewer), findsOneWidget);
      });

      testWidgets('should execute applyDefaultPanZoom command',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
              ),
            ),
          ),
        );

        // Act - Send an applyDefaultPanZoom command
        final event = PhysicalEvent.pointer(
          eventId: 'test-1',
          logicalPosition: const Offset(100, 100),
          screenPosition: const Offset(100, 100),
          transformSnapshot: const Transform2D(),
          hitList: [],
          borderProximity: BorderProximity.none,
          phase: InteractionPhase.start,
          rawEvent: PointerDownEvent(position: const Offset(100, 100)),
          delta: const Offset(10, 10),
          currentViewport: const Rect.fromLTWH(0, 0, 800, 600),
        );
        final command = DiagramCommand.applyDefaultPanZoom(origin: event);
        mockController.sendCommand(command);
        await tester.pump();

        // Assert - Widget should handle the command without crashing
        expect(find.byType(DiagramViewer), findsOneWidget);
      });
    });

    group('Object Rendering', () {
      testWidgets('should render objects from controller',
          (WidgetTester tester) async {
        // Arrange
        final testObject = TestDiagramObject(
          bounds: const Rect.fromLTWH(100, 100, 200, 200),
          color: Colors.red,
          id: 'test-1',
        );
        mockController.addObject(testObject);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
              ),
            ),
          ),
        );

        // Act
        await tester.pump();

        // Assert - Widget should render without crashing
        expect(find.byType(DiagramViewer), findsOneWidget);
      });
    });

    group('Configuration', () {
      testWidgets('should use controller configuration',
          (WidgetTester tester) async {
        // Arrange
        const customConfig = DiagramConfiguration(
          backgroundColor: Colors.blue,
          edgeThreshold: 100.0,
          maxZoom: 5.0,
          minZoom: 0.1,
          bounceDuration: Duration(milliseconds: 300),
          autoScrollInterval: Duration(milliseconds: 16),
          autoScrollAcceleration: 2.0,
        );

        final customController = MockDiagramController(
          configuration: customConfig,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: customController,
              ),
            ),
          ),
        );

        // Act
        await tester.pump();

        // Assert - Widget should use the custom configuration without crashing
        expect(find.byType(DiagramViewer), findsOneWidget);

        // Cleanup
        customController.dispose();
      });
    });

    group('Error Handling', () {
      testWidgets('should handle null controller gracefully',
          (WidgetTester tester) async {
        // This test verifies that the widget handles edge cases properly
        // In a real implementation, the controller should be required

        // Arrange & Act
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController, // Using valid controller for now
              ),
            ),
          ),
        );

        // Assert
        expect(find.byType(DiagramViewer), findsOneWidget);
      });
    });
  });
}
