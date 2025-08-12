// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'physical_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PhysicalEvent {
  String get eventId => throw _privateConstructorUsedError;
  Transform2D get transformSnapshot => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            PointerEvent rawEvent,
            Offset? delta,
            Rect currentViewport,
            Set<MouseButton> pressedMouseButtons,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)
        pointer,
    required TResult Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            Object rawEvent,
            double? scale,
            double? rotation,
            Rect currentViewport,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)
        gesture,
    required TResult Function(
            String eventId,
            Transform2D transformSnapshot,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport,
            InteractionType? activeInteraction)
        keyboard,
    required TResult Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)
        dndTargetEnter,
    required TResult Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)
        dndTargetOver,
    required TResult Function(
            String eventId, Transform2D transformSnapshot, Duration timestamp)
        dndTargetLeave,
    required TResult Function(
            String eventId,
            Object data,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)
        dndTargetDrop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            PointerEvent rawEvent,
            Offset? delta,
            Rect currentViewport,
            Set<MouseButton> pressedMouseButtons,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)?
        pointer,
    TResult? Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            Object rawEvent,
            double? scale,
            double? rotation,
            Rect currentViewport,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)?
        gesture,
    TResult? Function(
            String eventId,
            Transform2D transformSnapshot,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport,
            InteractionType? activeInteraction)?
        keyboard,
    TResult? Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetEnter,
    TResult? Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetOver,
    TResult? Function(
            String eventId, Transform2D transformSnapshot, Duration timestamp)?
        dndTargetLeave,
    TResult? Function(
            String eventId,
            Object data,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetDrop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            PointerEvent rawEvent,
            Offset? delta,
            Rect currentViewport,
            Set<MouseButton> pressedMouseButtons,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)?
        pointer,
    TResult Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            Object rawEvent,
            double? scale,
            double? rotation,
            Rect currentViewport,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)?
        gesture,
    TResult Function(
            String eventId,
            Transform2D transformSnapshot,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport,
            InteractionType? activeInteraction)?
        keyboard,
    TResult Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetEnter,
    TResult Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetOver,
    TResult Function(
            String eventId, Transform2D transformSnapshot, Duration timestamp)?
        dndTargetLeave,
    TResult Function(
            String eventId,
            Object data,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetDrop,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PointerPhysicalEvent value) pointer,
    required TResult Function(GesturePhysicalEvent value) gesture,
    required TResult Function(KeyboardPhysicalEvent value) keyboard,
    required TResult Function(DnDTargetEnterPhysicalEvent value) dndTargetEnter,
    required TResult Function(DnDTargetOverPhysicalEvent value) dndTargetOver,
    required TResult Function(DnDTargetLeavePhysicalEvent value) dndTargetLeave,
    required TResult Function(DnDTargetDropPhysicalEvent value) dndTargetDrop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PointerPhysicalEvent value)? pointer,
    TResult? Function(GesturePhysicalEvent value)? gesture,
    TResult? Function(KeyboardPhysicalEvent value)? keyboard,
    TResult? Function(DnDTargetEnterPhysicalEvent value)? dndTargetEnter,
    TResult? Function(DnDTargetOverPhysicalEvent value)? dndTargetOver,
    TResult? Function(DnDTargetLeavePhysicalEvent value)? dndTargetLeave,
    TResult? Function(DnDTargetDropPhysicalEvent value)? dndTargetDrop,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PointerPhysicalEvent value)? pointer,
    TResult Function(GesturePhysicalEvent value)? gesture,
    TResult Function(KeyboardPhysicalEvent value)? keyboard,
    TResult Function(DnDTargetEnterPhysicalEvent value)? dndTargetEnter,
    TResult Function(DnDTargetOverPhysicalEvent value)? dndTargetOver,
    TResult Function(DnDTargetLeavePhysicalEvent value)? dndTargetLeave,
    TResult Function(DnDTargetDropPhysicalEvent value)? dndTargetDrop,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of PhysicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhysicalEventCopyWith<PhysicalEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhysicalEventCopyWith<$Res> {
  factory $PhysicalEventCopyWith(
          PhysicalEvent value, $Res Function(PhysicalEvent) then) =
      _$PhysicalEventCopyWithImpl<$Res, PhysicalEvent>;
  @useResult
  $Res call({String eventId, Transform2D transformSnapshot});

  $Transform2DCopyWith<$Res> get transformSnapshot;
}

/// @nodoc
class _$PhysicalEventCopyWithImpl<$Res, $Val extends PhysicalEvent>
    implements $PhysicalEventCopyWith<$Res> {
  _$PhysicalEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhysicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? transformSnapshot = null,
  }) {
    return _then(_value.copyWith(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      transformSnapshot: null == transformSnapshot
          ? _value.transformSnapshot
          : transformSnapshot // ignore: cast_nullable_to_non_nullable
              as Transform2D,
    ) as $Val);
  }

  /// Create a copy of PhysicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Transform2DCopyWith<$Res> get transformSnapshot {
    return $Transform2DCopyWith<$Res>(_value.transformSnapshot, (value) {
      return _then(_value.copyWith(transformSnapshot: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PointerPhysicalEventImplCopyWith<$Res>
    implements $PhysicalEventCopyWith<$Res> {
  factory _$$PointerPhysicalEventImplCopyWith(_$PointerPhysicalEventImpl value,
          $Res Function(_$PointerPhysicalEventImpl) then) =
      __$$PointerPhysicalEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String eventId,
      Offset logicalPosition,
      Offset screenPosition,
      Transform2D transformSnapshot,
      List<DiagramObjectEntity> hitList,
      BorderProximity borderProximity,
      InteractionPhase phase,
      PointerEvent rawEvent,
      Offset? delta,
      Rect currentViewport,
      Set<MouseButton> pressedMouseButtons,
      Set<LogicalKeyboardKey> pressedKeys,
      InteractionType? activeInteraction});

  @override
  $Transform2DCopyWith<$Res> get transformSnapshot;
  $BorderProximityCopyWith<$Res> get borderProximity;
}

/// @nodoc
class __$$PointerPhysicalEventImplCopyWithImpl<$Res>
    extends _$PhysicalEventCopyWithImpl<$Res, _$PointerPhysicalEventImpl>
    implements _$$PointerPhysicalEventImplCopyWith<$Res> {
  __$$PointerPhysicalEventImplCopyWithImpl(_$PointerPhysicalEventImpl _value,
      $Res Function(_$PointerPhysicalEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhysicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? logicalPosition = null,
    Object? screenPosition = null,
    Object? transformSnapshot = null,
    Object? hitList = null,
    Object? borderProximity = null,
    Object? phase = null,
    Object? rawEvent = null,
    Object? delta = freezed,
    Object? currentViewport = null,
    Object? pressedMouseButtons = null,
    Object? pressedKeys = null,
    Object? activeInteraction = freezed,
  }) {
    return _then(_$PointerPhysicalEventImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      logicalPosition: null == logicalPosition
          ? _value.logicalPosition
          : logicalPosition // ignore: cast_nullable_to_non_nullable
              as Offset,
      screenPosition: null == screenPosition
          ? _value.screenPosition
          : screenPosition // ignore: cast_nullable_to_non_nullable
              as Offset,
      transformSnapshot: null == transformSnapshot
          ? _value.transformSnapshot
          : transformSnapshot // ignore: cast_nullable_to_non_nullable
              as Transform2D,
      hitList: null == hitList
          ? _value._hitList
          : hitList // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
      borderProximity: null == borderProximity
          ? _value.borderProximity
          : borderProximity // ignore: cast_nullable_to_non_nullable
              as BorderProximity,
      phase: null == phase
          ? _value.phase
          : phase // ignore: cast_nullable_to_non_nullable
              as InteractionPhase,
      rawEvent: null == rawEvent
          ? _value.rawEvent
          : rawEvent // ignore: cast_nullable_to_non_nullable
              as PointerEvent,
      delta: freezed == delta
          ? _value.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as Offset?,
      currentViewport: null == currentViewport
          ? _value.currentViewport
          : currentViewport // ignore: cast_nullable_to_non_nullable
              as Rect,
      pressedMouseButtons: null == pressedMouseButtons
          ? _value._pressedMouseButtons
          : pressedMouseButtons // ignore: cast_nullable_to_non_nullable
              as Set<MouseButton>,
      pressedKeys: null == pressedKeys
          ? _value._pressedKeys
          : pressedKeys // ignore: cast_nullable_to_non_nullable
              as Set<LogicalKeyboardKey>,
      activeInteraction: freezed == activeInteraction
          ? _value.activeInteraction
          : activeInteraction // ignore: cast_nullable_to_non_nullable
              as InteractionType?,
    ));
  }

  /// Create a copy of PhysicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BorderProximityCopyWith<$Res> get borderProximity {
    return $BorderProximityCopyWith<$Res>(_value.borderProximity, (value) {
      return _then(_value.copyWith(borderProximity: value));
    });
  }
}

/// @nodoc

class _$PointerPhysicalEventImpl extends PointerPhysicalEvent {
  const _$PointerPhysicalEventImpl(
      {required this.eventId,
      required this.logicalPosition,
      required this.screenPosition,
      required this.transformSnapshot,
      required final List<DiagramObjectEntity> hitList,
      required this.borderProximity,
      required this.phase,
      required this.rawEvent,
      this.delta,
      required this.currentViewport,
      required final Set<MouseButton> pressedMouseButtons,
      required final Set<LogicalKeyboardKey> pressedKeys,
      required this.activeInteraction})
      : _hitList = hitList,
        _pressedMouseButtons = pressedMouseButtons,
        _pressedKeys = pressedKeys,
        super._();

