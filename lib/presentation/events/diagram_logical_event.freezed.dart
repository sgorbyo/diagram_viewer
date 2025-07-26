// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diagram_logical_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DiagramLogicalEvent {
  String get eventId => throw _privateConstructorUsedError;
  Offset get diagramCoordinates => throw _privateConstructorUsedError;
  Offset get screenCoordinates => throw _privateConstructorUsedError;
  BorderProximity get borderProximity => throw _privateConstructorUsedError;
  InteractionPhase get phase => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String eventId,
            Offset diagramCoordinates,
            Offset screenCoordinates,
            BorderProximity borderProximity,
            InteractionPhase phase,
            Offset delta)
        continuous,
    required TResult Function(
            String eventId,
            Offset diagramCoordinates,
            Offset screenCoordinates,
            BorderProximity borderProximity,
            InteractionPhase phase,
            double scale,
            double rotation)
        transformation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String eventId,
            Offset diagramCoordinates,
            Offset screenCoordinates,
            BorderProximity borderProximity,
            InteractionPhase phase,
            Offset delta)?
        continuous,
    TResult? Function(
            String eventId,
            Offset diagramCoordinates,
            Offset screenCoordinates,
            BorderProximity borderProximity,
            InteractionPhase phase,
            double scale,
            double rotation)?
        transformation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String eventId,
            Offset diagramCoordinates,
            Offset screenCoordinates,
            BorderProximity borderProximity,
            InteractionPhase phase,
            Offset delta)?
        continuous,
    TResult Function(
            String eventId,
            Offset diagramCoordinates,
            Offset screenCoordinates,
            BorderProximity borderProximity,
            InteractionPhase phase,
            double scale,
            double rotation)?
        transformation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ContinuousInteractionEvent value) continuous,
    required TResult Function(_TransformationInteractionEvent value)
        transformation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ContinuousInteractionEvent value)? continuous,
    TResult? Function(_TransformationInteractionEvent value)? transformation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ContinuousInteractionEvent value)? continuous,
    TResult Function(_TransformationInteractionEvent value)? transformation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of DiagramLogicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiagramLogicalEventCopyWith<DiagramLogicalEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagramLogicalEventCopyWith<$Res> {
  factory $DiagramLogicalEventCopyWith(
          DiagramLogicalEvent value, $Res Function(DiagramLogicalEvent) then) =
      _$DiagramLogicalEventCopyWithImpl<$Res, DiagramLogicalEvent>;
  @useResult
  $Res call(
      {String eventId,
      Offset diagramCoordinates,
      Offset screenCoordinates,
      BorderProximity borderProximity,
      InteractionPhase phase});

  $BorderProximityCopyWith<$Res> get borderProximity;
}

/// @nodoc
class _$DiagramLogicalEventCopyWithImpl<$Res, $Val extends DiagramLogicalEvent>
    implements $DiagramLogicalEventCopyWith<$Res> {
  _$DiagramLogicalEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiagramLogicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? diagramCoordinates = null,
    Object? screenCoordinates = null,
    Object? borderProximity = null,
    Object? phase = null,
  }) {
    return _then(_value.copyWith(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      diagramCoordinates: null == diagramCoordinates
          ? _value.diagramCoordinates
          : diagramCoordinates // ignore: cast_nullable_to_non_nullable
              as Offset,
      screenCoordinates: null == screenCoordinates
          ? _value.screenCoordinates
          : screenCoordinates // ignore: cast_nullable_to_non_nullable
              as Offset,
      borderProximity: null == borderProximity
          ? _value.borderProximity
          : borderProximity // ignore: cast_nullable_to_non_nullable
              as BorderProximity,
      phase: null == phase
          ? _value.phase
          : phase // ignore: cast_nullable_to_non_nullable
              as InteractionPhase,
    ) as $Val);
  }

  /// Create a copy of DiagramLogicalEvent
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
abstract class _$$ContinuousInteractionEventImplCopyWith<$Res>
    implements $DiagramLogicalEventCopyWith<$Res> {
  factory _$$ContinuousInteractionEventImplCopyWith(
          _$ContinuousInteractionEventImpl value,
          $Res Function(_$ContinuousInteractionEventImpl) then) =
      __$$ContinuousInteractionEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String eventId,
      Offset diagramCoordinates,
      Offset screenCoordinates,
      BorderProximity borderProximity,
      InteractionPhase phase,
      Offset delta});

  @override
  $BorderProximityCopyWith<$Res> get borderProximity;
}

