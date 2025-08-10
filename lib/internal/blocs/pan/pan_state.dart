import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pan_state.freezed.dart';

/// States for pan operations
@freezed
class PanState with _$PanState {
  /// Initial pan state
  const factory PanState.initial({
    @Default(Offset.zero) Offset translation,
  }) = _Initial;

  /// Panning state
  const factory PanState.panning({
    required Offset translation,
    required Offset delta,
  }) = _Panning;

  /// Auto-centering state
  const factory PanState.autoCentering({
    required Offset translation,
    required Offset targetTranslation,
  }) = _AutoCentering;
}