  @override
  final String eventId;
  @override
  final Offset logicalPosition;
  @override
  final Offset screenPosition;
  @override
  final Transform2D transformSnapshot;
  final List<DiagramObjectEntity> _hitList;
  @override
  List<DiagramObjectEntity> get hitList {
    if (_hitList is EqualUnmodifiableListView) return _hitList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hitList);
  }

  @override
  final BorderProximity borderProximity;
  @override
  final InteractionPhase phase;
  @override
  final PointerEvent rawEvent;
  @override
  final Offset? delta;
  @override
  final Rect currentViewport;
  final Set<MouseButton> _pressedMouseButtons;
  @override
  Set<MouseButton> get pressedMouseButtons {
    if (_pressedMouseButtons is EqualUnmodifiableSetView)
      return _pressedMouseButtons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_pressedMouseButtons);
  }

  final Set<LogicalKeyboardKey> _pressedKeys;
  @override
  Set<LogicalKeyboardKey> get pressedKeys {
    if (_pressedKeys is EqualUnmodifiableSetView) return _pressedKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_pressedKeys);
  }

  @override
  final InteractionType? activeInteraction;

  @override
  String toString() {
    return 'PhysicalEvent.pointer(eventId: $eventId, logicalPosition: $logicalPosition, screenPosition: $screenPosition, transformSnapshot: $transformSnapshot, hitList: $hitList, borderProximity: $borderProximity, phase: $phase, rawEvent: $rawEvent, delta: $delta, currentViewport: $currentViewport, pressedMouseButtons: $pressedMouseButtons, pressedKeys: $pressedKeys, activeInteraction: $activeInteraction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointerPhysicalEventImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.logicalPosition, logicalPosition) ||
                other.logicalPosition == logicalPosition) &&
            (identical(other.screenPosition, screenPosition) ||
                other.screenPosition == screenPosition) &&
            (identical(other.transformSnapshot, transformSnapshot) ||
                other.transformSnapshot == transformSnapshot) &&
            const DeepCollectionEquality().equals(other._hitList, _hitList) &&
            (identical(other.borderProximity, borderProximity) ||
                other.borderProximity == borderProximity) &&
            (identical(other.phase, phase) || other.phase == phase) &&
            (identical(other.rawEvent, rawEvent) ||
                other.rawEvent == rawEvent) &&
            (identical(other.delta, delta) || other.delta == delta) &&
            (identical(other.currentViewport, currentViewport) ||
                other.currentViewport == currentViewport) &&
            const DeepCollectionEquality()
                .equals(other._pressedMouseButtons, _pressedMouseButtons) &&
            const DeepCollectionEquality()
                .equals(other._pressedKeys, _pressedKeys) &&
            (identical(other.activeInteraction, activeInteraction) ||
                other.activeInteraction == activeInteraction));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      eventId,
      logicalPosition,
      screenPosition,
      transformSnapshot,
      const DeepCollectionEquality().hash(_hitList),
      borderProximity,
      phase,
      rawEvent,
      delta,
      currentViewport,
      const DeepCollectionEquality().hash(_pressedMouseButtons),
      const DeepCollectionEquality().hash(_pressedKeys),
      activeInteraction);

  /// Create a copy of PhysicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PointerPhysicalEventImplCopyWith<_$PointerPhysicalEventImpl>
      get copyWith =>
          __$$PointerPhysicalEventImplCopyWithImpl<_$PointerPhysicalEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            PointerEvent rawEvent,
            Offset? delta,
            Rect currentViewport,
            Set<MouseButton> pressedMouseButtons,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)
        pointer,
    required TResult Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            Object rawEvent,
            double? scale,
            double? rotation,
            Rect currentViewport,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)
        gesture,
    required TResult Function(
            String eventId,
            Transform2D transformSnapshot,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport,
            InteractionType? activeInteraction)
        keyboard,
    required TResult Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)
        dndTargetEnter,
    required TResult Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)
        dndTargetOver,
    required TResult Function(
            String eventId, Transform2D transformSnapshot, Duration timestamp)
        dndTargetLeave,
    required TResult Function(
            String eventId,
            Object data,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)
        dndTargetDrop,
  }) {
    return pointer(
        eventId,
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
        activeInteraction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            PointerEvent rawEvent,
            Offset? delta,
            Rect currentViewport,
            Set<MouseButton> pressedMouseButtons,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)?
        pointer,
    TResult? Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            Object rawEvent,
            double? scale,
            double? rotation,
            Rect currentViewport,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)?
        gesture,
    TResult? Function(
            String eventId,
            Transform2D transformSnapshot,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport,
            InteractionType? activeInteraction)?
        keyboard,
    TResult? Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetEnter,
    TResult? Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetOver,
    TResult? Function(
            String eventId, Transform2D transformSnapshot, Duration timestamp)?
        dndTargetLeave,
    TResult? Function(
            String eventId,
            Object data,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetDrop,
  }) {
    return pointer?.call(
        eventId,
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
        activeInteraction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            PointerEvent rawEvent,
            Offset? delta,
            Rect currentViewport,
            Set<MouseButton> pressedMouseButtons,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)?
        pointer,
    TResult Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            Object rawEvent,
            double? scale,
            double? rotation,
            Rect currentViewport,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)?
        gesture,
    TResult Function(
            String eventId,
            Transform2D transformSnapshot,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport,
            InteractionType? activeInteraction)?
        keyboard,
    TResult Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetEnter,
    TResult Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetOver,
    TResult Function(
            String eventId, Transform2D transformSnapshot, Duration timestamp)?
        dndTargetLeave,
    TResult Function(
            String eventId,
            Object data,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetDrop,
    required TResult orElse(),
  }) {
    if (pointer != null) {
      return pointer(
          eventId,
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
          activeInteraction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PointerPhysicalEvent value) pointer,
    required TResult Function(GesturePhysicalEvent value) gesture,
    required TResult Function(KeyboardPhysicalEvent value) keyboard,
    required TResult Function(DnDTargetEnterPhysicalEvent value) dndTargetEnter,
    required TResult Function(DnDTargetOverPhysicalEvent value) dndTargetOver,
    required TResult Function(DnDTargetLeavePhysicalEvent value) dndTargetLeave,
    required TResult Function(DnDTargetDropPhysicalEvent value) dndTargetDrop,
  }) {
    return pointer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PointerPhysicalEvent value)? pointer,
    TResult? Function(GesturePhysicalEvent value)? gesture,
    TResult? Function(KeyboardPhysicalEvent value)? keyboard,
    TResult? Function(DnDTargetEnterPhysicalEvent value)? dndTargetEnter,
    TResult? Function(DnDTargetOverPhysicalEvent value)? dndTargetOver,
    TResult? Function(DnDTargetLeavePhysicalEvent value)? dndTargetLeave,
    TResult? Function(DnDTargetDropPhysicalEvent value)? dndTargetDrop,
  }) {
    return pointer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PointerPhysicalEvent value)? pointer,
    TResult Function(GesturePhysicalEvent value)? gesture,
    TResult Function(KeyboardPhysicalEvent value)? keyboard,
    TResult Function(DnDTargetEnterPhysicalEvent value)? dndTargetEnter,
    TResult Function(DnDTargetOverPhysicalEvent value)? dndTargetOver,
    TResult Function(DnDTargetLeavePhysicalEvent value)? dndTargetLeave,
    TResult Function(DnDTargetDropPhysicalEvent value)? dndTargetDrop,
    required TResult orElse(),
  }) {
    if (pointer != null) {
      return pointer(this);
    }
    return orElse();
  }
}

abstract class PointerPhysicalEvent extends PhysicalEvent {
  const factory PointerPhysicalEvent(
          {required final String eventId,
          required final Offset logicalPosition,
          required final Offset screenPosition,
          required final Transform2D transformSnapshot,
          required final List<DiagramObjectEntity> hitList,
          required final BorderProximity borderProximity,
          required final InteractionPhase phase,
          required final PointerEvent rawEvent,
          final Offset? delta,
          required final Rect currentViewport,
          required final Set<MouseButton> pressedMouseButtons,
          required final Set<LogicalKeyboardKey> pressedKeys,
          required final InteractionType? activeInteraction}) =
      _$PointerPhysicalEventImpl;
  const PointerPhysicalEvent._() : super._();

  @override
  String get eventId;
  Offset get logicalPosition;
  Offset get screenPosition;
  @override
  Transform2D get transformSnapshot;
  List<DiagramObjectEntity> get hitList;
  BorderProximity get borderProximity;
  InteractionPhase get phase;
  PointerEvent get rawEvent;
  Offset? get delta;
  Rect get currentViewport;
  Set<MouseButton> get pressedMouseButtons;
  Set<LogicalKeyboardKey> get pressedKeys;
  InteractionType? get activeInteraction;

