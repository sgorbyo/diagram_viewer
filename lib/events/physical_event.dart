import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:diagram_viewer/events/transform_2d.dart';
import 'package:diagram_viewer/events/border_proximity.dart';
import 'package:diagram_viewer/interfaces/diagram_object_entity.dart';

part 'physical_event.freezed.dart';

/// Phase of an interaction event.
///
/// This enum represents the different phases of an interaction:
/// - [start]: The interaction has just begun
/// - [update]: The interaction is ongoing (for continuous events)
/// - [end]: The interaction has ended
enum InteractionPhase {
  /// The interaction has just begun.
  start,

  /// The interaction is ongoing (for continuous events).
  update,

  /// The interaction has ended.
  end,
}

/// A unified physical event that represents user interactions with the diagram.
///
/// This sealed class unifies similar physical events across different platforms
/// (mobile and desktop) into logical events that the Controller can interpret.
/// The DiagramViewer enriches these events with:
/// - Logical coordinates (converted from screen coordinates)
/// - Transform snapshot at the time of the event
/// - Hit-test results (list of objects at the event location)
/// - Border proximity information
/// - Event phase (start, update, end)
///
/// ## Architecture
///
/// The DiagramViewer captures raw UI events (pointer, gesture, keyboard)
/// and converts them into PhysicalEvents with enriched context. These events
/// are then sent to the Controller for interpretation and business logic decisions.
///
/// ## Event Types
///
/// - [PhysicalEvent.pointer]: Mouse/touch pointer events (down, move, up)
/// - [PhysicalEvent.gesture]: Multi-touch gesture events (pinch, rotate)
/// - [PhysicalEvent.keyboard]: Keyboard events (key down, key up)
///
/// ## Example Usage
///
/// ```dart
/// // Handle a pointer event
/// event.when(
///   pointer: (eventId, logicalPosition, screenPosition, transformSnapshot,
///             hitList, borderProximity, phase, rawEvent, delta) {
///     if (hitList.isNotEmpty) {
///       // Object manipulation
///       _handleObjectDrag(hitList.first, logicalPosition);
///     } else {
///       // Pan the diagram
///       _commandController.add(DiagramCommand.applyDefaultPanZoom(origin: event));
///     }
///   },
///   gesture: (eventId, logicalPosition, screenPosition, transformSnapshot,
///             hitList, borderProximity, phase, rawEvent, scale, rotation) {
///     // Handle zoom/rotation
///     _commandController.add(DiagramCommand.applyDefaultPanZoom(origin: event));
///   },
///   keyboard: (eventId, logicalPosition, transformSnapshot, hitList,
///              borderProximity, rawEvent, pressedKeys) {
///     // Handle keyboard shortcuts
///     _handleKeyboardShortcut(pressedKeys);
///   },
/// );
/// ```
@freezed
class PhysicalEvent with _$PhysicalEvent {
  const PhysicalEvent._();

  /// Pointer event (mouse/touch).
  ///
  /// Represents mouse or touch pointer events including:
  /// - Mouse down/move/up
  /// - Touch down/move/up
  /// - Drag operations
  ///
  /// [eventId] - Unique identifier for this event
  /// [logicalPosition] - Position in diagram coordinates
  /// [screenPosition] - Position in screen coordinates
  /// [transformSnapshot] - Transform at the time of the event
  /// [hitList] - List of objects at the event position
  /// [borderProximity] - Proximity to diagram borders
  /// [phase] - Event phase (start, update, end)
  /// [rawEvent] - Original Flutter pointer event
  /// [delta] - Movement delta (for move events)
  const factory PhysicalEvent.pointer({
    required String eventId,
    required Offset logicalPosition,
    required Offset screenPosition,
    required Transform2D transformSnapshot,
    required List<DiagramObjectEntity> hitList,
    required BorderProximity borderProximity,
    required InteractionPhase phase,
    required PointerEvent rawEvent,
    Offset? delta,
  }) = PointerPhysicalEvent;

