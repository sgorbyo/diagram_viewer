import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'diagram_logical_event.freezed.dart';

enum InteractionPhase {
  start,
  update,
  end,
}

@freezed
class DiagramLogicalEvent with _$DiagramLogicalEvent {
  const factory DiagramLogicalEvent.continuous({
    required String eventId,
    required Offset diagramCoordinates,
    required Offset screenCoordinates,
    required BorderProximity borderProximity,
    required InteractionPhase phase,
    required Offset delta,
  }) = _ContinuousInteractionEvent;

  const factory DiagramLogicalEvent.transformation({
    required String eventId,
    required Offset diagramCoordinates,
    required Offset screenCoordinates,
    required BorderProximity borderProximity,
    required InteractionPhase phase,
    required double scale,
    @Default(0.0) double rotation,
  }) = _TransformationInteractionEvent;
}

@freezed
class BorderProximity with _$BorderProximity {
  const factory BorderProximity({
    required bool isNearLeft,
    required bool isNearRight,
    required bool isNearTop,
    required bool isNearBottom,
    required double distanceFromEdge,
  }) = _BorderProximity;
}