/// @nodoc
class __$$ContinuousInteractionEventImplCopyWithImpl<$Res>
    extends _$DiagramLogicalEventCopyWithImpl<$Res,
        _$ContinuousInteractionEventImpl>
    implements _$$ContinuousInteractionEventImplCopyWith<$Res> {
  __$$ContinuousInteractionEventImplCopyWithImpl(
      _$ContinuousInteractionEventImpl _value,
      $Res Function(_$ContinuousInteractionEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramLogicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? diagramCoordinates = null,
    Object? screenCoordinates = null,
    Object? borderProximity = null,
    Object? phase = null,
    Object? delta = null,
  }) {
    return _then(_$ContinuousInteractionEventImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      diagramCoordinates: null == diagramCoordinates
          ? _value.diagramCoordinates
          : diagramCoordinates // ignore: cast_nullable_to_non_nullable
              as Offset,
      screenCoordinates: null == screenCoordinates
          ? _value.screenCoordinates
          : screenCoordinates // ignore: cast_nullable_to_non_nullable
              as Offset,
      borderProximity: null == borderProximity
          ? _value.borderProximity
          : borderProximity // ignore: cast_nullable_to_non_nullable
              as BorderProximity,
      phase: null == phase
          ? _value.phase
          : phase // ignore: cast_nullable_to_non_nullable
              as InteractionPhase,
      delta: null == delta
          ? _value.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as Offset,
    ));
  }
}

/// @nodoc

class _$ContinuousInteractionEventImpl implements _ContinuousInteractionEvent {
  const _$ContinuousInteractionEventImpl(
      {required this.eventId,
      required this.diagramCoordinates,
      required this.screenCoordinates,
      required this.borderProximity,
      required this.phase,
      required this.delta});

  @override
  final String eventId;
  @override
  final Offset diagramCoordinates;
  @override
  final Offset screenCoordinates;
  @override
  final BorderProximity borderProximity;
  @override
  final InteractionPhase phase;
  @override
  final Offset delta;

