// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'zoom_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ZoomState {
  double get currentScale => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isOverscrolled, double currentScale) initial,
    required TResult Function(
            bool isOverscrolled, double currentScale, Offset focalPoint)
        zooming,
    required TResult Function(
            double currentScale, double targetScale, double progress)
        bouncingBack,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isOverscrolled, double currentScale)? initial,
    TResult? Function(
            bool isOverscrolled, double currentScale, Offset focalPoint)?
        zooming,
    TResult? Function(double currentScale, double targetScale, double progress)?
        bouncingBack,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isOverscrolled, double currentScale)? initial,
    TResult Function(
            bool isOverscrolled, double currentScale, Offset focalPoint)?
        zooming,
    TResult Function(double currentScale, double targetScale, double progress)?
        bouncingBack,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Zooming value) zooming,
    required TResult Function(_BouncingBack value) bouncingBack,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Zooming value)? zooming,
    TResult? Function(_BouncingBack value)? bouncingBack,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Zooming value)? zooming,
    TResult Function(_BouncingBack value)? bouncingBack,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ZoomState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ZoomStateCopyWith<ZoomState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZoomStateCopyWith<$Res> {
  factory $ZoomStateCopyWith(ZoomState value, $Res Function(ZoomState) then) =
      _$ZoomStateCopyWithImpl<$Res, ZoomState>;
  @useResult
  $Res call({double currentScale});
}

/// @nodoc
class _$ZoomStateCopyWithImpl<$Res, $Val extends ZoomState>
    implements $ZoomStateCopyWith<$Res> {
  _$ZoomStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ZoomState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentScale = null,
  }) {
    return _then(_value.copyWith(
      currentScale: null == currentScale
          ? _value.currentScale
          : currentScale // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $ZoomStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isOverscrolled, double currentScale});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ZoomStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ZoomState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOverscrolled = null,
    Object? currentScale = null,
  }) {
    return _then(_$InitialImpl(
      isOverscrolled: null == isOverscrolled
          ? _value.isOverscrolled
          : isOverscrolled // ignore: cast_nullable_to_non_nullable
              as bool,
      currentScale: null == currentScale
          ? _value.currentScale
          : currentScale // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl({this.isOverscrolled = false, this.currentScale = 1.0});

  @override
  @JsonKey()
  final bool isOverscrolled;
  @override
  @JsonKey()
  final double currentScale;

  @override
  String toString() {
    return 'ZoomState.initial(isOverscrolled: $isOverscrolled, currentScale: $currentScale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isOverscrolled, isOverscrolled) ||
                other.isOverscrolled == isOverscrolled) &&
            (identical(other.currentScale, currentScale) ||
                other.currentScale == currentScale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isOverscrolled, currentScale);

  /// Create a copy of ZoomState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isOverscrolled, double currentScale) initial,
    required TResult Function(
            bool isOverscrolled, double currentScale, Offset focalPoint)
        zooming,
    required TResult Function(
            double currentScale, double targetScale, double progress)
        bouncingBack,
  }) {
    return initial(isOverscrolled, currentScale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isOverscrolled, double currentScale)? initial,
    TResult? Function(
            bool isOverscrolled, double currentScale, Offset focalPoint)?
        zooming,
    TResult? Function(double currentScale, double targetScale, double progress)?
        bouncingBack,
  }) {
    return initial?.call(isOverscrolled, currentScale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isOverscrolled, double currentScale)? initial,
    TResult Function(
            bool isOverscrolled, double currentScale, Offset focalPoint)?
        zooming,
    TResult Function(double currentScale, double targetScale, double progress)?
        bouncingBack,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isOverscrolled, currentScale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Zooming value) zooming,
    required TResult Function(_BouncingBack value) bouncingBack,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Zooming value)? zooming,
    TResult? Function(_BouncingBack value)? bouncingBack,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Zooming value)? zooming,
    TResult Function(_BouncingBack value)? bouncingBack,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ZoomState {
  const factory _Initial(
      {final bool isOverscrolled, final double currentScale}) = _$InitialImpl;

  bool get isOverscrolled;
  @override
  double get currentScale;

  /// Create a copy of ZoomState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ZoomingImplCopyWith<$Res>
    implements $ZoomStateCopyWith<$Res> {
  factory _$$ZoomingImplCopyWith(
          _$ZoomingImpl value, $Res Function(_$ZoomingImpl) then) =
      __$$ZoomingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isOverscrolled, double currentScale, Offset focalPoint});
}