  /// Gesture event (multi-touch).
  ///
  /// Represents multi-touch gesture events including:
  /// - Pinch to zoom
  /// - Rotation gestures
  /// - Multi-finger pan
  ///
  /// [eventId] - Unique identifier for this event
  /// [logicalPosition] - Position in diagram coordinates
  /// [screenPosition] - Position in screen coordinates
  /// [transformSnapshot] - Transform at the time of the event
  /// [hitList] - List of objects at the event position
  /// [borderProximity] - Proximity to diagram borders
  /// [phase] - Event phase (start, update, end)
  /// [rawEvent] - Original Flutter gesture event
  /// [scale] - Scale factor (for pinch gestures)
  /// [rotation] - Rotation angle in radians (for rotation gestures)
  const factory PhysicalEvent.gesture({
    required String eventId,
    required Offset logicalPosition,
    required Offset screenPosition,
    required Transform2D transformSnapshot,
    required List<DiagramObjectEntity> hitList,
    required BorderProximity borderProximity,
    required InteractionPhase phase,
    required Object rawEvent,
    double? scale,
    double? rotation,
  }) = GesturePhysicalEvent;

  /// Keyboard event.
  ///
  /// Represents keyboard events including:
  /// - Key down/up
  /// - Key combinations
  /// - Modifier keys
  ///
  /// [eventId] - Unique identifier for this event
  /// [logicalPosition] - Current logical position (if applicable)
  /// [transformSnapshot] - Transform at the time of the event
  /// [hitList] - List of objects at the current position
  /// [borderProximity] - Proximity to diagram borders
  /// [rawEvent] - Original Flutter key event
  /// [pressedKeys] - Set of currently pressed keys
  const factory PhysicalEvent.keyboard({
    required String eventId,
    required Offset logicalPosition,
    required Transform2D transformSnapshot,
    required List<DiagramObjectEntity> hitList,
    required BorderProximity borderProximity,
    required KeyEvent rawEvent,
    required Set<LogicalKeyboardKey> pressedKeys,
  }) = KeyboardPhysicalEvent;

  /// Returns true if this event is a pointer event.
  bool get isPointer => this is PointerPhysicalEvent;

  /// Returns true if this event is a gesture event.
  bool get isGesture => this is GesturePhysicalEvent;

  /// Returns true if this event is a keyboard event.
  bool get isKeyboard => this is KeyboardPhysicalEvent;

  /// Returns the logical position of this event.
  @override
  Offset get logicalPosition => when(
        pointer: (eventId, logicalPosition, screenPosition, transformSnapshot,
                hitList, borderProximity, phase, rawEvent, delta) =>
            logicalPosition,
        gesture: (eventId, logicalPosition, screenPosition, transformSnapshot,
                hitList, borderProximity, phase, rawEvent, scale, rotation) =>
            logicalPosition,
        keyboard: (eventId, logicalPosition, transformSnapshot, hitList,
                borderProximity, rawEvent, pressedKeys) =>
            logicalPosition,
      );

  /// Returns the transform snapshot of this event.
  @override
  Transform2D get transformSnapshot => when(
        pointer: (eventId, logicalPosition, screenPosition, transformSnapshot,
                hitList, borderProximity, phase, rawEvent, delta) =>
            transformSnapshot,
        gesture: (eventId, logicalPosition, screenPosition, transformSnapshot,
                hitList, borderProximity, phase, rawEvent, scale, rotation) =>
            transformSnapshot,
        keyboard: (eventId, logicalPosition, transformSnapshot, hitList,
                borderProximity, rawEvent, pressedKeys) =>
            transformSnapshot,
      );

  /// Returns the hit list of this event.
  @override
  List<DiagramObjectEntity> get hitList => when(
        pointer: (eventId, logicalPosition, screenPosition, transformSnapshot,
                hitList, borderProximity, phase, rawEvent, delta) =>
            hitList,
        gesture: (eventId, logicalPosition, screenPosition, transformSnapshot,
                hitList, borderProximity, phase, rawEvent, scale, rotation) =>
            hitList,
        keyboard: (eventId, logicalPosition, transformSnapshot, hitList,
                borderProximity, rawEvent, pressedKeys) =>
            hitList,
      );

  /// Returns the border proximity of this event.
  @override
  BorderProximity get borderProximity => when(
        pointer: (eventId, logicalPosition, screenPosition, transformSnapshot,
                hitList, borderProximity, phase, rawEvent, delta) =>
            borderProximity,
        gesture: (eventId, logicalPosition, screenPosition, transformSnapshot,
                hitList, borderProximity, phase, rawEvent, scale, rotation) =>
            borderProximity,
        keyboard: (eventId, logicalPosition, transformSnapshot, hitList,
                borderProximity, rawEvent, pressedKeys) =>
            borderProximity,
      );

  /// Returns true if this event has any objects in its hit list.
  bool get hasHitObjects => hitList.isNotEmpty;

  /// Returns the first object in the hit list, or null if empty.
  DiagramObjectEntity? get firstHitObject =>
      hitList.isNotEmpty ? hitList.first : null;
}