  /// Create a copy of PhysicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PointerPhysicalEventImplCopyWith<_$PointerPhysicalEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GesturePhysicalEventImplCopyWith<$Res>
    implements $PhysicalEventCopyWith<$Res> {
  factory _$$GesturePhysicalEventImplCopyWith(_$GesturePhysicalEventImpl value,
          $Res Function(_$GesturePhysicalEventImpl) then) =
      __$$GesturePhysicalEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String eventId,
      Offset logicalPosition,
      Offset screenPosition,
      Transform2D transformSnapshot,
      List<DiagramObjectEntity> hitList,
      BorderProximity borderProximity,
      InteractionPhase phase,
      Object rawEvent,
      double? scale,
      double? rotation,
      Rect currentViewport,
      Set<LogicalKeyboardKey> pressedKeys,
      InteractionType? activeInteraction});

  @override
  $Transform2DCopyWith<$Res> get transformSnapshot;
  $BorderProximityCopyWith<$Res> get borderProximity;
}

/// @nodoc
class __$$GesturePhysicalEventImplCopyWithImpl<$Res>
    extends _$PhysicalEventCopyWithImpl<$Res, _$GesturePhysicalEventImpl>
    implements _$$GesturePhysicalEventImplCopyWith<$Res> {
  __$$GesturePhysicalEventImplCopyWithImpl(_$GesturePhysicalEventImpl _value,
      $Res Function(_$GesturePhysicalEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhysicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? logicalPosition = null,
    Object? screenPosition = null,
    Object? transformSnapshot = null,
    Object? hitList = null,
    Object? borderProximity = null,
    Object? phase = null,
    Object? rawEvent = null,
    Object? scale = freezed,
    Object? rotation = freezed,
    Object? currentViewport = null,
    Object? pressedKeys = null,
    Object? activeInteraction = freezed,
  }) {
    return _then(_$GesturePhysicalEventImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      logicalPosition: null == logicalPosition
          ? _value.logicalPosition
          : logicalPosition // ignore: cast_nullable_to_non_nullable
              as Offset,
      screenPosition: null == screenPosition
          ? _value.screenPosition
          : screenPosition // ignore: cast_nullable_to_non_nullable
              as Offset,
      transformSnapshot: null == transformSnapshot
          ? _value.transformSnapshot
          : transformSnapshot // ignore: cast_nullable_to_non_nullable
              as Transform2D,
      hitList: null == hitList
          ? _value._hitList
          : hitList // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
      borderProximity: null == borderProximity
          ? _value.borderProximity
          : borderProximity // ignore: cast_nullable_to_non_nullable
              as BorderProximity,
      phase: null == phase
          ? _value.phase
          : phase // ignore: cast_nullable_to_non_nullable
              as InteractionPhase,
      rawEvent: null == rawEvent ? _value.rawEvent : rawEvent,
      scale: freezed == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double?,
      rotation: freezed == rotation
          ? _value.rotation
          : rotation // ignore: cast_nullable_to_non_nullable
              as double?,
      currentViewport: null == currentViewport
          ? _value.currentViewport
          : currentViewport // ignore: cast_nullable_to_non_nullable
              as Rect,
      pressedKeys: null == pressedKeys
          ? _value._pressedKeys
          : pressedKeys // ignore: cast_nullable_to_non_nullable
              as Set<LogicalKeyboardKey>,
      activeInteraction: freezed == activeInteraction
          ? _value.activeInteraction
          : activeInteraction // ignore: cast_nullable_to_non_nullable
              as InteractionType?,
    ));
  }

  /// Create a copy of PhysicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BorderProximityCopyWith<$Res> get borderProximity {
    return $BorderProximityCopyWith<$Res>(_value.borderProximity, (value) {
      return _then(_value.copyWith(borderProximity: value));
    });
  }
}

/// @nodoc

class _$GesturePhysicalEventImpl extends GesturePhysicalEvent {
  const _$GesturePhysicalEventImpl(
      {required this.eventId,
      required this.logicalPosition,
      required this.screenPosition,
      required this.transformSnapshot,
      required final List<DiagramObjectEntity> hitList,
      required this.borderProximity,
      required this.phase,
      required this.rawEvent,
      this.scale,
      this.rotation,
      required this.currentViewport,
      required final Set<LogicalKeyboardKey> pressedKeys,
      required this.activeInteraction})
      : _hitList = hitList,
        _pressedKeys = pressedKeys,
        super._();

  @override
  final String eventId;
  @override
  final Offset logicalPosition;
  @override
  final Offset screenPosition;
  @override
  final Transform2D transformSnapshot;
  final List<DiagramObjectEntity> _hitList;
  @override
  List<DiagramObjectEntity> get hitList {
    if (_hitList is EqualUnmodifiableListView) return _hitList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hitList);
  }

  @override
  final BorderProximity borderProximity;
  @override
  final InteractionPhase phase;
  @override
  final Object rawEvent;
  @override
  final double? scale;
  @override
  final double? rotation;
  @override
  final Rect currentViewport;
  final Set<LogicalKeyboardKey> _pressedKeys;
  @override
  Set<LogicalKeyboardKey> get pressedKeys {
    if (_pressedKeys is EqualUnmodifiableSetView) return _pressedKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_pressedKeys);
  }

  @override
  final InteractionType? activeInteraction;

  @override
  String toString() {
    return 'PhysicalEvent.gesture(eventId: $eventId, logicalPosition: $logicalPosition, screenPosition: $screenPosition, transformSnapshot: $transformSnapshot, hitList: $hitList, borderProximity: $borderProximity, phase: $phase, rawEvent: $rawEvent, scale: $scale, rotation: $rotation, currentViewport: $currentViewport, pressedKeys: $pressedKeys, activeInteraction: $activeInteraction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GesturePhysicalEventImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.logicalPosition, logicalPosition) ||
                other.logicalPosition == logicalPosition) &&
            (identical(other.screenPosition, screenPosition) ||
                other.screenPosition == screenPosition) &&
            (identical(other.transformSnapshot, transformSnapshot) ||
                other.transformSnapshot == transformSnapshot) &&
            const DeepCollectionEquality().equals(other._hitList, _hitList) &&
            (identical(other.borderProximity, borderProximity) ||
                other.borderProximity == borderProximity) &&
            (identical(other.phase, phase) || other.phase == phase) &&
            const DeepCollectionEquality().equals(other.rawEvent, rawEvent) &&
            (identical(other.scale, scale) || other.scale == scale) &&
            (identical(other.rotation, rotation) ||
                other.rotation == rotation) &&
            (identical(other.currentViewport, currentViewport) ||
                other.currentViewport == currentViewport) &&
            const DeepCollectionEquality()
                .equals(other._pressedKeys, _pressedKeys) &&
            (identical(other.activeInteraction, activeInteraction) ||
                other.activeInteraction == activeInteraction));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      eventId,
      logicalPosition,
      screenPosition,
      transformSnapshot,
      const DeepCollectionEquality().hash(_hitList),
      borderProximity,
      phase,
      const DeepCollectionEquality().hash(rawEvent),
      scale,
      rotation,
      currentViewport,
      const DeepCollectionEquality().hash(_pressedKeys),
      activeInteraction);

  /// Create a copy of PhysicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GesturePhysicalEventImplCopyWith<_$GesturePhysicalEventImpl>
      get copyWith =>
          __$$GesturePhysicalEventImplCopyWithImpl<_$GesturePhysicalEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            PointerEvent rawEvent,
            Offset? delta,
            Rect currentViewport,
            Set<MouseButton> pressedMouseButtons,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)
        pointer,
    required TResult Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            Object rawEvent,
            double? scale,
            double? rotation,
            Rect currentViewport,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)
        gesture,
    required TResult Function(
            String eventId,
            Transform2D transformSnapshot,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport,
            InteractionType? activeInteraction)
        keyboard,
    required TResult Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)
        dndTargetEnter,
    required TResult Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)
        dndTargetOver,
    required TResult Function(
            String eventId, Transform2D transformSnapshot, Duration timestamp)
        dndTargetLeave,
    required TResult Function(
            String eventId,
            Object data,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)
        dndTargetDrop,
  }) {
    return gesture(
        eventId,
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
        activeInteraction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            PointerEvent rawEvent,
            Offset? delta,
            Rect currentViewport,
            Set<MouseButton> pressedMouseButtons,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)?
        pointer,
    TResult? Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            Object rawEvent,
            double? scale,
            double? rotation,
            Rect currentViewport,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)?
        gesture,
    TResult? Function(
            String eventId,
            Transform2D transformSnapshot,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport,
            InteractionType? activeInteraction)?
        keyboard,
    TResult? Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetEnter,
    TResult? Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetOver,
    TResult? Function(
            String eventId, Transform2D transformSnapshot, Duration timestamp)?
        dndTargetLeave,
    TResult? Function(
            String eventId,
            Object data,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetDrop,
  }) {
    return gesture?.call(
        eventId,
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
        activeInteraction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            PointerEvent rawEvent,
            Offset? delta,
            Rect currentViewport,
            Set<MouseButton> pressedMouseButtons,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)?
        pointer,
    TResult Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            Object rawEvent,
            double? scale,
            double? rotation,
            Rect currentViewport,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)?
        gesture,
    TResult Function(
            String eventId,
            Transform2D transformSnapshot,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport,
            InteractionType? activeInteraction)?
        keyboard,
    TResult Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetEnter,
    TResult Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetOver,
    TResult Function(
            String eventId, Transform2D transformSnapshot, Duration timestamp)?
        dndTargetLeave,
    TResult Function(
            String eventId,
            Object data,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetDrop,
    required TResult orElse(),
  }) {
    if (gesture != null) {
      return gesture(
          eventId,
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
          activeInteraction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PointerPhysicalEvent value) pointer,
    required TResult Function(GesturePhysicalEvent value) gesture,
    required TResult Function(KeyboardPhysicalEvent value) keyboard,
    required TResult Function(DnDTargetEnterPhysicalEvent value) dndTargetEnter,
    required TResult Function(DnDTargetOverPhysicalEvent value) dndTargetOver,
    required TResult Function(DnDTargetLeavePhysicalEvent value) dndTargetLeave,
    required TResult Function(DnDTargetDropPhysicalEvent value) dndTargetDrop,
  }) {
    return gesture(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PointerPhysicalEvent value)? pointer,
    TResult? Function(GesturePhysicalEvent value)? gesture,
    TResult? Function(KeyboardPhysicalEvent value)? keyboard,
    TResult? Function(DnDTargetEnterPhysicalEvent value)? dndTargetEnter,
    TResult? Function(DnDTargetOverPhysicalEvent value)? dndTargetOver,
    TResult? Function(DnDTargetLeavePhysicalEvent value)? dndTargetLeave,
    TResult? Function(DnDTargetDropPhysicalEvent value)? dndTargetDrop,
  }) {
    return gesture?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PointerPhysicalEvent value)? pointer,
    TResult Function(GesturePhysicalEvent value)? gesture,
    TResult Function(KeyboardPhysicalEvent value)? keyboard,
    TResult Function(DnDTargetEnterPhysicalEvent value)? dndTargetEnter,
    TResult Function(DnDTargetOverPhysicalEvent value)? dndTargetOver,
    TResult Function(DnDTargetLeavePhysicalEvent value)? dndTargetLeave,
    TResult Function(DnDTargetDropPhysicalEvent value)? dndTargetDrop,
    required TResult orElse(),
  }) {
    if (gesture != null) {
      return gesture(this);
    }
    return orElse();
  }
}