/// @nodoc
class __$$ZoomingImplCopyWithImpl<$Res>
    extends _$ZoomStateCopyWithImpl<$Res, _$ZoomingImpl>
    implements _$$ZoomingImplCopyWith<$Res> {
  __$$ZoomingImplCopyWithImpl(
      _$ZoomingImpl _value, $Res Function(_$ZoomingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ZoomState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOverscrolled = null,
    Object? currentScale = null,
    Object? focalPoint = null,
  }) {
    return _then(_$ZoomingImpl(
      isOverscrolled: null == isOverscrolled
          ? _value.isOverscrolled
          : isOverscrolled // ignore: cast_nullable_to_non_nullable
              as bool,
      currentScale: null == currentScale
          ? _value.currentScale
          : currentScale // ignore: cast_nullable_to_non_nullable
              as double,
      focalPoint: null == focalPoint
          ? _value.focalPoint
          : focalPoint // ignore: cast_nullable_to_non_nullable
              as Offset,
    ));
  }
}

/// @nodoc

class _$ZoomingImpl implements _Zooming {
  const _$ZoomingImpl(
      {required this.isOverscrolled,
      required this.currentScale,
      required this.focalPoint});

  @override
  final bool isOverscrolled;
  @override
  final double currentScale;
  @override
  final Offset focalPoint;

  @override
  String toString() {
    return 'ZoomState.zooming(isOverscrolled: $isOverscrolled, currentScale: $currentScale, focalPoint: $focalPoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZoomingImpl &&
            (identical(other.isOverscrolled, isOverscrolled) ||
                other.isOverscrolled == isOverscrolled) &&
            (identical(other.currentScale, currentScale) ||
                other.currentScale == currentScale) &&
            (identical(other.focalPoint, focalPoint) ||
                other.focalPoint == focalPoint));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isOverscrolled, currentScale, focalPoint);

  /// Create a copy of ZoomState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ZoomingImplCopyWith<_$ZoomingImpl> get copyWith =>
      __$$ZoomingImplCopyWithImpl<_$ZoomingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isOverscrolled, double currentScale) initial,
    required TResult Function(
            bool isOverscrolled, double currentScale, Offset focalPoint)
        zooming,
    required TResult Function(
            double currentScale, double targetScale, double progress)
        bouncingBack,
  }) {
    return zooming(isOverscrolled, currentScale, focalPoint);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isOverscrolled, double currentScale)? initial,
    TResult? Function(
            bool isOverscrolled, double currentScale, Offset focalPoint)?
        zooming,
    TResult? Function(double currentScale, double targetScale, double progress)?
        bouncingBack,
  }) {
    return zooming?.call(isOverscrolled, currentScale, focalPoint);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isOverscrolled, double currentScale)? initial,
    TResult Function(
            bool isOverscrolled, double currentScale, Offset focalPoint)?
        zooming,
    TResult Function(double currentScale, double targetScale, double progress)?
        bouncingBack,
    required TResult orElse(),
  }) {
    if (zooming != null) {
      return zooming(isOverscrolled, currentScale, focalPoint);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Zooming value) zooming,
    required TResult Function(_BouncingBack value) bouncingBack,
  }) {
    return zooming(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Zooming value)? zooming,
    TResult? Function(_BouncingBack value)? bouncingBack,
  }) {
    return zooming?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Zooming value)? zooming,
    TResult Function(_BouncingBack value)? bouncingBack,
    required TResult orElse(),
  }) {
    if (zooming != null) {
      return zooming(this);
    }
    return orElse();
  }
}

abstract class _Zooming implements ZoomState {
  const factory _Zooming(
      {required final bool isOverscrolled,
      required final double currentScale,
      required final Offset focalPoint}) = _$ZoomingImpl;

