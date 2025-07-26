// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'border_proximity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BorderProximity {
  /// Whether the point is near the left edge of the viewport.
  bool get isNearLeft => throw _privateConstructorUsedError;

  /// Whether the point is near the right edge of the viewport.
  bool get isNearRight => throw _privateConstructorUsedError;

  /// Whether the point is near the top edge of the viewport.
  bool get isNearTop => throw _privateConstructorUsedError;

  /// Whether the point is near the bottom edge of the viewport.
  bool get isNearBottom => throw _privateConstructorUsedError;

  /// Distance from the nearest edge in pixels.
  ///
  /// This is the minimum distance to any edge that the point is near.
  /// If the point is not near any edge, this should be a large value.
  double get distanceFromEdge => throw _privateConstructorUsedError;

  /// Threshold distance that determines "nearness" to an edge.
  ///
  /// Points within this distance from an edge are considered "near" that edge.
  /// This threshold is typically configurable and independent of zoom level.
  double get threshold => throw _privateConstructorUsedError;

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
      double distanceFromEdge,
      double threshold});
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
    Object? threshold = null,
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
      threshold: null == threshold
          ? _value.threshold
          : threshold // ignore: cast_nullable_to_non_nullable
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
      double distanceFromEdge,
      double threshold});
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
    Object? threshold = null,
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
      threshold: null == threshold
          ? _value.threshold
          : threshold // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$BorderProximityImpl extends _BorderProximity {
  const _$BorderProximityImpl(
      {this.isNearLeft = false,
      this.isNearRight = false,
      this.isNearTop = false,
      this.isNearBottom = false,
      this.distanceFromEdge = double.infinity,
      this.threshold = 50.0})
      : super._();

  /// Whether the point is near the left edge of the viewport.
  @override
  @JsonKey()
  final bool isNearLeft;

  /// Whether the point is near the right edge of the viewport.
  @override
  @JsonKey()
  final bool isNearRight;

  /// Whether the point is near the top edge of the viewport.
  @override
  @JsonKey()
  final bool isNearTop;

  /// Whether the point is near the bottom edge of the viewport.
  @override
  @JsonKey()
  final bool isNearBottom;

  /// Distance from the nearest edge in pixels.
  ///
  /// This is the minimum distance to any edge that the point is near.
  /// If the point is not near any edge, this should be a large value.
  @override
  @JsonKey()
  final double distanceFromEdge;

  /// Threshold distance that determines "nearness" to an edge.
  ///
  /// Points within this distance from an edge are considered "near" that edge.
  /// This threshold is typically configurable and independent of zoom level.
  @override
  @JsonKey()
  final double threshold;

  @override
  String toString() {
    return 'BorderProximity(isNearLeft: $isNearLeft, isNearRight: $isNearRight, isNearTop: $isNearTop, isNearBottom: $isNearBottom, distanceFromEdge: $distanceFromEdge, threshold: $threshold)';
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
                other.distanceFromEdge == distanceFromEdge) &&
            (identical(other.threshold, threshold) ||
                other.threshold == threshold));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isNearLeft, isNearRight,
      isNearTop, isNearBottom, distanceFromEdge, threshold);

  /// Create a copy of BorderProximity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BorderProximityImplCopyWith<_$BorderProximityImpl> get copyWith =>
      __$$BorderProximityImplCopyWithImpl<_$BorderProximityImpl>(
          this, _$identity);
}

abstract class _BorderProximity extends BorderProximity {
  const factory _BorderProximity(
      {final bool isNearLeft,
      final bool isNearRight,
      final bool isNearTop,
      final bool isNearBottom,
      final double distanceFromEdge,
      final double threshold}) = _$BorderProximityImpl;
  const _BorderProximity._() : super._();

  /// Whether the point is near the left edge of the viewport.
  @override
  bool get isNearLeft;

  /// Whether the point is near the right edge of the viewport.
  @override
  bool get isNearRight;

  /// Whether the point is near the top edge of the viewport.
  @override
  bool get isNearTop;

  /// Whether the point is near the bottom edge of the viewport.
  @override
  bool get isNearBottom;

  /// Distance from the nearest edge in pixels.
  ///
  /// This is the minimum distance to any edge that the point is near.
  /// If the point is not near any edge, this should be a large value.
  @override
  double get distanceFromEdge;

  /// Threshold distance that determines "nearness" to an edge.
  ///
  /// Points within this distance from an edge are considered "near" that edge.
  /// This threshold is typically configurable and independent of zoom level.
  @override
  double get threshold;

  /// Create a copy of BorderProximity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BorderProximityImplCopyWith<_$BorderProximityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