abstract class GesturePhysicalEvent extends PhysicalEvent {
  const factory GesturePhysicalEvent(
          {required final String eventId,
          required final Offset logicalPosition,
          required final Offset screenPosition,
          required final Transform2D transformSnapshot,
          required final List<DiagramObjectEntity> hitList,
          required final BorderProximity borderProximity,
          required final InteractionPhase phase,
          required final Object rawEvent,
          final double? scale,
          final double? rotation,
          required final Rect currentViewport,
          required final Set<LogicalKeyboardKey> pressedKeys,
          required final InteractionType? activeInteraction}) =
      _$GesturePhysicalEventImpl;
  const GesturePhysicalEvent._() : super._();

  @override
  String get eventId;
  Offset get logicalPosition;
  Offset get screenPosition;
  @override
  Transform2D get transformSnapshot;
  List<DiagramObjectEntity> get hitList;
  BorderProximity get borderProximity;
  InteractionPhase get phase;
  Object get rawEvent;
  double? get scale;
  double? get rotation;
  Rect get currentViewport;
  Set<LogicalKeyboardKey> get pressedKeys;
  InteractionType? get activeInteraction;

  /// Create a copy of PhysicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GesturePhysicalEventImplCopyWith<_$GesturePhysicalEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$KeyboardPhysicalEventImplCopyWith<$Res>
    implements $PhysicalEventCopyWith<$Res> {
  factory _$$KeyboardPhysicalEventImplCopyWith(
          _$KeyboardPhysicalEventImpl value,
          $Res Function(_$KeyboardPhysicalEventImpl) then) =
      __$$KeyboardPhysicalEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String eventId,
      Transform2D transformSnapshot,
      KeyEvent rawEvent,
      Set<LogicalKeyboardKey> pressedKeys,
      Rect currentViewport,
      InteractionType? activeInteraction});

  @override
  $Transform2DCopyWith<$Res> get transformSnapshot;
}

/// @nodoc
class __$$KeyboardPhysicalEventImplCopyWithImpl<$Res>
    extends _$PhysicalEventCopyWithImpl<$Res, _$KeyboardPhysicalEventImpl>
    implements _$$KeyboardPhysicalEventImplCopyWith<$Res> {
  __$$KeyboardPhysicalEventImplCopyWithImpl(_$KeyboardPhysicalEventImpl _value,
      $Res Function(_$KeyboardPhysicalEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhysicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? transformSnapshot = null,
    Object? rawEvent = null,
    Object? pressedKeys = null,
    Object? currentViewport = null,
    Object? activeInteraction = freezed,
  }) {
    return _then(_$KeyboardPhysicalEventImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      transformSnapshot: null == transformSnapshot
          ? _value.transformSnapshot
          : transformSnapshot // ignore: cast_nullable_to_non_nullable
              as Transform2D,
      rawEvent: null == rawEvent
          ? _value.rawEvent
          : rawEvent // ignore: cast_nullable_to_non_nullable
              as KeyEvent,
      pressedKeys: null == pressedKeys
          ? _value._pressedKeys
          : pressedKeys // ignore: cast_nullable_to_non_nullable
              as Set<LogicalKeyboardKey>,
      currentViewport: null == currentViewport
          ? _value.currentViewport
          : currentViewport // ignore: cast_nullable_to_non_nullable
              as Rect,
      activeInteraction: freezed == activeInteraction
          ? _value.activeInteraction
          : activeInteraction // ignore: cast_nullable_to_non_nullable
              as InteractionType?,
    ));
  }
}

/// @nodoc

class _$KeyboardPhysicalEventImpl extends KeyboardPhysicalEvent {
  const _$KeyboardPhysicalEventImpl(
      {required this.eventId,
      required this.transformSnapshot,
      required this.rawEvent,
      required final Set<LogicalKeyboardKey> pressedKeys,
      required this.currentViewport,
      required this.activeInteraction})
      : _pressedKeys = pressedKeys,
        super._();

  @override
  final String eventId;
  @override
  final Transform2D transformSnapshot;
  @override
  final KeyEvent rawEvent;
  final Set<LogicalKeyboardKey> _pressedKeys;
  @override
  Set<LogicalKeyboardKey> get pressedKeys {
    if (_pressedKeys is EqualUnmodifiableSetView) return _pressedKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_pressedKeys);
  }

  @override
  final Rect currentViewport;
  @override
  final InteractionType? activeInteraction;

  @override
  String toString() {
    return 'PhysicalEvent.keyboard(eventId: $eventId, transformSnapshot: $transformSnapshot, rawEvent: $rawEvent, pressedKeys: $pressedKeys, currentViewport: $currentViewport, activeInteraction: $activeInteraction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KeyboardPhysicalEventImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.transformSnapshot, transformSnapshot) ||
                other.transformSnapshot == transformSnapshot) &&
            (identical(other.rawEvent, rawEvent) ||
                other.rawEvent == rawEvent) &&
            const DeepCollectionEquality()
                .equals(other._pressedKeys, _pressedKeys) &&
            (identical(other.currentViewport, currentViewport) ||
                other.currentViewport == currentViewport) &&
            (identical(other.activeInteraction, activeInteraction) ||
                other.activeInteraction == activeInteraction));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      eventId,
      transformSnapshot,
      rawEvent,
      const DeepCollectionEquality().hash(_pressedKeys),
      currentViewport,
      activeInteraction);

  /// Create a copy of PhysicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KeyboardPhysicalEventImplCopyWith<_$KeyboardPhysicalEventImpl>
      get copyWith => __$$KeyboardPhysicalEventImplCopyWithImpl<
          _$KeyboardPhysicalEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            PointerEvent rawEvent,
            Offset? delta,
            Rect currentViewport,
            Set<MouseButton> pressedMouseButtons,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)
        pointer,
    required TResult Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            Object rawEvent,
            double? scale,
            double? rotation,
            Rect currentViewport,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)
        gesture,
    required TResult Function(
            String eventId,
            Transform2D transformSnapshot,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport,
            InteractionType? activeInteraction)
        keyboard,
    required TResult Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)
        dndTargetEnter,
    required TResult Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)
        dndTargetOver,
    required TResult Function(
            String eventId, Transform2D transformSnapshot, Duration timestamp)
        dndTargetLeave,
    required TResult Function(
            String eventId,
            Object data,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)
        dndTargetDrop,
  }) {
    return keyboard(eventId, transformSnapshot, rawEvent, pressedKeys,
        currentViewport, activeInteraction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            PointerEvent rawEvent,
            Offset? delta,
            Rect currentViewport,
            Set<MouseButton> pressedMouseButtons,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)?
        pointer,
    TResult? Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            Object rawEvent,
            double? scale,
            double? rotation,
            Rect currentViewport,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)?
        gesture,
    TResult? Function(
            String eventId,
            Transform2D transformSnapshot,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport,
            InteractionType? activeInteraction)?
        keyboard,
    TResult? Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetEnter,
    TResult? Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetOver,
    TResult? Function(
            String eventId, Transform2D transformSnapshot, Duration timestamp)?
        dndTargetLeave,
    TResult? Function(
            String eventId,
            Object data,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetDrop,
  }) {
    return keyboard?.call(eventId, transformSnapshot, rawEvent, pressedKeys,
        currentViewport, activeInteraction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            PointerEvent rawEvent,
            Offset? delta,
            Rect currentViewport,
            Set<MouseButton> pressedMouseButtons,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)?
        pointer,
    TResult Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            Object rawEvent,
            double? scale,
            double? rotation,
            Rect currentViewport,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)?
        gesture,
    TResult Function(
            String eventId,
            Transform2D transformSnapshot,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport,
            InteractionType? activeInteraction)?
        keyboard,
    TResult Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetEnter,
    TResult Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetOver,
    TResult Function(
            String eventId, Transform2D transformSnapshot, Duration timestamp)?
        dndTargetLeave,
    TResult Function(
            String eventId,
            Object data,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetDrop,
    required TResult orElse(),
  }) {
    if (keyboard != null) {
      return keyboard(eventId, transformSnapshot, rawEvent, pressedKeys,
          currentViewport, activeInteraction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PointerPhysicalEvent value) pointer,
    required TResult Function(GesturePhysicalEvent value) gesture,
    required TResult Function(KeyboardPhysicalEvent value) keyboard,
    required TResult Function(DnDTargetEnterPhysicalEvent value) dndTargetEnter,
    required TResult Function(DnDTargetOverPhysicalEvent value) dndTargetOver,
    required TResult Function(DnDTargetLeavePhysicalEvent value) dndTargetLeave,
    required TResult Function(DnDTargetDropPhysicalEvent value) dndTargetDrop,
  }) {
    return keyboard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PointerPhysicalEvent value)? pointer,
    TResult? Function(GesturePhysicalEvent value)? gesture,
    TResult? Function(KeyboardPhysicalEvent value)? keyboard,
    TResult? Function(DnDTargetEnterPhysicalEvent value)? dndTargetEnter,
    TResult? Function(DnDTargetOverPhysicalEvent value)? dndTargetOver,
    TResult? Function(DnDTargetLeavePhysicalEvent value)? dndTargetLeave,
    TResult? Function(DnDTargetDropPhysicalEvent value)? dndTargetDrop,
  }) {
    return keyboard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PointerPhysicalEvent value)? pointer,
    TResult Function(GesturePhysicalEvent value)? gesture,
    TResult Function(KeyboardPhysicalEvent value)? keyboard,
    TResult Function(DnDTargetEnterPhysicalEvent value)? dndTargetEnter,
    TResult Function(DnDTargetOverPhysicalEvent value)? dndTargetOver,
    TResult Function(DnDTargetLeavePhysicalEvent value)? dndTargetLeave,
    TResult Function(DnDTargetDropPhysicalEvent value)? dndTargetDrop,
    required TResult orElse(),
  }) {
    if (keyboard != null) {
      return keyboard(this);
    }
    return orElse();
  }
}

