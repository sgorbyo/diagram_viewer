import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:diagram_viewer/events/events.dart';

part 'transform_event.freezed.dart';

/// Events for transform operations
@freezed
class TransformEvent with _$TransformEvent {
  /// Update the current transform
  const factory TransformEvent.updateTransform({
    required Transform2D transform,
  }) = _UpdateTransform;

  /// Apply zoom operation
  const factory TransformEvent.zoom({
    required double scale,
    required Offset focalPoint,
    required Transform2D currentTransform,
  }) = _Zoom;

  /// Apply pan operation
  const factory TransformEvent.pan({
    required Offset delta,
    required Transform2D currentTransform,
  }) = _Pan;

  /// Reset transform to identity
  const factory TransformEvent.reset() = _Reset;

  /// Update diagram bounds
  const factory TransformEvent.updateDiagramBounds({
    required Rect diagramRect,
    required Size viewportSize,
  }) = _UpdateDiagramBounds;
}
