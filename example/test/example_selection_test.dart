import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/events/events.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import '../lib/controllers/example_diagram_controller.dart';

void main() {
  group('Example Selection Functionality', () {
    late ExampleDiagramController controller;

    setUp(() {
      controller = ExampleDiagramController();
    });

    tearDown(() {
      controller.dispose();
    });

    test('should enable selection mode when Select switch is turned on', () {
      // Arrange
      expect(controller.isSelectionModeEnabled, isFalse);

      // Act
      controller.setSelectionMode(true);

      // Assert
      expect(controller.isSelectionModeEnabled, isTrue);
    });

    test('should disable selection mode when Select switch is turned off', () {
      // Arrange
      controller.setSelectionMode(true);
      expect(controller.isSelectionModeEnabled, isTrue);

      // Act
      controller.setSelectionMode(false);

      // Assert
      expect(controller.isSelectionModeEnabled, isFalse);
    });

    test('should have selection mode disabled by default', () {
      // Assert
      expect(controller.isSelectionModeEnabled, isFalse);
    });

    test('should toggle selection mode correctly', () {
      // Arrange
      expect(controller.isSelectionModeEnabled, isFalse);

      // Act & Assert - Toggle on
      controller.setSelectionMode(true);
      expect(controller.isSelectionModeEnabled, isTrue);

      // Act & Assert - Toggle off
      controller.setSelectionMode(false);
      expect(controller.isSelectionModeEnabled, isFalse);

      // Act & Assert - Toggle on again
      controller.setSelectionMode(true);
      expect(controller.isSelectionModeEnabled, isTrue);
    });

    test('should NOT send setTransform command when selection is active',
        () async {
      // Arrange
      controller.setSelectionMode(true);
      expect(controller.isSelectionModeEnabled, isTrue);

      // Capture commands sent by the controller
      final List<DiagramCommand> sentCommands = [];
      controller.commandStream.listen(sentCommands.add);

      // Act - Send dragBegin event that should trigger selection
      final dragBeginEvent = DiagramEventUnion.dragBegin(
        DiagramDragBegin(
          eventId: 'test-selection-exclusive',
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

      // Wait a bit for the event to be processed
      await Future.delayed(const Duration(milliseconds: 100));

      // Assert - Should send showSelectionOverlay command
      expect(sentCommands, isNotEmpty);
      expect(
          sentCommands.any((cmd) => cmd.maybeWhen(
                showSelectionOverlay: (_) => true,
                orElse: () => false,
              )),
          isTrue);

      // Assert - Should NOT send setTransform command
      expect(
          sentCommands.any((cmd) => cmd.maybeWhen(
                setTransform: (_) => true,
                orElse: () => false,
              )),
          isFalse);
    });

    test('should send handleAsUsual command when selection is NOT active',
        () async {
      // Arrange
      controller.setSelectionMode(false);
      expect(controller.isSelectionModeEnabled, isFalse);

      // Capture commands sent by the controller
      final List<DiagramCommand> sentCommands = [];
      controller.commandStream.listen(sentCommands.add);

      // Act - Send dragBegin event that should trigger pan
      final dragBeginEvent = DiagramEventUnion.dragBegin(
        DiagramDragBegin(
          eventId: 'test-pan-exclusive',
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

      // Wait a bit for the event to be processed
      await Future.delayed(const Duration(milliseconds: 100));

      // Assert - Should send handleAsUsual command for browsing (pan)
      expect(sentCommands, isNotEmpty);
      expect(
          sentCommands.any((cmd) => cmd.maybeWhen(
                handleAsUsual: (_) => true,
                orElse: () => false,
              )),
          isTrue);
    });
  });
}