abstract class KeyboardPhysicalEvent extends PhysicalEvent {
  const factory KeyboardPhysicalEvent(
          {required final String eventId,
          required final Transform2D transformSnapshot,
          required final KeyEvent rawEvent,
          required final Set<LogicalKeyboardKey> pressedKeys,
          required final Rect currentViewport,
          required final InteractionType? activeInteraction}) =
      _$KeyboardPhysicalEventImpl;
  const KeyboardPhysicalEvent._() : super._();

  @override
  String get eventId;
  @override
  Transform2D get transformSnapshot;
  KeyEvent get rawEvent;
  Set<LogicalKeyboardKey> get pressedKeys;
  Rect get currentViewport;
  InteractionType? get activeInteraction;

  /// Create a copy of PhysicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KeyboardPhysicalEventImplCopyWith<_$KeyboardPhysicalEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DnDTargetEnterPhysicalEventImplCopyWith<$Res>
    implements $PhysicalEventCopyWith<$Res> {
  factory _$$DnDTargetEnterPhysicalEventImplCopyWith(
          _$DnDTargetEnterPhysicalEventImpl value,
          $Res Function(_$DnDTargetEnterPhysicalEventImpl) then) =
      __$$DnDTargetEnterPhysicalEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String eventId,
      Object dataPreview,
      Offset screenPosition,
      Offset logicalPosition,
      Transform2D transformSnapshot,
      Duration timestamp});

  @override
  $Transform2DCopyWith<$Res> get transformSnapshot;
}

/// @nodoc
class __$$DnDTargetEnterPhysicalEventImplCopyWithImpl<$Res>
    extends _$PhysicalEventCopyWithImpl<$Res, _$DnDTargetEnterPhysicalEventImpl>
    implements _$$DnDTargetEnterPhysicalEventImplCopyWith<$Res> {
  __$$DnDTargetEnterPhysicalEventImplCopyWithImpl(
      _$DnDTargetEnterPhysicalEventImpl _value,
      $Res Function(_$DnDTargetEnterPhysicalEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhysicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? dataPreview = null,
    Object? screenPosition = null,
    Object? logicalPosition = null,
    Object? transformSnapshot = null,
    Object? timestamp = null,
  }) {
    return _then(_$DnDTargetEnterPhysicalEventImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      dataPreview: null == dataPreview ? _value.dataPreview : dataPreview,
      screenPosition: null == screenPosition
          ? _value.screenPosition
          : screenPosition // ignore: cast_nullable_to_non_nullable
              as Offset,
      logicalPosition: null == logicalPosition
          ? _value.logicalPosition
          : logicalPosition // ignore: cast_nullable_to_non_nullable
              as Offset,
      transformSnapshot: null == transformSnapshot
          ? _value.transformSnapshot
          : transformSnapshot // ignore: cast_nullable_to_non_nullable
              as Transform2D,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$DnDTargetEnterPhysicalEventImpl extends DnDTargetEnterPhysicalEvent {
  const _$DnDTargetEnterPhysicalEventImpl(
      {required this.eventId,
      required this.dataPreview,
      required this.screenPosition,
      required this.logicalPosition,
      required this.transformSnapshot,
      required this.timestamp})
      : super._();

  @override
  final String eventId;
  @override
  final Object dataPreview;
  @override
  final Offset screenPosition;
  @override
  final Offset logicalPosition;
  @override
  final Transform2D transformSnapshot;
  @override
  final Duration timestamp;

  @override
  String toString() {
    return 'PhysicalEvent.dndTargetEnter(eventId: $eventId, dataPreview: $dataPreview, screenPosition: $screenPosition, logicalPosition: $logicalPosition, transformSnapshot: $transformSnapshot, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DnDTargetEnterPhysicalEventImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            const DeepCollectionEquality()
                .equals(other.dataPreview, dataPreview) &&
            (identical(other.screenPosition, screenPosition) ||
                other.screenPosition == screenPosition) &&
            (identical(other.logicalPosition, logicalPosition) ||
                other.logicalPosition == logicalPosition) &&
            (identical(other.transformSnapshot, transformSnapshot) ||
                other.transformSnapshot == transformSnapshot) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      eventId,
      const DeepCollectionEquality().hash(dataPreview),
      screenPosition,
      logicalPosition,
      transformSnapshot,
      timestamp);

  /// Create a copy of PhysicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DnDTargetEnterPhysicalEventImplCopyWith<_$DnDTargetEnterPhysicalEventImpl>
      get copyWith => __$$DnDTargetEnterPhysicalEventImplCopyWithImpl<
          _$DnDTargetEnterPhysicalEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            PointerEvent rawEvent,
            Offset? delta,
            Rect currentViewport,
            Set<MouseButton> pressedMouseButtons,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)
        pointer,
    required TResult Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            Object rawEvent,
            double? scale,
            double? rotation,
            Rect currentViewport,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)
        gesture,
    required TResult Function(
            String eventId,
            Transform2D transformSnapshot,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport,
            InteractionType? activeInteraction)
        keyboard,
    required TResult Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)
        dndTargetEnter,
    required TResult Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)
        dndTargetOver,
    required TResult Function(
            String eventId, Transform2D transformSnapshot, Duration timestamp)
        dndTargetLeave,
    required TResult Function(
            String eventId,
            Object data,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)
        dndTargetDrop,
  }) {
    return dndTargetEnter(eventId, dataPreview, screenPosition, logicalPosition,
        transformSnapshot, timestamp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            PointerEvent rawEvent,
            Offset? delta,
            Rect currentViewport,
            Set<MouseButton> pressedMouseButtons,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)?
        pointer,
    TResult? Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            Object rawEvent,
            double? scale,
            double? rotation,
            Rect currentViewport,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)?
        gesture,
    TResult? Function(
            String eventId,
            Transform2D transformSnapshot,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport,
            InteractionType? activeInteraction)?
        keyboard,
    TResult? Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetEnter,
    TResult? Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetOver,
    TResult? Function(
            String eventId, Transform2D transformSnapshot, Duration timestamp)?
        dndTargetLeave,
    TResult? Function(
            String eventId,
            Object data,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetDrop,
  }) {
    return dndTargetEnter?.call(eventId, dataPreview, screenPosition,
        logicalPosition, transformSnapshot, timestamp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            PointerEvent rawEvent,
            Offset? delta,
            Rect currentViewport,
            Set<MouseButton> pressedMouseButtons,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)?
        pointer,
    TResult Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            Object rawEvent,
            double? scale,
            double? rotation,
            Rect currentViewport,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)?
        gesture,
    TResult Function(
            String eventId,
            Transform2D transformSnapshot,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport,
            InteractionType? activeInteraction)?
        keyboard,
    TResult Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetEnter,
    TResult Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetOver,
    TResult Function(
            String eventId, Transform2D transformSnapshot, Duration timestamp)?
        dndTargetLeave,
    TResult Function(
            String eventId,
            Object data,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetDrop,
    required TResult orElse(),
  }) {
    if (dndTargetEnter != null) {
      return dndTargetEnter(eventId, dataPreview, screenPosition,
          logicalPosition, transformSnapshot, timestamp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PointerPhysicalEvent value) pointer,
    required TResult Function(GesturePhysicalEvent value) gesture,
    required TResult Function(KeyboardPhysicalEvent value) keyboard,
    required TResult Function(DnDTargetEnterPhysicalEvent value) dndTargetEnter,
    required TResult Function(DnDTargetOverPhysicalEvent value) dndTargetOver,
    required TResult Function(DnDTargetLeavePhysicalEvent value) dndTargetLeave,
    required TResult Function(DnDTargetDropPhysicalEvent value) dndTargetDrop,
  }) {
    return dndTargetEnter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PointerPhysicalEvent value)? pointer,
    TResult? Function(GesturePhysicalEvent value)? gesture,
    TResult? Function(KeyboardPhysicalEvent value)? keyboard,
    TResult? Function(DnDTargetEnterPhysicalEvent value)? dndTargetEnter,
    TResult? Function(DnDTargetOverPhysicalEvent value)? dndTargetOver,
    TResult? Function(DnDTargetLeavePhysicalEvent value)? dndTargetLeave,
    TResult? Function(DnDTargetDropPhysicalEvent value)? dndTargetDrop,
  }) {
    return dndTargetEnter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PointerPhysicalEvent value)? pointer,
    TResult Function(GesturePhysicalEvent value)? gesture,
    TResult Function(KeyboardPhysicalEvent value)? keyboard,
    TResult Function(DnDTargetEnterPhysicalEvent value)? dndTargetEnter,
    TResult Function(DnDTargetOverPhysicalEvent value)? dndTargetOver,
    TResult Function(DnDTargetLeavePhysicalEvent value)? dndTargetLeave,
    TResult Function(DnDTargetDropPhysicalEvent value)? dndTargetDrop,
    required TResult orElse(),
  }) {
    if (dndTargetEnter != null) {
      return dndTargetEnter(this);
    }
    return orElse();
  }
}

