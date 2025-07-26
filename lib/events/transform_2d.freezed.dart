// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transform_2d.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Transform2D {
  /// Scale factor (1.0 = no scaling, 2.0 = 2x zoom, 0.5 = 50% zoom)
  double get scale => throw _privateConstructorUsedError;

  /// Translation offset in pixels
  Offset get translation => throw _privateConstructorUsedError;

  /// Rotation angle in radians
  double get rotation => throw _privateConstructorUsedError;

  /// Create a copy of Transform2D
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $Transform2DCopyWith<Transform2D> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Transform2DCopyWith<$Res> {
  factory $Transform2DCopyWith(
          Transform2D value, $Res Function(Transform2D) then) =
      _$Transform2DCopyWithImpl<$Res, Transform2D>;
  @useResult
  $Res call({double scale, Offset translation, double rotation});
}

/// @nodoc
class _$Transform2DCopyWithImpl<$Res, $Val extends Transform2D>
    implements $Transform2DCopyWith<$Res> {
  _$Transform2DCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Transform2D
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scale = null,
    Object? translation = null,
    Object? rotation = null,
  }) {
    return _then(_value.copyWith(
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double,
      translation: null == translation
          ? _value.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as Offset,
      rotation: null == rotation
          ? _value.rotation
          : rotation // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$Transform2DImplCopyWith<$Res>
    implements $Transform2DCopyWith<$Res> {
  factory _$$Transform2DImplCopyWith(
          _$Transform2DImpl value, $Res Function(_$Transform2DImpl) then) =
      __$$Transform2DImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double scale, Offset translation, double rotation});
}

/// @nodoc
class __$$Transform2DImplCopyWithImpl<$Res>
    extends _$Transform2DCopyWithImpl<$Res, _$Transform2DImpl>
    implements _$$Transform2DImplCopyWith<$Res> {
  __$$Transform2DImplCopyWithImpl(
      _$Transform2DImpl _value, $Res Function(_$Transform2DImpl) _then)
      : super(_value, _then);

  /// Create a copy of Transform2D
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scale = null,
    Object? translation = null,
    Object? rotation = null,
  }) {
    return _then(_$Transform2DImpl(
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double,
      translation: null == translation
          ? _value.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as Offset,
      rotation: null == rotation
          ? _value.rotation
          : rotation // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$Transform2DImpl extends _Transform2D {
  const _$Transform2DImpl(
      {this.scale = 1.0, this.translation = Offset.zero, this.rotation = 0.0})
      : super._();

  /// Scale factor (1.0 = no scaling, 2.0 = 2x zoom, 0.5 = 50% zoom)
  @override
  @JsonKey()
  final double scale;

  /// Translation offset in pixels
  @override
  @JsonKey()
  final Offset translation;

  /// Rotation angle in radians
  @override
  @JsonKey()
  final double rotation;

  @override
  String toString() {
    return 'Transform2D(scale: $scale, translation: $translation, rotation: $rotation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Transform2DImpl &&
            (identical(other.scale, scale) || other.scale == scale) &&
            (identical(other.translation, translation) ||
                other.translation == translation) &&
            (identical(other.rotation, rotation) ||
                other.rotation == rotation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, scale, translation, rotation);

  /// Create a copy of Transform2D
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$Transform2DImplCopyWith<_$Transform2DImpl> get copyWith =>
      __$$Transform2DImplCopyWithImpl<_$Transform2DImpl>(this, _$identity);
}

abstract class _Transform2D extends Transform2D {
  const factory _Transform2D(
      {final double scale,
      final Offset translation,
      final double rotation}) = _$Transform2DImpl;
  const _Transform2D._() : super._();

  /// Scale factor (1.0 = no scaling, 2.0 = 2x zoom, 0.5 = 50% zoom)
  @override
  double get scale;

  /// Translation offset in pixels
  @override
  Offset get translation;

  /// Rotation angle in radians
  @override
  double get rotation;

  /// Create a copy of Transform2D
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$Transform2DImplCopyWith<_$Transform2DImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
