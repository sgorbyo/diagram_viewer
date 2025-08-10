// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diagram_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DiagramTap {
  String get eventId => throw _privateConstructorUsedError;
  Offset get logicalPosition => throw _privateConstructorUsedError;
  Offset get screenPosition => throw _privateConstructorUsedError;
  Transform2D get transformSnapshot => throw _privateConstructorUsedError;
  List<DiagramObjectEntity> get hitList => throw _privateConstructorUsedError;
  Duration get timestamp => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  int get fingerCount => throw _privateConstructorUsedError;
  MouseButton? get mouseButton => throw _privateConstructorUsedError;
  bool get isOnObject => throw _privateConstructorUsedError;
  Duration get pressDuration => throw _privateConstructorUsedError;
  Offset get velocity => throw _privateConstructorUsedError;

  /// Create a copy of DiagramTap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiagramTapCopyWith<DiagramTap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagramTapCopyWith<$Res> {
  factory $DiagramTapCopyWith(
          DiagramTap value, $Res Function(DiagramTap) then) =
      _$DiagramTapCopyWithImpl<$Res, DiagramTap>;
  @useResult
  $Res call(
      {String eventId,
      Offset logicalPosition,
      Offset screenPosition,
      Transform2D transformSnapshot,
      List<DiagramObjectEntity> hitList,
      Duration timestamp,
      Map<String, dynamic> metadata,
      int fingerCount,
      MouseButton? mouseButton,
      bool isOnObject,
      Duration pressDuration,
      Offset velocity});

  $Transform2DCopyWith<$Res> get transformSnapshot;
}

/// @nodoc
class _$DiagramTapCopyWithImpl<$Res, $Val extends DiagramTap>
    implements $DiagramTapCopyWith<$Res> {
  _$DiagramTapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiagramTap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? logicalPosition = null,
    Object? screenPosition = null,
    Object? transformSnapshot = null,
    Object? hitList = null,
    Object? timestamp = null,
    Object? metadata = null,
    Object? fingerCount = null,
    Object? mouseButton = freezed,
    Object? isOnObject = null,
    Object? pressDuration = null,
    Object? velocity = null,
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
      screenPosition: null == screenPosition
          ? _value.screenPosition
          : screenPosition // ignore: cast_nullable_to_non_nullable
              as Offset,
      transformSnapshot: null == transformSnapshot
          ? _value.transformSnapshot
          : transformSnapshot // ignore: cast_nullable_to_non_nullable
              as Transform2D,
      hitList: null == hitList
          ? _value.hitList
          : hitList // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as Duration,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      fingerCount: null == fingerCount
          ? _value.fingerCount
          : fingerCount // ignore: cast_nullable_to_non_nullable
              as int,
      mouseButton: freezed == mouseButton
          ? _value.mouseButton
          : mouseButton // ignore: cast_nullable_to_non_nullable
              as MouseButton?,
      isOnObject: null == isOnObject
          ? _value.isOnObject
          : isOnObject // ignore: cast_nullable_to_non_nullable
              as bool,
      pressDuration: null == pressDuration
          ? _value.pressDuration
          : pressDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      velocity: null == velocity
          ? _value.velocity
          : velocity // ignore: cast_nullable_to_non_nullable
              as Offset,
    ) as $Val);
  }

  /// Create a copy of DiagramTap
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
abstract class _$$DiagramTapImplCopyWith<$Res>
    implements $DiagramTapCopyWith<$Res> {
  factory _$$DiagramTapImplCopyWith(
          _$DiagramTapImpl value, $Res Function(_$DiagramTapImpl) then) =
      __$$DiagramTapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String eventId,
      Offset logicalPosition,
      Offset screenPosition,
      Transform2D transformSnapshot,
      List<DiagramObjectEntity> hitList,
      Duration timestamp,
      Map<String, dynamic> metadata,
      int fingerCount,
      MouseButton? mouseButton,
      bool isOnObject,
      Duration pressDuration,
      Offset velocity});

  @override
  $Transform2DCopyWith<$Res> get transformSnapshot;
}

/// @nodoc
class __$$DiagramTapImplCopyWithImpl<$Res>
    extends _$DiagramTapCopyWithImpl<$Res, _$DiagramTapImpl>
    implements _$$DiagramTapImplCopyWith<$Res> {
  __$$DiagramTapImplCopyWithImpl(
      _$DiagramTapImpl _value, $Res Function(_$DiagramTapImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramTap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? logicalPosition = null,
    Object? screenPosition = null,
    Object? transformSnapshot = null,
    Object? hitList = null,
    Object? timestamp = null,
    Object? metadata = null,
    Object? fingerCount = null,
    Object? mouseButton = freezed,
    Object? isOnObject = null,
    Object? pressDuration = null,
    Object? velocity = null,
  }) {
    return _then(_$DiagramTapImpl(
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
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as Duration,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      fingerCount: null == fingerCount
          ? _value.fingerCount
          : fingerCount // ignore: cast_nullable_to_non_nullable
              as int,
      mouseButton: freezed == mouseButton
          ? _value.mouseButton
          : mouseButton // ignore: cast_nullable_to_non_nullable
              as MouseButton?,
      isOnObject: null == isOnObject
          ? _value.isOnObject
          : isOnObject // ignore: cast_nullable_to_non_nullable
              as bool,
      pressDuration: null == pressDuration
          ? _value.pressDuration
          : pressDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      velocity: null == velocity
          ? _value.velocity
          : velocity // ignore: cast_nullable_to_non_nullable
              as Offset,
    ));
  }
}

/// @nodoc

class _$DiagramTapImpl implements _DiagramTap {
  const _$DiagramTapImpl(
      {required this.eventId,
      required this.logicalPosition,
      required this.screenPosition,
      required this.transformSnapshot,
      required final List<DiagramObjectEntity> hitList,
      required this.timestamp,
      required final Map<String, dynamic> metadata,
      required this.fingerCount,
      required this.mouseButton,
      required this.isOnObject,
      required this.pressDuration,
      required this.velocity})
      : _hitList = hitList,
        _metadata = metadata;

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
  final Duration timestamp;
  final Map<String, dynamic> _metadata;
  @override
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  final int fingerCount;
  @override
  final MouseButton? mouseButton;
  @override
  final bool isOnObject;
  @override
  final Duration pressDuration;
  @override
  final Offset velocity;

  @override
  String toString() {
    return 'DiagramTap(eventId: $eventId, logicalPosition: $logicalPosition, screenPosition: $screenPosition, transformSnapshot: $transformSnapshot, hitList: $hitList, timestamp: $timestamp, metadata: $metadata, fingerCount: $fingerCount, mouseButton: $mouseButton, isOnObject: $isOnObject, pressDuration: $pressDuration, velocity: $velocity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiagramTapImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.logicalPosition, logicalPosition) ||
                other.logicalPosition == logicalPosition) &&
            (identical(other.screenPosition, screenPosition) ||
                other.screenPosition == screenPosition) &&
            (identical(other.transformSnapshot, transformSnapshot) ||
                other.transformSnapshot == transformSnapshot) &&
            const DeepCollectionEquality().equals(other._hitList, _hitList) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.fingerCount, fingerCount) ||
                other.fingerCount == fingerCount) &&
            (identical(other.mouseButton, mouseButton) ||
                other.mouseButton == mouseButton) &&
            (identical(other.isOnObject, isOnObject) ||
                other.isOnObject == isOnObject) &&
            (identical(other.pressDuration, pressDuration) ||
                other.pressDuration == pressDuration) &&
            (identical(other.velocity, velocity) ||
                other.velocity == velocity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      eventId,
      logicalPosition,
      screenPosition,
      transformSnapshot,
      const DeepCollectionEquality().hash(_hitList),
      timestamp,
      const DeepCollectionEquality().hash(_metadata),
      fingerCount,
      mouseButton,
      isOnObject,
      pressDuration,
      velocity);

  /// Create a copy of DiagramTap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiagramTapImplCopyWith<_$DiagramTapImpl> get copyWith =>
      __$$DiagramTapImplCopyWithImpl<_$DiagramTapImpl>(this, _$identity);
}

abstract class _DiagramTap implements DiagramTap {
  const factory _DiagramTap(
      {required final String eventId,
      required final Offset logicalPosition,
      required final Offset screenPosition,
      required final Transform2D transformSnapshot,
      required final List<DiagramObjectEntity> hitList,
      required final Duration timestamp,
      required final Map<String, dynamic> metadata,
      required final int fingerCount,
      required final MouseButton? mouseButton,
      required final bool isOnObject,
      required final Duration pressDuration,
      required final Offset velocity}) = _$DiagramTapImpl;

  @override
  String get eventId;
  @override
  Offset get logicalPosition;
  @override
  Offset get screenPosition;
  @override
  Transform2D get transformSnapshot;
  @override
  List<DiagramObjectEntity> get hitList;
  @override
  Duration get timestamp;
  @override
  Map<String, dynamic> get metadata;
  @override
  int get fingerCount;
  @override
  MouseButton? get mouseButton;
  @override
  bool get isOnObject;
  @override
  Duration get pressDuration;
  @override
  Offset get velocity;

  /// Create a copy of DiagramTap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiagramTapImplCopyWith<_$DiagramTapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DiagramDoubleTap {
  String get eventId => throw _privateConstructorUsedError;
  Offset get logicalPosition => throw _privateConstructorUsedError;
  Offset get screenPosition => throw _privateConstructorUsedError;
  Transform2D get transformSnapshot => throw _privateConstructorUsedError;
  List<DiagramObjectEntity> get hitList => throw _privateConstructorUsedError;
  Duration get timestamp => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  int get fingerCount => throw _privateConstructorUsedError;
  MouseButton? get mouseButton => throw _privateConstructorUsedError;
  bool get isOnObject => throw _privateConstructorUsedError;
  Duration get intervalBetweenTaps => throw _privateConstructorUsedError;

  /// Create a copy of DiagramDoubleTap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiagramDoubleTapCopyWith<DiagramDoubleTap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagramDoubleTapCopyWith<$Res> {
  factory $DiagramDoubleTapCopyWith(
          DiagramDoubleTap value, $Res Function(DiagramDoubleTap) then) =
      _$DiagramDoubleTapCopyWithImpl<$Res, DiagramDoubleTap>;
  @useResult
  $Res call(
      {String eventId,
      Offset logicalPosition,
      Offset screenPosition,
      Transform2D transformSnapshot,
      List<DiagramObjectEntity> hitList,
      Duration timestamp,
      Map<String, dynamic> metadata,
      int fingerCount,
      MouseButton? mouseButton,
      bool isOnObject,
      Duration intervalBetweenTaps});

  $Transform2DCopyWith<$Res> get transformSnapshot;
}

/// @nodoc
class _$DiagramDoubleTapCopyWithImpl<$Res, $Val extends DiagramDoubleTap>
    implements $DiagramDoubleTapCopyWith<$Res> {
  _$DiagramDoubleTapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiagramDoubleTap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? logicalPosition = null,
    Object? screenPosition = null,
    Object? transformSnapshot = null,
    Object? hitList = null,
    Object? timestamp = null,
    Object? metadata = null,
    Object? fingerCount = null,
    Object? mouseButton = freezed,
    Object? isOnObject = null,
    Object? intervalBetweenTaps = null,
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
      screenPosition: null == screenPosition
          ? _value.screenPosition
          : screenPosition // ignore: cast_nullable_to_non_nullable
              as Offset,
      transformSnapshot: null == transformSnapshot
          ? _value.transformSnapshot
          : transformSnapshot // ignore: cast_nullable_to_non_nullable
              as Transform2D,
      hitList: null == hitList
          ? _value.hitList
          : hitList // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as Duration,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      fingerCount: null == fingerCount
          ? _value.fingerCount
          : fingerCount // ignore: cast_nullable_to_non_nullable
              as int,
      mouseButton: freezed == mouseButton
          ? _value.mouseButton
          : mouseButton // ignore: cast_nullable_to_non_nullable
              as MouseButton?,
      isOnObject: null == isOnObject
          ? _value.isOnObject
          : isOnObject // ignore: cast_nullable_to_non_nullable
              as bool,
      intervalBetweenTaps: null == intervalBetweenTaps
          ? _value.intervalBetweenTaps
          : intervalBetweenTaps // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }

  /// Create a copy of DiagramDoubleTap
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
abstract class _$$DiagramDoubleTapImplCopyWith<$Res>
    implements $DiagramDoubleTapCopyWith<$Res> {
  factory _$$DiagramDoubleTapImplCopyWith(_$DiagramDoubleTapImpl value,
          $Res Function(_$DiagramDoubleTapImpl) then) =
      __$$DiagramDoubleTapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String eventId,
      Offset logicalPosition,
      Offset screenPosition,
      Transform2D transformSnapshot,
      List<DiagramObjectEntity> hitList,
      Duration timestamp,
      Map<String, dynamic> metadata,
      int fingerCount,
      MouseButton? mouseButton,
      bool isOnObject,
      Duration intervalBetweenTaps});

  @override
  $Transform2DCopyWith<$Res> get transformSnapshot;
}

/// @nodoc
class __$$DiagramDoubleTapImplCopyWithImpl<$Res>
    extends _$DiagramDoubleTapCopyWithImpl<$Res, _$DiagramDoubleTapImpl>
    implements _$$DiagramDoubleTapImplCopyWith<$Res> {
  __$$DiagramDoubleTapImplCopyWithImpl(_$DiagramDoubleTapImpl _value,
      $Res Function(_$DiagramDoubleTapImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramDoubleTap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? logicalPosition = null,
    Object? screenPosition = null,
    Object? transformSnapshot = null,
    Object? hitList = null,
    Object? timestamp = null,
    Object? metadata = null,
    Object? fingerCount = null,
    Object? mouseButton = freezed,
    Object? isOnObject = null,
    Object? intervalBetweenTaps = null,
  }) {
    return _then(_$DiagramDoubleTapImpl(
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
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as Duration,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      fingerCount: null == fingerCount
          ? _value.fingerCount
          : fingerCount // ignore: cast_nullable_to_non_nullable
              as int,
      mouseButton: freezed == mouseButton
          ? _value.mouseButton
          : mouseButton // ignore: cast_nullable_to_non_nullable
              as MouseButton?,
      isOnObject: null == isOnObject
          ? _value.isOnObject
          : isOnObject // ignore: cast_nullable_to_non_nullable
              as bool,
      intervalBetweenTaps: null == intervalBetweenTaps
          ? _value.intervalBetweenTaps
          : intervalBetweenTaps // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$DiagramDoubleTapImpl implements _DiagramDoubleTap {
  const _$DiagramDoubleTapImpl(
      {required this.eventId,
      required this.logicalPosition,
      required this.screenPosition,
      required this.transformSnapshot,
      required final List<DiagramObjectEntity> hitList,
      required this.timestamp,
      required final Map<String, dynamic> metadata,
      required this.fingerCount,
      required this.mouseButton,
      required this.isOnObject,
      required this.intervalBetweenTaps})
      : _hitList = hitList,
        _metadata = metadata;

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
  final Duration timestamp;
  final Map<String, dynamic> _metadata;
  @override
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  final int fingerCount;
  @override
  final MouseButton? mouseButton;
  @override
  final bool isOnObject;
  @override
  final Duration intervalBetweenTaps;

  @override
  String toString() {
    return 'DiagramDoubleTap(eventId: $eventId, logicalPosition: $logicalPosition, screenPosition: $screenPosition, transformSnapshot: $transformSnapshot, hitList: $hitList, timestamp: $timestamp, metadata: $metadata, fingerCount: $fingerCount, mouseButton: $mouseButton, isOnObject: $isOnObject, intervalBetweenTaps: $intervalBetweenTaps)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiagramDoubleTapImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.logicalPosition, logicalPosition) ||
                other.logicalPosition == logicalPosition) &&
            (identical(other.screenPosition, screenPosition) ||
                other.screenPosition == screenPosition) &&
            (identical(other.transformSnapshot, transformSnapshot) ||
                other.transformSnapshot == transformSnapshot) &&
            const DeepCollectionEquality().equals(other._hitList, _hitList) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.fingerCount, fingerCount) ||
                other.fingerCount == fingerCount) &&
            (identical(other.mouseButton, mouseButton) ||
                other.mouseButton == mouseButton) &&
            (identical(other.isOnObject, isOnObject) ||
                other.isOnObject == isOnObject) &&
            (identical(other.intervalBetweenTaps, intervalBetweenTaps) ||
                other.intervalBetweenTaps == intervalBetweenTaps));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      eventId,
      logicalPosition,
      screenPosition,
      transformSnapshot,
      const DeepCollectionEquality().hash(_hitList),
      timestamp,
      const DeepCollectionEquality().hash(_metadata),
      fingerCount,
      mouseButton,
      isOnObject,
      intervalBetweenTaps);

  /// Create a copy of DiagramDoubleTap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiagramDoubleTapImplCopyWith<_$DiagramDoubleTapImpl> get copyWith =>
      __$$DiagramDoubleTapImplCopyWithImpl<_$DiagramDoubleTapImpl>(
          this, _$identity);
}

abstract class _DiagramDoubleTap implements DiagramDoubleTap {
  const factory _DiagramDoubleTap(
      {required final String eventId,
      required final Offset logicalPosition,
      required final Offset screenPosition,
      required final Transform2D transformSnapshot,
      required final List<DiagramObjectEntity> hitList,
      required final Duration timestamp,
      required final Map<String, dynamic> metadata,
      required final int fingerCount,
      required final MouseButton? mouseButton,
      required final bool isOnObject,
      required final Duration intervalBetweenTaps}) = _$DiagramDoubleTapImpl;

  @override
  String get eventId;
  @override
  Offset get logicalPosition;
  @override
  Offset get screenPosition;
  @override
  Transform2D get transformSnapshot;
  @override
  List<DiagramObjectEntity> get hitList;
  @override
  Duration get timestamp;
  @override
  Map<String, dynamic> get metadata;
  @override
  int get fingerCount;
  @override
  MouseButton? get mouseButton;
  @override
  bool get isOnObject;
  @override
  Duration get intervalBetweenTaps;

