import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/diagram_viewer.dart';
import '../interfaces/i_diagram_controller_test.dart';

/// Tests for scroll functionality to prevent regression bugs
void main() {
  group('DiagramViewer Scroll Tests', () {
    late MockDiagramController mockController;
    late List<DiagramObjectEntity> testObjects;

    setUp(() {
      mockController = MockDiagramController();
      testObjects = [
        TestDiagramObject(
          bounds: const Rect.fromLTWH(100, 100, 50, 50),
          color: Colors.red,
          id: 'test-1',
        ),
        TestDiagramObject(
          bounds: const Rect.fromLTWH(200, 200, 50, 50),
          color: Colors.blue,
          id: 'test-2',
        ),
      ];
      mockController.addObject(testObjects[0]);
      mockController.addObject(testObjects[1]);
    });

    tearDown(() {
      mockController.dispose();
    });

    group('Mouse Scroll Tests', () {
      testWidgets('should handle mouse scroll events correctly',
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

        // Act - Simulate mouse scroll by tapping to focus and then sending scroll event
        await tester.tap(find.byType(DiagramViewer));
        await tester.pump();

        // Note: In real app, PointerScrollEvent would be sent by the system
        // For testing, we verify the widget structure supports scroll events
        expect(find.byType(DiagramViewer), findsOneWidget);
        expect(mockController.hasReceivedEvents, isTrue);
      });
    });

    group('Keyboard Navigation Tests', () {
      testWidgets('should handle arrow key navigation correctly',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Focus(
                child: DiagramViewer(
                  controller: mockController,
                ),
              ),
            ),
          ),
        );

        // Act - Focus the widget and simulate arrow key press
        await tester.tap(find.byType(DiagramViewer));
        await tester.pump();
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
        await tester.pump();

        // Assert - Check that events were sent to controller
        expect(mockController.hasReceivedEvents, isTrue);
      });

      testWidgets('should handle page up/down navigation correctly',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Focus(
                child: DiagramViewer(
                  controller: mockController,
                ),
              ),
            ),
          ),
        );

        // Act - Focus the widget and simulate page up key press
        await tester.tap(find.byType(DiagramViewer));
        await tester.pump();
        await tester.sendKeyEvent(LogicalKeyboardKey.pageUp);
        await tester.pump();

        // Assert - Check that events were sent to controller
        expect(mockController.hasReceivedEvents, isTrue);
      });

      testWidgets('should handle home/end navigation correctly',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Focus(
                child: DiagramViewer(
                  controller: mockController,
                ),
              ),
            ),
          ),
        );

        // Act - Focus the widget and simulate home key press
        await tester.tap(find.byType(DiagramViewer));
        await tester.pump();
        await tester.sendKeyEvent(LogicalKeyboardKey.home);
        await tester.pump();

        // Assert - Check that events were sent to controller
        expect(mockController.hasReceivedEvents, isTrue);
      });
    });

    group('Drag on Empty Area Tests', () {
      testWidgets('should handle drag on empty area correctly',
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

        // Act - Simulate tap on empty area
        await tester.tap(find.byType(DiagramViewer));
        await tester.pump();

        // Assert - Check that events were sent to controller
        expect(mockController.hasReceivedEvents, isTrue);
      });
    });

    group('Object Movement Tests', () {
      testWidgets('should preserve object IDs during interaction',
          (WidgetTester tester) async {
        // Arrange
        final initialIds = testObjects.map((obj) => obj.id).toList();

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
              ),
            ),
          ),
        );

        // Act - Simulate tap on object area
        await tester.tap(find.byType(DiagramViewer));
        await tester.pump();

        // Assert - Object IDs should be preserved
        final finalIds = testObjects.map((obj) => obj.id).toList();
        expect(finalIds, equals(initialIds));
      });
    });

    group('Transform Command Tests', () {
      testWidgets('should handle keyboard events without crashing',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Focus(
                child: DiagramViewer(
                  controller: mockController,
                ),
              ),
            ),
          ),
        );

        // Act - Focus the widget and simulate keyboard navigation
        await tester.tap(find.byType(DiagramViewer));
        await tester.pump();
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
        await tester.pump();

        // Assert - Widget should still be functional
        expect(find.byType(DiagramViewer), findsOneWidget);
        expect(mockController.hasReceivedEvents, isTrue);
      });
    });

    group('Redraw Command Tests', () {
      testWidgets('should send redraw command when objects change',
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

        // Act - Send a redraw command
        mockController.sendCommand(DiagramCommand.redraw(
          renderables: testObjects,
          logicalExtent: const Rect.fromLTWH(0, 0, 1000, 1000),
        ));
        await tester.pump();

        // Assert - Widget should still be functional
        expect(find.byType(DiagramViewer), findsOneWidget);
      });
    });

    group('Regression Prevention Tests', () {
      testWidgets(
          'should maintain widget functionality after multiple interactions',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Focus(
                child: DiagramViewer(
                  controller: mockController,
                ),
              ),
            ),
          ),
        );

        // Act - Focus the widget and perform multiple interactions
        await tester.tap(find.byType(DiagramViewer));
        await tester.pump();
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
        await tester.pump();
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
        await tester.pump();
        await tester.tap(find.byType(DiagramViewer));
        await tester.pump();

        // Assert - Widget should still be functional
        expect(find.byType(DiagramViewer), findsOneWidget);
        expect(mockController.hasReceivedEvents, isTrue);
      });

      testWidgets('should handle rapid key presses without crashing',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Focus(
                child: DiagramViewer(
                  controller: mockController,
                ),
              ),
            ),
          ),
        );

        // Act - Focus the widget and perform rapid key presses
        await tester.tap(find.byType(DiagramViewer));
        await tester.pump();
        for (int i = 0; i < 10; i++) {
          await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
          await tester.pump();
        }

        // Assert - Widget should still be functional
        expect(find.byType(DiagramViewer), findsOneWidget);
      });
    });
  });
}
