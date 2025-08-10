// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transform_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransformState {
  Transform2D get transform => throw _privateConstructorUsedError;
  Rect get diagramRect => throw _privateConstructorUsedError;
  Size get viewportSize => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Transform2D transform, Rect diagramRect, Size viewportSize)
        initial,
    required TResult Function(
            Transform2D transform, Rect diagramRect, Size viewportSize)
        updated,
    required TResult Function(
            Transform2D transform,
            Transform2D targetTransform,
            double progress,
            Rect diagramRect,
            Size viewportSize)
        animating,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Transform2D transform, Rect diagramRect, Size viewportSize)?
        initial,
    TResult? Function(
            Transform2D transform, Rect diagramRect, Size viewportSize)?
        updated,
    TResult? Function(Transform2D transform, Transform2D targetTransform,
            double progress, Rect diagramRect, Size viewportSize)?
        animating,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Transform2D transform, Rect diagramRect, Size viewportSize)?
        initial,
    TResult Function(
            Transform2D transform, Rect diagramRect, Size viewportSize)?
        updated,
    TResult Function(Transform2D transform, Transform2D targetTransform,
            double progress, Rect diagramRect, Size viewportSize)?
        animating,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Updated value) updated,
    required TResult Function(_Animating value) animating,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Updated value)? updated,
    TResult? Function(_Animating value)? animating,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Updated value)? updated,
    TResult Function(_Animating value)? animating,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of TransformState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransformStateCopyWith<TransformState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransformStateCopyWith<$Res> {
  factory $TransformStateCopyWith(
          TransformState value, $Res Function(TransformState) then) =
      _$TransformStateCopyWithImpl<$Res, TransformState>;
  @useResult
  $Res call({Transform2D transform, Rect diagramRect, Size viewportSize});

  $Transform2DCopyWith<$Res> get transform;
}

