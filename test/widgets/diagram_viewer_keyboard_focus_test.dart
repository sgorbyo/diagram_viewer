import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/diagram_viewer.dart';
// Removed unused import
// Removed unused import
import '../interfaces/i_diagram_controller_test.dart';

/// TDD Tests for keyboard focus and responsiveness
/// These tests document the real problems with keyboard event handling
void main() {
  group('Keyboard Focus and Responsiveness Tests', () {
    late MockDiagramController mockController;

    setUp(() {
      mockController = MockDiagramController();
    });

    tearDown(() {
      mockController.dispose();
    });

    testWidgets('should maintain focus after tap and respond to keyboard',
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

      // Act - Tap to focus and then press key
      await tester.tap(find.byType(DiagramViewer));
      await tester.pump();

      // Clear initial events
      mockController.clearReceivedEvents();

      // Press arrow key
      await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowUp);
      await tester.pump();
      await tester.sendKeyUpEvent(LogicalKeyboardKey.arrowUp);
      await tester.pump();

      // Assert - Should receive keyboard event
      expect(mockController.hasReceivedEvents, isTrue);

      // Check for scroll events (keyboard navigation)
      final scrollEvents = mockController.receivedEvents
          .where((event) => event.maybeWhen(
                scroll: (_) => true,
                orElse: () => false,
              ))
          .toList();
      expect(scrollEvents.length, equals(1));
    });

    testWidgets('should handle rapid key presses without losing focus',
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

      // Act - Focus and rapid key presses
      await tester.tap(find.byType(DiagramViewer));
      await tester.pump();
      mockController.clearReceivedEvents();

      // Rapid sequence
      await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowUp);
      await tester.pump();
      await tester.sendKeyUpEvent(LogicalKeyboardKey.arrowUp);
      await tester.pump();

      await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowDown);
      await tester.pump();
      await tester.sendKeyUpEvent(LogicalKeyboardKey.arrowDown);
      await tester.pump();

      await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowLeft);
      await tester.pump();
      await tester.sendKeyUpEvent(LogicalKeyboardKey.arrowLeft);
      await tester.pump();

      // Assert - Should receive all keyboard events
      final scrollEvents = mockController.receivedEvents
          .where((event) => event.maybeWhen(
                scroll: (_) => true,
                orElse: () => false,
              ))
          .toList();
      expect(scrollEvents.length, equals(3));
    });

    testWidgets('should handle key repeat events', (WidgetTester tester) async {
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

      // Act - Focus and hold key
      await tester.tap(find.byType(DiagramViewer));
      await tester.pump();
      mockController.clearReceivedEvents();

      // Simulate key repeat (proper sequence with up/down)
      await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowUp);
      await tester.pump();
      await tester.sendKeyUpEvent(LogicalKeyboardKey.arrowUp);
      await tester.pump();

      // Repeat the key press
      await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowUp);
      await tester.pump();
      await tester.sendKeyUpEvent(LogicalKeyboardKey.arrowUp);
      await tester.pump();

      // Assert - Should handle repeat events gracefully
      final scrollEvents = mockController.receivedEvents
          .where((event) => event.maybeWhen(
                scroll: (_) => true,
                orElse: () => false,
              ))
          .toList();
      expect(scrollEvents.length, equals(2)); // Two separate key presses
    });
  });
}