  @override
  String toString() {
    return 'DiagramLogicalEvent.continuous(eventId: $eventId, diagramCoordinates: $diagramCoordinates, screenCoordinates: $screenCoordinates, borderProximity: $borderProximity, phase: $phase, delta: $delta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContinuousInteractionEventImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.diagramCoordinates, diagramCoordinates) ||
                other.diagramCoordinates == diagramCoordinates) &&
            (identical(other.screenCoordinates, screenCoordinates) ||
                other.screenCoordinates == screenCoordinates) &&
            (identical(other.borderProximity, borderProximity) ||
                other.borderProximity == borderProximity) &&
            (identical(other.phase, phase) || other.phase == phase) &&
            (identical(other.delta, delta) || other.delta == delta));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eventId, diagramCoordinates,
      screenCoordinates, borderProximity, phase, delta);

  /// Create a copy of DiagramLogicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContinuousInteractionEventImplCopyWith<_$ContinuousInteractionEventImpl>
      get copyWith => __$$ContinuousInteractionEventImplCopyWithImpl<
          _$ContinuousInteractionEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String eventId,
            Offset diagramCoordinates,
            Offset screenCoordinates,
            BorderProximity borderProximity,
            InteractionPhase phase,
            Offset delta)
        continuous,
    required TResult Function(
            String eventId,
            Offset diagramCoordinates,
            Offset screenCoordinates,
            BorderProximity borderProximity,
            InteractionPhase phase,
            double scale,
            double rotation)
        transformation,
  }) {
    return continuous(eventId, diagramCoordinates, screenCoordinates,
        borderProximity, phase, delta);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String eventId,
            Offset diagramCoordinates,
            Offset screenCoordinates,
            BorderProximity borderProximity,
            InteractionPhase phase,
            Offset delta)?
        continuous,
    TResult? Function(
            String eventId,
            Offset diagramCoordinates,
            Offset screenCoordinates,
            BorderProximity borderProximity,
            InteractionPhase phase,
            double scale,
            double rotation)?
        transformation,
  }) {
    return continuous?.call(eventId, diagramCoordinates, screenCoordinates,
        borderProximity, phase, delta);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String eventId,
            Offset diagramCoordinates,
            Offset screenCoordinates,
            BorderProximity borderProximity,
            InteractionPhase phase,
            Offset delta)?
        continuous,
    TResult Function(
            String eventId,
            Offset diagramCoordinates,
            Offset screenCoordinates,
            BorderProximity borderProximity,
            InteractionPhase phase,
            double scale,
            double rotation)?
        transformation,
    required TResult orElse(),
  }) {
    if (continuous != null) {
      return continuous(eventId, diagramCoordinates, screenCoordinates,
          borderProximity, phase, delta);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ContinuousInteractionEvent value) continuous,
    required TResult Function(_TransformationInteractionEvent value)
        transformation,
  }) {
    return continuous(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ContinuousInteractionEvent value)? continuous,
    TResult? Function(_TransformationInteractionEvent value)? transformation,
  }) {
    return continuous?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ContinuousInteractionEvent value)? continuous,
    TResult Function(_TransformationInteractionEvent value)? transformation,
    required TResult orElse(),
  }) {
    if (continuous != null) {
      return continuous(this);
    }
    return orElse();
  }
}

abstract class _ContinuousInteractionEvent implements DiagramLogicalEvent {
  const factory _ContinuousInteractionEvent(
      {required final String eventId,
      required final Offset diagramCoordinates,
      required final Offset screenCoordinates,
      required final BorderProximity borderProximity,
      required final InteractionPhase phase,
      required final Offset delta}) = _$ContinuousInteractionEventImpl;

  @override
  String get eventId;
  @override
  Offset get diagramCoordinates;
  @override
  Offset get screenCoordinates;
  @override
  BorderProximity get borderProximity;
  @override
  InteractionPhase get phase;
  Offset get delta;

  /// Create a copy of DiagramLogicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContinuousInteractionEventImplCopyWith<_$ContinuousInteractionEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransformationInteractionEventImplCopyWith<$Res>
    implements $DiagramLogicalEventCopyWith<$Res> {
  factory _$$TransformationInteractionEventImplCopyWith(
          _$TransformationInteractionEventImpl value,
          $Res Function(_$TransformationInteractionEventImpl) then) =
      __$$TransformationInteractionEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String eventId,
      Offset diagramCoordinates,
      Offset screenCoordinates,
      BorderProximity borderProximity,
      InteractionPhase phase,
      double scale,
      double rotation});

  @override
  $BorderProximityCopyWith<$Res> get borderProximity;
}