abstract class DnDTargetEnterPhysicalEvent extends PhysicalEvent {
  const factory DnDTargetEnterPhysicalEvent(
      {required final String eventId,
      required final Object dataPreview,
      required final Offset screenPosition,
      required final Offset logicalPosition,
      required final Transform2D transformSnapshot,
      required final Duration timestamp}) = _$DnDTargetEnterPhysicalEventImpl;
  const DnDTargetEnterPhysicalEvent._() : super._();

  @override
  String get eventId;
  Object get dataPreview;
  Offset get screenPosition;
  Offset get logicalPosition;
  @override
  Transform2D get transformSnapshot;
  Duration get timestamp;

  /// Create a copy of PhysicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DnDTargetEnterPhysicalEventImplCopyWith<_$DnDTargetEnterPhysicalEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DnDTargetOverPhysicalEventImplCopyWith<$Res>
    implements $PhysicalEventCopyWith<$Res> {
  factory _$$DnDTargetOverPhysicalEventImplCopyWith(
          _$DnDTargetOverPhysicalEventImpl value,
          $Res Function(_$DnDTargetOverPhysicalEventImpl) then) =
      __$$DnDTargetOverPhysicalEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String eventId,
      Object dataPreview,
      Offset screenPosition,
      Offset logicalPosition,
      Transform2D transformSnapshot,
      Duration timestamp});

  @override
  $Transform2DCopyWith<$Res> get transformSnapshot;
}

/// @nodoc
class __$$DnDTargetOverPhysicalEventImplCopyWithImpl<$Res>
    extends _$PhysicalEventCopyWithImpl<$Res, _$DnDTargetOverPhysicalEventImpl>
    implements _$$DnDTargetOverPhysicalEventImplCopyWith<$Res> {
  __$$DnDTargetOverPhysicalEventImplCopyWithImpl(
      _$DnDTargetOverPhysicalEventImpl _value,
      $Res Function(_$DnDTargetOverPhysicalEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhysicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? dataPreview = null,
    Object? screenPosition = null,
    Object? logicalPosition = null,
    Object? transformSnapshot = null,
    Object? timestamp = null,
  }) {
    return _then(_$DnDTargetOverPhysicalEventImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      dataPreview: null == dataPreview ? _value.dataPreview : dataPreview,
      screenPosition: null == screenPosition
          ? _value.screenPosition
          : screenPosition // ignore: cast_nullable_to_non_nullable
              as Offset,
      logicalPosition: null == logicalPosition
          ? _value.logicalPosition
          : logicalPosition // ignore: cast_nullable_to_non_nullable
              as Offset,
      transformSnapshot: null == transformSnapshot
          ? _value.transformSnapshot
          : transformSnapshot // ignore: cast_nullable_to_non_nullable
              as Transform2D,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$DnDTargetOverPhysicalEventImpl extends DnDTargetOverPhysicalEvent {
  const _$DnDTargetOverPhysicalEventImpl(
      {required this.eventId,
      required this.dataPreview,
      required this.screenPosition,
      required this.logicalPosition,
      required this.transformSnapshot,
      required this.timestamp})
      : super._();

  @override
  final String eventId;
  @override
  final Object dataPreview;
  @override
  final Offset screenPosition;
  @override
  final Offset logicalPosition;
  @override
  final Transform2D transformSnapshot;
  @override
  final Duration timestamp;

  @override
  String toString() {
    return 'PhysicalEvent.dndTargetOver(eventId: $eventId, dataPreview: $dataPreview, screenPosition: $screenPosition, logicalPosition: $logicalPosition, transformSnapshot: $transformSnapshot, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DnDTargetOverPhysicalEventImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            const DeepCollectionEquality()
                .equals(other.dataPreview, dataPreview) &&
            (identical(other.screenPosition, screenPosition) ||
                other.screenPosition == screenPosition) &&
            (identical(other.logicalPosition, logicalPosition) ||
                other.logicalPosition == logicalPosition) &&
            (identical(other.transformSnapshot, transformSnapshot) ||
                other.transformSnapshot == transformSnapshot) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      eventId,
      const DeepCollectionEquality().hash(dataPreview),
      screenPosition,
      logicalPosition,
      transformSnapshot,
      timestamp);

  /// Create a copy of PhysicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DnDTargetOverPhysicalEventImplCopyWith<_$DnDTargetOverPhysicalEventImpl>
      get copyWith => __$$DnDTargetOverPhysicalEventImplCopyWithImpl<
          _$DnDTargetOverPhysicalEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            PointerEvent rawEvent,
            Offset? delta,
            Rect currentViewport,
            Set<MouseButton> pressedMouseButtons,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)
        pointer,
    required TResult Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            Object rawEvent,
            double? scale,
            double? rotation,
            Rect currentViewport,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)
        gesture,
    required TResult Function(
            String eventId,
            Transform2D transformSnapshot,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport,
            InteractionType? activeInteraction)
        keyboard,
    required TResult Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)
        dndTargetEnter,
    required TResult Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)
        dndTargetOver,
    required TResult Function(
            String eventId, Transform2D transformSnapshot, Duration timestamp)
        dndTargetLeave,
    required TResult Function(
            String eventId,
            Object data,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)
        dndTargetDrop,
  }) {
    return dndTargetOver(eventId, dataPreview, screenPosition, logicalPosition,
        transformSnapshot, timestamp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            PointerEvent rawEvent,
            Offset? delta,
            Rect currentViewport,
            Set<MouseButton> pressedMouseButtons,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)?
        pointer,
    TResult? Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            Object rawEvent,
            double? scale,
            double? rotation,
            Rect currentViewport,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)?
        gesture,
    TResult? Function(
            String eventId,
            Transform2D transformSnapshot,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport,
            InteractionType? activeInteraction)?
        keyboard,
    TResult? Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetEnter,
    TResult? Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetOver,
    TResult? Function(
            String eventId, Transform2D transformSnapshot, Duration timestamp)?
        dndTargetLeave,
    TResult? Function(
            String eventId,
            Object data,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetDrop,
  }) {
    return dndTargetOver?.call(eventId, dataPreview, screenPosition,
        logicalPosition, transformSnapshot, timestamp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            PointerEvent rawEvent,
            Offset? delta,
            Rect currentViewport,
            Set<MouseButton> pressedMouseButtons,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)?
        pointer,
    TResult Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            Object rawEvent,
            double? scale,
            double? rotation,
            Rect currentViewport,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)?
        gesture,
    TResult Function(
            String eventId,
            Transform2D transformSnapshot,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport,
            InteractionType? activeInteraction)?
        keyboard,
    TResult Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetEnter,
    TResult Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetOver,
    TResult Function(
            String eventId, Transform2D transformSnapshot, Duration timestamp)?
        dndTargetLeave,
    TResult Function(
            String eventId,
            Object data,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetDrop,
    required TResult orElse(),
  }) {
    if (dndTargetOver != null) {
      return dndTargetOver(eventId, dataPreview, screenPosition,
          logicalPosition, transformSnapshot, timestamp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PointerPhysicalEvent value) pointer,
    required TResult Function(GesturePhysicalEvent value) gesture,
    required TResult Function(KeyboardPhysicalEvent value) keyboard,
    required TResult Function(DnDTargetEnterPhysicalEvent value) dndTargetEnter,
    required TResult Function(DnDTargetOverPhysicalEvent value) dndTargetOver,
    required TResult Function(DnDTargetLeavePhysicalEvent value) dndTargetLeave,
    required TResult Function(DnDTargetDropPhysicalEvent value) dndTargetDrop,
  }) {
    return dndTargetOver(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PointerPhysicalEvent value)? pointer,
    TResult? Function(GesturePhysicalEvent value)? gesture,
    TResult? Function(KeyboardPhysicalEvent value)? keyboard,
    TResult? Function(DnDTargetEnterPhysicalEvent value)? dndTargetEnter,
    TResult? Function(DnDTargetOverPhysicalEvent value)? dndTargetOver,
    TResult? Function(DnDTargetLeavePhysicalEvent value)? dndTargetLeave,
    TResult? Function(DnDTargetDropPhysicalEvent value)? dndTargetDrop,
  }) {
    return dndTargetOver?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PointerPhysicalEvent value)? pointer,
    TResult Function(GesturePhysicalEvent value)? gesture,
    TResult Function(KeyboardPhysicalEvent value)? keyboard,
    TResult Function(DnDTargetEnterPhysicalEvent value)? dndTargetEnter,
    TResult Function(DnDTargetOverPhysicalEvent value)? dndTargetOver,
    TResult Function(DnDTargetLeavePhysicalEvent value)? dndTargetLeave,
    TResult Function(DnDTargetDropPhysicalEvent value)? dndTargetDrop,
    required TResult orElse(),
  }) {
    if (dndTargetOver != null) {
      return dndTargetOver(this);
    }
    return orElse();
  }
}