/// @nodoc
class _$TransformStateCopyWithImpl<$Res, $Val extends TransformState>
    implements $TransformStateCopyWith<$Res> {
  _$TransformStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransformState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transform = null,
    Object? diagramRect = null,
    Object? viewportSize = null,
  }) {
    return _then(_value.copyWith(
      transform: null == transform
          ? _value.transform
          : transform // ignore: cast_nullable_to_non_nullable
              as Transform2D,
      diagramRect: null == diagramRect
          ? _value.diagramRect
          : diagramRect // ignore: cast_nullable_to_non_nullable
              as Rect,
      viewportSize: null == viewportSize
          ? _value.viewportSize
          : viewportSize // ignore: cast_nullable_to_non_nullable
              as Size,
    ) as $Val);
  }

  /// Create a copy of TransformState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Transform2DCopyWith<$Res> get transform {
    return $Transform2DCopyWith<$Res>(_value.transform, (value) {
      return _then(_value.copyWith(transform: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $TransformStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Transform2D transform, Rect diagramRect, Size viewportSize});

  @override
  $Transform2DCopyWith<$Res> get transform;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$TransformStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransformState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transform = null,
    Object? diagramRect = null,
    Object? viewportSize = null,
  }) {
    return _then(_$InitialImpl(
      transform: null == transform
          ? _value.transform
          : transform // ignore: cast_nullable_to_non_nullable
              as Transform2D,
      diagramRect: null == diagramRect
          ? _value.diagramRect
          : diagramRect // ignore: cast_nullable_to_non_nullable
              as Rect,
      viewportSize: null == viewportSize
          ? _value.viewportSize
          : viewportSize // ignore: cast_nullable_to_non_nullable
              as Size,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.transform = const Transform2D(),
      this.diagramRect = Rect.zero,
      this.viewportSize = Size.zero});

  @override
  @JsonKey()
  final Transform2D transform;
  @override
  @JsonKey()
  final Rect diagramRect;
  @override
  @JsonKey()
  final Size viewportSize;

  @override
  String toString() {
    return 'TransformState.initial(transform: $transform, diagramRect: $diagramRect, viewportSize: $viewportSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.transform, transform) ||
                other.transform == transform) &&
            (identical(other.diagramRect, diagramRect) ||
                other.diagramRect == diagramRect) &&
            (identical(other.viewportSize, viewportSize) ||
                other.viewportSize == viewportSize));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, transform, diagramRect, viewportSize);

  /// Create a copy of TransformState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Transform2D transform, Rect diagramRect, Size viewportSize)
        initial,
    required TResult Function(
            Transform2D transform, Rect diagramRect, Size viewportSize)
        updated,
    required TResult Function(
            Transform2D transform,
            Transform2D targetTransform,
            double progress,
            Rect diagramRect,
            Size viewportSize)
        animating,
  }) {
    return initial(transform, diagramRect, viewportSize);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Transform2D transform, Rect diagramRect, Size viewportSize)?
        initial,
    TResult? Function(
            Transform2D transform, Rect diagramRect, Size viewportSize)?
        updated,
    TResult? Function(Transform2D transform, Transform2D targetTransform,
            double progress, Rect diagramRect, Size viewportSize)?
        animating,
  }) {
    return initial?.call(transform, diagramRect, viewportSize);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Transform2D transform, Rect diagramRect, Size viewportSize)?
        initial,
    TResult Function(
            Transform2D transform, Rect diagramRect, Size viewportSize)?
        updated,
    TResult Function(Transform2D transform, Transform2D targetTransform,
            double progress, Rect diagramRect, Size viewportSize)?
        animating,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(transform, diagramRect, viewportSize);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Updated value) updated,
    required TResult Function(_Animating value) animating,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Updated value)? updated,
    TResult? Function(_Animating value)? animating,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Updated value)? updated,
    TResult Function(_Animating value)? animating,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements TransformState {
  const factory _Initial(
      {final Transform2D transform,
      final Rect diagramRect,
      final Size viewportSize}) = _$InitialImpl;

  @override
  Transform2D get transform;
  @override
  Rect get diagramRect;
  @override
  Size get viewportSize;

  /// Create a copy of TransformState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatedImplCopyWith<$Res>
    implements $TransformStateCopyWith<$Res> {
  factory _$$UpdatedImplCopyWith(
          _$UpdatedImpl value, $Res Function(_$UpdatedImpl) then) =
      __$$UpdatedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Transform2D transform, Rect diagramRect, Size viewportSize});

  @override
  $Transform2DCopyWith<$Res> get transform;
}

/// @nodoc
class __$$UpdatedImplCopyWithImpl<$Res>
    extends _$TransformStateCopyWithImpl<$Res, _$UpdatedImpl>
    implements _$$UpdatedImplCopyWith<$Res> {
  __$$UpdatedImplCopyWithImpl(
      _$UpdatedImpl _value, $Res Function(_$UpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransformState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transform = null,
    Object? diagramRect = null,
    Object? viewportSize = null,
  }) {
    return _then(_$UpdatedImpl(
      transform: null == transform
          ? _value.transform
          : transform // ignore: cast_nullable_to_non_nullable
              as Transform2D,
      diagramRect: null == diagramRect
          ? _value.diagramRect
          : diagramRect // ignore: cast_nullable_to_non_nullable
              as Rect,
      viewportSize: null == viewportSize
          ? _value.viewportSize
          : viewportSize // ignore: cast_nullable_to_non_nullable
              as Size,
    ));
  }
}

/// @nodoc

class _$UpdatedImpl implements _Updated {
  const _$UpdatedImpl(
      {required this.transform,
      required this.diagramRect,
      required this.viewportSize});

  @override
  final Transform2D transform;
  @override
  final Rect diagramRect;
  @override
  final Size viewportSize;