  /// Create a copy of DiagramDoubleTap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiagramDoubleTapImplCopyWith<_$DiagramDoubleTapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DiagramLongPress {
  String get eventId => throw _privateConstructorUsedError;
  Offset get logicalPosition => throw _privateConstructorUsedError;
  Offset get screenPosition => throw _privateConstructorUsedError;
  Transform2D get transformSnapshot => throw _privateConstructorUsedError;
  List<DiagramObjectEntity> get hitList => throw _privateConstructorUsedError;
  Duration get timestamp => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  int get fingerCount => throw _privateConstructorUsedError;
  MouseButton? get mouseButton => throw _privateConstructorUsedError;
  bool get isOnObject => throw _privateConstructorUsedError;
  Duration get pressDuration => throw _privateConstructorUsedError;

  /// Create a copy of DiagramLongPress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiagramLongPressCopyWith<DiagramLongPress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagramLongPressCopyWith<$Res> {
  factory $DiagramLongPressCopyWith(
          DiagramLongPress value, $Res Function(DiagramLongPress) then) =
      _$DiagramLongPressCopyWithImpl<$Res, DiagramLongPress>;
  @useResult
  $Res call(
      {String eventId,
      Offset logicalPosition,
      Offset screenPosition,
      Transform2D transformSnapshot,
      List<DiagramObjectEntity> hitList,
      Duration timestamp,
      Map<String, dynamic> metadata,
      int fingerCount,
      MouseButton? mouseButton,
      bool isOnObject,
      Duration pressDuration});

  $Transform2DCopyWith<$Res> get transformSnapshot;
}

/// @nodoc
class _$DiagramLongPressCopyWithImpl<$Res, $Val extends DiagramLongPress>
    implements $DiagramLongPressCopyWith<$Res> {
  _$DiagramLongPressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiagramLongPress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? logicalPosition = null,
    Object? screenPosition = null,
    Object? transformSnapshot = null,
    Object? hitList = null,
    Object? timestamp = null,
    Object? metadata = null,
    Object? fingerCount = null,
    Object? mouseButton = freezed,
    Object? isOnObject = null,
    Object? pressDuration = null,
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
      screenPosition: null == screenPosition
          ? _value.screenPosition
          : screenPosition // ignore: cast_nullable_to_non_nullable
              as Offset,
      transformSnapshot: null == transformSnapshot
          ? _value.transformSnapshot
          : transformSnapshot // ignore: cast_nullable_to_non_nullable
              as Transform2D,
      hitList: null == hitList
          ? _value.hitList
          : hitList // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as Duration,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      fingerCount: null == fingerCount
          ? _value.fingerCount
          : fingerCount // ignore: cast_nullable_to_non_nullable
              as int,
      mouseButton: freezed == mouseButton
          ? _value.mouseButton
          : mouseButton // ignore: cast_nullable_to_non_nullable
              as MouseButton?,
      isOnObject: null == isOnObject
          ? _value.isOnObject
          : isOnObject // ignore: cast_nullable_to_non_nullable
              as bool,
      pressDuration: null == pressDuration
          ? _value.pressDuration
          : pressDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }

  /// Create a copy of DiagramLongPress
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
abstract class _$$DiagramLongPressImplCopyWith<$Res>
    implements $DiagramLongPressCopyWith<$Res> {
  factory _$$DiagramLongPressImplCopyWith(_$DiagramLongPressImpl value,
          $Res Function(_$DiagramLongPressImpl) then) =
      __$$DiagramLongPressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String eventId,
      Offset logicalPosition,
      Offset screenPosition,
      Transform2D transformSnapshot,
      List<DiagramObjectEntity> hitList,
      Duration timestamp,
      Map<String, dynamic> metadata,
      int fingerCount,
      MouseButton? mouseButton,
      bool isOnObject,
      Duration pressDuration});

  @override
  $Transform2DCopyWith<$Res> get transformSnapshot;
}

/// @nodoc
class __$$DiagramLongPressImplCopyWithImpl<$Res>
    extends _$DiagramLongPressCopyWithImpl<$Res, _$DiagramLongPressImpl>
    implements _$$DiagramLongPressImplCopyWith<$Res> {
  __$$DiagramLongPressImplCopyWithImpl(_$DiagramLongPressImpl _value,
      $Res Function(_$DiagramLongPressImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramLongPress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? logicalPosition = null,
    Object? screenPosition = null,
    Object? transformSnapshot = null,
    Object? hitList = null,
    Object? timestamp = null,
    Object? metadata = null,
    Object? fingerCount = null,
    Object? mouseButton = freezed,
    Object? isOnObject = null,
    Object? pressDuration = null,
  }) {
    return _then(_$DiagramLongPressImpl(
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
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as Duration,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      fingerCount: null == fingerCount
          ? _value.fingerCount
          : fingerCount // ignore: cast_nullable_to_non_nullable
              as int,
      mouseButton: freezed == mouseButton
          ? _value.mouseButton
          : mouseButton // ignore: cast_nullable_to_non_nullable
              as MouseButton?,
      isOnObject: null == isOnObject
          ? _value.isOnObject
          : isOnObject // ignore: cast_nullable_to_non_nullable
              as bool,
      pressDuration: null == pressDuration
          ? _value.pressDuration
          : pressDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$DiagramLongPressImpl implements _DiagramLongPress {
  const _$DiagramLongPressImpl(
      {required this.eventId,
      required this.logicalPosition,
      required this.screenPosition,
      required this.transformSnapshot,
      required final List<DiagramObjectEntity> hitList,
      required this.timestamp,
      required final Map<String, dynamic> metadata,
      required this.fingerCount,
      required this.mouseButton,
      required this.isOnObject,
      required this.pressDuration})
      : _hitList = hitList,
        _metadata = metadata;

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
  final Duration timestamp;
  final Map<String, dynamic> _metadata;
  @override
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  final int fingerCount;
  @override
  final MouseButton? mouseButton;
  @override
  final bool isOnObject;
  @override
  final Duration pressDuration;

  @override
  String toString() {
    return 'DiagramLongPress(eventId: $eventId, logicalPosition: $logicalPosition, screenPosition: $screenPosition, transformSnapshot: $transformSnapshot, hitList: $hitList, timestamp: $timestamp, metadata: $metadata, fingerCount: $fingerCount, mouseButton: $mouseButton, isOnObject: $isOnObject, pressDuration: $pressDuration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiagramLongPressImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.logicalPosition, logicalPosition) ||
                other.logicalPosition == logicalPosition) &&
            (identical(other.screenPosition, screenPosition) ||
                other.screenPosition == screenPosition) &&
            (identical(other.transformSnapshot, transformSnapshot) ||
                other.transformSnapshot == transformSnapshot) &&
            const DeepCollectionEquality().equals(other._hitList, _hitList) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.fingerCount, fingerCount) ||
                other.fingerCount == fingerCount) &&
            (identical(other.mouseButton, mouseButton) ||
                other.mouseButton == mouseButton) &&
            (identical(other.isOnObject, isOnObject) ||
                other.isOnObject == isOnObject) &&
            (identical(other.pressDuration, pressDuration) ||
                other.pressDuration == pressDuration));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      eventId,
      logicalPosition,
      screenPosition,
      transformSnapshot,
      const DeepCollectionEquality().hash(_hitList),
      timestamp,
      const DeepCollectionEquality().hash(_metadata),
      fingerCount,
      mouseButton,
      isOnObject,
      pressDuration);

  /// Create a copy of DiagramLongPress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiagramLongPressImplCopyWith<_$DiagramLongPressImpl> get copyWith =>
      __$$DiagramLongPressImplCopyWithImpl<_$DiagramLongPressImpl>(
          this, _$identity);
}

abstract class _DiagramLongPress implements DiagramLongPress {
  const factory _DiagramLongPress(
      {required final String eventId,
      required final Offset logicalPosition,
      required final Offset screenPosition,
      required final Transform2D transformSnapshot,
      required final List<DiagramObjectEntity> hitList,
      required final Duration timestamp,
      required final Map<String, dynamic> metadata,
      required final int fingerCount,
      required final MouseButton? mouseButton,
      required final bool isOnObject,
      required final Duration pressDuration}) = _$DiagramLongPressImpl;

  @override
  String get eventId;
  @override
  Offset get logicalPosition;
  @override
  Offset get screenPosition;
  @override
  Transform2D get transformSnapshot;
  @override
  List<DiagramObjectEntity> get hitList;
  @override
  Duration get timestamp;
  @override
  Map<String, dynamic> get metadata;
  @override
  int get fingerCount;
  @override
  MouseButton? get mouseButton;
  @override
  bool get isOnObject;
  @override
  Duration get pressDuration;

  /// Create a copy of DiagramLongPress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiagramLongPressImplCopyWith<_$DiagramLongPressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DiagramScroll {
  String get eventId => throw _privateConstructorUsedError;
  Offset get logicalPosition => throw _privateConstructorUsedError;
  Offset get screenPosition => throw _privateConstructorUsedError;
  Transform2D get transformSnapshot => throw _privateConstructorUsedError;
  List<DiagramObjectEntity> get hitList => throw _privateConstructorUsedError;
  Duration get timestamp => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  double get scrollDelta => throw _privateConstructorUsedError;
  double get scrollVelocity => throw _privateConstructorUsedError;
  Duration get scrollDuration => throw _privateConstructorUsedError;
  Offset get scrollDirection => throw _privateConstructorUsedError;
  bool get isInertial => throw _privateConstructorUsedError;
  int get scrollCount => throw _privateConstructorUsedError;
  double? get suggestedInertiaDuration => throw _privateConstructorUsedError;
  double? get suggestedInertiaDecay => throw _privateConstructorUsedError;

  /// Create a copy of DiagramScroll
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiagramScrollCopyWith<DiagramScroll> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagramScrollCopyWith<$Res> {
  factory $DiagramScrollCopyWith(
          DiagramScroll value, $Res Function(DiagramScroll) then) =
      _$DiagramScrollCopyWithImpl<$Res, DiagramScroll>;
  @useResult
  $Res call(
      {String eventId,
      Offset logicalPosition,
      Offset screenPosition,
      Transform2D transformSnapshot,
      List<DiagramObjectEntity> hitList,
      Duration timestamp,
      Map<String, dynamic> metadata,
      double scrollDelta,
      double scrollVelocity,
      Duration scrollDuration,
      Offset scrollDirection,
      bool isInertial,
      int scrollCount,
      double? suggestedInertiaDuration,
      double? suggestedInertiaDecay});

  $Transform2DCopyWith<$Res> get transformSnapshot;
}

/// @nodoc
class _$DiagramScrollCopyWithImpl<$Res, $Val extends DiagramScroll>
    implements $DiagramScrollCopyWith<$Res> {
  _$DiagramScrollCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiagramScroll
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? logicalPosition = null,
    Object? screenPosition = null,
    Object? transformSnapshot = null,
    Object? hitList = null,
    Object? timestamp = null,
    Object? metadata = null,
    Object? scrollDelta = null,
    Object? scrollVelocity = null,
    Object? scrollDuration = null,
    Object? scrollDirection = null,
    Object? isInertial = null,
    Object? scrollCount = null,
    Object? suggestedInertiaDuration = freezed,
    Object? suggestedInertiaDecay = freezed,
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
      screenPosition: null == screenPosition
          ? _value.screenPosition
          : screenPosition // ignore: cast_nullable_to_non_nullable
              as Offset,
      transformSnapshot: null == transformSnapshot
          ? _value.transformSnapshot
          : transformSnapshot // ignore: cast_nullable_to_non_nullable
              as Transform2D,
      hitList: null == hitList
          ? _value.hitList
          : hitList // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as Duration,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      scrollDelta: null == scrollDelta
          ? _value.scrollDelta
          : scrollDelta // ignore: cast_nullable_to_non_nullable
              as double,
      scrollVelocity: null == scrollVelocity
          ? _value.scrollVelocity
          : scrollVelocity // ignore: cast_nullable_to_non_nullable
              as double,
      scrollDuration: null == scrollDuration
          ? _value.scrollDuration
          : scrollDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      scrollDirection: null == scrollDirection
          ? _value.scrollDirection
          : scrollDirection // ignore: cast_nullable_to_non_nullable
              as Offset,
      isInertial: null == isInertial
          ? _value.isInertial
          : isInertial // ignore: cast_nullable_to_non_nullable
              as bool,
      scrollCount: null == scrollCount
          ? _value.scrollCount
          : scrollCount // ignore: cast_nullable_to_non_nullable
              as int,
      suggestedInertiaDuration: freezed == suggestedInertiaDuration
          ? _value.suggestedInertiaDuration
          : suggestedInertiaDuration // ignore: cast_nullable_to_non_nullable
              as double?,
      suggestedInertiaDecay: freezed == suggestedInertiaDecay
          ? _value.suggestedInertiaDecay
          : suggestedInertiaDecay // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  /// Create a copy of DiagramScroll
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
abstract class _$$DiagramScrollImplCopyWith<$Res>
    implements $DiagramScrollCopyWith<$Res> {
  factory _$$DiagramScrollImplCopyWith(
          _$DiagramScrollImpl value, $Res Function(_$DiagramScrollImpl) then) =
      __$$DiagramScrollImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String eventId,
      Offset logicalPosition,
      Offset screenPosition,
      Transform2D transformSnapshot,
      List<DiagramObjectEntity> hitList,
      Duration timestamp,
      Map<String, dynamic> metadata,
      double scrollDelta,
      double scrollVelocity,
      Duration scrollDuration,
      Offset scrollDirection,
      bool isInertial,
      int scrollCount,
      double? suggestedInertiaDuration,
      double? suggestedInertiaDecay});

  @override
  $Transform2DCopyWith<$Res> get transformSnapshot;
}

/// @nodoc
class __$$DiagramScrollImplCopyWithImpl<$Res>
    extends _$DiagramScrollCopyWithImpl<$Res, _$DiagramScrollImpl>
    implements _$$DiagramScrollImplCopyWith<$Res> {
  __$$DiagramScrollImplCopyWithImpl(
      _$DiagramScrollImpl _value, $Res Function(_$DiagramScrollImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramScroll
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? logicalPosition = null,
    Object? screenPosition = null,
    Object? transformSnapshot = null,
    Object? hitList = null,
    Object? timestamp = null,
    Object? metadata = null,
    Object? scrollDelta = null,
    Object? scrollVelocity = null,
    Object? scrollDuration = null,
    Object? scrollDirection = null,
    Object? isInertial = null,
    Object? scrollCount = null,
    Object? suggestedInertiaDuration = freezed,
    Object? suggestedInertiaDecay = freezed,
  }) {
    return _then(_$DiagramScrollImpl(
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
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as Duration,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      scrollDelta: null == scrollDelta
          ? _value.scrollDelta
          : scrollDelta // ignore: cast_nullable_to_non_nullable
              as double,
      scrollVelocity: null == scrollVelocity
          ? _value.scrollVelocity
          : scrollVelocity // ignore: cast_nullable_to_non_nullable
              as double,
      scrollDuration: null == scrollDuration
          ? _value.scrollDuration
          : scrollDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      scrollDirection: null == scrollDirection
          ? _value.scrollDirection
          : scrollDirection // ignore: cast_nullable_to_non_nullable
              as Offset,
      isInertial: null == isInertial
          ? _value.isInertial
          : isInertial // ignore: cast_nullable_to_non_nullable
              as bool,
      scrollCount: null == scrollCount
          ? _value.scrollCount
          : scrollCount // ignore: cast_nullable_to_non_nullable
              as int,
      suggestedInertiaDuration: freezed == suggestedInertiaDuration
          ? _value.suggestedInertiaDuration
          : suggestedInertiaDuration // ignore: cast_nullable_to_non_nullable
              as double?,
      suggestedInertiaDecay: freezed == suggestedInertiaDecay
          ? _value.suggestedInertiaDecay
          : suggestedInertiaDecay // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$DiagramScrollImpl implements _DiagramScroll {
  const _$DiagramScrollImpl(
      {required this.eventId,
      required this.logicalPosition,
      required this.screenPosition,
      required this.transformSnapshot,
      required final List<DiagramObjectEntity> hitList,
      required this.timestamp,
      required final Map<String, dynamic> metadata,
      required this.scrollDelta,
      required this.scrollVelocity,
      required this.scrollDuration,
      required this.scrollDirection,
      required this.isInertial,
      required this.scrollCount,
      this.suggestedInertiaDuration,
      this.suggestedInertiaDecay})
      : _hitList = hitList,
        _metadata = metadata;

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
  final Duration timestamp;
  final Map<String, dynamic> _metadata;
  @override
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  final double scrollDelta;
  @override
  final double scrollVelocity;
  @override
  final Duration scrollDuration;
  @override
  final Offset scrollDirection;
  @override
  final bool isInertial;
  @override
  final int scrollCount;
  @override
  final double? suggestedInertiaDuration;
  @override
  final double? suggestedInertiaDecay;

  @override
  String toString() {
    return 'DiagramScroll(eventId: $eventId, logicalPosition: $logicalPosition, screenPosition: $screenPosition, transformSnapshot: $transformSnapshot, hitList: $hitList, timestamp: $timestamp, metadata: $metadata, scrollDelta: $scrollDelta, scrollVelocity: $scrollVelocity, scrollDuration: $scrollDuration, scrollDirection: $scrollDirection, isInertial: $isInertial, scrollCount: $scrollCount, suggestedInertiaDuration: $suggestedInertiaDuration, suggestedInertiaDecay: $suggestedInertiaDecay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiagramScrollImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.logicalPosition, logicalPosition) ||
                other.logicalPosition == logicalPosition) &&
            (identical(other.screenPosition, screenPosition) ||
                other.screenPosition == screenPosition) &&
            (identical(other.transformSnapshot, transformSnapshot) ||
                other.transformSnapshot == transformSnapshot) &&
            const DeepCollectionEquality().equals(other._hitList, _hitList) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.scrollDelta, scrollDelta) ||
                other.scrollDelta == scrollDelta) &&
            (identical(other.scrollVelocity, scrollVelocity) ||
                other.scrollVelocity == scrollVelocity) &&
            (identical(other.scrollDuration, scrollDuration) ||
                other.scrollDuration == scrollDuration) &&
            (identical(other.scrollDirection, scrollDirection) ||
                other.scrollDirection == scrollDirection) &&
            (identical(other.isInertial, isInertial) ||
                other.isInertial == isInertial) &&
            (identical(other.scrollCount, scrollCount) ||
                other.scrollCount == scrollCount) &&
            (identical(
                    other.suggestedInertiaDuration, suggestedInertiaDuration) ||
                other.suggestedInertiaDuration == suggestedInertiaDuration) &&
            (identical(other.suggestedInertiaDecay, suggestedInertiaDecay) ||
                other.suggestedInertiaDecay == suggestedInertiaDecay));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      eventId,
      logicalPosition,
      screenPosition,
      transformSnapshot,
      const DeepCollectionEquality().hash(_hitList),
      timestamp,
      const DeepCollectionEquality().hash(_metadata),
      scrollDelta,
      scrollVelocity,
      scrollDuration,
      scrollDirection,
      isInertial,
      scrollCount,
      suggestedInertiaDuration,
      suggestedInertiaDecay);

  /// Create a copy of DiagramScroll
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiagramScrollImplCopyWith<_$DiagramScrollImpl> get copyWith =>
      __$$DiagramScrollImplCopyWithImpl<_$DiagramScrollImpl>(this, _$identity);
}

