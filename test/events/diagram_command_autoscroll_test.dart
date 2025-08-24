import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/events/diagram_command.dart';

void main() {
  group('DiagramCommand Autoscroll Tests', () {
    test('should create enableAutoscroll command', () {
      // Arrange & Act
      final command = DiagramCommand.enableAutoscroll();

      // Assert
      expect(command, isNotNull);
      expect(command.isEnableAutoscroll, isTrue);
      expect(command.isDisableAutoscroll, isFalse);
      expect(command.isReturnToBounds, isFalse);
      expect(command.affectsAutoScroll, isTrue);
      expect(command.description, equals('EnableAutoscroll'));
    });

    test('should create disableAutoscroll command', () {
      // Arrange & Act
      final command = DiagramCommand.disableAutoscroll();

      // Assert
      expect(command, isNotNull);
      expect(command.isEnableAutoscroll, isFalse);
      expect(command.isDisableAutoscroll, isTrue);
      expect(command.isReturnToBounds, isFalse);
      expect(command.affectsAutoScroll, isTrue);
      expect(command.description, equals('DisableAutoscroll'));
    });

    test('should create returnToBounds command', () {
      // Arrange & Act
      final command = DiagramCommand.returnToBounds();

      // Assert
      expect(command, isNotNull);
      expect(command.isEnableAutoscroll, isFalse);
      expect(command.isDisableAutoscroll, isFalse);
      expect(command.isReturnToBounds, isTrue);
      expect(command.affectsAutoScroll, isFalse);
      expect(command.description, equals('ReturnToBounds'));
    });

    test('should handle autoscroll commands in when method', () {
      // Arrange
      final enableCommand = DiagramCommand.enableAutoscroll();
      final disableCommand = DiagramCommand.disableAutoscroll();
      final returnCommand = DiagramCommand.returnToBounds();

      // Act & Assert
      final enableResult = enableCommand.when(
        applyDefaultPanZoom: (origin) => 'applyDefaultPanZoom',
        setTransform: (transform) => 'setTransform',
        redraw: (renderables, logicalExtent) => 'redraw',
        elasticBounceBack: (targetTransform, duration) => 'elasticBounceBack',
        autoScrollStep: (velocity, stepDuration) => 'autoScrollStep',
        stopAutoScroll: () => 'stopAutoScroll',
        enableAutoscroll: () => 'enableAutoscroll',
        disableAutoscroll: () => 'disableAutoscroll',
        returnToBounds: () => 'returnToBounds',
        showDragOverlay: (ghostSpec, position) => 'showDragOverlay',
        updateDragOverlay: (position) => 'updateDragOverlay',
        hideDragOverlay: () => 'hideDragOverlay',
        showSelectionOverlay: (startPosition) => 'showSelectionOverlay',
        updateSelectionRect: (currentPosition) => 'updateSelectionRect',
        hideSelectionOverlay: () => 'hideSelectionOverlay',
        handleAsUsual: (originalEvent) => 'handleAsUsual',
        setCursor: (effect) => 'setCursor',
      );

      final disableResult = disableCommand.when(
        applyDefaultPanZoom: (origin) => 'applyDefaultPanZoom',
        setTransform: (transform) => 'setTransform',
        redraw: (renderables, logicalExtent) => 'redraw',
        elasticBounceBack: (targetTransform, duration) => 'elasticBounceBack',
        autoScrollStep: (velocity, stepDuration) => 'autoScrollStep',
        stopAutoScroll: () => 'stopAutoScroll',
        enableAutoscroll: () => 'enableAutoscroll',
        disableAutoscroll: () => 'disableAutoscroll',
        returnToBounds: () => 'returnToBounds',
        showDragOverlay: (ghostSpec, position) => 'showDragOverlay',
        updateDragOverlay: (position) => 'updateDragOverlay',
        hideDragOverlay: () => 'hideDragOverlay',
        showSelectionOverlay: (startPosition) => 'showSelectionOverlay',
        updateSelectionRect: (currentPosition) => 'updateSelectionRect',
        hideSelectionOverlay: () => 'hideSelectionOverlay',
        handleAsUsual: (originalEvent) => 'handleAsUsual',
        setCursor: (effect) => 'setCursor',
      );

      final returnResult = returnCommand.when(
        applyDefaultPanZoom: (origin) => 'applyDefaultPanZoom',
        setTransform: (transform) => 'setTransform',
        redraw: (renderables, logicalExtent) => 'redraw',
        elasticBounceBack: (targetTransform, duration) => 'elasticBounceBack',
        autoScrollStep: (velocity, stepDuration) => 'autoScrollStep',
        stopAutoScroll: () => 'stopAutoScroll',
        enableAutoscroll: () => 'enableAutoscroll',
        disableAutoscroll: () => 'disableAutoscroll',
        returnToBounds: () => 'returnToBounds',
        showDragOverlay: (ghostSpec, position) => 'showDragOverlay',
        updateDragOverlay: (position) => 'updateDragOverlay',
        hideDragOverlay: () => 'hideDragOverlay',
        showSelectionOverlay: (startPosition) => 'showSelectionOverlay',
        updateSelectionRect: (currentPosition) => 'updateSelectionRect',
        hideSelectionOverlay: () => 'hideSelectionOverlay',
        handleAsUsual: (originalEvent) => 'handleAsUsual',
        setCursor: (effect) => 'setCursor',
      );

      expect(enableResult, equals('enableAutoscroll'));
      expect(disableResult, equals('disableAutoscroll'));
      expect(returnResult, equals('returnToBounds'));
    });

    test('should handle autoscroll commands in maybeWhen method', () {
      // Arrange
      final enableCommand = DiagramCommand.enableAutoscroll();

      // Act & Assert
      final result = enableCommand.maybeWhen(
        enableAutoscroll: () => 'autoscroll_enabled',
        orElse: () => 'other_command',
      );

      expect(result, equals('autoscroll_enabled'));
    });
  });
}
