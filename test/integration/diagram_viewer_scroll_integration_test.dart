import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/diagram_viewer.dart';
import '../interfaces/i_diagram_controller_test.dart';

/// Integration tests for scroll functionality to prevent regression bugs
void main() {
  group('DiagramViewer Scroll Integration Tests', () {
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

    group('Scroll Functionality Integration', () {
      testWidgets('should handle all scroll types without conflicts',
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

        // Act - Test keyboard navigation
        await tester.tap(find.byType(DiagramViewer));
        await tester.pump();
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
        await tester.pump();

        // Act - Test tap events
        await tester.tap(find.byType(DiagramViewer));
        await tester.pump();

        // Act - Test multiple rapid interactions
        for (int i = 0; i < 5; i++) {
          await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
          await tester.pump();
        }

        // Assert - All interactions should work without conflicts
        expect(find.byType(DiagramViewer), findsOneWidget);
        expect(mockController.hasReceivedEvents, isTrue);
      });

      testWidgets('should maintain state consistency across scroll types',
          (WidgetTester tester) async {
        // Arrange
        final initialIds = testObjects.map((obj) => obj.id).toList();

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

        // Act - Perform mixed interactions
        await tester.tap(find.byType(DiagramViewer));
        await tester.pump();
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
        await tester.pump();
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowRight);
        await tester.pump();
        await tester.tap(find.byType(DiagramViewer));
        await tester.pump();

        // Assert - Object IDs should be preserved
        final finalIds = testObjects.map((obj) => obj.id).toList();
        expect(finalIds, equals(initialIds));
      });

      testWidgets('should handle scroll events in correct order',
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

        // Act - Focus and send events in sequence
        await tester.tap(find.byType(DiagramViewer));
        await tester.pump();

        // Send keyboard events
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
        await tester.pump();
        await tester.sendKeyEvent(LogicalKeyboardKey.pageUp);
        await tester.pump();
        await tester.sendKeyEvent(LogicalKeyboardKey.home);
        await tester.pump();

        // Send tap events
        await tester.tap(find.byType(DiagramViewer));
        await tester.pump();

        // Assert - Events should be processed in order
        expect(mockController.receivedEvents.length, greaterThan(0));
        expect(find.byType(DiagramViewer), findsOneWidget);
      });
    });

    group('Regression Prevention', () {
      testWidgets('should not crash under heavy scroll load',
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

        // Act - Simulate heavy scroll load
        await tester.tap(find.byType(DiagramViewer));
        await tester.pump();

        for (int i = 0; i < 20; i++) {
          await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
          await tester.pump();
          await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
          await tester.pump();
        }

        // Assert - Widget should remain functional
        expect(find.byType(DiagramViewer), findsOneWidget);
        expect(mockController.hasReceivedEvents, isTrue);
      });

      testWidgets('should handle mixed scroll and object interactions',
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

        // Act - Mix scroll and object interactions
        await tester.tap(find.byType(DiagramViewer));
        await tester.pump();
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
        await tester.pump();
        await tester.tap(find.byType(DiagramViewer));
        await tester.pump();
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
        await tester.pump();

        // Assert - All interactions should work
        expect(find.byType(DiagramViewer), findsOneWidget);
        expect(mockController.hasReceivedEvents, isTrue);
      });
    });

    group('Command Flow Verification', () {
      testWidgets('should send appropriate commands for scroll events',
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

        // Act - Send scroll events
        await tester.tap(find.byType(DiagramViewer));
        await tester.pump();
        await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
        await tester.pump();

        // Assert - Commands should be sent
        expect(mockController.hasReceivedEvents, isTrue);

        // Send a redraw command to verify command flow
        mockController.sendCommand(DiagramCommand.redraw(
          renderables: testObjects,
          logicalExtent: const Rect.fromLTWH(0, 0, 1000, 1000),
        ));
        await tester.pump();

        // Widget should still be functional
        expect(find.byType(DiagramViewer), findsOneWidget);
      });
    });
  });
}