abstract class _DiagramScroll implements DiagramScroll {
  const factory _DiagramScroll(
      {required final String eventId,
      required final Offset logicalPosition,
      required final Offset screenPosition,
      required final Transform2D transformSnapshot,
      required final List<DiagramObjectEntity> hitList,
      required final Duration timestamp,
      required final Map<String, dynamic> metadata,
      required final double scrollDelta,
      required final double scrollVelocity,
      required final Duration scrollDuration,
      required final Offset scrollDirection,
      required final bool isInertial,
      required final int scrollCount,
      final double? suggestedInertiaDuration,
      final double? suggestedInertiaDecay}) = _$DiagramScrollImpl;

  @override
  String get eventId;
  @override
  Offset get logicalPosition;
  @override
  Offset get screenPosition;
  @override
  Transform2D get transformSnapshot;
  @override
  List<DiagramObjectEntity> get hitList;
  @override
  Duration get timestamp;
  @override
  Map<String, dynamic> get metadata;
  @override
  double get scrollDelta;
  @override
  double get scrollVelocity;
  @override
  Duration get scrollDuration;
  @override
  Offset get scrollDirection;
  @override
  bool get isInertial;
  @override
  int get scrollCount;
  @override
  double? get suggestedInertiaDuration;
  @override
  double? get suggestedInertiaDecay;

  /// Create a copy of DiagramScroll
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiagramScrollImplCopyWith<_$DiagramScrollImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DiagramDragBegin {
  String get eventId => throw _privateConstructorUsedError;
  Offset get logicalPosition => throw _privateConstructorUsedError;
  Offset get screenPosition => throw _privateConstructorUsedError;
  Transform2D get transformSnapshot => throw _privateConstructorUsedError;
  List<DiagramObjectEntity> get hitList => throw _privateConstructorUsedError;
  Duration get timestamp => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  int get fingerCount => throw _privateConstructorUsedError;
  MouseButton? get mouseButton => throw _privateConstructorUsedError;
  bool get isOnObject => throw _privateConstructorUsedError;

  /// Create a copy of DiagramDragBegin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiagramDragBeginCopyWith<DiagramDragBegin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagramDragBeginCopyWith<$Res> {
  factory $DiagramDragBeginCopyWith(
          DiagramDragBegin value, $Res Function(DiagramDragBegin) then) =
      _$DiagramDragBeginCopyWithImpl<$Res, DiagramDragBegin>;
  @useResult
  $Res call(
      {String eventId,
      Offset logicalPosition,
      Offset screenPosition,
      Transform2D transformSnapshot,
      List<DiagramObjectEntity> hitList,
      Duration timestamp,
      Map<String, dynamic> metadata,
      int fingerCount,
      MouseButton? mouseButton,
      bool isOnObject});

  $Transform2DCopyWith<$Res> get transformSnapshot;
}

/// @nodoc
class _$DiagramDragBeginCopyWithImpl<$Res, $Val extends DiagramDragBegin>
    implements $DiagramDragBeginCopyWith<$Res> {
  _$DiagramDragBeginCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiagramDragBegin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? logicalPosition = null,
    Object? screenPosition = null,
    Object? transformSnapshot = null,
    Object? hitList = null,
    Object? timestamp = null,
    Object? metadata = null,
    Object? fingerCount = null,
    Object? mouseButton = freezed,
    Object? isOnObject = null,
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
      screenPosition: null == screenPosition
          ? _value.screenPosition
          : screenPosition // ignore: cast_nullable_to_non_nullable
              as Offset,
      transformSnapshot: null == transformSnapshot
          ? _value.transformSnapshot
          : transformSnapshot // ignore: cast_nullable_to_non_nullable
              as Transform2D,
      hitList: null == hitList
          ? _value.hitList
          : hitList // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as Duration,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      fingerCount: null == fingerCount
          ? _value.fingerCount
          : fingerCount // ignore: cast_nullable_to_non_nullable
              as int,
      mouseButton: freezed == mouseButton
          ? _value.mouseButton
          : mouseButton // ignore: cast_nullable_to_non_nullable
              as MouseButton?,
      isOnObject: null == isOnObject
          ? _value.isOnObject
          : isOnObject // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of DiagramDragBegin
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
abstract class _$$DiagramDragBeginImplCopyWith<$Res>
    implements $DiagramDragBeginCopyWith<$Res> {
  factory _$$DiagramDragBeginImplCopyWith(_$DiagramDragBeginImpl value,
          $Res Function(_$DiagramDragBeginImpl) then) =
      __$$DiagramDragBeginImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String eventId,
      Offset logicalPosition,
      Offset screenPosition,
      Transform2D transformSnapshot,
      List<DiagramObjectEntity> hitList,
      Duration timestamp,
      Map<String, dynamic> metadata,
      int fingerCount,
      MouseButton? mouseButton,
      bool isOnObject});

  @override
  $Transform2DCopyWith<$Res> get transformSnapshot;
}

/// @nodoc
class __$$DiagramDragBeginImplCopyWithImpl<$Res>
    extends _$DiagramDragBeginCopyWithImpl<$Res, _$DiagramDragBeginImpl>
    implements _$$DiagramDragBeginImplCopyWith<$Res> {
  __$$DiagramDragBeginImplCopyWithImpl(_$DiagramDragBeginImpl _value,
      $Res Function(_$DiagramDragBeginImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramDragBegin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? logicalPosition = null,
    Object? screenPosition = null,
    Object? transformSnapshot = null,
    Object? hitList = null,
    Object? timestamp = null,
    Object? metadata = null,
    Object? fingerCount = null,
    Object? mouseButton = freezed,
    Object? isOnObject = null,
  }) {
    return _then(_$DiagramDragBeginImpl(
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
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as Duration,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      fingerCount: null == fingerCount
          ? _value.fingerCount
          : fingerCount // ignore: cast_nullable_to_non_nullable
              as int,
      mouseButton: freezed == mouseButton
          ? _value.mouseButton
          : mouseButton // ignore: cast_nullable_to_non_nullable
              as MouseButton?,
      isOnObject: null == isOnObject
          ? _value.isOnObject
          : isOnObject // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DiagramDragBeginImpl implements _DiagramDragBegin {
  const _$DiagramDragBeginImpl(
      {required this.eventId,
      required this.logicalPosition,
      required this.screenPosition,
      required this.transformSnapshot,
      required final List<DiagramObjectEntity> hitList,
      required this.timestamp,
      required final Map<String, dynamic> metadata,
      required this.fingerCount,
      required this.mouseButton,
      required this.isOnObject})
      : _hitList = hitList,
        _metadata = metadata;

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
  final Duration timestamp;
  final Map<String, dynamic> _metadata;
  @override
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  final int fingerCount;
  @override
  final MouseButton? mouseButton;
  @override
  final bool isOnObject;

  @override
  String toString() {
    return 'DiagramDragBegin(eventId: $eventId, logicalPosition: $logicalPosition, screenPosition: $screenPosition, transformSnapshot: $transformSnapshot, hitList: $hitList, timestamp: $timestamp, metadata: $metadata, fingerCount: $fingerCount, mouseButton: $mouseButton, isOnObject: $isOnObject)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiagramDragBeginImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.logicalPosition, logicalPosition) ||
                other.logicalPosition == logicalPosition) &&
            (identical(other.screenPosition, screenPosition) ||
                other.screenPosition == screenPosition) &&
            (identical(other.transformSnapshot, transformSnapshot) ||
                other.transformSnapshot == transformSnapshot) &&
            const DeepCollectionEquality().equals(other._hitList, _hitList) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.fingerCount, fingerCount) ||
                other.fingerCount == fingerCount) &&
            (identical(other.mouseButton, mouseButton) ||
                other.mouseButton == mouseButton) &&
            (identical(other.isOnObject, isOnObject) ||
                other.isOnObject == isOnObject));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      eventId,
      logicalPosition,
      screenPosition,
      transformSnapshot,
      const DeepCollectionEquality().hash(_hitList),
      timestamp,
      const DeepCollectionEquality().hash(_metadata),
      fingerCount,
      mouseButton,
      isOnObject);

  /// Create a copy of DiagramDragBegin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiagramDragBeginImplCopyWith<_$DiagramDragBeginImpl> get copyWith =>
      __$$DiagramDragBeginImplCopyWithImpl<_$DiagramDragBeginImpl>(
          this, _$identity);
}

abstract class _DiagramDragBegin implements DiagramDragBegin {
  const factory _DiagramDragBegin(
      {required final String eventId,
      required final Offset logicalPosition,
      required final Offset screenPosition,
      required final Transform2D transformSnapshot,
      required final List<DiagramObjectEntity> hitList,
      required final Duration timestamp,
      required final Map<String, dynamic> metadata,
      required final int fingerCount,
      required final MouseButton? mouseButton,
      required final bool isOnObject}) = _$DiagramDragBeginImpl;

  @override
  String get eventId;
  @override
  Offset get logicalPosition;
  @override
  Offset get screenPosition;
  @override
  Transform2D get transformSnapshot;
  @override
  List<DiagramObjectEntity> get hitList;
  @override
  Duration get timestamp;
  @override
  Map<String, dynamic> get metadata;
  @override
  int get fingerCount;
  @override
  MouseButton? get mouseButton;
  @override
  bool get isOnObject;

  /// Create a copy of DiagramDragBegin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiagramDragBeginImplCopyWith<_$DiagramDragBeginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DiagramDragContinue {
  String get eventId => throw _privateConstructorUsedError;
  Offset get logicalPosition => throw _privateConstructorUsedError;
  Offset get screenPosition => throw _privateConstructorUsedError;
  Transform2D get transformSnapshot => throw _privateConstructorUsedError;
  List<DiagramObjectEntity> get hitList => throw _privateConstructorUsedError;
  Duration get timestamp => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  Offset get delta => throw _privateConstructorUsedError;
  Offset get totalDelta => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;
  Offset get velocity => throw _privateConstructorUsedError;

  /// Create a copy of DiagramDragContinue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiagramDragContinueCopyWith<DiagramDragContinue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagramDragContinueCopyWith<$Res> {
  factory $DiagramDragContinueCopyWith(
          DiagramDragContinue value, $Res Function(DiagramDragContinue) then) =
      _$DiagramDragContinueCopyWithImpl<$Res, DiagramDragContinue>;
  @useResult
  $Res call(
      {String eventId,
      Offset logicalPosition,
      Offset screenPosition,
      Transform2D transformSnapshot,
      List<DiagramObjectEntity> hitList,
      Duration timestamp,
      Map<String, dynamic> metadata,
      Offset delta,
      Offset totalDelta,
      Duration duration,
      Offset velocity});

  $Transform2DCopyWith<$Res> get transformSnapshot;
}

/// @nodoc
class _$DiagramDragContinueCopyWithImpl<$Res, $Val extends DiagramDragContinue>
    implements $DiagramDragContinueCopyWith<$Res> {
  _$DiagramDragContinueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiagramDragContinue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? logicalPosition = null,
    Object? screenPosition = null,
    Object? transformSnapshot = null,
    Object? hitList = null,
    Object? timestamp = null,
    Object? metadata = null,
    Object? delta = null,
    Object? totalDelta = null,
    Object? duration = null,
    Object? velocity = null,
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
      screenPosition: null == screenPosition
          ? _value.screenPosition
          : screenPosition // ignore: cast_nullable_to_non_nullable
              as Offset,
      transformSnapshot: null == transformSnapshot
          ? _value.transformSnapshot
          : transformSnapshot // ignore: cast_nullable_to_non_nullable
              as Transform2D,
      hitList: null == hitList
          ? _value.hitList
          : hitList // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as Duration,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      delta: null == delta
          ? _value.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as Offset,
      totalDelta: null == totalDelta
          ? _value.totalDelta
          : totalDelta // ignore: cast_nullable_to_non_nullable
              as Offset,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      velocity: null == velocity
          ? _value.velocity
          : velocity // ignore: cast_nullable_to_non_nullable
              as Offset,
    ) as $Val);
  }

  /// Create a copy of DiagramDragContinue
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
abstract class _$$DiagramDragContinueImplCopyWith<$Res>
    implements $DiagramDragContinueCopyWith<$Res> {
  factory _$$DiagramDragContinueImplCopyWith(_$DiagramDragContinueImpl value,
          $Res Function(_$DiagramDragContinueImpl) then) =
      __$$DiagramDragContinueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String eventId,
      Offset logicalPosition,
      Offset screenPosition,
      Transform2D transformSnapshot,
      List<DiagramObjectEntity> hitList,
      Duration timestamp,
      Map<String, dynamic> metadata,
      Offset delta,
      Offset totalDelta,
      Duration duration,
      Offset velocity});

  @override
  $Transform2DCopyWith<$Res> get transformSnapshot;
}

/// @nodoc
class __$$DiagramDragContinueImplCopyWithImpl<$Res>
    extends _$DiagramDragContinueCopyWithImpl<$Res, _$DiagramDragContinueImpl>
    implements _$$DiagramDragContinueImplCopyWith<$Res> {
  __$$DiagramDragContinueImplCopyWithImpl(_$DiagramDragContinueImpl _value,
      $Res Function(_$DiagramDragContinueImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramDragContinue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? logicalPosition = null,
    Object? screenPosition = null,
    Object? transformSnapshot = null,
    Object? hitList = null,
    Object? timestamp = null,
    Object? metadata = null,
    Object? delta = null,
    Object? totalDelta = null,
    Object? duration = null,
    Object? velocity = null,
  }) {
    return _then(_$DiagramDragContinueImpl(
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
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as Duration,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      delta: null == delta
          ? _value.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as Offset,
      totalDelta: null == totalDelta
          ? _value.totalDelta
          : totalDelta // ignore: cast_nullable_to_non_nullable
              as Offset,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      velocity: null == velocity
          ? _value.velocity
          : velocity // ignore: cast_nullable_to_non_nullable
              as Offset,
    ));
  }
}

/// @nodoc

class _$DiagramDragContinueImpl implements _DiagramDragContinue {
  const _$DiagramDragContinueImpl(
      {required this.eventId,
      required this.logicalPosition,
      required this.screenPosition,
      required this.transformSnapshot,
      required final List<DiagramObjectEntity> hitList,
      required this.timestamp,
      required final Map<String, dynamic> metadata,
      required this.delta,
      required this.totalDelta,
      required this.duration,
      required this.velocity})
      : _hitList = hitList,
        _metadata = metadata;

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
  final Duration timestamp;
  final Map<String, dynamic> _metadata;
  @override
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  final Offset delta;
  @override
  final Offset totalDelta;
  @override
  final Duration duration;
  @override
  final Offset velocity;

  @override
  String toString() {
    return 'DiagramDragContinue(eventId: $eventId, logicalPosition: $logicalPosition, screenPosition: $screenPosition, transformSnapshot: $transformSnapshot, hitList: $hitList, timestamp: $timestamp, metadata: $metadata, delta: $delta, totalDelta: $totalDelta, duration: $duration, velocity: $velocity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiagramDragContinueImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.logicalPosition, logicalPosition) ||
                other.logicalPosition == logicalPosition) &&
            (identical(other.screenPosition, screenPosition) ||
                other.screenPosition == screenPosition) &&
            (identical(other.transformSnapshot, transformSnapshot) ||
                other.transformSnapshot == transformSnapshot) &&
            const DeepCollectionEquality().equals(other._hitList, _hitList) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.delta, delta) || other.delta == delta) &&
            (identical(other.totalDelta, totalDelta) ||
                other.totalDelta == totalDelta) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.velocity, velocity) ||
                other.velocity == velocity));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      eventId,
      logicalPosition,
      screenPosition,
      transformSnapshot,
      const DeepCollectionEquality().hash(_hitList),
      timestamp,
      const DeepCollectionEquality().hash(_metadata),
      delta,
      totalDelta,
      duration,
      velocity);

  /// Create a copy of DiagramDragContinue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiagramDragContinueImplCopyWith<_$DiagramDragContinueImpl> get copyWith =>
      __$$DiagramDragContinueImplCopyWithImpl<_$DiagramDragContinueImpl>(
          this, _$identity);
}

abstract class _DiagramDragContinue implements DiagramDragContinue {
  const factory _DiagramDragContinue(
      {required final String eventId,
      required final Offset logicalPosition,
      required final Offset screenPosition,
      required final Transform2D transformSnapshot,
      required final List<DiagramObjectEntity> hitList,
      required final Duration timestamp,
      required final Map<String, dynamic> metadata,
      required final Offset delta,
      required final Offset totalDelta,
      required final Duration duration,
      required final Offset velocity}) = _$DiagramDragContinueImpl;

  @override
  String get eventId;
  @override
  Offset get logicalPosition;
  @override
  Offset get screenPosition;
  @override
  Transform2D get transformSnapshot;
  @override
  List<DiagramObjectEntity> get hitList;
  @override
  Duration get timestamp;
  @override
  Map<String, dynamic> get metadata;
  @override
  Offset get delta;
  @override
  Offset get totalDelta;
  @override
  Duration get duration;
  @override
  Offset get velocity;

