import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:diagram_viewer/events/events.dart';

part 'pan_event.freezed.dart';

/// Events for pan operations
@freezed
class PanEvent with _$PanEvent {
  /// Mouse/touch pan event
  const factory PanEvent.pan({
    required Offset delta,
    required Transform2D currentTransform,
  }) = _Pan;

  /// Keyboard pan event
  const factory PanEvent.keyboardPan({
    required Offset direction,
    required Transform2D currentTransform,
  }) = _KeyboardPan;

  /// Auto-center the diagram
  const factory PanEvent.autoCenter({
    required Transform2D currentTransform,
  }) = _AutoCenter;

  /// Reset pan state
  const factory PanEvent.reset() = _Reset;
}
