import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// Removed unused import

part 'zoom_state.freezed.dart';

/// States for zoom operations
@freezed
class ZoomState with _$ZoomState {
  /// Initial zoom state
  const factory ZoomState.initial({
    @Default(false) bool isOverscrolled,
    @Default(1.0) double currentScale,
  }) = _Initial;

  /// Zooming state
  const factory ZoomState.zooming({
    required bool isOverscrolled,
    required double currentScale,
    required Offset focalPoint,
  }) = _Zooming;

  /// Bounce-back animation state
  const factory ZoomState.bouncingBack({
    required double currentScale,
    required double targetScale,
    required double progress,
  }) = _BouncingBack;
}
