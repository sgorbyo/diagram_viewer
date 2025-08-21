import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/diagram_viewer.dart';
import 'package:diagram_viewer/events/events.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import '../lib/controllers/example_diagram_controller.dart';

void main() {
  group('Selection vs Pan Mutual Exclusivity Tests', () {
    late ExampleDiagramController controller;
    late List<DiagramCommand> sentCommands;

    setUp(() {
      sentCommands = [];
      controller = ExampleDiagramController();

      // Capture commands sent to DiagramViewer
      controller.commandStream.listen(sentCommands.add);
    });

    tearDown(() {
      controller.dispose();
    });

    test('should send ONLY selection commands when selection mode is active',
        () async {
      // Arrange
      controller.setSelectionMode(true);
      expect(controller.isSelectionModeEnabled, isTrue);

      // Clear any initial commands
      sentCommands.clear();

      // Act - Send dragBegin event that should trigger selection
      final dragBeginEvent = DiagramEventUnion.dragBegin(
        DiagramDragBegin(
          eventId: 'test-selection-only',
          logicalPosition: const Offset(100, 100),
          screenPosition: const Offset(200, 200),
          transformSnapshot: Transform2D.identity,
          hitList: [], // Empty space - should trigger selection
          timestamp: Duration.zero,
          metadata: {'pressedKeys': []},
          fingerCount: 1,
          mouseButton: MouseButton.left,
          isOnObject: false,
        ),
      );

      controller.eventsSink.add(dragBeginEvent);

      // Wait for processing
      await Future.delayed(const Duration(milliseconds: 100));

      // Assert - Should have sent commands
      expect(sentCommands, isNotEmpty);

      // Should have sent showSelectionOverlay command
      expect(
          sentCommands.any((cmd) => cmd.maybeWhen(
                showSelectionOverlay: (_) => true,
                orElse: () => false,
              )),
          isTrue);

      // CRITICAL: Should NOT have sent setTransform command (which would cause pan)
      expect(
          sentCommands.any((cmd) => cmd.maybeWhen(
                setTransform: (_) => true,
                orElse: () => false,
              )),
          isFalse);
    }, timeout: const Timeout(Duration(seconds: 10)));

    test('should send ONLY pan commands when selection mode is NOT active',
        () async {
      // Arrange
      controller.setSelectionMode(false);
      expect(controller.isSelectionModeEnabled, isFalse);

      // Clear any initial commands
      sentCommands.clear();

      // Act - Send dragBegin event that should trigger pan
      final dragBeginEvent = DiagramEventUnion.dragBegin(
        DiagramDragBegin(
          eventId: 'test-pan-only',
          logicalPosition: const Offset(150, 150),
          screenPosition: const Offset(300, 300),
          transformSnapshot: Transform2D.identity,
          hitList: [], // Empty space - should trigger pan
          timestamp: Duration.zero,
          metadata: {'pressedKeys': []},
          fingerCount: 1,
          mouseButton: MouseButton.left,
          isOnObject: false,
        ),
      );

      controller.eventsSink.add(dragBeginEvent);

      // Wait for processing
      await Future.delayed(const Duration(milliseconds: 100));

      // Assert - Should have sent commands
      expect(sentCommands, isNotEmpty);

      // Should have sent setTransform command for pan
      expect(
          sentCommands.any((cmd) => cmd.maybeWhen(
                setTransform: (_) => true,
                orElse: () => false,
              )),
          isTrue);

      // Should NOT have sent selection commands
      expect(
          sentCommands.any((cmd) => cmd.maybeWhen(
                showSelectionOverlay: (_) => true,
                orElse: () => false,
              )),
          isFalse);
    }, timeout: const Timeout(Duration(seconds: 10)));

    test('should handle Shift+click for selection even without switch',
        () async {
      // Arrange
      controller.setSelectionMode(false);
      expect(controller.isSelectionModeEnabled, isFalse);

      // Clear any initial commands
      sentCommands.clear();

      // Act - Send dragBegin event with Shift key (should trigger selection even without switch)
      final dragBeginEvent = DiagramEventUnion.dragBegin(
        DiagramDragBegin(
          eventId: 'test-shift-selection',
          logicalPosition: const Offset(200, 200),
          screenPosition: const Offset(400, 400),
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

      controller.eventsSink.add(dragBeginEvent);

      // Wait for processing
      await Future.delayed(const Duration(milliseconds: 100));

      // Assert - Should send selection commands even without switch
      expect(sentCommands, isNotEmpty);
      expect(
          sentCommands.any((cmd) => cmd.maybeWhen(
                showSelectionOverlay: (_) => true,
                orElse: () => false,
              )),
          isTrue);

      // Should NOT have sent setTransform command (selection should block pan)
      expect(
          sentCommands.any((cmd) => cmd.maybeWhen(
                setTransform: (_) => true,
                orElse: () => false,
              )),
          isFalse);
    }, timeout: const Timeout(Duration(seconds: 10)));

    test('should complete full selection cycle when selection is active',
        () async {
      // Arrange
      controller.setSelectionMode(true);
      expect(controller.isSelectionModeEnabled, isTrue);

      // Clear any initial commands
      sentCommands.clear();

      // Act 1 - Send dragBegin event
      final dragBeginEvent = DiagramEventUnion.dragBegin(
        DiagramDragBegin(
          eventId: 'test-full-selection-cycle',
          logicalPosition: const Offset(100, 100),
          screenPosition: const Offset(200, 200),
          transformSnapshot: Transform2D.identity,
          hitList: [], // Empty space
          timestamp: Duration.zero,
          metadata: {'pressedKeys': []},
          fingerCount: 1,
          mouseButton: MouseButton.left,
          isOnObject: false,
        ),
      );

      controller.eventsSink.add(dragBeginEvent);
      await Future.delayed(const Duration(milliseconds: 50));

      // Act 2 - Send dragContinue event
      final dragContinueEvent = DiagramEventUnion.dragContinue(
        DiagramDragContinue(
          eventId: 'test-full-selection-cycle',
          logicalPosition: const Offset(150, 150),
          screenPosition: const Offset(300, 300),
          transformSnapshot: Transform2D.identity,
          hitList: [], // Empty space
          timestamp: Duration.zero,
          metadata: {'pressedKeys': []},
          delta: const Offset(50, 50),
          totalDelta: const Offset(50, 50),
          duration: Duration.zero,
          velocity: Offset.zero,
        ),
      );

      controller.eventsSink.add(dragContinueEvent);
      await Future.delayed(const Duration(milliseconds: 50));

      // Act 3 - Send dragEnd event
      final dragEndEvent = DiagramEventUnion.dragEnd(
        DiagramDragEnd(
          eventId: 'test-full-selection-cycle',
          logicalPosition: const Offset(200, 200),
          screenPosition: const Offset(400, 400),
          transformSnapshot: Transform2D.identity,
          hitList: [], // Empty space
          timestamp: Duration.zero,
          metadata: {'pressedKeys': []},
          totalDelta: const Offset(100, 100),
          totalDuration: Duration.zero,
          finalVelocity: Offset.zero,
          wasCancelled: false,
        ),
      );

      controller.eventsSink.add(dragEndEvent);
      await Future.delayed(const Duration(milliseconds: 50));

      // Assert - Should have sent all selection commands
      expect(sentCommands, isNotEmpty);

      // Should have sent showSelectionOverlay command
      expect(
          sentCommands.any((cmd) => cmd.maybeWhen(
                showSelectionOverlay: (_) => true,
                orElse: () => false,
              )),
          isTrue);

      // Should have sent updateSelectionRect command
      expect(
          sentCommands.any((cmd) => cmd.maybeWhen(
                updateSelectionRect: (_) => true,
                orElse: () => false,
              )),
          isTrue);

      // Should have sent hideSelectionOverlay command
      expect(
          sentCommands.any((cmd) => cmd.maybeWhen(
                hideSelectionOverlay: () => true,
                orElse: () => false,
              )),
          isTrue);

      // CRITICAL: Should NOT have sent ANY setTransform commands
      final setTransformCommands = sentCommands.where((cmd) => cmd.maybeWhen(
            setTransform: (_) => true,
            orElse: () => false,
          ));
      expect(setTransformCommands, isEmpty);
    }, timeout: const Timeout(Duration(seconds: 15)));
  });
}