/// @nodoc
class __$$TransformationInteractionEventImplCopyWithImpl<$Res>
    extends _$DiagramLogicalEventCopyWithImpl<$Res,
        _$TransformationInteractionEventImpl>
    implements _$$TransformationInteractionEventImplCopyWith<$Res> {
  __$$TransformationInteractionEventImplCopyWithImpl(
      _$TransformationInteractionEventImpl _value,
      $Res Function(_$TransformationInteractionEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramLogicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? diagramCoordinates = null,
    Object? screenCoordinates = null,
    Object? borderProximity = null,
    Object? phase = null,
    Object? scale = null,
    Object? rotation = null,
  }) {
    return _then(_$TransformationInteractionEventImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      diagramCoordinates: null == diagramCoordinates
          ? _value.diagramCoordinates
          : diagramCoordinates // ignore: cast_nullable_to_non_nullable
              as Offset,
      screenCoordinates: null == screenCoordinates
          ? _value.screenCoordinates
          : screenCoordinates // ignore: cast_nullable_to_non_nullable
              as Offset,
      borderProximity: null == borderProximity
          ? _value.borderProximity
          : borderProximity // ignore: cast_nullable_to_non_nullable
              as BorderProximity,
      phase: null == phase
          ? _value.phase
          : phase // ignore: cast_nullable_to_non_nullable
              as InteractionPhase,
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double,
      rotation: null == rotation
          ? _value.rotation
          : rotation // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$TransformationInteractionEventImpl
    implements _TransformationInteractionEvent {
  const _$TransformationInteractionEventImpl(
      {required this.eventId,
      required this.diagramCoordinates,
      required this.screenCoordinates,
      required this.borderProximity,
      required this.phase,
      required this.scale,
      this.rotation = 0.0});

  @override
  final String eventId;
  @override
  final Offset diagramCoordinates;
  @override
  final Offset screenCoordinates;
  @override
  final BorderProximity borderProximity;
  @override
  final InteractionPhase phase;
  @override
  final double scale;
  @override
  @JsonKey()
  final double rotation;

  @override
  String toString() {
    return 'DiagramLogicalEvent.transformation(eventId: $eventId, diagramCoordinates: $diagramCoordinates, screenCoordinates: $screenCoordinates, borderProximity: $borderProximity, phase: $phase, scale: $scale, rotation: $rotation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransformationInteractionEventImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.diagramCoordinates, diagramCoordinates) ||
                other.diagramCoordinates == diagramCoordinates) &&
            (identical(other.screenCoordinates, screenCoordinates) ||
                other.screenCoordinates == screenCoordinates) &&
            (identical(other.borderProximity, borderProximity) ||
                other.borderProximity == borderProximity) &&
            (identical(other.phase, phase) || other.phase == phase) &&
            (identical(other.scale, scale) || other.scale == scale) &&
            (identical(other.rotation, rotation) ||
                other.rotation == rotation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eventId, diagramCoordinates,
      screenCoordinates, borderProximity, phase, scale, rotation);

  /// Create a copy of DiagramLogicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransformationInteractionEventImplCopyWith<
          _$TransformationInteractionEventImpl>
      get copyWith => __$$TransformationInteractionEventImplCopyWithImpl<
          _$TransformationInteractionEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String eventId,
            Offset diagramCoordinates,
            Offset screenCoordinates,
            BorderProximity borderProximity,
            InteractionPhase phase,
            Offset delta)
        continuous,
    required TResult Function(
            String eventId,
            Offset diagramCoordinates,
            Offset screenCoordinates,
            BorderProximity borderProximity,
            InteractionPhase phase,
            double scale,
            double rotation)
        transformation,
  }) {
    return transformation(eventId, diagramCoordinates, screenCoordinates,
        borderProximity, phase, scale, rotation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String eventId,
            Offset diagramCoordinates,
            Offset screenCoordinates,
            BorderProximity borderProximity,
            InteractionPhase phase,
            Offset delta)?
        continuous,
    TResult? Function(
            String eventId,
            Offset diagramCoordinates,
            Offset screenCoordinates,
            BorderProximity borderProximity,
            InteractionPhase phase,
            double scale,
            double rotation)?
        transformation,
  }) {
    return transformation?.call(eventId, diagramCoordinates, screenCoordinates,
        borderProximity, phase, scale, rotation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String eventId,
            Offset diagramCoordinates,
            Offset screenCoordinates,
            BorderProximity borderProximity,
            InteractionPhase phase,
            Offset delta)?
        continuous,
    TResult Function(
            String eventId,
            Offset diagramCoordinates,
            Offset screenCoordinates,
            BorderProximity borderProximity,
            InteractionPhase phase,
            double scale,
            double rotation)?
        transformation,
    required TResult orElse(),
  }) {
    if (transformation != null) {
      return transformation(eventId, diagramCoordinates, screenCoordinates,
          borderProximity, phase, scale, rotation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ContinuousInteractionEvent value) continuous,
    required TResult Function(_TransformationInteractionEvent value)
        transformation,
  }) {
    return transformation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ContinuousInteractionEvent value)? continuous,
    TResult? Function(_TransformationInteractionEvent value)? transformation,
  }) {
    return transformation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ContinuousInteractionEvent value)? continuous,
    TResult Function(_TransformationInteractionEvent value)? transformation,
    required TResult orElse(),
  }) {
    if (transformation != null) {
      return transformation(this);
    }
    return orElse();
  }
}