  /// Create a copy of DiagramDragContinue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiagramDragContinueImplCopyWith<_$DiagramDragContinueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DiagramDragEnd {
  String get eventId => throw _privateConstructorUsedError;
  Offset get logicalPosition => throw _privateConstructorUsedError;
  Offset get screenPosition => throw _privateConstructorUsedError;
  Transform2D get transformSnapshot => throw _privateConstructorUsedError;
  List<DiagramObjectEntity> get hitList => throw _privateConstructorUsedError;
  Duration get timestamp => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  Offset get totalDelta => throw _privateConstructorUsedError;
  Duration get totalDuration => throw _privateConstructorUsedError;
  Offset get finalVelocity => throw _privateConstructorUsedError;
  bool get wasCancelled => throw _privateConstructorUsedError;

  /// Create a copy of DiagramDragEnd
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiagramDragEndCopyWith<DiagramDragEnd> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagramDragEndCopyWith<$Res> {
  factory $DiagramDragEndCopyWith(
          DiagramDragEnd value, $Res Function(DiagramDragEnd) then) =
      _$DiagramDragEndCopyWithImpl<$Res, DiagramDragEnd>;
  @useResult
  $Res call(
      {String eventId,
      Offset logicalPosition,
      Offset screenPosition,
      Transform2D transformSnapshot,
      List<DiagramObjectEntity> hitList,
      Duration timestamp,
      Map<String, dynamic> metadata,
      Offset totalDelta,
      Duration totalDuration,
      Offset finalVelocity,
      bool wasCancelled});

  $Transform2DCopyWith<$Res> get transformSnapshot;
}

/// @nodoc
class _$DiagramDragEndCopyWithImpl<$Res, $Val extends DiagramDragEnd>
    implements $DiagramDragEndCopyWith<$Res> {
  _$DiagramDragEndCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiagramDragEnd
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? logicalPosition = null,
    Object? screenPosition = null,
    Object? transformSnapshot = null,
    Object? hitList = null,
    Object? timestamp = null,
    Object? metadata = null,
    Object? totalDelta = null,
    Object? totalDuration = null,
    Object? finalVelocity = null,
    Object? wasCancelled = null,
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
      screenPosition: null == screenPosition
          ? _value.screenPosition
          : screenPosition // ignore: cast_nullable_to_non_nullable
              as Offset,
      transformSnapshot: null == transformSnapshot
          ? _value.transformSnapshot
          : transformSnapshot // ignore: cast_nullable_to_non_nullable
              as Transform2D,
      hitList: null == hitList
          ? _value.hitList
          : hitList // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as Duration,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      totalDelta: null == totalDelta
          ? _value.totalDelta
          : totalDelta // ignore: cast_nullable_to_non_nullable
              as Offset,
      totalDuration: null == totalDuration
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      finalVelocity: null == finalVelocity
          ? _value.finalVelocity
          : finalVelocity // ignore: cast_nullable_to_non_nullable
              as Offset,
      wasCancelled: null == wasCancelled
          ? _value.wasCancelled
          : wasCancelled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of DiagramDragEnd
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
abstract class _$$DiagramDragEndImplCopyWith<$Res>
    implements $DiagramDragEndCopyWith<$Res> {
  factory _$$DiagramDragEndImplCopyWith(_$DiagramDragEndImpl value,
          $Res Function(_$DiagramDragEndImpl) then) =
      __$$DiagramDragEndImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String eventId,
      Offset logicalPosition,
      Offset screenPosition,
      Transform2D transformSnapshot,
      List<DiagramObjectEntity> hitList,
      Duration timestamp,
      Map<String, dynamic> metadata,
      Offset totalDelta,
      Duration totalDuration,
      Offset finalVelocity,
      bool wasCancelled});

  @override
  $Transform2DCopyWith<$Res> get transformSnapshot;
}

/// @nodoc
class __$$DiagramDragEndImplCopyWithImpl<$Res>
    extends _$DiagramDragEndCopyWithImpl<$Res, _$DiagramDragEndImpl>
    implements _$$DiagramDragEndImplCopyWith<$Res> {
  __$$DiagramDragEndImplCopyWithImpl(
      _$DiagramDragEndImpl _value, $Res Function(_$DiagramDragEndImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramDragEnd
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? logicalPosition = null,
    Object? screenPosition = null,
    Object? transformSnapshot = null,
    Object? hitList = null,
    Object? timestamp = null,
    Object? metadata = null,
    Object? totalDelta = null,
    Object? totalDuration = null,
    Object? finalVelocity = null,
    Object? wasCancelled = null,
  }) {
    return _then(_$DiagramDragEndImpl(
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
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as Duration,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      totalDelta: null == totalDelta
          ? _value.totalDelta
          : totalDelta // ignore: cast_nullable_to_non_nullable
              as Offset,
      totalDuration: null == totalDuration
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      finalVelocity: null == finalVelocity
          ? _value.finalVelocity
          : finalVelocity // ignore: cast_nullable_to_non_nullable
              as Offset,
      wasCancelled: null == wasCancelled
          ? _value.wasCancelled
          : wasCancelled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DiagramDragEndImpl implements _DiagramDragEnd {
  const _$DiagramDragEndImpl(
      {required this.eventId,
      required this.logicalPosition,
      required this.screenPosition,
      required this.transformSnapshot,
      required final List<DiagramObjectEntity> hitList,
      required this.timestamp,
      required final Map<String, dynamic> metadata,
      required this.totalDelta,
      required this.totalDuration,
      required this.finalVelocity,
      required this.wasCancelled})
      : _hitList = hitList,
        _metadata = metadata;

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
  final Duration timestamp;
  final Map<String, dynamic> _metadata;
  @override
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  final Offset totalDelta;
  @override
  final Duration totalDuration;
  @override
  final Offset finalVelocity;
  @override
  final bool wasCancelled;

  @override
  String toString() {
    return 'DiagramDragEnd(eventId: $eventId, logicalPosition: $logicalPosition, screenPosition: $screenPosition, transformSnapshot: $transformSnapshot, hitList: $hitList, timestamp: $timestamp, metadata: $metadata, totalDelta: $totalDelta, totalDuration: $totalDuration, finalVelocity: $finalVelocity, wasCancelled: $wasCancelled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiagramDragEndImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.logicalPosition, logicalPosition) ||
                other.logicalPosition == logicalPosition) &&
            (identical(other.screenPosition, screenPosition) ||
                other.screenPosition == screenPosition) &&
            (identical(other.transformSnapshot, transformSnapshot) ||
                other.transformSnapshot == transformSnapshot) &&
            const DeepCollectionEquality().equals(other._hitList, _hitList) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.totalDelta, totalDelta) ||
                other.totalDelta == totalDelta) &&
            (identical(other.totalDuration, totalDuration) ||
                other.totalDuration == totalDuration) &&
            (identical(other.finalVelocity, finalVelocity) ||
                other.finalVelocity == finalVelocity) &&
            (identical(other.wasCancelled, wasCancelled) ||
                other.wasCancelled == wasCancelled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      eventId,
      logicalPosition,
      screenPosition,
      transformSnapshot,
      const DeepCollectionEquality().hash(_hitList),
      timestamp,
      const DeepCollectionEquality().hash(_metadata),
      totalDelta,
      totalDuration,
      finalVelocity,
      wasCancelled);

  /// Create a copy of DiagramDragEnd
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiagramDragEndImplCopyWith<_$DiagramDragEndImpl> get copyWith =>
      __$$DiagramDragEndImplCopyWithImpl<_$DiagramDragEndImpl>(
          this, _$identity);
}

abstract class _DiagramDragEnd implements DiagramDragEnd {
  const factory _DiagramDragEnd(
      {required final String eventId,
      required final Offset logicalPosition,
      required final Offset screenPosition,
      required final Transform2D transformSnapshot,
      required final List<DiagramObjectEntity> hitList,
      required final Duration timestamp,
      required final Map<String, dynamic> metadata,
      required final Offset totalDelta,
      required final Duration totalDuration,
      required final Offset finalVelocity,
      required final bool wasCancelled}) = _$DiagramDragEndImpl;

  @override
  String get eventId;
  @override
  Offset get logicalPosition;
  @override
  Offset get screenPosition;
  @override
  Transform2D get transformSnapshot;
  @override
  List<DiagramObjectEntity> get hitList;
  @override
  Duration get timestamp;
  @override
  Map<String, dynamic> get metadata;
  @override
  Offset get totalDelta;
  @override
  Duration get totalDuration;
  @override
  Offset get finalVelocity;
  @override
  bool get wasCancelled;

  /// Create a copy of DiagramDragEnd
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiagramDragEndImplCopyWith<_$DiagramDragEndImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DiagramPinchBegin {
  String get eventId => throw _privateConstructorUsedError;
  Offset get logicalPosition => throw _privateConstructorUsedError;
  Offset get screenPosition => throw _privateConstructorUsedError;
  Transform2D get transformSnapshot => throw _privateConstructorUsedError;
  List<DiagramObjectEntity> get hitList => throw _privateConstructorUsedError;
  Duration get timestamp => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  int get fingerCount => throw _privateConstructorUsedError;
  Offset get focalPoint => throw _privateConstructorUsedError;

  /// Create a copy of DiagramPinchBegin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiagramPinchBeginCopyWith<DiagramPinchBegin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagramPinchBeginCopyWith<$Res> {
  factory $DiagramPinchBeginCopyWith(
          DiagramPinchBegin value, $Res Function(DiagramPinchBegin) then) =
      _$DiagramPinchBeginCopyWithImpl<$Res, DiagramPinchBegin>;
  @useResult
  $Res call(
      {String eventId,
      Offset logicalPosition,
      Offset screenPosition,
      Transform2D transformSnapshot,
      List<DiagramObjectEntity> hitList,
      Duration timestamp,
      Map<String, dynamic> metadata,
      int fingerCount,
      Offset focalPoint});

  $Transform2DCopyWith<$Res> get transformSnapshot;
}

/// @nodoc
class _$DiagramPinchBeginCopyWithImpl<$Res, $Val extends DiagramPinchBegin>
    implements $DiagramPinchBeginCopyWith<$Res> {
  _$DiagramPinchBeginCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiagramPinchBegin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? logicalPosition = null,
    Object? screenPosition = null,
    Object? transformSnapshot = null,
    Object? hitList = null,
    Object? timestamp = null,
    Object? metadata = null,
    Object? fingerCount = null,
    Object? focalPoint = null,
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
      screenPosition: null == screenPosition
          ? _value.screenPosition
          : screenPosition // ignore: cast_nullable_to_non_nullable
              as Offset,
      transformSnapshot: null == transformSnapshot
          ? _value.transformSnapshot
          : transformSnapshot // ignore: cast_nullable_to_non_nullable
              as Transform2D,
      hitList: null == hitList
          ? _value.hitList
          : hitList // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as Duration,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      fingerCount: null == fingerCount
          ? _value.fingerCount
          : fingerCount // ignore: cast_nullable_to_non_nullable
              as int,
      focalPoint: null == focalPoint
          ? _value.focalPoint
          : focalPoint // ignore: cast_nullable_to_non_nullable
              as Offset,
    ) as $Val);
  }

  /// Create a copy of DiagramPinchBegin
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
abstract class _$$DiagramPinchBeginImplCopyWith<$Res>
    implements $DiagramPinchBeginCopyWith<$Res> {
  factory _$$DiagramPinchBeginImplCopyWith(_$DiagramPinchBeginImpl value,
          $Res Function(_$DiagramPinchBeginImpl) then) =
      __$$DiagramPinchBeginImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String eventId,
      Offset logicalPosition,
      Offset screenPosition,
      Transform2D transformSnapshot,
      List<DiagramObjectEntity> hitList,
      Duration timestamp,
      Map<String, dynamic> metadata,
      int fingerCount,
      Offset focalPoint});

  @override
  $Transform2DCopyWith<$Res> get transformSnapshot;
}

/// @nodoc
class __$$DiagramPinchBeginImplCopyWithImpl<$Res>
    extends _$DiagramPinchBeginCopyWithImpl<$Res, _$DiagramPinchBeginImpl>
    implements _$$DiagramPinchBeginImplCopyWith<$Res> {
  __$$DiagramPinchBeginImplCopyWithImpl(_$DiagramPinchBeginImpl _value,
      $Res Function(_$DiagramPinchBeginImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramPinchBegin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? logicalPosition = null,
    Object? screenPosition = null,
    Object? transformSnapshot = null,
    Object? hitList = null,
    Object? timestamp = null,
    Object? metadata = null,
    Object? fingerCount = null,
    Object? focalPoint = null,
  }) {
    return _then(_$DiagramPinchBeginImpl(
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
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as Duration,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      fingerCount: null == fingerCount
          ? _value.fingerCount
          : fingerCount // ignore: cast_nullable_to_non_nullable
              as int,
      focalPoint: null == focalPoint
          ? _value.focalPoint
          : focalPoint // ignore: cast_nullable_to_non_nullable
              as Offset,
    ));
  }
}

/// @nodoc

class _$DiagramPinchBeginImpl implements _DiagramPinchBegin {
  const _$DiagramPinchBeginImpl(
      {required this.eventId,
      required this.logicalPosition,
      required this.screenPosition,
      required this.transformSnapshot,
      required final List<DiagramObjectEntity> hitList,
      required this.timestamp,
      required final Map<String, dynamic> metadata,
      required this.fingerCount,
      required this.focalPoint})
      : _hitList = hitList,
        _metadata = metadata;

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
  final Duration timestamp;
  final Map<String, dynamic> _metadata;
  @override
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  final int fingerCount;
  @override
  final Offset focalPoint;

  @override
  String toString() {
    return 'DiagramPinchBegin(eventId: $eventId, logicalPosition: $logicalPosition, screenPosition: $screenPosition, transformSnapshot: $transformSnapshot, hitList: $hitList, timestamp: $timestamp, metadata: $metadata, fingerCount: $fingerCount, focalPoint: $focalPoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiagramPinchBeginImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.logicalPosition, logicalPosition) ||
                other.logicalPosition == logicalPosition) &&
            (identical(other.screenPosition, screenPosition) ||
                other.screenPosition == screenPosition) &&
            (identical(other.transformSnapshot, transformSnapshot) ||
                other.transformSnapshot == transformSnapshot) &&
            const DeepCollectionEquality().equals(other._hitList, _hitList) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.fingerCount, fingerCount) ||
                other.fingerCount == fingerCount) &&
            (identical(other.focalPoint, focalPoint) ||
                other.focalPoint == focalPoint));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      eventId,
      logicalPosition,
      screenPosition,
      transformSnapshot,
      const DeepCollectionEquality().hash(_hitList),
      timestamp,
      const DeepCollectionEquality().hash(_metadata),
      fingerCount,
      focalPoint);

  /// Create a copy of DiagramPinchBegin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiagramPinchBeginImplCopyWith<_$DiagramPinchBeginImpl> get copyWith =>
      __$$DiagramPinchBeginImplCopyWithImpl<_$DiagramPinchBeginImpl>(
          this, _$identity);
}

abstract class _DiagramPinchBegin implements DiagramPinchBegin {
  const factory _DiagramPinchBegin(
      {required final String eventId,
      required final Offset logicalPosition,
      required final Offset screenPosition,
      required final Transform2D transformSnapshot,
      required final List<DiagramObjectEntity> hitList,
      required final Duration timestamp,
      required final Map<String, dynamic> metadata,
      required final int fingerCount,
      required final Offset focalPoint}) = _$DiagramPinchBeginImpl;

  @override
  String get eventId;
  @override
  Offset get logicalPosition;
  @override
  Offset get screenPosition;
  @override
  Transform2D get transformSnapshot;
  @override
  List<DiagramObjectEntity> get hitList;
  @override
  Duration get timestamp;
  @override
  Map<String, dynamic> get metadata;
  @override
  int get fingerCount;
  @override
  Offset get focalPoint;

  /// Create a copy of DiagramPinchBegin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiagramPinchBeginImplCopyWith<_$DiagramPinchBeginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DiagramPinchContinue {
  String get eventId => throw _privateConstructorUsedError;
  Offset get logicalPosition => throw _privateConstructorUsedError;
  Offset get screenPosition => throw _privateConstructorUsedError;
  Transform2D get transformSnapshot => throw _privateConstructorUsedError;
  List<DiagramObjectEntity> get hitList => throw _privateConstructorUsedError;
  Duration get timestamp => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  double get scale => throw _privateConstructorUsedError;
  double get rotation => throw _privateConstructorUsedError;
  Offset get focalPoint => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;

  /// Create a copy of DiagramPinchContinue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiagramPinchContinueCopyWith<DiagramPinchContinue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagramPinchContinueCopyWith<$Res> {
  factory $DiagramPinchContinueCopyWith(DiagramPinchContinue value,
          $Res Function(DiagramPinchContinue) then) =
      _$DiagramPinchContinueCopyWithImpl<$Res, DiagramPinchContinue>;
  @useResult
  $Res call(
      {String eventId,
      Offset logicalPosition,
      Offset screenPosition,
      Transform2D transformSnapshot,
      List<DiagramObjectEntity> hitList,
      Duration timestamp,
      Map<String, dynamic> metadata,
      double scale,
      double rotation,
      Offset focalPoint,
      Duration duration});

  $Transform2DCopyWith<$Res> get transformSnapshot;
}

/// @nodoc
class _$DiagramPinchContinueCopyWithImpl<$Res,
        $Val extends DiagramPinchContinue>
    implements $DiagramPinchContinueCopyWith<$Res> {
  _$DiagramPinchContinueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiagramPinchContinue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? logicalPosition = null,
    Object? screenPosition = null,
    Object? transformSnapshot = null,
    Object? hitList = null,
    Object? timestamp = null,
    Object? metadata = null,
    Object? scale = null,
    Object? rotation = null,
    Object? focalPoint = null,
    Object? duration = null,
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
      screenPosition: null == screenPosition
          ? _value.screenPosition
          : screenPosition // ignore: cast_nullable_to_non_nullable
              as Offset,
      transformSnapshot: null == transformSnapshot
          ? _value.transformSnapshot
          : transformSnapshot // ignore: cast_nullable_to_non_nullable
              as Transform2D,
      hitList: null == hitList
          ? _value.hitList
          : hitList // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as Duration,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double,
      rotation: null == rotation
          ? _value.rotation
          : rotation // ignore: cast_nullable_to_non_nullable
              as double,
      focalPoint: null == focalPoint
          ? _value.focalPoint
          : focalPoint // ignore: cast_nullable_to_non_nullable
              as Offset,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }

  /// Create a copy of DiagramPinchContinue
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
abstract class _$$DiagramPinchContinueImplCopyWith<$Res>
    implements $DiagramPinchContinueCopyWith<$Res> {
  factory _$$DiagramPinchContinueImplCopyWith(_$DiagramPinchContinueImpl value,
          $Res Function(_$DiagramPinchContinueImpl) then) =
      __$$DiagramPinchContinueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String eventId,
      Offset logicalPosition,
      Offset screenPosition,
      Transform2D transformSnapshot,
      List<DiagramObjectEntity> hitList,
      Duration timestamp,
      Map<String, dynamic> metadata,
      double scale,
      double rotation,
      Offset focalPoint,
      Duration duration});

  @override
  $Transform2DCopyWith<$Res> get transformSnapshot;
}

