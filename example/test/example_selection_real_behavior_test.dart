import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/diagram_viewer.dart';
import 'package:diagram_viewer/events/events.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import '../lib/controllers/example_diagram_controller.dart';

void main() {
  group('Example Selection Real Behavior Tests', () {
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

    test('should NOT send setTransform during selection cycle', () async {
      // Arrange
      controller.setSelectionMode(true);
      expect(controller.isSelectionModeEnabled, isTrue);

      // Clear any initial commands
      sentCommands.clear();

      // Act 1 - Start selection (dragBegin)
      final dragBeginEvent = DiagramEventUnion.dragBegin(
        DiagramDragBegin(
          eventId: 'test-real-selection',
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

      // Act 2 - Continue selection (dragContinue)
      final dragContinueEvent = DiagramEventUnion.dragContinue(
        DiagramDragContinue(
          eventId: 'test-real-selection',
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

      // Act 3 - End selection (dragEnd)
      final dragEndEvent = DiagramEventUnion.dragEnd(
        DiagramDragEnd(
          eventId: 'test-real-selection',
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

      // Assert - Should have sent selection commands
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
      expect(setTransformCommands, isEmpty,
          reason:
              'Selection should NOT trigger pan commands. Found: ${setTransformCommands.length} setTransform commands');
    }, timeout: const Timeout(Duration(seconds: 15)));

    test('should send setTransform when NOT selecting', () async {
      // Arrange
      controller.setSelectionMode(false);
      expect(controller.isSelectionModeEnabled, isFalse);

      // Clear any initial commands
      sentCommands.clear();

      // Act - Send dragBegin event that should trigger pan
      final dragBeginEvent = DiagramEventUnion.dragBegin(
        DiagramDragBegin(
          eventId: 'test-real-pan',
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
  });
}
