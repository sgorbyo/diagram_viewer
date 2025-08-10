import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:diagram_viewer/events/events.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';

part 'event_management_state.freezed.dart';

/// States for the EventManagementBloc
@freezed
class EventManagementState with _$EventManagementState {
  const factory EventManagementState.idle() = IdleState;

  const factory EventManagementState.pointerActive({
    required String eventId,
    required Set<MouseButton> pressedMouseButtons,
    required Set<LogicalKeyboardKey> pressedKeys,
    required DateTime startTime,
    required Offset startPosition,
    required Offset lastPosition,
    required List<DiagramObjectEntity> lastHitList,
  }) = PointerActiveState;

  const factory EventManagementState.gestureActive({
    required String eventId,
    required Set<LogicalKeyboardKey> pressedKeys,
    required DateTime startTime,
    required Offset startPosition,
  }) = GestureActiveState;

  const factory EventManagementState.keyboardActive({
    required String eventId,
    required Set<LogicalKeyboardKey> pressedKeys,
    required DateTime startTime,
  }) = KeyboardActiveState;
}
