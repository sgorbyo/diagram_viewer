import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:diagram_viewer/events/transform_2d.dart';
import 'package:diagram_viewer/events/border_proximity.dart';
import 'package:diagram_viewer/events/mouse_button.dart';
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

/// Type of active interaction
enum InteractionType {
  pointer,
  gesture,
  keyboard,
}

/// A unified physical event that represents user interactions with the diagram.
///
/// This sealed class unifies similar physical events from different platforms
/// (mobile and desktop) into logical events that the Controller can interpret.
/// The DiagramViewer enriches these events with:
/// - Logical coordinates (converted from screen coordinates)
/// - Transform snapshot at the time of the event
/// - Hit-test results (list of objects at the event location)
/// - Border proximity information
/// - Event phase (start, update, end)
/// - Pressed mouse buttons and keyboard keys
/// - Active interaction type
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
///             hitList, borderProximity, phase, rawEvent, delta, currentViewport,
///             pressedMouseButtons, pressedKeys, activeInteraction) {
///     if (hitList.isNotEmpty) {
///       // Object manipulation
///       _handleObjectDrag(hitList.first, logicalPosition);
///     } else {
///       // Pan the diagram
///       _commandController.add(DiagramCommand.applyDefaultPanZoom(origin: event));
///     }
///   },
///   gesture: (eventId, logicalPosition, screenPosition, transformSnapshot,
///             hitList, borderProximity, phase, rawEvent, scale, rotation, currentViewport,
///             pressedKeys, activeInteraction) {
///     // Handle zoom/rotation
///     _commandController.add(DiagramCommand.applyDefaultPanZoom(origin: event));
///   },
///   keyboard: (eventId, transformSnapshot, rawEvent, pressedKeys, currentViewport,
///              activeInteraction) {
///     // Handle keyboard shortcuts
///     _handleKeyboardShortcut(pressedKeys);
///   },
/// );
/// ```
@freezed
class PhysicalEvent with _$PhysicalEvent {
  const PhysicalEvent._();

  /// Pointer event (mouse/touch) with enhanced information.
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
  /// [currentViewport] - Current visible area in logical coordinates
  /// [pressedMouseButtons] - Set of currently pressed mouse buttons
  /// [pressedKeys] - Set of currently pressed keyboard keys
  /// [activeInteraction] - Type of active interaction (if any)
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
    required Rect currentViewport,
    required Set<MouseButton> pressedMouseButtons,
    required Set<LogicalKeyboardKey> pressedKeys,
    required InteractionType? activeInteraction,
  }) = PointerPhysicalEvent;

  /// Gesture event (multi-touch) with enhanced information.
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
  /// [currentViewport] - Current visible area in logical coordinates
  /// [pressedKeys] - Set of currently pressed keyboard keys
  /// [activeInteraction] - Type of active interaction (if any)
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
    required Rect currentViewport,
    required Set<LogicalKeyboardKey> pressedKeys,
    required InteractionType? activeInteraction,
  }) = GesturePhysicalEvent;

  /// Keyboard event (standalone - no position/hit-testing).
  ///
  /// Represents keyboard events including:
  /// - Key down/up
  /// - Key combinations
  /// - Modifier keys
  ///
  /// [eventId] - Unique identifier for this event
  /// [transformSnapshot] - Transform at the time of the event
  /// [rawEvent] - Original Flutter key event
  /// [pressedKeys] - Set of currently pressed keys
  /// [currentViewport] - Current visible area in logical coordinates
  /// [activeInteraction] - Type of active interaction (if any)
  const factory PhysicalEvent.keyboard({
    required String eventId,
    required Transform2D transformSnapshot,
    required KeyEvent rawEvent,
    required Set<LogicalKeyboardKey> pressedKeys,
    required Rect currentViewport,
    required InteractionType? activeInteraction,
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
        pointer: (eventId,
                logicalPosition,
                screenPosition,
                transformSnapshot,
                hitList,
                borderProximity,
                phase,
                rawEvent,
                delta,
                currentViewport,
                pressedMouseButtons,
                pressedKeys,
                activeInteraction) =>
            logicalPosition,
        gesture: (eventId,
                logicalPosition,
                screenPosition,
                transformSnapshot,
                hitList,
                borderProximity,
                phase,
                rawEvent,
                scale,
                rotation,
                currentViewport,
                pressedKeys,
                activeInteraction) =>
            logicalPosition,
        keyboard: (eventId, transformSnapshot, rawEvent, pressedKeys,
                currentViewport, activeInteraction) =>
            Offset.zero, // Keyboard events don't have logical position
      );

  /// Returns the transform snapshot of this event.
  @override
  Transform2D get transformSnapshot => when(
        pointer: (eventId,
                logicalPosition,
                screenPosition,
                transformSnapshot,
                hitList,
                borderProximity,
                phase,
                rawEvent,
                delta,
                currentViewport,
                pressedMouseButtons,
                pressedKeys,
                activeInteraction) =>
            transformSnapshot,
        gesture: (eventId,
                logicalPosition,
                screenPosition,
                transformSnapshot,
                hitList,
                borderProximity,
                phase,
                rawEvent,
                scale,
                rotation,
                currentViewport,
                pressedKeys,
                activeInteraction) =>
            transformSnapshot,
        keyboard: (eventId, transformSnapshot, rawEvent, pressedKeys,
                currentViewport, activeInteraction) =>
            transformSnapshot,
      );

  /// Returns the hit list of this event.
  @override
  List<DiagramObjectEntity> get hitList => when(
        pointer: (eventId,
                logicalPosition,
                screenPosition,
                transformSnapshot,
                hitList,
                borderProximity,
                phase,
                rawEvent,
                delta,
                currentViewport,
                pressedMouseButtons,
                pressedKeys,
                activeInteraction) =>
            hitList,
        gesture: (eventId,
                logicalPosition,
                screenPosition,
                transformSnapshot,
                hitList,
                borderProximity,
                phase,
                rawEvent,
                scale,
                rotation,
                currentViewport,
                pressedKeys,
                activeInteraction) =>
            hitList,
        keyboard: (eventId, transformSnapshot, rawEvent, pressedKeys,
                currentViewport, activeInteraction) =>
            [], // Keyboard events don't have hit list
      );

  /// Returns the border proximity of this event.
  @override
  BorderProximity get borderProximity => when(
        pointer: (eventId,
                logicalPosition,
                screenPosition,
                transformSnapshot,
                hitList,
                borderProximity,
                phase,
                rawEvent,
                delta,
                currentViewport,
                pressedMouseButtons,
                pressedKeys,
                activeInteraction) =>
            borderProximity,
        gesture: (eventId,
                logicalPosition,
                screenPosition,
                transformSnapshot,
                hitList,
                borderProximity,
                phase,
                rawEvent,
                scale,
                rotation,
                currentViewport,
                pressedKeys,
                activeInteraction) =>
            borderProximity,
        keyboard: (eventId, transformSnapshot, rawEvent, pressedKeys,
                currentViewport, activeInteraction) =>
            BorderProximity.none, // Keyboard events don't have border proximity
      );

  /// Returns true if this event has any objects in its hit list.
  bool get hasHitObjects => hitList.isNotEmpty;

  /// Returns the first object in the hit list, or null if empty.
  DiagramObjectEntity? get firstHitObject =>
      hitList.isNotEmpty ? hitList.first : null;
}