/// @nodoc
class __$$DiagramPinchContinueImplCopyWithImpl<$Res>
    extends _$DiagramPinchContinueCopyWithImpl<$Res, _$DiagramPinchContinueImpl>
    implements _$$DiagramPinchContinueImplCopyWith<$Res> {
  __$$DiagramPinchContinueImplCopyWithImpl(_$DiagramPinchContinueImpl _value,
      $Res Function(_$DiagramPinchContinueImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramPinchContinue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? logicalPosition = null,
    Object? screenPosition = null,
    Object? transformSnapshot = null,
    Object? hitList = null,
    Object? timestamp = null,
    Object? metadata = null,
    Object? scale = null,
    Object? rotation = null,
    Object? focalPoint = null,
    Object? duration = null,
  }) {
    return _then(_$DiagramPinchContinueImpl(
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
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as Duration,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double,
      rotation: null == rotation
          ? _value.rotation
          : rotation // ignore: cast_nullable_to_non_nullable
              as double,
      focalPoint: null == focalPoint
          ? _value.focalPoint
          : focalPoint // ignore: cast_nullable_to_non_nullable
              as Offset,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$DiagramPinchContinueImpl implements _DiagramPinchContinue {
  const _$DiagramPinchContinueImpl(
      {required this.eventId,
      required this.logicalPosition,
      required this.screenPosition,
      required this.transformSnapshot,
      required final List<DiagramObjectEntity> hitList,
      required this.timestamp,
      required final Map<String, dynamic> metadata,
      required this.scale,
      required this.rotation,
      required this.focalPoint,
      required this.duration})
      : _hitList = hitList,
        _metadata = metadata;

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
  final Duration timestamp;
  final Map<String, dynamic> _metadata;
  @override
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  final double scale;
  @override
  final double rotation;
  @override
  final Offset focalPoint;
  @override
  final Duration duration;

  @override
  String toString() {
    return 'DiagramPinchContinue(eventId: $eventId, logicalPosition: $logicalPosition, screenPosition: $screenPosition, transformSnapshot: $transformSnapshot, hitList: $hitList, timestamp: $timestamp, metadata: $metadata, scale: $scale, rotation: $rotation, focalPoint: $focalPoint, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiagramPinchContinueImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.logicalPosition, logicalPosition) ||
                other.logicalPosition == logicalPosition) &&
            (identical(other.screenPosition, screenPosition) ||
                other.screenPosition == screenPosition) &&
            (identical(other.transformSnapshot, transformSnapshot) ||
                other.transformSnapshot == transformSnapshot) &&
            const DeepCollectionEquality().equals(other._hitList, _hitList) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.scale, scale) || other.scale == scale) &&
            (identical(other.rotation, rotation) ||
                other.rotation == rotation) &&
            (identical(other.focalPoint, focalPoint) ||
                other.focalPoint == focalPoint) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      eventId,
      logicalPosition,
      screenPosition,
      transformSnapshot,
      const DeepCollectionEquality().hash(_hitList),
      timestamp,
      const DeepCollectionEquality().hash(_metadata),
      scale,
      rotation,
      focalPoint,
      duration);

  /// Create a copy of DiagramPinchContinue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiagramPinchContinueImplCopyWith<_$DiagramPinchContinueImpl>
      get copyWith =>
          __$$DiagramPinchContinueImplCopyWithImpl<_$DiagramPinchContinueImpl>(
              this, _$identity);
}

abstract class _DiagramPinchContinue implements DiagramPinchContinue {
  const factory _DiagramPinchContinue(
      {required final String eventId,
      required final Offset logicalPosition,
      required final Offset screenPosition,
      required final Transform2D transformSnapshot,
      required final List<DiagramObjectEntity> hitList,
      required final Duration timestamp,
      required final Map<String, dynamic> metadata,
      required final double scale,
      required final double rotation,
      required final Offset focalPoint,
      required final Duration duration}) = _$DiagramPinchContinueImpl;

  @override
  String get eventId;
  @override
  Offset get logicalPosition;
  @override
  Offset get screenPosition;
  @override
  Transform2D get transformSnapshot;
  @override
  List<DiagramObjectEntity> get hitList;
  @override
  Duration get timestamp;
  @override
  Map<String, dynamic> get metadata;
  @override
  double get scale;
  @override
  double get rotation;
  @override
  Offset get focalPoint;
  @override
  Duration get duration;

  /// Create a copy of DiagramPinchContinue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiagramPinchContinueImplCopyWith<_$DiagramPinchContinueImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DiagramPinchEnd {
  String get eventId => throw _privateConstructorUsedError;
  Offset get logicalPosition => throw _privateConstructorUsedError;
  Offset get screenPosition => throw _privateConstructorUsedError;
  Transform2D get transformSnapshot => throw _privateConstructorUsedError;
  List<DiagramObjectEntity> get hitList => throw _privateConstructorUsedError;
  Duration get timestamp => throw _privateConstructorUsedError;
  Map<String, dynamic> get metadata => throw _privateConstructorUsedError;
  double get finalScale => throw _privateConstructorUsedError;
  double get finalRotation => throw _privateConstructorUsedError;
  Duration get totalDuration => throw _privateConstructorUsedError;
  bool get wasCancelled => throw _privateConstructorUsedError;

  /// Create a copy of DiagramPinchEnd
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiagramPinchEndCopyWith<DiagramPinchEnd> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagramPinchEndCopyWith<$Res> {
  factory $DiagramPinchEndCopyWith(
          DiagramPinchEnd value, $Res Function(DiagramPinchEnd) then) =
      _$DiagramPinchEndCopyWithImpl<$Res, DiagramPinchEnd>;
  @useResult
  $Res call(
      {String eventId,
      Offset logicalPosition,
      Offset screenPosition,
      Transform2D transformSnapshot,
      List<DiagramObjectEntity> hitList,
      Duration timestamp,
      Map<String, dynamic> metadata,
      double finalScale,
      double finalRotation,
      Duration totalDuration,
      bool wasCancelled});

  $Transform2DCopyWith<$Res> get transformSnapshot;
}

/// @nodoc
class _$DiagramPinchEndCopyWithImpl<$Res, $Val extends DiagramPinchEnd>
    implements $DiagramPinchEndCopyWith<$Res> {
  _$DiagramPinchEndCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiagramPinchEnd
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? logicalPosition = null,
    Object? screenPosition = null,
    Object? transformSnapshot = null,
    Object? hitList = null,
    Object? timestamp = null,
    Object? metadata = null,
    Object? finalScale = null,
    Object? finalRotation = null,
    Object? totalDuration = null,
    Object? wasCancelled = null,
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
      screenPosition: null == screenPosition
          ? _value.screenPosition
          : screenPosition // ignore: cast_nullable_to_non_nullable
              as Offset,
      transformSnapshot: null == transformSnapshot
          ? _value.transformSnapshot
          : transformSnapshot // ignore: cast_nullable_to_non_nullable
              as Transform2D,
      hitList: null == hitList
          ? _value.hitList
          : hitList // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as Duration,
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      finalScale: null == finalScale
          ? _value.finalScale
          : finalScale // ignore: cast_nullable_to_non_nullable
              as double,
      finalRotation: null == finalRotation
          ? _value.finalRotation
          : finalRotation // ignore: cast_nullable_to_non_nullable
              as double,
      totalDuration: null == totalDuration
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      wasCancelled: null == wasCancelled
          ? _value.wasCancelled
          : wasCancelled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of DiagramPinchEnd
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
abstract class _$$DiagramPinchEndImplCopyWith<$Res>
    implements $DiagramPinchEndCopyWith<$Res> {
  factory _$$DiagramPinchEndImplCopyWith(_$DiagramPinchEndImpl value,
          $Res Function(_$DiagramPinchEndImpl) then) =
      __$$DiagramPinchEndImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String eventId,
      Offset logicalPosition,
      Offset screenPosition,
      Transform2D transformSnapshot,
      List<DiagramObjectEntity> hitList,
      Duration timestamp,
      Map<String, dynamic> metadata,
      double finalScale,
      double finalRotation,
      Duration totalDuration,
      bool wasCancelled});

  @override
  $Transform2DCopyWith<$Res> get transformSnapshot;
}

/// @nodoc
class __$$DiagramPinchEndImplCopyWithImpl<$Res>
    extends _$DiagramPinchEndCopyWithImpl<$Res, _$DiagramPinchEndImpl>
    implements _$$DiagramPinchEndImplCopyWith<$Res> {
  __$$DiagramPinchEndImplCopyWithImpl(
      _$DiagramPinchEndImpl _value, $Res Function(_$DiagramPinchEndImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramPinchEnd
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? logicalPosition = null,
    Object? screenPosition = null,
    Object? transformSnapshot = null,
    Object? hitList = null,
    Object? timestamp = null,
    Object? metadata = null,
    Object? finalScale = null,
    Object? finalRotation = null,
    Object? totalDuration = null,
    Object? wasCancelled = null,
  }) {
    return _then(_$DiagramPinchEndImpl(
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
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as Duration,
      metadata: null == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      finalScale: null == finalScale
          ? _value.finalScale
          : finalScale // ignore: cast_nullable_to_non_nullable
              as double,
      finalRotation: null == finalRotation
          ? _value.finalRotation
          : finalRotation // ignore: cast_nullable_to_non_nullable
              as double,
      totalDuration: null == totalDuration
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      wasCancelled: null == wasCancelled
          ? _value.wasCancelled
          : wasCancelled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DiagramPinchEndImpl implements _DiagramPinchEnd {
  const _$DiagramPinchEndImpl(
      {required this.eventId,
      required this.logicalPosition,
      required this.screenPosition,
      required this.transformSnapshot,
      required final List<DiagramObjectEntity> hitList,
      required this.timestamp,
      required final Map<String, dynamic> metadata,
      required this.finalScale,
      required this.finalRotation,
      required this.totalDuration,
      required this.wasCancelled})
      : _hitList = hitList,
        _metadata = metadata;

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
  final Duration timestamp;
  final Map<String, dynamic> _metadata;
  @override
  Map<String, dynamic> get metadata {
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metadata);
  }

  @override
  final double finalScale;
  @override
  final double finalRotation;
  @override
  final Duration totalDuration;
  @override
  final bool wasCancelled;

  @override
  String toString() {
    return 'DiagramPinchEnd(eventId: $eventId, logicalPosition: $logicalPosition, screenPosition: $screenPosition, transformSnapshot: $transformSnapshot, hitList: $hitList, timestamp: $timestamp, metadata: $metadata, finalScale: $finalScale, finalRotation: $finalRotation, totalDuration: $totalDuration, wasCancelled: $wasCancelled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiagramPinchEndImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.logicalPosition, logicalPosition) ||
                other.logicalPosition == logicalPosition) &&
            (identical(other.screenPosition, screenPosition) ||
                other.screenPosition == screenPosition) &&
            (identical(other.transformSnapshot, transformSnapshot) ||
                other.transformSnapshot == transformSnapshot) &&
            const DeepCollectionEquality().equals(other._hitList, _hitList) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.finalScale, finalScale) ||
                other.finalScale == finalScale) &&
            (identical(other.finalRotation, finalRotation) ||
                other.finalRotation == finalRotation) &&
            (identical(other.totalDuration, totalDuration) ||
                other.totalDuration == totalDuration) &&
            (identical(other.wasCancelled, wasCancelled) ||
                other.wasCancelled == wasCancelled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      eventId,
      logicalPosition,
      screenPosition,
      transformSnapshot,
      const DeepCollectionEquality().hash(_hitList),
      timestamp,
      const DeepCollectionEquality().hash(_metadata),
      finalScale,
      finalRotation,
      totalDuration,
      wasCancelled);

  /// Create a copy of DiagramPinchEnd
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiagramPinchEndImplCopyWith<_$DiagramPinchEndImpl> get copyWith =>
      __$$DiagramPinchEndImplCopyWithImpl<_$DiagramPinchEndImpl>(
          this, _$identity);
}

abstract class _DiagramPinchEnd implements DiagramPinchEnd {
  const factory _DiagramPinchEnd(
      {required final String eventId,
      required final Offset logicalPosition,
      required final Offset screenPosition,
      required final Transform2D transformSnapshot,
      required final List<DiagramObjectEntity> hitList,
      required final Duration timestamp,
      required final Map<String, dynamic> metadata,
      required final double finalScale,
      required final double finalRotation,
      required final Duration totalDuration,
      required final bool wasCancelled}) = _$DiagramPinchEndImpl;

  @override
  String get eventId;
  @override
  Offset get logicalPosition;
  @override
  Offset get screenPosition;
  @override
  Transform2D get transformSnapshot;
  @override
  List<DiagramObjectEntity> get hitList;
  @override
  Duration get timestamp;
  @override
  Map<String, dynamic> get metadata;
  @override
  double get finalScale;
  @override
  double get finalRotation;
  @override
  Duration get totalDuration;
  @override
  bool get wasCancelled;

  /// Create a copy of DiagramPinchEnd
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiagramPinchEndImplCopyWith<_$DiagramPinchEndImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DiagramEventUnion {
  Object get event => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DiagramTap event) tap,
    required TResult Function(DiagramDoubleTap event) doubleTap,
    required TResult Function(DiagramLongPress event) longPress,
    required TResult Function(DiagramScroll event) scroll,
    required TResult Function(DiagramDragBegin event) dragBegin,
    required TResult Function(DiagramDragContinue event) dragContinue,
    required TResult Function(DiagramDragEnd event) dragEnd,
    required TResult Function(DiagramPinchBegin event) pinchBegin,
    required TResult Function(DiagramPinchContinue event) pinchContinue,
    required TResult Function(DiagramPinchEnd event) pinchEnd,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DiagramTap event)? tap,
    TResult? Function(DiagramDoubleTap event)? doubleTap,
    TResult? Function(DiagramLongPress event)? longPress,
    TResult? Function(DiagramScroll event)? scroll,
    TResult? Function(DiagramDragBegin event)? dragBegin,
    TResult? Function(DiagramDragContinue event)? dragContinue,
    TResult? Function(DiagramDragEnd event)? dragEnd,
    TResult? Function(DiagramPinchBegin event)? pinchBegin,
    TResult? Function(DiagramPinchContinue event)? pinchContinue,
    TResult? Function(DiagramPinchEnd event)? pinchEnd,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DiagramTap event)? tap,
    TResult Function(DiagramDoubleTap event)? doubleTap,
    TResult Function(DiagramLongPress event)? longPress,
    TResult Function(DiagramScroll event)? scroll,
    TResult Function(DiagramDragBegin event)? dragBegin,
    TResult Function(DiagramDragContinue event)? dragContinue,
    TResult Function(DiagramDragEnd event)? dragEnd,
    TResult Function(DiagramPinchBegin event)? pinchBegin,
    TResult Function(DiagramPinchContinue event)? pinchContinue,
    TResult Function(DiagramPinchEnd event)? pinchEnd,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Tap value) tap,
    required TResult Function(_DoubleTap value) doubleTap,
    required TResult Function(_LongPress value) longPress,
    required TResult Function(_Scroll value) scroll,
    required TResult Function(_DragBegin value) dragBegin,
    required TResult Function(_DragContinue value) dragContinue,
    required TResult Function(_DragEnd value) dragEnd,
    required TResult Function(_PinchBegin value) pinchBegin,
    required TResult Function(_PinchContinue value) pinchContinue,
    required TResult Function(_PinchEnd value) pinchEnd,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Tap value)? tap,
    TResult? Function(_DoubleTap value)? doubleTap,
    TResult? Function(_LongPress value)? longPress,
    TResult? Function(_Scroll value)? scroll,
    TResult? Function(_DragBegin value)? dragBegin,
    TResult? Function(_DragContinue value)? dragContinue,
    TResult? Function(_DragEnd value)? dragEnd,
    TResult? Function(_PinchBegin value)? pinchBegin,
    TResult? Function(_PinchContinue value)? pinchContinue,
    TResult? Function(_PinchEnd value)? pinchEnd,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Tap value)? tap,
    TResult Function(_DoubleTap value)? doubleTap,
    TResult Function(_LongPress value)? longPress,
    TResult Function(_Scroll value)? scroll,
    TResult Function(_DragBegin value)? dragBegin,
    TResult Function(_DragContinue value)? dragContinue,
    TResult Function(_DragEnd value)? dragEnd,
    TResult Function(_PinchBegin value)? pinchBegin,
    TResult Function(_PinchContinue value)? pinchContinue,
    TResult Function(_PinchEnd value)? pinchEnd,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagramEventUnionCopyWith<$Res> {
  factory $DiagramEventUnionCopyWith(
          DiagramEventUnion value, $Res Function(DiagramEventUnion) then) =
      _$DiagramEventUnionCopyWithImpl<$Res, DiagramEventUnion>;
}

/// @nodoc
class _$DiagramEventUnionCopyWithImpl<$Res, $Val extends DiagramEventUnion>
    implements $DiagramEventUnionCopyWith<$Res> {
  _$DiagramEventUnionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TapImplCopyWith<$Res> {
  factory _$$TapImplCopyWith(_$TapImpl value, $Res Function(_$TapImpl) then) =
      __$$TapImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DiagramTap event});

  $DiagramTapCopyWith<$Res> get event;
}

