import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:diagram_viewer/events/events.dart';

part 'transform_state.freezed.dart';

/// States for transform operations
@freezed
class TransformState with _$TransformState {
  /// Initial transform state
  const factory TransformState.initial({
    @Default(Transform2D()) Transform2D transform,
    @Default(Rect.zero) Rect diagramRect,
    @Default(Size.zero) Size viewportSize,
  }) = _Initial;

  /// Transform updated state
  const factory TransformState.updated({
    required Transform2D transform,
    required Rect diagramRect,
    required Size viewportSize,
  }) = _Updated;

  /// Transform animating state
  const factory TransformState.animating({
    required Transform2D transform,
    required Transform2D targetTransform,
    required double progress,
    required Rect diagramRect,
    required Size viewportSize,
  }) = _Animating;
}