  bool get isOverscrolled;
  @override
  double get currentScale;
  Offset get focalPoint;

  /// Create a copy of ZoomState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ZoomingImplCopyWith<_$ZoomingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BouncingBackImplCopyWith<$Res>
    implements $ZoomStateCopyWith<$Res> {
  factory _$$BouncingBackImplCopyWith(
          _$BouncingBackImpl value, $Res Function(_$BouncingBackImpl) then) =
      __$$BouncingBackImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double currentScale, double targetScale, double progress});
}

/// @nodoc
class __$$BouncingBackImplCopyWithImpl<$Res>
    extends _$ZoomStateCopyWithImpl<$Res, _$BouncingBackImpl>
    implements _$$BouncingBackImplCopyWith<$Res> {
  __$$BouncingBackImplCopyWithImpl(
      _$BouncingBackImpl _value, $Res Function(_$BouncingBackImpl) _then)
      : super(_value, _then);

  /// Create a copy of ZoomState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentScale = null,
    Object? targetScale = null,
    Object? progress = null,
  }) {
    return _then(_$BouncingBackImpl(
      currentScale: null == currentScale
          ? _value.currentScale
          : currentScale // ignore: cast_nullable_to_non_nullable
              as double,
      targetScale: null == targetScale
          ? _value.targetScale
          : targetScale // ignore: cast_nullable_to_non_nullable
              as double,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$BouncingBackImpl implements _BouncingBack {
  const _$BouncingBackImpl(
      {required this.currentScale,
      required this.targetScale,
      required this.progress});

  @override
  final double currentScale;
  @override
  final double targetScale;
  @override
  final double progress;

  @override
  String toString() {
    return 'ZoomState.bouncingBack(currentScale: $currentScale, targetScale: $targetScale, progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BouncingBackImpl &&
            (identical(other.currentScale, currentScale) ||
                other.currentScale == currentScale) &&
            (identical(other.targetScale, targetScale) ||
                other.targetScale == targetScale) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, currentScale, targetScale, progress);

  /// Create a copy of ZoomState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BouncingBackImplCopyWith<_$BouncingBackImpl> get copyWith =>
      __$$BouncingBackImplCopyWithImpl<_$BouncingBackImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isOverscrolled, double currentScale) initial,
    required TResult Function(
            bool isOverscrolled, double currentScale, Offset focalPoint)
        zooming,
    required TResult Function(
            double currentScale, double targetScale, double progress)
        bouncingBack,
  }) {
    return bouncingBack(currentScale, targetScale, progress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isOverscrolled, double currentScale)? initial,
    TResult? Function(
            bool isOverscrolled, double currentScale, Offset focalPoint)?
        zooming,
    TResult? Function(double currentScale, double targetScale, double progress)?
        bouncingBack,
  }) {
    return bouncingBack?.call(currentScale, targetScale, progress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isOverscrolled, double currentScale)? initial,
    TResult Function(
            bool isOverscrolled, double currentScale, Offset focalPoint)?
        zooming,
    TResult Function(double currentScale, double targetScale, double progress)?
        bouncingBack,
    required TResult orElse(),
  }) {
    if (bouncingBack != null) {
      return bouncingBack(currentScale, targetScale, progress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Zooming value) zooming,
    required TResult Function(_BouncingBack value) bouncingBack,
  }) {
    return bouncingBack(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Zooming value)? zooming,
    TResult? Function(_BouncingBack value)? bouncingBack,
  }) {
    return bouncingBack?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Zooming value)? zooming,
    TResult Function(_BouncingBack value)? bouncingBack,
    required TResult orElse(),
  }) {
    if (bouncingBack != null) {
      return bouncingBack(this);
    }
    return orElse();
  }
}

abstract class _BouncingBack implements ZoomState {
  const factory _BouncingBack(
      {required final double currentScale,
      required final double targetScale,
      required final double progress}) = _$BouncingBackImpl;

  @override
  double get currentScale;
  double get targetScale;
  double get progress;

  /// Create a copy of ZoomState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BouncingBackImplCopyWith<_$BouncingBackImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