abstract class _TransformationInteractionEvent implements DiagramLogicalEvent {
  const factory _TransformationInteractionEvent(
      {required final String eventId,
      required final Offset diagramCoordinates,
      required final Offset screenCoordinates,
      required final BorderProximity borderProximity,
      required final InteractionPhase phase,
      required final double scale,
      final double rotation}) = _$TransformationInteractionEventImpl;

  @override
  String get eventId;
  @override
  Offset get diagramCoordinates;
  @override
  Offset get screenCoordinates;
  @override
  BorderProximity get borderProximity;
  @override
  InteractionPhase get phase;
  double get scale;
  double get rotation;

  /// Create a copy of DiagramLogicalEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransformationInteractionEventImplCopyWith<
          _$TransformationInteractionEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BorderProximity {
  bool get isNearLeft => throw _privateConstructorUsedError;
  bool get isNearRight => throw _privateConstructorUsedError;
  bool get isNearTop => throw _privateConstructorUsedError;
  bool get isNearBottom => throw _privateConstructorUsedError;
  double get distanceFromEdge => throw _privateConstructorUsedError;

  /// Create a copy of BorderProximity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BorderProximityCopyWith<BorderProximity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BorderProximityCopyWith<$Res> {
  factory $BorderProximityCopyWith(
          BorderProximity value, $Res Function(BorderProximity) then) =
      _$BorderProximityCopyWithImpl<$Res, BorderProximity>;
  @useResult
  $Res call(
      {bool isNearLeft,
      bool isNearRight,
      bool isNearTop,
      bool isNearBottom,
      double distanceFromEdge});
}

/// @nodoc
class _$BorderProximityCopyWithImpl<$Res, $Val extends BorderProximity>
    implements $BorderProximityCopyWith<$Res> {
  _$BorderProximityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BorderProximity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNearLeft = null,
    Object? isNearRight = null,
    Object? isNearTop = null,
    Object? isNearBottom = null,
    Object? distanceFromEdge = null,
  }) {
    return _then(_value.copyWith(
      isNearLeft: null == isNearLeft
          ? _value.isNearLeft
          : isNearLeft // ignore: cast_nullable_to_non_nullable
              as bool,
      isNearRight: null == isNearRight
          ? _value.isNearRight
          : isNearRight // ignore: cast_nullable_to_non_nullable
              as bool,
      isNearTop: null == isNearTop
          ? _value.isNearTop
          : isNearTop // ignore: cast_nullable_to_non_nullable
              as bool,
      isNearBottom: null == isNearBottom
          ? _value.isNearBottom
          : isNearBottom // ignore: cast_nullable_to_non_nullable
              as bool,
      distanceFromEdge: null == distanceFromEdge
          ? _value.distanceFromEdge
          : distanceFromEdge // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BorderProximityImplCopyWith<$Res>
    implements $BorderProximityCopyWith<$Res> {
  factory _$$BorderProximityImplCopyWith(_$BorderProximityImpl value,
          $Res Function(_$BorderProximityImpl) then) =
      __$$BorderProximityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isNearLeft,
      bool isNearRight,
      bool isNearTop,
      bool isNearBottom,
      double distanceFromEdge});
}

/// @nodoc
class __$$BorderProximityImplCopyWithImpl<$Res>
    extends _$BorderProximityCopyWithImpl<$Res, _$BorderProximityImpl>
    implements _$$BorderProximityImplCopyWith<$Res> {
  __$$BorderProximityImplCopyWithImpl(
      _$BorderProximityImpl _value, $Res Function(_$BorderProximityImpl) _then)
      : super(_value, _then);

  /// Create a copy of BorderProximity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNearLeft = null,
    Object? isNearRight = null,
    Object? isNearTop = null,
    Object? isNearBottom = null,
    Object? distanceFromEdge = null,
  }) {
    return _then(_$BorderProximityImpl(
      isNearLeft: null == isNearLeft
          ? _value.isNearLeft
          : isNearLeft // ignore: cast_nullable_to_non_nullable
              as bool,
      isNearRight: null == isNearRight
          ? _value.isNearRight
          : isNearRight // ignore: cast_nullable_to_non_nullable
              as bool,
      isNearTop: null == isNearTop
          ? _value.isNearTop
          : isNearTop // ignore: cast_nullable_to_non_nullable
              as bool,
      isNearBottom: null == isNearBottom
          ? _value.isNearBottom
          : isNearBottom // ignore: cast_nullable_to_non_nullable
              as bool,
      distanceFromEdge: null == distanceFromEdge
          ? _value.distanceFromEdge
          : distanceFromEdge // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$BorderProximityImpl implements _BorderProximity {
  const _$BorderProximityImpl(
      {required this.isNearLeft,
      required this.isNearRight,
      required this.isNearTop,
      required this.isNearBottom,
      required this.distanceFromEdge});

  @override
  final bool isNearLeft;
  @override
  final bool isNearRight;
  @override
  final bool isNearTop;
  @override
  final bool isNearBottom;
  @override
  final double distanceFromEdge;

  @override
  String toString() {
    return 'BorderProximity(isNearLeft: $isNearLeft, isNearRight: $isNearRight, isNearTop: $isNearTop, isNearBottom: $isNearBottom, distanceFromEdge: $distanceFromEdge)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BorderProximityImpl &&
            (identical(other.isNearLeft, isNearLeft) ||
                other.isNearLeft == isNearLeft) &&
            (identical(other.isNearRight, isNearRight) ||
                other.isNearRight == isNearRight) &&
            (identical(other.isNearTop, isNearTop) ||
                other.isNearTop == isNearTop) &&
            (identical(other.isNearBottom, isNearBottom) ||
                other.isNearBottom == isNearBottom) &&
            (identical(other.distanceFromEdge, distanceFromEdge) ||
                other.distanceFromEdge == distanceFromEdge));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isNearLeft, isNearRight,
      isNearTop, isNearBottom, distanceFromEdge);

  /// Create a copy of BorderProximity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BorderProximityImplCopyWith<_$BorderProximityImpl> get copyWith =>
      __$$BorderProximityImplCopyWithImpl<_$BorderProximityImpl>(
          this, _$identity);
}

abstract class _BorderProximity implements BorderProximity {
  const factory _BorderProximity(
      {required final bool isNearLeft,
      required final bool isNearRight,
      required final bool isNearTop,
      required final bool isNearBottom,
      required final double distanceFromEdge}) = _$BorderProximityImpl;

  @override
  bool get isNearLeft;
  @override
  bool get isNearRight;
  @override
  bool get isNearTop;
  @override
  bool get isNearBottom;
  @override
  double get distanceFromEdge;

  /// Create a copy of BorderProximity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BorderProximityImplCopyWith<_$BorderProximityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