  @override
  String toString() {
    return 'TransformState.updated(transform: $transform, diagramRect: $diagramRect, viewportSize: $viewportSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatedImpl &&
            (identical(other.transform, transform) ||
                other.transform == transform) &&
            (identical(other.diagramRect, diagramRect) ||
                other.diagramRect == diagramRect) &&
            (identical(other.viewportSize, viewportSize) ||
                other.viewportSize == viewportSize));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, transform, diagramRect, viewportSize);

  /// Create a copy of TransformState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatedImplCopyWith<_$UpdatedImpl> get copyWith =>
      __$$UpdatedImplCopyWithImpl<_$UpdatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Transform2D transform, Rect diagramRect, Size viewportSize)
        initial,
    required TResult Function(
            Transform2D transform, Rect diagramRect, Size viewportSize)
        updated,
    required TResult Function(
            Transform2D transform,
            Transform2D targetTransform,
            double progress,
            Rect diagramRect,
            Size viewportSize)
        animating,
  }) {
    return updated(transform, diagramRect, viewportSize);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Transform2D transform, Rect diagramRect, Size viewportSize)?
        initial,
    TResult? Function(
            Transform2D transform, Rect diagramRect, Size viewportSize)?
        updated,
    TResult? Function(Transform2D transform, Transform2D targetTransform,
            double progress, Rect diagramRect, Size viewportSize)?
        animating,
  }) {
    return updated?.call(transform, diagramRect, viewportSize);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Transform2D transform, Rect diagramRect, Size viewportSize)?
        initial,
    TResult Function(
            Transform2D transform, Rect diagramRect, Size viewportSize)?
        updated,
    TResult Function(Transform2D transform, Transform2D targetTransform,
            double progress, Rect diagramRect, Size viewportSize)?
        animating,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(transform, diagramRect, viewportSize);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Updated value) updated,
    required TResult Function(_Animating value) animating,
  }) {
    return updated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Updated value)? updated,
    TResult? Function(_Animating value)? animating,
  }) {
    return updated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Updated value)? updated,
    TResult Function(_Animating value)? animating,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(this);
    }
    return orElse();
  }
}

abstract class _Updated implements TransformState {
  const factory _Updated(
      {required final Transform2D transform,
      required final Rect diagramRect,
      required final Size viewportSize}) = _$UpdatedImpl;

  @override
  Transform2D get transform;
  @override
  Rect get diagramRect;
  @override
  Size get viewportSize;

  /// Create a copy of TransformState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatedImplCopyWith<_$UpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AnimatingImplCopyWith<$Res>
    implements $TransformStateCopyWith<$Res> {
  factory _$$AnimatingImplCopyWith(
          _$AnimatingImpl value, $Res Function(_$AnimatingImpl) then) =
      __$$AnimatingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Transform2D transform,
      Transform2D targetTransform,
      double progress,
      Rect diagramRect,
      Size viewportSize});

  @override
  $Transform2DCopyWith<$Res> get transform;
  $Transform2DCopyWith<$Res> get targetTransform;
}

/// @nodoc
class __$$AnimatingImplCopyWithImpl<$Res>
    extends _$TransformStateCopyWithImpl<$Res, _$AnimatingImpl>
    implements _$$AnimatingImplCopyWith<$Res> {
  __$$AnimatingImplCopyWithImpl(
      _$AnimatingImpl _value, $Res Function(_$AnimatingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransformState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transform = null,
    Object? targetTransform = null,
    Object? progress = null,
    Object? diagramRect = null,
    Object? viewportSize = null,
  }) {
    return _then(_$AnimatingImpl(
      transform: null == transform
          ? _value.transform
          : transform // ignore: cast_nullable_to_non_nullable
              as Transform2D,
      targetTransform: null == targetTransform
          ? _value.targetTransform
          : targetTransform // ignore: cast_nullable_to_non_nullable
              as Transform2D,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      diagramRect: null == diagramRect
          ? _value.diagramRect
          : diagramRect // ignore: cast_nullable_to_non_nullable
              as Rect,
      viewportSize: null == viewportSize
          ? _value.viewportSize
          : viewportSize // ignore: cast_nullable_to_non_nullable
              as Size,
    ));
  }

  /// Create a copy of TransformState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Transform2DCopyWith<$Res> get targetTransform {
    return $Transform2DCopyWith<$Res>(_value.targetTransform, (value) {
      return _then(_value.copyWith(targetTransform: value));
    });
  }
}

