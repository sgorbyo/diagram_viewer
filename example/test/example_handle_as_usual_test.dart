import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:diagram_viewer/events/events.dart';
import 'package:diagram_viewer/events/transform_2d.dart';
import 'package:diagram_viewer/events/mouse_button.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import '../lib/controllers/example_diagram_controller.dart';

void main() {
  group('HandleAsUsual Command Tests', () {
    late ExampleDiagramController controller;
    late List<DiagramCommand> sentCommands;

    setUp(() {
      controller = ExampleDiagramController();
      sentCommands = [];

      // Capture commands sent by the controller
      controller.commandStream.listen((command) {
        sentCommands.add(command);
      });
    });

    test(
        'should send handleAsUsual for browsing events when selection is disabled',
        () async {
      // Arrange
      controller.setSelectionMode(false);
      expect(controller.isSelectionModeEnabled, isFalse);

      // Clear any initial commands
      sentCommands.clear();

      // Act - Send a browsing event (drag on empty space)
      final browsingEvent = DiagramEventUnion.dragBegin(
        DiagramDragBegin(
          eventId: 'test-browsing-event',
          logicalPosition: const Offset(300, 300),
          screenPosition: const Offset(600, 600),
          transformSnapshot: Transform2D.identity,
          hitList: [], // Empty space - no objects hit
          timestamp: Duration.zero,
          metadata: {'pressedKeys': []},
          fingerCount: 1,
          mouseButton: MouseButton.left,
          isOnObject: false,
        ),
      );

      controller.eventsSink.add(browsingEvent);

      // Wait for async processing
      await Future.delayed(const Duration(milliseconds: 100));

      // Assert - Should have sent handleAsUsual command
      expect(sentCommands, isNotEmpty);
      expect(
        sentCommands.any((cmd) => cmd.maybeWhen(
              handleAsUsual: (_) => true,
              orElse: () => false,
            )),
        isTrue,
        reason: 'Should send handleAsUsual for browsing events',
      );

      // Should NOT have sent selection commands
      expect(
        sentCommands.any((cmd) => cmd.maybeWhen(
              showSelectionOverlay: (_) => true,
              orElse: () => false,
            )),
        isFalse,
        reason: 'Should not send selection commands for browsing',
      );
    });

    test('should send handleAsUsual for drag continue events during browsing',
        () async {
      // Arrange
      controller.setSelectionMode(false);
      sentCommands.clear();

      // Start browsing with drag begin
      final dragBeginEvent = DiagramEventUnion.dragBegin(
        DiagramDragBegin(
          eventId: 'test-browsing-drag',
          logicalPosition: const Offset(300, 300),
          screenPosition: const Offset(600, 600),
          transformSnapshot: Transform2D.identity,
          hitList: [],
          timestamp: Duration.zero,
          metadata: {'pressedKeys': []},
          fingerCount: 1,
          mouseButton: MouseButton.left,
          isOnObject: false,
        ),
      );

      controller.eventsSink.add(dragBeginEvent);
      sentCommands.clear(); // Clear the drag begin command

      // Act - Send drag continue
      final dragContinueEvent = DiagramEventUnion.dragContinue(
        DiagramDragContinue(
          eventId: 'test-browsing-drag',
          logicalPosition: const Offset(350, 350),
          screenPosition: const Offset(650, 650),
          transformSnapshot: Transform2D.identity,
          hitList: [],
          timestamp: Duration.zero,
          metadata: {'pressedKeys': []},
          delta: const Offset(50, 50),
          totalDelta: const Offset(50, 50),
          duration: Duration.zero,
          velocity: Offset.zero,
        ),
      );

      controller.eventsSink.add(dragContinueEvent);

      // Wait for async processing
      await Future.delayed(const Duration(milliseconds: 100));

      // Assert - Should have sent handleAsUsual for drag continue
      expect(sentCommands, isNotEmpty);
      expect(
        sentCommands.any((cmd) => cmd.maybeWhen(
              handleAsUsual: (_) => true,
              orElse: () => false,
            )),
        isTrue,
        reason: 'Should send handleAsUsual for drag continue during browsing',
      );
    });

    test('should send handleAsUsual for drag end events during browsing',
        () async {
      // Arrange
      controller.setSelectionMode(false);
      sentCommands.clear();

      // Start browsing with drag begin and continue
      final dragBeginEvent = DiagramEventUnion.dragBegin(
        DiagramDragBegin(
          eventId: 'test-browsing-drag',
          logicalPosition: const Offset(300, 300),
          screenPosition: const Offset(600, 600),
          transformSnapshot: Transform2D.identity,
          hitList: [],
          timestamp: Duration.zero,
          metadata: {'pressedKeys': []},
          fingerCount: 1,
          mouseButton: MouseButton.left,
          isOnObject: false,
        ),
      );

      final dragContinueEvent = DiagramEventUnion.dragContinue(
        DiagramDragContinue(
          eventId: 'test-browsing-drag',
          logicalPosition: const Offset(350, 350),
          screenPosition: const Offset(650, 650),
          transformSnapshot: Transform2D.identity,
          hitList: [],
          timestamp: Duration.zero,
          metadata: {'pressedKeys': []},
          delta: const Offset(50, 50),
          totalDelta: const Offset(50, 50),
          duration: Duration.zero,
          velocity: Offset.zero,
        ),
      );

      controller.eventsSink.add(dragBeginEvent);
      controller.eventsSink.add(dragContinueEvent);
      sentCommands.clear(); // Clear previous commands

      // Act - Send drag end
      final dragEndEvent = DiagramEventUnion.dragEnd(
        DiagramDragEnd(
          eventId: 'test-browsing-drag',
          logicalPosition: const Offset(400, 400),
          screenPosition: const Offset(700, 700),
          transformSnapshot: Transform2D.identity,
          hitList: [],
          timestamp: Duration.zero,
          metadata: {'pressedKeys': []},
          totalDelta: const Offset(100, 100),
          totalDuration: Duration.zero,
          finalVelocity: Offset.zero,
          wasCancelled: false,
        ),
      );

      controller.eventsSink.add(dragEndEvent);

      // Wait for async processing
      await Future.delayed(const Duration(milliseconds: 100));

      // Assert - Should have sent handleAsUsual for drag end
      expect(sentCommands, isNotEmpty);
      expect(
        sentCommands.any((cmd) => cmd.maybeWhen(
              handleAsUsual: (_) => true,
              orElse: () => false,
            )),
        isTrue,
        reason: 'Should send handleAsUsual for drag end during browsing',
      );
    });

    test(
        'should NOT send handleAsUsual when objects are hit (object drag mode)',
        () async {
      // Arrange
      controller.setSelectionMode(false);
      sentCommands.clear();

      // Act - Send drag event that hits an object
      final objectDragEvent = DiagramEventUnion.dragBegin(
        DiagramDragBegin(
          eventId: 'test-object-drag',
          logicalPosition: const Offset(100, 100),
          screenPosition: const Offset(200, 200),
          transformSnapshot: Transform2D.identity,
          hitList: [MockDiagramObject()], // Object hit - should not be browsing
          timestamp: Duration.zero,
          metadata: {'pressedKeys': []},
          fingerCount: 1,
          mouseButton: MouseButton.left,
          isOnObject: true,
        ),
      );

      controller.eventsSink.add(objectDragEvent);

      // Wait for async processing
      await Future.delayed(const Duration(milliseconds: 100));

      // Assert - Should NOT have sent handleAsUsual (should handle object drag instead)
      expect(
        sentCommands.any((cmd) => cmd.maybeWhen(
              handleAsUsual: (_) => true,
              orElse: () => false,
            )),
        isFalse,
        reason: 'Should not send handleAsUsual when objects are hit',
      );
    });

    test('should NOT send handleAsUsual when selection mode is enabled',
        () async {
      // Arrange
      controller.setSelectionMode(true);
      expect(controller.isSelectionModeEnabled, isTrue);
      sentCommands.clear();

      // Act - Send browsing event with selection mode enabled
      final browsingEvent = DiagramEventUnion.dragBegin(
        DiagramDragBegin(
          eventId: 'test-selection-browsing',
          logicalPosition: const Offset(300, 300),
          screenPosition: const Offset(600, 600),
          transformSnapshot: Transform2D.identity,
          hitList: [], // Empty space
          timestamp: Duration.zero,
          metadata: {'pressedKeys': []},
          fingerCount: 1,
          mouseButton: MouseButton.left,
          isOnObject: false,
        ),
      );

      controller.eventsSink.add(browsingEvent);

      // Wait for async processing
      await Future.delayed(const Duration(milliseconds: 100));

      // Assert - Should NOT have sent handleAsUsual (should start selection instead)
      expect(
        sentCommands.any((cmd) => cmd.maybeWhen(
              handleAsUsual: (_) => true,
              orElse: () => false,
            )),
        isFalse,
        reason: 'Should not send handleAsUsual when selection mode is enabled',
      );

      // Should have sent selection commands instead
      expect(
        sentCommands.any((cmd) => cmd.maybeWhen(
              showSelectionOverlay: (_) => true,
              orElse: () => false,
            )),
        isTrue,
        reason: 'Should send selection commands when selection mode is enabled',
      );
    });

    test(
        'should handle Shift+click for selection even when selection mode is disabled',
        () async {
      // Arrange
      controller.setSelectionMode(false);
      expect(controller.isSelectionModeEnabled, isFalse);
      sentCommands.clear();

      // Act - Send browsing event with Shift key pressed
      final shiftBrowsingEvent = DiagramEventUnion.dragBegin(
        DiagramDragBegin(
          eventId: 'test-shift-browsing',
          logicalPosition: const Offset(300, 300),
          screenPosition: const Offset(600, 600),
          transformSnapshot: Transform2D.identity,
          hitList: [], // Empty space
          timestamp: Duration.zero,
          metadata: {
            'pressedKeys': ['Shift']
          }, // Shift key pressed
          fingerCount: 1,
          mouseButton: MouseButton.left,
          isOnObject: false,
        ),
      );

      controller.eventsSink.add(shiftBrowsingEvent);

      // Wait for async processing
      await Future.delayed(const Duration(milliseconds: 100));

      // Assert - Should NOT have sent handleAsUsual (Shift+click should start selection)
      expect(
        sentCommands.any((cmd) => cmd.maybeWhen(
              handleAsUsual: (_) => true,
              orElse: () => false,
            )),
        isFalse,
        reason: 'Shift+click should not send handleAsUsual',
      );

      // Should have sent selection commands instead
      expect(
        sentCommands.any((cmd) => cmd.maybeWhen(
              showSelectionOverlay: (_) => true,
              orElse: () => false,
            )),
        isTrue,
        reason:
            'Shift+click should start selection even when selection mode is disabled',
      );
    });
  });
}

// Mock object for testing
class MockDiagramObject implements DiagramObjectEntity {
  @override
  String get id => 'mock-object';

  @override
  Rect get logicalBounds => const Rect.fromLTWH(0, 0, 100, 100);

  @override
  int get zOrder => 0;

  @override
  bool get isVisible => true;

  @override
  void paint(Canvas canvas) {}

  @override
  bool contains(Offset point) {
    return logicalBounds.contains(point);
  }

  @override
  Offset get center => logicalBounds.center;

  @override
  bool get isInteractive => true;

  @override
  bool get isSelected => false;

  @override
  List<Object?> get props => [id];

  @override
  bool get stringify => true;
}