/// @nodoc
class __$$TapImplCopyWithImpl<$Res>
    extends _$DiagramEventUnionCopyWithImpl<$Res, _$TapImpl>
    implements _$$TapImplCopyWith<$Res> {
  __$$TapImplCopyWithImpl(_$TapImpl _value, $Res Function(_$TapImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
  }) {
    return _then(_$TapImpl(
      null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as DiagramTap,
    ));
  }

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DiagramTapCopyWith<$Res> get event {
    return $DiagramTapCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value));
    });
  }
}

/// @nodoc

class _$TapImpl implements _Tap {
  const _$TapImpl(this.event);

  @override
  final DiagramTap event;

  @override
  String toString() {
    return 'DiagramEventUnion.tap(event: $event)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TapImpl &&
            (identical(other.event, event) || other.event == event));
  }

  @override
  int get hashCode => Object.hash(runtimeType, event);

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TapImplCopyWith<_$TapImpl> get copyWith =>
      __$$TapImplCopyWithImpl<_$TapImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DiagramTap event) tap,
    required TResult Function(DiagramDoubleTap event) doubleTap,
    required TResult Function(DiagramLongPress event) longPress,
    required TResult Function(DiagramScroll event) scroll,
    required TResult Function(DiagramDragBegin event) dragBegin,
    required TResult Function(DiagramDragContinue event) dragContinue,
    required TResult Function(DiagramDragEnd event) dragEnd,
    required TResult Function(DiagramPinchBegin event) pinchBegin,
    required TResult Function(DiagramPinchContinue event) pinchContinue,
    required TResult Function(DiagramPinchEnd event) pinchEnd,
  }) {
    return tap(event);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DiagramTap event)? tap,
    TResult? Function(DiagramDoubleTap event)? doubleTap,
    TResult? Function(DiagramLongPress event)? longPress,
    TResult? Function(DiagramScroll event)? scroll,
    TResult? Function(DiagramDragBegin event)? dragBegin,
    TResult? Function(DiagramDragContinue event)? dragContinue,
    TResult? Function(DiagramDragEnd event)? dragEnd,
    TResult? Function(DiagramPinchBegin event)? pinchBegin,
    TResult? Function(DiagramPinchContinue event)? pinchContinue,
    TResult? Function(DiagramPinchEnd event)? pinchEnd,
  }) {
    return tap?.call(event);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DiagramTap event)? tap,
    TResult Function(DiagramDoubleTap event)? doubleTap,
    TResult Function(DiagramLongPress event)? longPress,
    TResult Function(DiagramScroll event)? scroll,
    TResult Function(DiagramDragBegin event)? dragBegin,
    TResult Function(DiagramDragContinue event)? dragContinue,
    TResult Function(DiagramDragEnd event)? dragEnd,
    TResult Function(DiagramPinchBegin event)? pinchBegin,
    TResult Function(DiagramPinchContinue event)? pinchContinue,
    TResult Function(DiagramPinchEnd event)? pinchEnd,
    required TResult orElse(),
  }) {
    if (tap != null) {
      return tap(event);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Tap value) tap,
    required TResult Function(_DoubleTap value) doubleTap,
    required TResult Function(_LongPress value) longPress,
    required TResult Function(_Scroll value) scroll,
    required TResult Function(_DragBegin value) dragBegin,
    required TResult Function(_DragContinue value) dragContinue,
    required TResult Function(_DragEnd value) dragEnd,
    required TResult Function(_PinchBegin value) pinchBegin,
    required TResult Function(_PinchContinue value) pinchContinue,
    required TResult Function(_PinchEnd value) pinchEnd,
  }) {
    return tap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Tap value)? tap,
    TResult? Function(_DoubleTap value)? doubleTap,
    TResult? Function(_LongPress value)? longPress,
    TResult? Function(_Scroll value)? scroll,
    TResult? Function(_DragBegin value)? dragBegin,
    TResult? Function(_DragContinue value)? dragContinue,
    TResult? Function(_DragEnd value)? dragEnd,
    TResult? Function(_PinchBegin value)? pinchBegin,
    TResult? Function(_PinchContinue value)? pinchContinue,
    TResult? Function(_PinchEnd value)? pinchEnd,
  }) {
    return tap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Tap value)? tap,
    TResult Function(_DoubleTap value)? doubleTap,
    TResult Function(_LongPress value)? longPress,
    TResult Function(_Scroll value)? scroll,
    TResult Function(_DragBegin value)? dragBegin,
    TResult Function(_DragContinue value)? dragContinue,
    TResult Function(_DragEnd value)? dragEnd,
    TResult Function(_PinchBegin value)? pinchBegin,
    TResult Function(_PinchContinue value)? pinchContinue,
    TResult Function(_PinchEnd value)? pinchEnd,
    required TResult orElse(),
  }) {
    if (tap != null) {
      return tap(this);
    }
    return orElse();
  }
}

abstract class _Tap implements DiagramEventUnion {
  const factory _Tap(final DiagramTap event) = _$TapImpl;

  @override
  DiagramTap get event;

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TapImplCopyWith<_$TapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DoubleTapImplCopyWith<$Res> {
  factory _$$DoubleTapImplCopyWith(
          _$DoubleTapImpl value, $Res Function(_$DoubleTapImpl) then) =
      __$$DoubleTapImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DiagramDoubleTap event});

  $DiagramDoubleTapCopyWith<$Res> get event;
}

/// @nodoc
class __$$DoubleTapImplCopyWithImpl<$Res>
    extends _$DiagramEventUnionCopyWithImpl<$Res, _$DoubleTapImpl>
    implements _$$DoubleTapImplCopyWith<$Res> {
  __$$DoubleTapImplCopyWithImpl(
      _$DoubleTapImpl _value, $Res Function(_$DoubleTapImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
  }) {
    return _then(_$DoubleTapImpl(
      null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as DiagramDoubleTap,
    ));
  }

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DiagramDoubleTapCopyWith<$Res> get event {
    return $DiagramDoubleTapCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value));
    });
  }
}

/// @nodoc

class _$DoubleTapImpl implements _DoubleTap {
  const _$DoubleTapImpl(this.event);

  @override
  final DiagramDoubleTap event;

  @override
  String toString() {
    return 'DiagramEventUnion.doubleTap(event: $event)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoubleTapImpl &&
            (identical(other.event, event) || other.event == event));
  }

  @override
  int get hashCode => Object.hash(runtimeType, event);

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoubleTapImplCopyWith<_$DoubleTapImpl> get copyWith =>
      __$$DoubleTapImplCopyWithImpl<_$DoubleTapImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DiagramTap event) tap,
    required TResult Function(DiagramDoubleTap event) doubleTap,
    required TResult Function(DiagramLongPress event) longPress,
    required TResult Function(DiagramScroll event) scroll,
    required TResult Function(DiagramDragBegin event) dragBegin,
    required TResult Function(DiagramDragContinue event) dragContinue,
    required TResult Function(DiagramDragEnd event) dragEnd,
    required TResult Function(DiagramPinchBegin event) pinchBegin,
    required TResult Function(DiagramPinchContinue event) pinchContinue,
    required TResult Function(DiagramPinchEnd event) pinchEnd,
  }) {
    return doubleTap(event);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DiagramTap event)? tap,
    TResult? Function(DiagramDoubleTap event)? doubleTap,
    TResult? Function(DiagramLongPress event)? longPress,
    TResult? Function(DiagramScroll event)? scroll,
    TResult? Function(DiagramDragBegin event)? dragBegin,
    TResult? Function(DiagramDragContinue event)? dragContinue,
    TResult? Function(DiagramDragEnd event)? dragEnd,
    TResult? Function(DiagramPinchBegin event)? pinchBegin,
    TResult? Function(DiagramPinchContinue event)? pinchContinue,
    TResult? Function(DiagramPinchEnd event)? pinchEnd,
  }) {
    return doubleTap?.call(event);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DiagramTap event)? tap,
    TResult Function(DiagramDoubleTap event)? doubleTap,
    TResult Function(DiagramLongPress event)? longPress,
    TResult Function(DiagramScroll event)? scroll,
    TResult Function(DiagramDragBegin event)? dragBegin,
    TResult Function(DiagramDragContinue event)? dragContinue,
    TResult Function(DiagramDragEnd event)? dragEnd,
    TResult Function(DiagramPinchBegin event)? pinchBegin,
    TResult Function(DiagramPinchContinue event)? pinchContinue,
    TResult Function(DiagramPinchEnd event)? pinchEnd,
    required TResult orElse(),
  }) {
    if (doubleTap != null) {
      return doubleTap(event);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Tap value) tap,
    required TResult Function(_DoubleTap value) doubleTap,
    required TResult Function(_LongPress value) longPress,
    required TResult Function(_Scroll value) scroll,
    required TResult Function(_DragBegin value) dragBegin,
    required TResult Function(_DragContinue value) dragContinue,
    required TResult Function(_DragEnd value) dragEnd,
    required TResult Function(_PinchBegin value) pinchBegin,
    required TResult Function(_PinchContinue value) pinchContinue,
    required TResult Function(_PinchEnd value) pinchEnd,
  }) {
    return doubleTap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Tap value)? tap,
    TResult? Function(_DoubleTap value)? doubleTap,
    TResult? Function(_LongPress value)? longPress,
    TResult? Function(_Scroll value)? scroll,
    TResult? Function(_DragBegin value)? dragBegin,
    TResult? Function(_DragContinue value)? dragContinue,
    TResult? Function(_DragEnd value)? dragEnd,
    TResult? Function(_PinchBegin value)? pinchBegin,
    TResult? Function(_PinchContinue value)? pinchContinue,
    TResult? Function(_PinchEnd value)? pinchEnd,
  }) {
    return doubleTap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Tap value)? tap,
    TResult Function(_DoubleTap value)? doubleTap,
    TResult Function(_LongPress value)? longPress,
    TResult Function(_Scroll value)? scroll,
    TResult Function(_DragBegin value)? dragBegin,
    TResult Function(_DragContinue value)? dragContinue,
    TResult Function(_DragEnd value)? dragEnd,
    TResult Function(_PinchBegin value)? pinchBegin,
    TResult Function(_PinchContinue value)? pinchContinue,
    TResult Function(_PinchEnd value)? pinchEnd,
    required TResult orElse(),
  }) {
    if (doubleTap != null) {
      return doubleTap(this);
    }
    return orElse();
  }
}

abstract class _DoubleTap implements DiagramEventUnion {
  const factory _DoubleTap(final DiagramDoubleTap event) = _$DoubleTapImpl;

  @override
  DiagramDoubleTap get event;

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoubleTapImplCopyWith<_$DoubleTapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LongPressImplCopyWith<$Res> {
  factory _$$LongPressImplCopyWith(
          _$LongPressImpl value, $Res Function(_$LongPressImpl) then) =
      __$$LongPressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DiagramLongPress event});

  $DiagramLongPressCopyWith<$Res> get event;
}

/// @nodoc
class __$$LongPressImplCopyWithImpl<$Res>
    extends _$DiagramEventUnionCopyWithImpl<$Res, _$LongPressImpl>
    implements _$$LongPressImplCopyWith<$Res> {
  __$$LongPressImplCopyWithImpl(
      _$LongPressImpl _value, $Res Function(_$LongPressImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
  }) {
    return _then(_$LongPressImpl(
      null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as DiagramLongPress,
    ));
  }

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DiagramLongPressCopyWith<$Res> get event {
    return $DiagramLongPressCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value));
    });
  }
}

/// @nodoc

class _$LongPressImpl implements _LongPress {
  const _$LongPressImpl(this.event);

  @override
  final DiagramLongPress event;

  @override
  String toString() {
    return 'DiagramEventUnion.longPress(event: $event)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LongPressImpl &&
            (identical(other.event, event) || other.event == event));
  }

  @override
  int get hashCode => Object.hash(runtimeType, event);

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LongPressImplCopyWith<_$LongPressImpl> get copyWith =>
      __$$LongPressImplCopyWithImpl<_$LongPressImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DiagramTap event) tap,
    required TResult Function(DiagramDoubleTap event) doubleTap,
    required TResult Function(DiagramLongPress event) longPress,
    required TResult Function(DiagramScroll event) scroll,
    required TResult Function(DiagramDragBegin event) dragBegin,
    required TResult Function(DiagramDragContinue event) dragContinue,
    required TResult Function(DiagramDragEnd event) dragEnd,
    required TResult Function(DiagramPinchBegin event) pinchBegin,
    required TResult Function(DiagramPinchContinue event) pinchContinue,
    required TResult Function(DiagramPinchEnd event) pinchEnd,
  }) {
    return longPress(event);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DiagramTap event)? tap,
    TResult? Function(DiagramDoubleTap event)? doubleTap,
    TResult? Function(DiagramLongPress event)? longPress,
    TResult? Function(DiagramScroll event)? scroll,
    TResult? Function(DiagramDragBegin event)? dragBegin,
    TResult? Function(DiagramDragContinue event)? dragContinue,
    TResult? Function(DiagramDragEnd event)? dragEnd,
    TResult? Function(DiagramPinchBegin event)? pinchBegin,
    TResult? Function(DiagramPinchContinue event)? pinchContinue,
    TResult? Function(DiagramPinchEnd event)? pinchEnd,
  }) {
    return longPress?.call(event);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DiagramTap event)? tap,
    TResult Function(DiagramDoubleTap event)? doubleTap,
    TResult Function(DiagramLongPress event)? longPress,
    TResult Function(DiagramScroll event)? scroll,
    TResult Function(DiagramDragBegin event)? dragBegin,
    TResult Function(DiagramDragContinue event)? dragContinue,
    TResult Function(DiagramDragEnd event)? dragEnd,
    TResult Function(DiagramPinchBegin event)? pinchBegin,
    TResult Function(DiagramPinchContinue event)? pinchContinue,
    TResult Function(DiagramPinchEnd event)? pinchEnd,
    required TResult orElse(),
  }) {
    if (longPress != null) {
      return longPress(event);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Tap value) tap,
    required TResult Function(_DoubleTap value) doubleTap,
    required TResult Function(_LongPress value) longPress,
    required TResult Function(_Scroll value) scroll,
    required TResult Function(_DragBegin value) dragBegin,
    required TResult Function(_DragContinue value) dragContinue,
    required TResult Function(_DragEnd value) dragEnd,
    required TResult Function(_PinchBegin value) pinchBegin,
    required TResult Function(_PinchContinue value) pinchContinue,
    required TResult Function(_PinchEnd value) pinchEnd,
  }) {
    return longPress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Tap value)? tap,
    TResult? Function(_DoubleTap value)? doubleTap,
    TResult? Function(_LongPress value)? longPress,
    TResult? Function(_Scroll value)? scroll,
    TResult? Function(_DragBegin value)? dragBegin,
    TResult? Function(_DragContinue value)? dragContinue,
    TResult? Function(_DragEnd value)? dragEnd,
    TResult? Function(_PinchBegin value)? pinchBegin,
    TResult? Function(_PinchContinue value)? pinchContinue,
    TResult? Function(_PinchEnd value)? pinchEnd,
  }) {
    return longPress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Tap value)? tap,
    TResult Function(_DoubleTap value)? doubleTap,
    TResult Function(_LongPress value)? longPress,
    TResult Function(_Scroll value)? scroll,
    TResult Function(_DragBegin value)? dragBegin,
    TResult Function(_DragContinue value)? dragContinue,
    TResult Function(_DragEnd value)? dragEnd,
    TResult Function(_PinchBegin value)? pinchBegin,
    TResult Function(_PinchContinue value)? pinchContinue,
    TResult Function(_PinchEnd value)? pinchEnd,
    required TResult orElse(),
  }) {
    if (longPress != null) {
      return longPress(this);
    }
    return orElse();
  }
}

abstract class _LongPress implements DiagramEventUnion {
  const factory _LongPress(final DiagramLongPress event) = _$LongPressImpl;

  @override
  DiagramLongPress get event;

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LongPressImplCopyWith<_$LongPressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ScrollImplCopyWith<$Res> {
  factory _$$ScrollImplCopyWith(
          _$ScrollImpl value, $Res Function(_$ScrollImpl) then) =
      __$$ScrollImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DiagramScroll event});

  $DiagramScrollCopyWith<$Res> get event;
}

/// @nodoc
class __$$ScrollImplCopyWithImpl<$Res>
    extends _$DiagramEventUnionCopyWithImpl<$Res, _$ScrollImpl>
    implements _$$ScrollImplCopyWith<$Res> {
  __$$ScrollImplCopyWithImpl(
      _$ScrollImpl _value, $Res Function(_$ScrollImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
  }) {
    return _then(_$ScrollImpl(
      null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as DiagramScroll,
    ));
  }

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DiagramScrollCopyWith<$Res> get event {
    return $DiagramScrollCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value));
    });
  }
}

/// @nodoc

class _$ScrollImpl implements _Scroll {
  const _$ScrollImpl(this.event);

  @override
  final DiagramScroll event;

