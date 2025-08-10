import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:diagram_viewer/events/events.dart';

part 'zoom_event.freezed.dart';

/// Events for zoom operations
@freezed
class ZoomEvent with _$ZoomEvent {
  /// Mouse wheel zoom event
  const factory ZoomEvent.mouseWheelZoom({
    required double scrollDelta,
    required Offset screenPosition,
    required Transform2D currentTransform,
  }) = _MouseWheelZoom;

  /// Pinch-to-zoom event
  const factory ZoomEvent.pinchZoom({
    required double scale,
    required Offset screenPosition,
    required Transform2D currentTransform,
  }) = _PinchZoom;

  /// Keyboard zoom event
  const factory ZoomEvent.keyboardZoom({
    required bool zoomIn,
    required Transform2D currentTransform,
  }) = _KeyboardZoom;

  /// Execute bounce-back to normal limits
  const factory ZoomEvent.executeBounceBack() = _ExecuteBounceBack;

  /// Reset zoom state
  const factory ZoomEvent.reset() = _Reset;
}
