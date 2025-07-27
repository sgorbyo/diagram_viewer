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
  Offset get logicalPosition => throw _privateConstructorUsedError;
  Transform2D get transformSnapshot => throw _privateConstructorUsedError;
  List<DiagramObjectEntity> get hitList => throw _privateConstructorUsedError;
  BorderProximity get borderProximity => throw _privateConstructorUsedError;
  Object get rawEvent => throw _privateConstructorUsedError;
  Rect get currentViewport => throw _privateConstructorUsedError;
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
            Rect currentViewport)
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
            Rect currentViewport)
        gesture,
    required TResult Function(
            String eventId,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport)
        keyboard,
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
            Rect currentViewport)?
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
            Rect currentViewport)?
        gesture,
    TResult? Function(
            String eventId,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport)?
        keyboard,
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
            Rect currentViewport)?
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
            Rect currentViewport)?
        gesture,
    TResult Function(
            String eventId,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport)?
        keyboard,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PointerPhysicalEvent value) pointer,
    required TResult Function(GesturePhysicalEvent value) gesture,
    required TResult Function(KeyboardPhysicalEvent value) keyboard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PointerPhysicalEvent value)? pointer,
    TResult? Function(GesturePhysicalEvent value)? gesture,
    TResult? Function(KeyboardPhysicalEvent value)? keyboard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PointerPhysicalEvent value)? pointer,
    TResult Function(GesturePhysicalEvent value)? gesture,
    TResult Function(KeyboardPhysicalEvent value)? keyboard,
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
  $Res call(
      {String eventId,
      Offset logicalPosition,
      Transform2D transformSnapshot,
      List<DiagramObjectEntity> hitList,
      BorderProximity borderProximity,
      Rect currentViewport});

  $Transform2DCopyWith<$Res> get transformSnapshot;
  $BorderProximityCopyWith<$Res> get borderProximity;
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
    Object? logicalPosition = null,
    Object? transformSnapshot = null,
    Object? hitList = null,
    Object? borderProximity = null,
    Object? currentViewport = null,
  }) {
    return _then(_value.copyWith(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      logicalPosition: null == logicalPosition
          ? _value.logicalPosition
          : logicalPosition // ignore: cast_nullable_to_non_nullable
              as Offset,
      transformSnapshot: null == transformSnapshot
          ? _value.transformSnapshot
          : transformSnapshot // ignore: cast_nullable_to_non_nullable
              as Transform2D,
      hitList: null == hitList
          ? _value.hitList
          : hitList // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
      borderProximity: null == borderProximity
          ? _value.borderProximity
          : borderProximity // ignore: cast_nullable_to_non_nullable
              as BorderProximity,
      currentViewport: null == currentViewport
          ? _value.currentViewport
          : currentViewport // ignore: cast_nullable_to_non_nullable
              as Rect,
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

  /// Create a copy of PhysicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BorderProximityCopyWith<$Res> get borderProximity {
    return $BorderProximityCopyWith<$Res>(_value.borderProximity, (value) {
      return _then(_value.copyWith(borderProximity: value) as $Val);
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
      Rect currentViewport});

  @override
  $Transform2DCopyWith<$Res> get transformSnapshot;
  @override
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
    ));
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
      required this.currentViewport})
      : _hitList = hitList,
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

  @override
  String toString() {
    return 'PhysicalEvent.pointer(eventId: $eventId, logicalPosition: $logicalPosition, screenPosition: $screenPosition, transformSnapshot: $transformSnapshot, hitList: $hitList, borderProximity: $borderProximity, phase: $phase, rawEvent: $rawEvent, delta: $delta, currentViewport: $currentViewport)';
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
                other.currentViewport == currentViewport));
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
      currentViewport);

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
            Rect currentViewport)
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
            Rect currentViewport)
        gesture,
    required TResult Function(
            String eventId,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport)
        keyboard,
  }) {
    return pointer(eventId, logicalPosition, screenPosition, transformSnapshot,
        hitList, borderProximity, phase, rawEvent, delta, currentViewport);
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
            Rect currentViewport)?
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
            Rect currentViewport)?
        gesture,
    TResult? Function(
            String eventId,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport)?
        keyboard,
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
        currentViewport);
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
            Rect currentViewport)?
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
            Rect currentViewport)?
        gesture,
    TResult Function(
            String eventId,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport)?
        keyboard,
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
          currentViewport);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PointerPhysicalEvent value) pointer,
    required TResult Function(GesturePhysicalEvent value) gesture,
    required TResult Function(KeyboardPhysicalEvent value) keyboard,
  }) {
    return pointer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PointerPhysicalEvent value)? pointer,
    TResult? Function(GesturePhysicalEvent value)? gesture,
    TResult? Function(KeyboardPhysicalEvent value)? keyboard,
  }) {
    return pointer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PointerPhysicalEvent value)? pointer,
    TResult Function(GesturePhysicalEvent value)? gesture,
    TResult Function(KeyboardPhysicalEvent value)? keyboard,
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
      required final Rect currentViewport}) = _$PointerPhysicalEventImpl;
  const PointerPhysicalEvent._() : super._();

  @override
  String get eventId;
  @override
  Offset get logicalPosition;
  Offset get screenPosition;
  @override
  Transform2D get transformSnapshot;
  @override
  List<DiagramObjectEntity> get hitList;
  @override
  BorderProximity get borderProximity;
  InteractionPhase get phase;
  @override
  PointerEvent get rawEvent;
  Offset? get delta;
  @override
  Rect get currentViewport;

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
      Rect currentViewport});

  @override
  $Transform2DCopyWith<$Res> get transformSnapshot;
  @override
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
    ));
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
      required this.currentViewport})
      : _hitList = hitList,
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

  @override
  String toString() {
    return 'PhysicalEvent.gesture(eventId: $eventId, logicalPosition: $logicalPosition, screenPosition: $screenPosition, transformSnapshot: $transformSnapshot, hitList: $hitList, borderProximity: $borderProximity, phase: $phase, rawEvent: $rawEvent, scale: $scale, rotation: $rotation, currentViewport: $currentViewport)';
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
                other.currentViewport == currentViewport));
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
      currentViewport);

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
            Rect currentViewport)
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
            Rect currentViewport)
        gesture,
    required TResult Function(
            String eventId,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport)
        keyboard,
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
        currentViewport);
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
            Rect currentViewport)?
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
            Rect currentViewport)?
        gesture,
    TResult? Function(
            String eventId,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport)?
        keyboard,
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
        currentViewport);
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
            Rect currentViewport)?
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
            Rect currentViewport)?
        gesture,
    TResult Function(
            String eventId,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport)?
        keyboard,
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
          currentViewport);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PointerPhysicalEvent value) pointer,
    required TResult Function(GesturePhysicalEvent value) gesture,
    required TResult Function(KeyboardPhysicalEvent value) keyboard,
  }) {
    return gesture(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PointerPhysicalEvent value)? pointer,
    TResult? Function(GesturePhysicalEvent value)? gesture,
    TResult? Function(KeyboardPhysicalEvent value)? keyboard,
  }) {
    return gesture?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PointerPhysicalEvent value)? pointer,
    TResult Function(GesturePhysicalEvent value)? gesture,
    TResult Function(KeyboardPhysicalEvent value)? keyboard,
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
      required final Rect currentViewport}) = _$GesturePhysicalEventImpl;
  const GesturePhysicalEvent._() : super._();

  @override
  String get eventId;
  @override
  Offset get logicalPosition;
  Offset get screenPosition;
  @override
  Transform2D get transformSnapshot;
  @override
  List<DiagramObjectEntity> get hitList;
  @override
  BorderProximity get borderProximity;
  InteractionPhase get phase;
  @override
  Object get rawEvent;
  double? get scale;
  double? get rotation;
  @override
  Rect get currentViewport;

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
      Offset logicalPosition,
      Transform2D transformSnapshot,
      List<DiagramObjectEntity> hitList,
      BorderProximity borderProximity,
      KeyEvent rawEvent,
      Set<LogicalKeyboardKey> pressedKeys,
      Rect currentViewport});

  @override
  $Transform2DCopyWith<$Res> get transformSnapshot;
  @override
  $BorderProximityCopyWith<$Res> get borderProximity;
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
    Object? logicalPosition = null,
    Object? transformSnapshot = null,
    Object? hitList = null,
    Object? borderProximity = null,
    Object? rawEvent = null,
    Object? pressedKeys = null,
    Object? currentViewport = null,
  }) {
    return _then(_$KeyboardPhysicalEventImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      logicalPosition: null == logicalPosition
          ? _value.logicalPosition
          : logicalPosition // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc

class _$KeyboardPhysicalEventImpl extends KeyboardPhysicalEvent {
  const _$KeyboardPhysicalEventImpl(
      {required this.eventId,
      required this.logicalPosition,
      required this.transformSnapshot,
      required final List<DiagramObjectEntity> hitList,
      required this.borderProximity,
      required this.rawEvent,
      required final Set<LogicalKeyboardKey> pressedKeys,
      required this.currentViewport})
      : _hitList = hitList,
        _pressedKeys = pressedKeys,
        super._();

  @override
  final String eventId;
  @override
  final Offset logicalPosition;
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
  String toString() {
    return 'PhysicalEvent.keyboard(eventId: $eventId, logicalPosition: $logicalPosition, transformSnapshot: $transformSnapshot, hitList: $hitList, borderProximity: $borderProximity, rawEvent: $rawEvent, pressedKeys: $pressedKeys, currentViewport: $currentViewport)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KeyboardPhysicalEventImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.logicalPosition, logicalPosition) ||
                other.logicalPosition == logicalPosition) &&
            (identical(other.transformSnapshot, transformSnapshot) ||
                other.transformSnapshot == transformSnapshot) &&
            const DeepCollectionEquality().equals(other._hitList, _hitList) &&
            (identical(other.borderProximity, borderProximity) ||
                other.borderProximity == borderProximity) &&
            (identical(other.rawEvent, rawEvent) ||
                other.rawEvent == rawEvent) &&
            const DeepCollectionEquality()
                .equals(other._pressedKeys, _pressedKeys) &&
            (identical(other.currentViewport, currentViewport) ||
                other.currentViewport == currentViewport));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      eventId,
      logicalPosition,
      transformSnapshot,
      const DeepCollectionEquality().hash(_hitList),
      borderProximity,
      rawEvent,
      const DeepCollectionEquality().hash(_pressedKeys),
      currentViewport);

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
            Rect currentViewport)
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
            Rect currentViewport)
        gesture,
    required TResult Function(
            String eventId,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport)
        keyboard,
  }) {
    return keyboard(eventId, logicalPosition, transformSnapshot, hitList,
        borderProximity, rawEvent, pressedKeys, currentViewport);
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
            Rect currentViewport)?
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
            Rect currentViewport)?
        gesture,
    TResult? Function(
            String eventId,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport)?
        keyboard,
  }) {
    return keyboard?.call(eventId, logicalPosition, transformSnapshot, hitList,
        borderProximity, rawEvent, pressedKeys, currentViewport);
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
            Rect currentViewport)?
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
            Rect currentViewport)?
        gesture,
    TResult Function(
            String eventId,
            Offset logicalPosition,
            Transform2D transformSnapshot,
            List<DiagramObjectEntity> hitList,
            BorderProximity borderProximity,
            KeyEvent rawEvent,
            Set<LogicalKeyboardKey> pressedKeys,
            Rect currentViewport)?
        keyboard,
    required TResult orElse(),
  }) {
    if (keyboard != null) {
      return keyboard(eventId, logicalPosition, transformSnapshot, hitList,
          borderProximity, rawEvent, pressedKeys, currentViewport);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PointerPhysicalEvent value) pointer,
    required TResult Function(GesturePhysicalEvent value) gesture,
    required TResult Function(KeyboardPhysicalEvent value) keyboard,
  }) {
    return keyboard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PointerPhysicalEvent value)? pointer,
    TResult? Function(GesturePhysicalEvent value)? gesture,
    TResult? Function(KeyboardPhysicalEvent value)? keyboard,
  }) {
    return keyboard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PointerPhysicalEvent value)? pointer,
    TResult Function(GesturePhysicalEvent value)? gesture,
    TResult Function(KeyboardPhysicalEvent value)? keyboard,
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
      required final Offset logicalPosition,
      required final Transform2D transformSnapshot,
      required final List<DiagramObjectEntity> hitList,
      required final BorderProximity borderProximity,
      required final KeyEvent rawEvent,
      required final Set<LogicalKeyboardKey> pressedKeys,
      required final Rect currentViewport}) = _$KeyboardPhysicalEventImpl;
  const KeyboardPhysicalEvent._() : super._();

  @override
  String get eventId;
  @override
  Offset get logicalPosition;
  @override
  Transform2D get transformSnapshot;
  @override
  List<DiagramObjectEntity> get hitList;
  @override
  BorderProximity get borderProximity;
  @override
  KeyEvent get rawEvent;
  Set<LogicalKeyboardKey> get pressedKeys;
  @override
  Rect get currentViewport;

  /// Create a copy of PhysicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KeyboardPhysicalEventImplCopyWith<_$KeyboardPhysicalEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}