  @override
  String toString() {
    return 'DiagramEventUnion.scroll(event: $event)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScrollImpl &&
            (identical(other.event, event) || other.event == event));
  }

  @override
  int get hashCode => Object.hash(runtimeType, event);

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScrollImplCopyWith<_$ScrollImpl> get copyWith =>
      __$$ScrollImplCopyWithImpl<_$ScrollImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DiagramTap event) tap,
    required TResult Function(DiagramDoubleTap event) doubleTap,
    required TResult Function(DiagramLongPress event) longPress,
    required TResult Function(DiagramScroll event) scroll,
    required TResult Function(DiagramDragBegin event) dragBegin,
    required TResult Function(DiagramDragContinue event) dragContinue,
    required TResult Function(DiagramDragEnd event) dragEnd,
    required TResult Function(DiagramPinchBegin event) pinchBegin,
    required TResult Function(DiagramPinchContinue event) pinchContinue,
    required TResult Function(DiagramPinchEnd event) pinchEnd,
  }) {
    return scroll(event);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DiagramTap event)? tap,
    TResult? Function(DiagramDoubleTap event)? doubleTap,
    TResult? Function(DiagramLongPress event)? longPress,
    TResult? Function(DiagramScroll event)? scroll,
    TResult? Function(DiagramDragBegin event)? dragBegin,
    TResult? Function(DiagramDragContinue event)? dragContinue,
    TResult? Function(DiagramDragEnd event)? dragEnd,
    TResult? Function(DiagramPinchBegin event)? pinchBegin,
    TResult? Function(DiagramPinchContinue event)? pinchContinue,
    TResult? Function(DiagramPinchEnd event)? pinchEnd,
  }) {
    return scroll?.call(event);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DiagramTap event)? tap,
    TResult Function(DiagramDoubleTap event)? doubleTap,
    TResult Function(DiagramLongPress event)? longPress,
    TResult Function(DiagramScroll event)? scroll,
    TResult Function(DiagramDragBegin event)? dragBegin,
    TResult Function(DiagramDragContinue event)? dragContinue,
    TResult Function(DiagramDragEnd event)? dragEnd,
    TResult Function(DiagramPinchBegin event)? pinchBegin,
    TResult Function(DiagramPinchContinue event)? pinchContinue,
    TResult Function(DiagramPinchEnd event)? pinchEnd,
    required TResult orElse(),
  }) {
    if (scroll != null) {
      return scroll(event);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Tap value) tap,
    required TResult Function(_DoubleTap value) doubleTap,
    required TResult Function(_LongPress value) longPress,
    required TResult Function(_Scroll value) scroll,
    required TResult Function(_DragBegin value) dragBegin,
    required TResult Function(_DragContinue value) dragContinue,
    required TResult Function(_DragEnd value) dragEnd,
    required TResult Function(_PinchBegin value) pinchBegin,
    required TResult Function(_PinchContinue value) pinchContinue,
    required TResult Function(_PinchEnd value) pinchEnd,
  }) {
    return scroll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Tap value)? tap,
    TResult? Function(_DoubleTap value)? doubleTap,
    TResult? Function(_LongPress value)? longPress,
    TResult? Function(_Scroll value)? scroll,
    TResult? Function(_DragBegin value)? dragBegin,
    TResult? Function(_DragContinue value)? dragContinue,
    TResult? Function(_DragEnd value)? dragEnd,
    TResult? Function(_PinchBegin value)? pinchBegin,
    TResult? Function(_PinchContinue value)? pinchContinue,
    TResult? Function(_PinchEnd value)? pinchEnd,
  }) {
    return scroll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Tap value)? tap,
    TResult Function(_DoubleTap value)? doubleTap,
    TResult Function(_LongPress value)? longPress,
    TResult Function(_Scroll value)? scroll,
    TResult Function(_DragBegin value)? dragBegin,
    TResult Function(_DragContinue value)? dragContinue,
    TResult Function(_DragEnd value)? dragEnd,
    TResult Function(_PinchBegin value)? pinchBegin,
    TResult Function(_PinchContinue value)? pinchContinue,
    TResult Function(_PinchEnd value)? pinchEnd,
    required TResult orElse(),
  }) {
    if (scroll != null) {
      return scroll(this);
    }
    return orElse();
  }
}

abstract class _Scroll implements DiagramEventUnion {
  const factory _Scroll(final DiagramScroll event) = _$ScrollImpl;

  @override
  DiagramScroll get event;

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScrollImplCopyWith<_$ScrollImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DragBeginImplCopyWith<$Res> {
  factory _$$DragBeginImplCopyWith(
          _$DragBeginImpl value, $Res Function(_$DragBeginImpl) then) =
      __$$DragBeginImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DiagramDragBegin event});

  $DiagramDragBeginCopyWith<$Res> get event;
}

/// @nodoc
class __$$DragBeginImplCopyWithImpl<$Res>
    extends _$DiagramEventUnionCopyWithImpl<$Res, _$DragBeginImpl>
    implements _$$DragBeginImplCopyWith<$Res> {
  __$$DragBeginImplCopyWithImpl(
      _$DragBeginImpl _value, $Res Function(_$DragBeginImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
  }) {
    return _then(_$DragBeginImpl(
      null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as DiagramDragBegin,
    ));
  }

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DiagramDragBeginCopyWith<$Res> get event {
    return $DiagramDragBeginCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value));
    });
  }
}

/// @nodoc

class _$DragBeginImpl implements _DragBegin {
  const _$DragBeginImpl(this.event);

  @override
  final DiagramDragBegin event;

  @override
  String toString() {
    return 'DiagramEventUnion.dragBegin(event: $event)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DragBeginImpl &&
            (identical(other.event, event) || other.event == event));
  }

  @override
  int get hashCode => Object.hash(runtimeType, event);

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DragBeginImplCopyWith<_$DragBeginImpl> get copyWith =>
      __$$DragBeginImplCopyWithImpl<_$DragBeginImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DiagramTap event) tap,
    required TResult Function(DiagramDoubleTap event) doubleTap,
    required TResult Function(DiagramLongPress event) longPress,
    required TResult Function(DiagramScroll event) scroll,
    required TResult Function(DiagramDragBegin event) dragBegin,
    required TResult Function(DiagramDragContinue event) dragContinue,
    required TResult Function(DiagramDragEnd event) dragEnd,
    required TResult Function(DiagramPinchBegin event) pinchBegin,
    required TResult Function(DiagramPinchContinue event) pinchContinue,
    required TResult Function(DiagramPinchEnd event) pinchEnd,
  }) {
    return dragBegin(event);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DiagramTap event)? tap,
    TResult? Function(DiagramDoubleTap event)? doubleTap,
    TResult? Function(DiagramLongPress event)? longPress,
    TResult? Function(DiagramScroll event)? scroll,
    TResult? Function(DiagramDragBegin event)? dragBegin,
    TResult? Function(DiagramDragContinue event)? dragContinue,
    TResult? Function(DiagramDragEnd event)? dragEnd,
    TResult? Function(DiagramPinchBegin event)? pinchBegin,
    TResult? Function(DiagramPinchContinue event)? pinchContinue,
    TResult? Function(DiagramPinchEnd event)? pinchEnd,
  }) {
    return dragBegin?.call(event);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DiagramTap event)? tap,
    TResult Function(DiagramDoubleTap event)? doubleTap,
    TResult Function(DiagramLongPress event)? longPress,
    TResult Function(DiagramScroll event)? scroll,
    TResult Function(DiagramDragBegin event)? dragBegin,
    TResult Function(DiagramDragContinue event)? dragContinue,
    TResult Function(DiagramDragEnd event)? dragEnd,
    TResult Function(DiagramPinchBegin event)? pinchBegin,
    TResult Function(DiagramPinchContinue event)? pinchContinue,
    TResult Function(DiagramPinchEnd event)? pinchEnd,
    required TResult orElse(),
  }) {
    if (dragBegin != null) {
      return dragBegin(event);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Tap value) tap,
    required TResult Function(_DoubleTap value) doubleTap,
    required TResult Function(_LongPress value) longPress,
    required TResult Function(_Scroll value) scroll,
    required TResult Function(_DragBegin value) dragBegin,
    required TResult Function(_DragContinue value) dragContinue,
    required TResult Function(_DragEnd value) dragEnd,
    required TResult Function(_PinchBegin value) pinchBegin,
    required TResult Function(_PinchContinue value) pinchContinue,
    required TResult Function(_PinchEnd value) pinchEnd,
  }) {
    return dragBegin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Tap value)? tap,
    TResult? Function(_DoubleTap value)? doubleTap,
    TResult? Function(_LongPress value)? longPress,
    TResult? Function(_Scroll value)? scroll,
    TResult? Function(_DragBegin value)? dragBegin,
    TResult? Function(_DragContinue value)? dragContinue,
    TResult? Function(_DragEnd value)? dragEnd,
    TResult? Function(_PinchBegin value)? pinchBegin,
    TResult? Function(_PinchContinue value)? pinchContinue,
    TResult? Function(_PinchEnd value)? pinchEnd,
  }) {
    return dragBegin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Tap value)? tap,
    TResult Function(_DoubleTap value)? doubleTap,
    TResult Function(_LongPress value)? longPress,
    TResult Function(_Scroll value)? scroll,
    TResult Function(_DragBegin value)? dragBegin,
    TResult Function(_DragContinue value)? dragContinue,
    TResult Function(_DragEnd value)? dragEnd,
    TResult Function(_PinchBegin value)? pinchBegin,
    TResult Function(_PinchContinue value)? pinchContinue,
    TResult Function(_PinchEnd value)? pinchEnd,
    required TResult orElse(),
  }) {
    if (dragBegin != null) {
      return dragBegin(this);
    }
    return orElse();
  }
}

abstract class _DragBegin implements DiagramEventUnion {
  const factory _DragBegin(final DiagramDragBegin event) = _$DragBeginImpl;

  @override
  DiagramDragBegin get event;

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DragBeginImplCopyWith<_$DragBeginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DragContinueImplCopyWith<$Res> {
  factory _$$DragContinueImplCopyWith(
          _$DragContinueImpl value, $Res Function(_$DragContinueImpl) then) =
      __$$DragContinueImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DiagramDragContinue event});

  $DiagramDragContinueCopyWith<$Res> get event;
}

/// @nodoc
class __$$DragContinueImplCopyWithImpl<$Res>
    extends _$DiagramEventUnionCopyWithImpl<$Res, _$DragContinueImpl>
    implements _$$DragContinueImplCopyWith<$Res> {
  __$$DragContinueImplCopyWithImpl(
      _$DragContinueImpl _value, $Res Function(_$DragContinueImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
  }) {
    return _then(_$DragContinueImpl(
      null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as DiagramDragContinue,
    ));
  }

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DiagramDragContinueCopyWith<$Res> get event {
    return $DiagramDragContinueCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value));
    });
  }
}

/// @nodoc

class _$DragContinueImpl implements _DragContinue {
  const _$DragContinueImpl(this.event);

  @override
  final DiagramDragContinue event;

  @override
  String toString() {
    return 'DiagramEventUnion.dragContinue(event: $event)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DragContinueImpl &&
            (identical(other.event, event) || other.event == event));
  }

  @override
  int get hashCode => Object.hash(runtimeType, event);

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DragContinueImplCopyWith<_$DragContinueImpl> get copyWith =>
      __$$DragContinueImplCopyWithImpl<_$DragContinueImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DiagramTap event) tap,
    required TResult Function(DiagramDoubleTap event) doubleTap,
    required TResult Function(DiagramLongPress event) longPress,
    required TResult Function(DiagramScroll event) scroll,
    required TResult Function(DiagramDragBegin event) dragBegin,
    required TResult Function(DiagramDragContinue event) dragContinue,
    required TResult Function(DiagramDragEnd event) dragEnd,
    required TResult Function(DiagramPinchBegin event) pinchBegin,
    required TResult Function(DiagramPinchContinue event) pinchContinue,
    required TResult Function(DiagramPinchEnd event) pinchEnd,
  }) {
    return dragContinue(event);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DiagramTap event)? tap,
    TResult? Function(DiagramDoubleTap event)? doubleTap,
    TResult? Function(DiagramLongPress event)? longPress,
    TResult? Function(DiagramScroll event)? scroll,
    TResult? Function(DiagramDragBegin event)? dragBegin,
    TResult? Function(DiagramDragContinue event)? dragContinue,
    TResult? Function(DiagramDragEnd event)? dragEnd,
    TResult? Function(DiagramPinchBegin event)? pinchBegin,
    TResult? Function(DiagramPinchContinue event)? pinchContinue,
    TResult? Function(DiagramPinchEnd event)? pinchEnd,
  }) {
    return dragContinue?.call(event);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DiagramTap event)? tap,
    TResult Function(DiagramDoubleTap event)? doubleTap,
    TResult Function(DiagramLongPress event)? longPress,
    TResult Function(DiagramScroll event)? scroll,
    TResult Function(DiagramDragBegin event)? dragBegin,
    TResult Function(DiagramDragContinue event)? dragContinue,
    TResult Function(DiagramDragEnd event)? dragEnd,
    TResult Function(DiagramPinchBegin event)? pinchBegin,
    TResult Function(DiagramPinchContinue event)? pinchContinue,
    TResult Function(DiagramPinchEnd event)? pinchEnd,
    required TResult orElse(),
  }) {
    if (dragContinue != null) {
      return dragContinue(event);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Tap value) tap,
    required TResult Function(_DoubleTap value) doubleTap,
    required TResult Function(_LongPress value) longPress,
    required TResult Function(_Scroll value) scroll,
    required TResult Function(_DragBegin value) dragBegin,
    required TResult Function(_DragContinue value) dragContinue,
    required TResult Function(_DragEnd value) dragEnd,
    required TResult Function(_PinchBegin value) pinchBegin,
    required TResult Function(_PinchContinue value) pinchContinue,
    required TResult Function(_PinchEnd value) pinchEnd,
  }) {
    return dragContinue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Tap value)? tap,
    TResult? Function(_DoubleTap value)? doubleTap,
    TResult? Function(_LongPress value)? longPress,
    TResult? Function(_Scroll value)? scroll,
    TResult? Function(_DragBegin value)? dragBegin,
    TResult? Function(_DragContinue value)? dragContinue,
    TResult? Function(_DragEnd value)? dragEnd,
    TResult? Function(_PinchBegin value)? pinchBegin,
    TResult? Function(_PinchContinue value)? pinchContinue,
    TResult? Function(_PinchEnd value)? pinchEnd,
  }) {
    return dragContinue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Tap value)? tap,
    TResult Function(_DoubleTap value)? doubleTap,
    TResult Function(_LongPress value)? longPress,
    TResult Function(_Scroll value)? scroll,
    TResult Function(_DragBegin value)? dragBegin,
    TResult Function(_DragContinue value)? dragContinue,
    TResult Function(_DragEnd value)? dragEnd,
    TResult Function(_PinchBegin value)? pinchBegin,
    TResult Function(_PinchContinue value)? pinchContinue,
    TResult Function(_PinchEnd value)? pinchEnd,
    required TResult orElse(),
  }) {
    if (dragContinue != null) {
      return dragContinue(this);
    }
    return orElse();
  }
}

abstract class _DragContinue implements DiagramEventUnion {
  const factory _DragContinue(final DiagramDragContinue event) =
      _$DragContinueImpl;

  @override
  DiagramDragContinue get event;

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DragContinueImplCopyWith<_$DragContinueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DragEndImplCopyWith<$Res> {
  factory _$$DragEndImplCopyWith(
          _$DragEndImpl value, $Res Function(_$DragEndImpl) then) =
      __$$DragEndImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DiagramDragEnd event});

  $DiagramDragEndCopyWith<$Res> get event;
}

/// @nodoc
class __$$DragEndImplCopyWithImpl<$Res>
    extends _$DiagramEventUnionCopyWithImpl<$Res, _$DragEndImpl>
    implements _$$DragEndImplCopyWith<$Res> {
  __$$DragEndImplCopyWithImpl(
      _$DragEndImpl _value, $Res Function(_$DragEndImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
  }) {
    return _then(_$DragEndImpl(
      null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as DiagramDragEnd,
    ));
  }

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DiagramDragEndCopyWith<$Res> get event {
    return $DiagramDragEndCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value));
    });
  }
}

/// @nodoc

class _$DragEndImpl implements _DragEnd {
  const _$DragEndImpl(this.event);

  @override
  final DiagramDragEnd event;

  @override
  String toString() {
    return 'DiagramEventUnion.dragEnd(event: $event)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DragEndImpl &&
            (identical(other.event, event) || other.event == event));
  }

  @override
  int get hashCode => Object.hash(runtimeType, event);

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DragEndImplCopyWith<_$DragEndImpl> get copyWith =>
      __$$DragEndImplCopyWithImpl<_$DragEndImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DiagramTap event) tap,
    required TResult Function(DiagramDoubleTap event) doubleTap,
    required TResult Function(DiagramLongPress event) longPress,
    required TResult Function(DiagramScroll event) scroll,
    required TResult Function(DiagramDragBegin event) dragBegin,
    required TResult Function(DiagramDragContinue event) dragContinue,
    required TResult Function(DiagramDragEnd event) dragEnd,
    required TResult Function(DiagramPinchBegin event) pinchBegin,
    required TResult Function(DiagramPinchContinue event) pinchContinue,
    required TResult Function(DiagramPinchEnd event) pinchEnd,
  }) {
    return dragEnd(event);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DiagramTap event)? tap,
    TResult? Function(DiagramDoubleTap event)? doubleTap,
    TResult? Function(DiagramLongPress event)? longPress,
    TResult? Function(DiagramScroll event)? scroll,
    TResult? Function(DiagramDragBegin event)? dragBegin,
    TResult? Function(DiagramDragContinue event)? dragContinue,
    TResult? Function(DiagramDragEnd event)? dragEnd,
    TResult? Function(DiagramPinchBegin event)? pinchBegin,
    TResult? Function(DiagramPinchContinue event)? pinchContinue,
    TResult? Function(DiagramPinchEnd event)? pinchEnd,
  }) {
    return dragEnd?.call(event);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DiagramTap event)? tap,
    TResult Function(DiagramDoubleTap event)? doubleTap,
    TResult Function(DiagramLongPress event)? longPress,
    TResult Function(DiagramScroll event)? scroll,
    TResult Function(DiagramDragBegin event)? dragBegin,
    TResult Function(DiagramDragContinue event)? dragContinue,
    TResult Function(DiagramDragEnd event)? dragEnd,
    TResult Function(DiagramPinchBegin event)? pinchBegin,
    TResult Function(DiagramPinchContinue event)? pinchContinue,
    TResult Function(DiagramPinchEnd event)? pinchEnd,
    required TResult orElse(),
  }) {
    if (dragEnd != null) {
      return dragEnd(event);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Tap value) tap,
    required TResult Function(_DoubleTap value) doubleTap,
    required TResult Function(_LongPress value) longPress,
    required TResult Function(_Scroll value) scroll,
    required TResult Function(_DragBegin value) dragBegin,
    required TResult Function(_DragContinue value) dragContinue,
    required TResult Function(_DragEnd value) dragEnd,
    required TResult Function(_PinchBegin value) pinchBegin,
    required TResult Function(_PinchContinue value) pinchContinue,
    required TResult Function(_PinchEnd value) pinchEnd,
  }) {
    return dragEnd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Tap value)? tap,
    TResult? Function(_DoubleTap value)? doubleTap,
    TResult? Function(_LongPress value)? longPress,
    TResult? Function(_Scroll value)? scroll,
    TResult? Function(_DragBegin value)? dragBegin,
    TResult? Function(_DragContinue value)? dragContinue,
    TResult? Function(_DragEnd value)? dragEnd,
    TResult? Function(_PinchBegin value)? pinchBegin,
    TResult? Function(_PinchContinue value)? pinchContinue,
    TResult? Function(_PinchEnd value)? pinchEnd,
  }) {
    return dragEnd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Tap value)? tap,
    TResult Function(_DoubleTap value)? doubleTap,
    TResult Function(_LongPress value)? longPress,
    TResult Function(_Scroll value)? scroll,
    TResult Function(_DragBegin value)? dragBegin,
    TResult Function(_DragContinue value)? dragContinue,
    TResult Function(_DragEnd value)? dragEnd,
    TResult Function(_PinchBegin value)? pinchBegin,
    TResult Function(_PinchContinue value)? pinchContinue,
    TResult Function(_PinchEnd value)? pinchEnd,
    required TResult orElse(),
  }) {
    if (dragEnd != null) {
      return dragEnd(this);
    }
    return orElse();
  }
}

