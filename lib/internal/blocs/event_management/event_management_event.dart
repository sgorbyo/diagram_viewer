import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:diagram_viewer/events/events.dart';

part 'event_management_event.freezed.dart';

/// Events for the EventManagementBloc
@freezed
class EventManagementEvent with _$EventManagementEvent {
  const factory EventManagementEvent.startPointerEvent({
    required PointerEvent rawEvent,
    required Offset logicalPosition,
    required List<HitTestResult> hitResults,
    required Set<LogicalKeyboardKey> pressedKeys,
  }) = StartPointerEvent;

  const factory EventManagementEvent.updatePointerEvent({
    required PointerEvent rawEvent,
    required Offset logicalPosition,
    required List<HitTestResult> hitResults,
    required Set<LogicalKeyboardKey> pressedKeys,
  }) = UpdatePointerEvent;

  const factory EventManagementEvent.endPointerEvent({
    required PointerEvent rawEvent,
    required Set<LogicalKeyboardKey> pressedKeys,
  }) = EndPointerEvent;

  const factory EventManagementEvent.startGestureEvent({
    required Object rawEvent,
    required Offset logicalPosition,
    required List<HitTestResult> hitResults,
    required Set<LogicalKeyboardKey> pressedKeys,
  }) = StartGestureEvent;

  const factory EventManagementEvent.updateGestureEvent({
    required Object rawEvent,
    required Offset logicalPosition,
    required List<HitTestResult> hitResults,
    required Set<LogicalKeyboardKey> pressedKeys,
  }) = UpdateGestureEvent;

  const factory EventManagementEvent.endGestureEvent({
    required Object rawEvent,
    required Set<LogicalKeyboardKey> pressedKeys,
  }) = EndGestureEvent;

  const factory EventManagementEvent.startKeyboardEvent({
    required KeyEvent rawEvent,
  }) = StartKeyboardEvent;

  const factory EventManagementEvent.updateModifierKeys({
    required Set<LogicalKeyboardKey> keys,
  }) = UpdateModifierKeys;

  const factory EventManagementEvent.resetState() = ResetState;
}