/// @nodoc

class _$AnimatingImpl implements _Animating {
  const _$AnimatingImpl(
      {required this.transform,
      required this.targetTransform,
      required this.progress,
      required this.diagramRect,
      required this.viewportSize});

  @override
  final Transform2D transform;
  @override
  final Transform2D targetTransform;
  @override
  final double progress;
  @override
  final Rect diagramRect;
  @override
  final Size viewportSize;

  @override
  String toString() {
    return 'TransformState.animating(transform: $transform, targetTransform: $targetTransform, progress: $progress, diagramRect: $diagramRect, viewportSize: $viewportSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimatingImpl &&
            (identical(other.transform, transform) ||
                other.transform == transform) &&
            (identical(other.targetTransform, targetTransform) ||
                other.targetTransform == targetTransform) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.diagramRect, diagramRect) ||
                other.diagramRect == diagramRect) &&
            (identical(other.viewportSize, viewportSize) ||
                other.viewportSize == viewportSize));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transform, targetTransform,
      progress, diagramRect, viewportSize);

  /// Create a copy of TransformState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimatingImplCopyWith<_$AnimatingImpl> get copyWith =>
      __$$AnimatingImplCopyWithImpl<_$AnimatingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Transform2D transform, Rect diagramRect, Size viewportSize)
        initial,
    required TResult Function(
            Transform2D transform, Rect diagramRect, Size viewportSize)
        updated,
    required TResult Function(
            Transform2D transform,
            Transform2D targetTransform,
            double progress,
            Rect diagramRect,
            Size viewportSize)
        animating,
  }) {
    return animating(
        transform, targetTransform, progress, diagramRect, viewportSize);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Transform2D transform, Rect diagramRect, Size viewportSize)?
        initial,
    TResult? Function(
            Transform2D transform, Rect diagramRect, Size viewportSize)?
        updated,
    TResult? Function(Transform2D transform, Transform2D targetTransform,
            double progress, Rect diagramRect, Size viewportSize)?
        animating,
  }) {
    return animating?.call(
        transform, targetTransform, progress, diagramRect, viewportSize);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Transform2D transform, Rect diagramRect, Size viewportSize)?
        initial,
    TResult Function(
            Transform2D transform, Rect diagramRect, Size viewportSize)?
        updated,
    TResult Function(Transform2D transform, Transform2D targetTransform,
            double progress, Rect diagramRect, Size viewportSize)?
        animating,
    required TResult orElse(),
  }) {
    if (animating != null) {
      return animating(
          transform, targetTransform, progress, diagramRect, viewportSize);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Updated value) updated,
    required TResult Function(_Animating value) animating,
  }) {
    return animating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Updated value)? updated,
    TResult? Function(_Animating value)? animating,
  }) {
    return animating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Updated value)? updated,
    TResult Function(_Animating value)? animating,
    required TResult orElse(),
  }) {
    if (animating != null) {
      return animating(this);
    }
    return orElse();
  }
}

abstract class _Animating implements TransformState {
  const factory _Animating(
      {required final Transform2D transform,
      required final Transform2D targetTransform,
      required final double progress,
      required final Rect diagramRect,
      required final Size viewportSize}) = _$AnimatingImpl;

  @override
  Transform2D get transform;
  Transform2D get targetTransform;
  double get progress;
  @override
  Rect get diagramRect;
  @override
  Size get viewportSize;

  /// Create a copy of TransformState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnimatingImplCopyWith<_$AnimatingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