abstract class _DragEnd implements DiagramEventUnion {
  const factory _DragEnd(final DiagramDragEnd event) = _$DragEndImpl;

  @override
  DiagramDragEnd get event;

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DragEndImplCopyWith<_$DragEndImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PinchBeginImplCopyWith<$Res> {
  factory _$$PinchBeginImplCopyWith(
          _$PinchBeginImpl value, $Res Function(_$PinchBeginImpl) then) =
      __$$PinchBeginImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DiagramPinchBegin event});

  $DiagramPinchBeginCopyWith<$Res> get event;
}

/// @nodoc
class __$$PinchBeginImplCopyWithImpl<$Res>
    extends _$DiagramEventUnionCopyWithImpl<$Res, _$PinchBeginImpl>
    implements _$$PinchBeginImplCopyWith<$Res> {
  __$$PinchBeginImplCopyWithImpl(
      _$PinchBeginImpl _value, $Res Function(_$PinchBeginImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
  }) {
    return _then(_$PinchBeginImpl(
      null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as DiagramPinchBegin,
    ));
  }

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DiagramPinchBeginCopyWith<$Res> get event {
    return $DiagramPinchBeginCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value));
    });
  }
}

/// @nodoc

class _$PinchBeginImpl implements _PinchBegin {
  const _$PinchBeginImpl(this.event);

  @override
  final DiagramPinchBegin event;

  @override
  String toString() {
    return 'DiagramEventUnion.pinchBegin(event: $event)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PinchBeginImpl &&
            (identical(other.event, event) || other.event == event));
  }

  @override
  int get hashCode => Object.hash(runtimeType, event);

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PinchBeginImplCopyWith<_$PinchBeginImpl> get copyWith =>
      __$$PinchBeginImplCopyWithImpl<_$PinchBeginImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DiagramTap event) tap,
    required TResult Function(DiagramDoubleTap event) doubleTap,
    required TResult Function(DiagramLongPress event) longPress,
    required TResult Function(DiagramScroll event) scroll,
    required TResult Function(DiagramDragBegin event) dragBegin,
    required TResult Function(DiagramDragContinue event) dragContinue,
    required TResult Function(DiagramDragEnd event) dragEnd,
    required TResult Function(DiagramPinchBegin event) pinchBegin,
    required TResult Function(DiagramPinchContinue event) pinchContinue,
    required TResult Function(DiagramPinchEnd event) pinchEnd,
  }) {
    return pinchBegin(event);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DiagramTap event)? tap,
    TResult? Function(DiagramDoubleTap event)? doubleTap,
    TResult? Function(DiagramLongPress event)? longPress,
    TResult? Function(DiagramScroll event)? scroll,
    TResult? Function(DiagramDragBegin event)? dragBegin,
    TResult? Function(DiagramDragContinue event)? dragContinue,
    TResult? Function(DiagramDragEnd event)? dragEnd,
    TResult? Function(DiagramPinchBegin event)? pinchBegin,
    TResult? Function(DiagramPinchContinue event)? pinchContinue,
    TResult? Function(DiagramPinchEnd event)? pinchEnd,
  }) {
    return pinchBegin?.call(event);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DiagramTap event)? tap,
    TResult Function(DiagramDoubleTap event)? doubleTap,
    TResult Function(DiagramLongPress event)? longPress,
    TResult Function(DiagramScroll event)? scroll,
    TResult Function(DiagramDragBegin event)? dragBegin,
    TResult Function(DiagramDragContinue event)? dragContinue,
    TResult Function(DiagramDragEnd event)? dragEnd,
    TResult Function(DiagramPinchBegin event)? pinchBegin,
    TResult Function(DiagramPinchContinue event)? pinchContinue,
    TResult Function(DiagramPinchEnd event)? pinchEnd,
    required TResult orElse(),
  }) {
    if (pinchBegin != null) {
      return pinchBegin(event);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Tap value) tap,
    required TResult Function(_DoubleTap value) doubleTap,
    required TResult Function(_LongPress value) longPress,
    required TResult Function(_Scroll value) scroll,
    required TResult Function(_DragBegin value) dragBegin,
    required TResult Function(_DragContinue value) dragContinue,
    required TResult Function(_DragEnd value) dragEnd,
    required TResult Function(_PinchBegin value) pinchBegin,
    required TResult Function(_PinchContinue value) pinchContinue,
    required TResult Function(_PinchEnd value) pinchEnd,
  }) {
    return pinchBegin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Tap value)? tap,
    TResult? Function(_DoubleTap value)? doubleTap,
    TResult? Function(_LongPress value)? longPress,
    TResult? Function(_Scroll value)? scroll,
    TResult? Function(_DragBegin value)? dragBegin,
    TResult? Function(_DragContinue value)? dragContinue,
    TResult? Function(_DragEnd value)? dragEnd,
    TResult? Function(_PinchBegin value)? pinchBegin,
    TResult? Function(_PinchContinue value)? pinchContinue,
    TResult? Function(_PinchEnd value)? pinchEnd,
  }) {
    return pinchBegin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Tap value)? tap,
    TResult Function(_DoubleTap value)? doubleTap,
    TResult Function(_LongPress value)? longPress,
    TResult Function(_Scroll value)? scroll,
    TResult Function(_DragBegin value)? dragBegin,
    TResult Function(_DragContinue value)? dragContinue,
    TResult Function(_DragEnd value)? dragEnd,
    TResult Function(_PinchBegin value)? pinchBegin,
    TResult Function(_PinchContinue value)? pinchContinue,
    TResult Function(_PinchEnd value)? pinchEnd,
    required TResult orElse(),
  }) {
    if (pinchBegin != null) {
      return pinchBegin(this);
    }
    return orElse();
  }
}

abstract class _PinchBegin implements DiagramEventUnion {
  const factory _PinchBegin(final DiagramPinchBegin event) = _$PinchBeginImpl;

  @override
  DiagramPinchBegin get event;

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PinchBeginImplCopyWith<_$PinchBeginImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PinchContinueImplCopyWith<$Res> {
  factory _$$PinchContinueImplCopyWith(
          _$PinchContinueImpl value, $Res Function(_$PinchContinueImpl) then) =
      __$$PinchContinueImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DiagramPinchContinue event});

  $DiagramPinchContinueCopyWith<$Res> get event;
}

/// @nodoc
class __$$PinchContinueImplCopyWithImpl<$Res>
    extends _$DiagramEventUnionCopyWithImpl<$Res, _$PinchContinueImpl>
    implements _$$PinchContinueImplCopyWith<$Res> {
  __$$PinchContinueImplCopyWithImpl(
      _$PinchContinueImpl _value, $Res Function(_$PinchContinueImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
  }) {
    return _then(_$PinchContinueImpl(
      null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as DiagramPinchContinue,
    ));
  }

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DiagramPinchContinueCopyWith<$Res> get event {
    return $DiagramPinchContinueCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value));
    });
  }
}

/// @nodoc

class _$PinchContinueImpl implements _PinchContinue {
  const _$PinchContinueImpl(this.event);

  @override
  final DiagramPinchContinue event;

  @override
  String toString() {
    return 'DiagramEventUnion.pinchContinue(event: $event)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PinchContinueImpl &&
            (identical(other.event, event) || other.event == event));
  }

  @override
  int get hashCode => Object.hash(runtimeType, event);

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PinchContinueImplCopyWith<_$PinchContinueImpl> get copyWith =>
      __$$PinchContinueImplCopyWithImpl<_$PinchContinueImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DiagramTap event) tap,
    required TResult Function(DiagramDoubleTap event) doubleTap,
    required TResult Function(DiagramLongPress event) longPress,
    required TResult Function(DiagramScroll event) scroll,
    required TResult Function(DiagramDragBegin event) dragBegin,
    required TResult Function(DiagramDragContinue event) dragContinue,
    required TResult Function(DiagramDragEnd event) dragEnd,
    required TResult Function(DiagramPinchBegin event) pinchBegin,
    required TResult Function(DiagramPinchContinue event) pinchContinue,
    required TResult Function(DiagramPinchEnd event) pinchEnd,
  }) {
    return pinchContinue(event);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DiagramTap event)? tap,
    TResult? Function(DiagramDoubleTap event)? doubleTap,
    TResult? Function(DiagramLongPress event)? longPress,
    TResult? Function(DiagramScroll event)? scroll,
    TResult? Function(DiagramDragBegin event)? dragBegin,
    TResult? Function(DiagramDragContinue event)? dragContinue,
    TResult? Function(DiagramDragEnd event)? dragEnd,
    TResult? Function(DiagramPinchBegin event)? pinchBegin,
    TResult? Function(DiagramPinchContinue event)? pinchContinue,
    TResult? Function(DiagramPinchEnd event)? pinchEnd,
  }) {
    return pinchContinue?.call(event);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DiagramTap event)? tap,
    TResult Function(DiagramDoubleTap event)? doubleTap,
    TResult Function(DiagramLongPress event)? longPress,
    TResult Function(DiagramScroll event)? scroll,
    TResult Function(DiagramDragBegin event)? dragBegin,
    TResult Function(DiagramDragContinue event)? dragContinue,
    TResult Function(DiagramDragEnd event)? dragEnd,
    TResult Function(DiagramPinchBegin event)? pinchBegin,
    TResult Function(DiagramPinchContinue event)? pinchContinue,
    TResult Function(DiagramPinchEnd event)? pinchEnd,
    required TResult orElse(),
  }) {
    if (pinchContinue != null) {
      return pinchContinue(event);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Tap value) tap,
    required TResult Function(_DoubleTap value) doubleTap,
    required TResult Function(_LongPress value) longPress,
    required TResult Function(_Scroll value) scroll,
    required TResult Function(_DragBegin value) dragBegin,
    required TResult Function(_DragContinue value) dragContinue,
    required TResult Function(_DragEnd value) dragEnd,
    required TResult Function(_PinchBegin value) pinchBegin,
    required TResult Function(_PinchContinue value) pinchContinue,
    required TResult Function(_PinchEnd value) pinchEnd,
  }) {
    return pinchContinue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Tap value)? tap,
    TResult? Function(_DoubleTap value)? doubleTap,
    TResult? Function(_LongPress value)? longPress,
    TResult? Function(_Scroll value)? scroll,
    TResult? Function(_DragBegin value)? dragBegin,
    TResult? Function(_DragContinue value)? dragContinue,
    TResult? Function(_DragEnd value)? dragEnd,
    TResult? Function(_PinchBegin value)? pinchBegin,
    TResult? Function(_PinchContinue value)? pinchContinue,
    TResult? Function(_PinchEnd value)? pinchEnd,
  }) {
    return pinchContinue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Tap value)? tap,
    TResult Function(_DoubleTap value)? doubleTap,
    TResult Function(_LongPress value)? longPress,
    TResult Function(_Scroll value)? scroll,
    TResult Function(_DragBegin value)? dragBegin,
    TResult Function(_DragContinue value)? dragContinue,
    TResult Function(_DragEnd value)? dragEnd,
    TResult Function(_PinchBegin value)? pinchBegin,
    TResult Function(_PinchContinue value)? pinchContinue,
    TResult Function(_PinchEnd value)? pinchEnd,
    required TResult orElse(),
  }) {
    if (pinchContinue != null) {
      return pinchContinue(this);
    }
    return orElse();
  }
}

abstract class _PinchContinue implements DiagramEventUnion {
  const factory _PinchContinue(final DiagramPinchContinue event) =
      _$PinchContinueImpl;

  @override
  DiagramPinchContinue get event;

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PinchContinueImplCopyWith<_$PinchContinueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PinchEndImplCopyWith<$Res> {
  factory _$$PinchEndImplCopyWith(
          _$PinchEndImpl value, $Res Function(_$PinchEndImpl) then) =
      __$$PinchEndImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DiagramPinchEnd event});

  $DiagramPinchEndCopyWith<$Res> get event;
}

/// @nodoc
class __$$PinchEndImplCopyWithImpl<$Res>
    extends _$DiagramEventUnionCopyWithImpl<$Res, _$PinchEndImpl>
    implements _$$PinchEndImplCopyWith<$Res> {
  __$$PinchEndImplCopyWithImpl(
      _$PinchEndImpl _value, $Res Function(_$PinchEndImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? event = null,
  }) {
    return _then(_$PinchEndImpl(
      null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as DiagramPinchEnd,
    ));
  }

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DiagramPinchEndCopyWith<$Res> get event {
    return $DiagramPinchEndCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value));
    });
  }
}

/// @nodoc

class _$PinchEndImpl implements _PinchEnd {
  const _$PinchEndImpl(this.event);

  @override
  final DiagramPinchEnd event;

  @override
  String toString() {
    return 'DiagramEventUnion.pinchEnd(event: $event)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PinchEndImpl &&
            (identical(other.event, event) || other.event == event));
  }

  @override
  int get hashCode => Object.hash(runtimeType, event);

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PinchEndImplCopyWith<_$PinchEndImpl> get copyWith =>
      __$$PinchEndImplCopyWithImpl<_$PinchEndImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DiagramTap event) tap,
    required TResult Function(DiagramDoubleTap event) doubleTap,
    required TResult Function(DiagramLongPress event) longPress,
    required TResult Function(DiagramScroll event) scroll,
    required TResult Function(DiagramDragBegin event) dragBegin,
    required TResult Function(DiagramDragContinue event) dragContinue,
    required TResult Function(DiagramDragEnd event) dragEnd,
    required TResult Function(DiagramPinchBegin event) pinchBegin,
    required TResult Function(DiagramPinchContinue event) pinchContinue,
    required TResult Function(DiagramPinchEnd event) pinchEnd,
  }) {
    return pinchEnd(event);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DiagramTap event)? tap,
    TResult? Function(DiagramDoubleTap event)? doubleTap,
    TResult? Function(DiagramLongPress event)? longPress,
    TResult? Function(DiagramScroll event)? scroll,
    TResult? Function(DiagramDragBegin event)? dragBegin,
    TResult? Function(DiagramDragContinue event)? dragContinue,
    TResult? Function(DiagramDragEnd event)? dragEnd,
    TResult? Function(DiagramPinchBegin event)? pinchBegin,
    TResult? Function(DiagramPinchContinue event)? pinchContinue,
    TResult? Function(DiagramPinchEnd event)? pinchEnd,
  }) {
    return pinchEnd?.call(event);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DiagramTap event)? tap,
    TResult Function(DiagramDoubleTap event)? doubleTap,
    TResult Function(DiagramLongPress event)? longPress,
    TResult Function(DiagramScroll event)? scroll,
    TResult Function(DiagramDragBegin event)? dragBegin,
    TResult Function(DiagramDragContinue event)? dragContinue,
    TResult Function(DiagramDragEnd event)? dragEnd,
    TResult Function(DiagramPinchBegin event)? pinchBegin,
    TResult Function(DiagramPinchContinue event)? pinchContinue,
    TResult Function(DiagramPinchEnd event)? pinchEnd,
    required TResult orElse(),
  }) {
    if (pinchEnd != null) {
      return pinchEnd(event);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Tap value) tap,
    required TResult Function(_DoubleTap value) doubleTap,
    required TResult Function(_LongPress value) longPress,
    required TResult Function(_Scroll value) scroll,
    required TResult Function(_DragBegin value) dragBegin,
    required TResult Function(_DragContinue value) dragContinue,
    required TResult Function(_DragEnd value) dragEnd,
    required TResult Function(_PinchBegin value) pinchBegin,
    required TResult Function(_PinchContinue value) pinchContinue,
    required TResult Function(_PinchEnd value) pinchEnd,
  }) {
    return pinchEnd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Tap value)? tap,
    TResult? Function(_DoubleTap value)? doubleTap,
    TResult? Function(_LongPress value)? longPress,
    TResult? Function(_Scroll value)? scroll,
    TResult? Function(_DragBegin value)? dragBegin,
    TResult? Function(_DragContinue value)? dragContinue,
    TResult? Function(_DragEnd value)? dragEnd,
    TResult? Function(_PinchBegin value)? pinchBegin,
    TResult? Function(_PinchContinue value)? pinchContinue,
    TResult? Function(_PinchEnd value)? pinchEnd,
  }) {
    return pinchEnd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Tap value)? tap,
    TResult Function(_DoubleTap value)? doubleTap,
    TResult Function(_LongPress value)? longPress,
    TResult Function(_Scroll value)? scroll,
    TResult Function(_DragBegin value)? dragBegin,
    TResult Function(_DragContinue value)? dragContinue,
    TResult Function(_DragEnd value)? dragEnd,
    TResult Function(_PinchBegin value)? pinchBegin,
    TResult Function(_PinchContinue value)? pinchContinue,
    TResult Function(_PinchEnd value)? pinchEnd,
    required TResult orElse(),
  }) {
    if (pinchEnd != null) {
      return pinchEnd(this);
    }
    return orElse();
  }
}

abstract class _PinchEnd implements DiagramEventUnion {
  const factory _PinchEnd(final DiagramPinchEnd event) = _$PinchEndImpl;

  @override
  DiagramPinchEnd get event;

  /// Create a copy of DiagramEventUnion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PinchEndImplCopyWith<_$PinchEndImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
