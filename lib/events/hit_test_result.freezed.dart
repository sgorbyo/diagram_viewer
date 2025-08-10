// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hit_test_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HitTestResult {
  DiagramObjectEntity get object => throw _privateConstructorUsedError;
  double get distanceFromCenter =>
      throw _privateConstructorUsedError; // Distanza dal centro dell'oggetto
  Offset get hitPoint => throw _privateConstructorUsedError;

  /// Create a copy of HitTestResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HitTestResultCopyWith<HitTestResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HitTestResultCopyWith<$Res> {
  factory $HitTestResultCopyWith(
          HitTestResult value, $Res Function(HitTestResult) then) =
      _$HitTestResultCopyWithImpl<$Res, HitTestResult>;
  @useResult
  $Res call(
      {DiagramObjectEntity object, double distanceFromCenter, Offset hitPoint});
}

/// @nodoc
class _$HitTestResultCopyWithImpl<$Res, $Val extends HitTestResult>
    implements $HitTestResultCopyWith<$Res> {
  _$HitTestResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HitTestResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? object = null,
    Object? distanceFromCenter = null,
    Object? hitPoint = null,
  }) {
    return _then(_value.copyWith(
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as DiagramObjectEntity,
      distanceFromCenter: null == distanceFromCenter
          ? _value.distanceFromCenter
          : distanceFromCenter // ignore: cast_nullable_to_non_nullable
              as double,
      hitPoint: null == hitPoint
          ? _value.hitPoint
          : hitPoint // ignore: cast_nullable_to_non_nullable
              as Offset,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HitTestResultImplCopyWith<$Res>
    implements $HitTestResultCopyWith<$Res> {
  factory _$$HitTestResultImplCopyWith(
          _$HitTestResultImpl value, $Res Function(_$HitTestResultImpl) then) =
      __$$HitTestResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DiagramObjectEntity object, double distanceFromCenter, Offset hitPoint});
}

/// @nodoc
class __$$HitTestResultImplCopyWithImpl<$Res>
    extends _$HitTestResultCopyWithImpl<$Res, _$HitTestResultImpl>
    implements _$$HitTestResultImplCopyWith<$Res> {
  __$$HitTestResultImplCopyWithImpl(
      _$HitTestResultImpl _value, $Res Function(_$HitTestResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of HitTestResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? object = null,
    Object? distanceFromCenter = null,
    Object? hitPoint = null,
  }) {
    return _then(_$HitTestResultImpl(
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as DiagramObjectEntity,
      distanceFromCenter: null == distanceFromCenter
          ? _value.distanceFromCenter
          : distanceFromCenter // ignore: cast_nullable_to_non_nullable
              as double,
      hitPoint: null == hitPoint
          ? _value.hitPoint
          : hitPoint // ignore: cast_nullable_to_non_nullable
              as Offset,
    ));
  }
}

/// @nodoc

class _$HitTestResultImpl implements _HitTestResult {
  const _$HitTestResultImpl(
      {required this.object,
      required this.distanceFromCenter,
      required this.hitPoint});

  @override
  final DiagramObjectEntity object;
  @override
  final double distanceFromCenter;
// Distanza dal centro dell'oggetto
  @override
  final Offset hitPoint;

  @override
  String toString() {
    return 'HitTestResult(object: $object, distanceFromCenter: $distanceFromCenter, hitPoint: $hitPoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HitTestResultImpl &&
            (identical(other.object, object) || other.object == object) &&
            (identical(other.distanceFromCenter, distanceFromCenter) ||
                other.distanceFromCenter == distanceFromCenter) &&
            (identical(other.hitPoint, hitPoint) ||
                other.hitPoint == hitPoint));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, object, distanceFromCenter, hitPoint);

  /// Create a copy of HitTestResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HitTestResultImplCopyWith<_$HitTestResultImpl> get copyWith =>
      __$$HitTestResultImplCopyWithImpl<_$HitTestResultImpl>(this, _$identity);
}

abstract class _HitTestResult implements HitTestResult {
  const factory _HitTestResult(
      {required final DiagramObjectEntity object,
      required final double distanceFromCenter,
      required final Offset hitPoint}) = _$HitTestResultImpl;

  @override
  DiagramObjectEntity get object;
  @override
  double get distanceFromCenter; // Distanza dal centro dell'oggetto
  @override
  Offset get hitPoint;

  /// Create a copy of HitTestResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HitTestResultImplCopyWith<_$HitTestResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