abstract class DnDTargetOverPhysicalEvent extends PhysicalEvent {
  const factory DnDTargetOverPhysicalEvent(
      {required final String eventId,
      required final Object dataPreview,
      required final Offset screenPosition,
      required final Offset logicalPosition,
      required final Transform2D transformSnapshot,
      required final Duration timestamp}) = _$DnDTargetOverPhysicalEventImpl;
  const DnDTargetOverPhysicalEvent._() : super._();

  @override
  String get eventId;
  Object get dataPreview;
  Offset get screenPosition;
  Offset get logicalPosition;
  @override
  Transform2D get transformSnapshot;
  Duration get timestamp;

  /// Create a copy of PhysicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DnDTargetOverPhysicalEventImplCopyWith<_$DnDTargetOverPhysicalEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DnDTargetLeavePhysicalEventImplCopyWith<$Res>
    implements $PhysicalEventCopyWith<$Res> {
  factory _$$DnDTargetLeavePhysicalEventImplCopyWith(
          _$DnDTargetLeavePhysicalEventImpl value,
          $Res Function(_$DnDTargetLeavePhysicalEventImpl) then) =
      __$$DnDTargetLeavePhysicalEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String eventId, Transform2D transformSnapshot, Duration timestamp});

  @override
  $Transform2DCopyWith<$Res> get transformSnapshot;
}

/// @nodoc
class __$$DnDTargetLeavePhysicalEventImplCopyWithImpl<$Res>
    extends _$PhysicalEventCopyWithImpl<$Res, _$DnDTargetLeavePhysicalEventImpl>
    implements _$$DnDTargetLeavePhysicalEventImplCopyWith<$Res> {
  __$$DnDTargetLeavePhysicalEventImplCopyWithImpl(
      _$DnDTargetLeavePhysicalEventImpl _value,
      $Res Function(_$DnDTargetLeavePhysicalEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhysicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? transformSnapshot = null,
    Object? timestamp = null,
  }) {
    return _then(_$DnDTargetLeavePhysicalEventImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      transformSnapshot: null == transformSnapshot
          ? _value.transformSnapshot
          : transformSnapshot // ignore: cast_nullable_to_non_nullable
              as Transform2D,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$DnDTargetLeavePhysicalEventImpl extends DnDTargetLeavePhysicalEvent {
  const _$DnDTargetLeavePhysicalEventImpl(
      {required this.eventId,
      required this.transformSnapshot,
      required this.timestamp})
      : super._();

  @override
  final String eventId;
  @override
  final Transform2D transformSnapshot;
  @override
  final Duration timestamp;

  @override
  String toString() {
    return 'PhysicalEvent.dndTargetLeave(eventId: $eventId, transformSnapshot: $transformSnapshot, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DnDTargetLeavePhysicalEventImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.transformSnapshot, transformSnapshot) ||
                other.transformSnapshot == transformSnapshot) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, eventId, transformSnapshot, timestamp);

  /// Create a copy of PhysicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DnDTargetLeavePhysicalEventImplCopyWith<_$DnDTargetLeavePhysicalEventImpl>
      get copyWith => __$$DnDTargetLeavePhysicalEventImplCopyWithImpl<
          _$DnDTargetLeavePhysicalEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            PointerEvent rawEvent,
            Offset? delta,
            Rect currentViewport,
            Set<MouseButton> pressedMouseButtons,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)
        pointer,
    required TResult Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            Object rawEvent,
            double? scale,
            double? rotation,
            Rect currentViewport,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)
        gesture,
    required TResult Function(
            String eventId,
            Transform2D transformSnapshot,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport,
            InteractionType? activeInteraction)
        keyboard,
    required TResult Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)
        dndTargetEnter,
    required TResult Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)
        dndTargetOver,
    required TResult Function(
            String eventId, Transform2D transformSnapshot, Duration timestamp)
        dndTargetLeave,
    required TResult Function(
            String eventId,
            Object data,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)
        dndTargetDrop,
  }) {
    return dndTargetLeave(eventId, transformSnapshot, timestamp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            PointerEvent rawEvent,
            Offset? delta,
            Rect currentViewport,
            Set<MouseButton> pressedMouseButtons,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)?
        pointer,
    TResult? Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            Object rawEvent,
            double? scale,
            double? rotation,
            Rect currentViewport,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)?
        gesture,
    TResult? Function(
            String eventId,
            Transform2D transformSnapshot,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport,
            InteractionType? activeInteraction)?
        keyboard,
    TResult? Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetEnter,
    TResult? Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetOver,
    TResult? Function(
            String eventId, Transform2D transformSnapshot, Duration timestamp)?
        dndTargetLeave,
    TResult? Function(
            String eventId,
            Object data,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetDrop,
  }) {
    return dndTargetLeave?.call(eventId, transformSnapshot, timestamp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            PointerEvent rawEvent,
            Offset? delta,
            Rect currentViewport,
            Set<MouseButton> pressedMouseButtons,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)?
        pointer,
    TResult Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            Object rawEvent,
            double? scale,
            double? rotation,
            Rect currentViewport,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)?
        gesture,
    TResult Function(
            String eventId,
            Transform2D transformSnapshot,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport,
            InteractionType? activeInteraction)?
        keyboard,
    TResult Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetEnter,
    TResult Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetOver,
    TResult Function(
            String eventId, Transform2D transformSnapshot, Duration timestamp)?
        dndTargetLeave,
    TResult Function(
            String eventId,
            Object data,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetDrop,
    required TResult orElse(),
  }) {
    if (dndTargetLeave != null) {
      return dndTargetLeave(eventId, transformSnapshot, timestamp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PointerPhysicalEvent value) pointer,
    required TResult Function(GesturePhysicalEvent value) gesture,
    required TResult Function(KeyboardPhysicalEvent value) keyboard,
    required TResult Function(DnDTargetEnterPhysicalEvent value) dndTargetEnter,
    required TResult Function(DnDTargetOverPhysicalEvent value) dndTargetOver,
    required TResult Function(DnDTargetLeavePhysicalEvent value) dndTargetLeave,
    required TResult Function(DnDTargetDropPhysicalEvent value) dndTargetDrop,
  }) {
    return dndTargetLeave(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PointerPhysicalEvent value)? pointer,
    TResult? Function(GesturePhysicalEvent value)? gesture,
    TResult? Function(KeyboardPhysicalEvent value)? keyboard,
    TResult? Function(DnDTargetEnterPhysicalEvent value)? dndTargetEnter,
    TResult? Function(DnDTargetOverPhysicalEvent value)? dndTargetOver,
    TResult? Function(DnDTargetLeavePhysicalEvent value)? dndTargetLeave,
    TResult? Function(DnDTargetDropPhysicalEvent value)? dndTargetDrop,
  }) {
    return dndTargetLeave?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PointerPhysicalEvent value)? pointer,
    TResult Function(GesturePhysicalEvent value)? gesture,
    TResult Function(KeyboardPhysicalEvent value)? keyboard,
    TResult Function(DnDTargetEnterPhysicalEvent value)? dndTargetEnter,
    TResult Function(DnDTargetOverPhysicalEvent value)? dndTargetOver,
    TResult Function(DnDTargetLeavePhysicalEvent value)? dndTargetLeave,
    TResult Function(DnDTargetDropPhysicalEvent value)? dndTargetDrop,
    required TResult orElse(),
  }) {
    if (dndTargetLeave != null) {
      return dndTargetLeave(this);
    }
    return orElse();
  }
}

abstract class DnDTargetLeavePhysicalEvent extends PhysicalEvent {
  const factory DnDTargetLeavePhysicalEvent(
      {required final String eventId,
      required final Transform2D transformSnapshot,
      required final Duration timestamp}) = _$DnDTargetLeavePhysicalEventImpl;
  const DnDTargetLeavePhysicalEvent._() : super._();

  @override
  String get eventId;
  @override
  Transform2D get transformSnapshot;
  Duration get timestamp;

  /// Create a copy of PhysicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DnDTargetLeavePhysicalEventImplCopyWith<_$DnDTargetLeavePhysicalEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DnDTargetDropPhysicalEventImplCopyWith<$Res>
    implements $PhysicalEventCopyWith<$Res> {
  factory _$$DnDTargetDropPhysicalEventImplCopyWith(
          _$DnDTargetDropPhysicalEventImpl value,
          $Res Function(_$DnDTargetDropPhysicalEventImpl) then) =
      __$$DnDTargetDropPhysicalEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String eventId,
      Object data,
      Offset screenPosition,
      Offset logicalPosition,
      Transform2D transformSnapshot,
      Duration timestamp});

  @override
  $Transform2DCopyWith<$Res> get transformSnapshot;
}

/// @nodoc
class __$$DnDTargetDropPhysicalEventImplCopyWithImpl<$Res>
    extends _$PhysicalEventCopyWithImpl<$Res, _$DnDTargetDropPhysicalEventImpl>
    implements _$$DnDTargetDropPhysicalEventImplCopyWith<$Res> {
  __$$DnDTargetDropPhysicalEventImplCopyWithImpl(
      _$DnDTargetDropPhysicalEventImpl _value,
      $Res Function(_$DnDTargetDropPhysicalEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhysicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? data = null,
    Object? screenPosition = null,
    Object? logicalPosition = null,
    Object? transformSnapshot = null,
    Object? timestamp = null,
  }) {
    return _then(_$DnDTargetDropPhysicalEventImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data ? _value.data : data,
      screenPosition: null == screenPosition
          ? _value.screenPosition
          : screenPosition // ignore: cast_nullable_to_non_nullable
              as Offset,
      logicalPosition: null == logicalPosition
          ? _value.logicalPosition
          : logicalPosition // ignore: cast_nullable_to_non_nullable
              as Offset,
      transformSnapshot: null == transformSnapshot
          ? _value.transformSnapshot
          : transformSnapshot // ignore: cast_nullable_to_non_nullable
              as Transform2D,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$DnDTargetDropPhysicalEventImpl extends DnDTargetDropPhysicalEvent {
  const _$DnDTargetDropPhysicalEventImpl(
      {required this.eventId,
      required this.data,
      required this.screenPosition,
      required this.logicalPosition,
      required this.transformSnapshot,
      required this.timestamp})
      : super._();

  @override
  final String eventId;
  @override
  final Object data;
  @override
  final Offset screenPosition;
  @override
  final Offset logicalPosition;
  @override
  final Transform2D transformSnapshot;
  @override
  final Duration timestamp;

  @override
  String toString() {
    return 'PhysicalEvent.dndTargetDrop(eventId: $eventId, data: $data, screenPosition: $screenPosition, logicalPosition: $logicalPosition, transformSnapshot: $transformSnapshot, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DnDTargetDropPhysicalEventImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.screenPosition, screenPosition) ||
                other.screenPosition == screenPosition) &&
            (identical(other.logicalPosition, logicalPosition) ||
                other.logicalPosition == logicalPosition) &&
            (identical(other.transformSnapshot, transformSnapshot) ||
                other.transformSnapshot == transformSnapshot) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      eventId,
      const DeepCollectionEquality().hash(data),
      screenPosition,
      logicalPosition,
      transformSnapshot,
      timestamp);

  /// Create a copy of PhysicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DnDTargetDropPhysicalEventImplCopyWith<_$DnDTargetDropPhysicalEventImpl>
      get copyWith => __$$DnDTargetDropPhysicalEventImplCopyWithImpl<
          _$DnDTargetDropPhysicalEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            PointerEvent rawEvent,
            Offset? delta,
            Rect currentViewport,
            Set<MouseButton> pressedMouseButtons,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)
        pointer,
    required TResult Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            Object rawEvent,
            double? scale,
            double? rotation,
            Rect currentViewport,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)
        gesture,
    required TResult Function(
            String eventId,
            Transform2D transformSnapshot,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport,
            InteractionType? activeInteraction)
        keyboard,
    required TResult Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)
        dndTargetEnter,
    required TResult Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)
        dndTargetOver,
    required TResult Function(
            String eventId, Transform2D transformSnapshot, Duration timestamp)
        dndTargetLeave,
    required TResult Function(
            String eventId,
            Object data,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)
        dndTargetDrop,
  }) {
    return dndTargetDrop(eventId, data, screenPosition, logicalPosition,
        transformSnapshot, timestamp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            PointerEvent rawEvent,
            Offset? delta,
            Rect currentViewport,
            Set<MouseButton> pressedMouseButtons,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)?
        pointer,
    TResult? Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            Object rawEvent,
            double? scale,
            double? rotation,
            Rect currentViewport,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)?
        gesture,
    TResult? Function(
            String eventId,
            Transform2D transformSnapshot,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport,
            InteractionType? activeInteraction)?
        keyboard,
    TResult? Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetEnter,
    TResult? Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetOver,
    TResult? Function(
            String eventId, Transform2D transformSnapshot, Duration timestamp)?
        dndTargetLeave,
    TResult? Function(
            String eventId,
            Object data,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetDrop,
  }) {
    return dndTargetDrop?.call(eventId, data, screenPosition, logicalPosition,
        transformSnapshot, timestamp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            PointerEvent rawEvent,
            Offset? delta,
            Rect currentViewport,
            Set<MouseButton> pressedMouseButtons,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)?
        pointer,
    TResult Function(
            String eventId,
            Offset logicalPosition,
            Offset screenPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            InteractionPhase phase,
            Object rawEvent,
            double? scale,
            double? rotation,
            Rect currentViewport,
            Set<LogicalKeyboardKey> pressedKeys,
            InteractionType? activeInteraction)?
        gesture,
    TResult Function(
            String eventId,
            Transform2D transformSnapshot,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport,
            InteractionType? activeInteraction)?
        keyboard,
    TResult Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetEnter,
    TResult Function(
            String eventId,
            Object dataPreview,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetOver,
    TResult Function(
            String eventId, Transform2D transformSnapshot, Duration timestamp)?
        dndTargetLeave,
    TResult Function(
            String eventId,
            Object data,
            Offset screenPosition,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            Duration timestamp)?
        dndTargetDrop,
    required TResult orElse(),
  }) {
    if (dndTargetDrop != null) {
      return dndTargetDrop(eventId, data, screenPosition, logicalPosition,
          transformSnapshot, timestamp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PointerPhysicalEvent value) pointer,
    required TResult Function(GesturePhysicalEvent value) gesture,
    required TResult Function(KeyboardPhysicalEvent value) keyboard,
    required TResult Function(DnDTargetEnterPhysicalEvent value) dndTargetEnter,
    required TResult Function(DnDTargetOverPhysicalEvent value) dndTargetOver,
    required TResult Function(DnDTargetLeavePhysicalEvent value) dndTargetLeave,
    required TResult Function(DnDTargetDropPhysicalEvent value) dndTargetDrop,
  }) {
    return dndTargetDrop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PointerPhysicalEvent value)? pointer,
    TResult? Function(GesturePhysicalEvent value)? gesture,
    TResult? Function(KeyboardPhysicalEvent value)? keyboard,
    TResult? Function(DnDTargetEnterPhysicalEvent value)? dndTargetEnter,
    TResult? Function(DnDTargetOverPhysicalEvent value)? dndTargetOver,
    TResult? Function(DnDTargetLeavePhysicalEvent value)? dndTargetLeave,
    TResult? Function(DnDTargetDropPhysicalEvent value)? dndTargetDrop,
  }) {
    return dndTargetDrop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PointerPhysicalEvent value)? pointer,
    TResult Function(GesturePhysicalEvent value)? gesture,
    TResult Function(KeyboardPhysicalEvent value)? keyboard,
    TResult Function(DnDTargetEnterPhysicalEvent value)? dndTargetEnter,
    TResult Function(DnDTargetOverPhysicalEvent value)? dndTargetOver,
    TResult Function(DnDTargetLeavePhysicalEvent value)? dndTargetLeave,
    TResult Function(DnDTargetDropPhysicalEvent value)? dndTargetDrop,
    required TResult orElse(),
  }) {
    if (dndTargetDrop != null) {
      return dndTargetDrop(this);
    }
    return orElse();
  }
}

abstract class DnDTargetDropPhysicalEvent extends PhysicalEvent {
  const factory DnDTargetDropPhysicalEvent(
      {required final String eventId,
      required final Object data,
      required final Offset screenPosition,
      required final Offset logicalPosition,
      required final Transform2D transformSnapshot,
      required final Duration timestamp}) = _$DnDTargetDropPhysicalEventImpl;
  const DnDTargetDropPhysicalEvent._() : super._();

  @override
  String get eventId;
  Object get data;
  Offset get screenPosition;
  Offset get logicalPosition;
  @override
  Transform2D get transformSnapshot;
  Duration get timestamp;

  /// Create a copy of PhysicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DnDTargetDropPhysicalEventImplCopyWith<_$DnDTargetDropPhysicalEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}
