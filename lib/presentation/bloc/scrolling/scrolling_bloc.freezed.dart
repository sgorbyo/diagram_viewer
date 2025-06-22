// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scrolling_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ScrollingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ScaleStartDetails details) startScale,
    required TResult Function(
            ScaleUpdateDetails details, Offset? additionalFocalPoint)
        continueScale,
    required TResult Function(ScaleEndDetails details) endScale,
    required TResult Function(ScaleStartDetails details, Matrix4 matrix)
        restartScale,
    required TResult Function(Size size) viewportChanged,
    required TResult Function(List<DiagramObjectEntity> list) contentChanged,
    required TResult Function() initialToIdleAnimationEnd,
    required TResult Function() outOfBoundsToIdleAnimationEnd,
    required TResult Function(Matrix4 reachedMatrix) inertialAnimationEnd,
    required TResult Function() inertialAnimationStop,
    required TResult Function() scrollingAnimationEnd,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ScaleStartDetails details)? startScale,
    TResult? Function(ScaleUpdateDetails details, Offset? additionalFocalPoint)?
        continueScale,
    TResult? Function(ScaleEndDetails details)? endScale,
    TResult? Function(ScaleStartDetails details, Matrix4 matrix)? restartScale,
    TResult? Function(Size size)? viewportChanged,
    TResult? Function(List<DiagramObjectEntity> list)? contentChanged,
    TResult? Function()? initialToIdleAnimationEnd,
    TResult? Function()? outOfBoundsToIdleAnimationEnd,
    TResult? Function(Matrix4 reachedMatrix)? inertialAnimationEnd,
    TResult? Function()? inertialAnimationStop,
    TResult? Function()? scrollingAnimationEnd,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ScaleStartDetails details)? startScale,
    TResult Function(ScaleUpdateDetails details, Offset? additionalFocalPoint)?
        continueScale,
    TResult Function(ScaleEndDetails details)? endScale,
    TResult Function(ScaleStartDetails details, Matrix4 matrix)? restartScale,
    TResult Function(Size size)? viewportChanged,
    TResult Function(List<DiagramObjectEntity> list)? contentChanged,
    TResult Function()? initialToIdleAnimationEnd,
    TResult Function()? outOfBoundsToIdleAnimationEnd,
    TResult Function(Matrix4 reachedMatrix)? inertialAnimationEnd,
    TResult Function()? inertialAnimationStop,
    TResult Function()? scrollingAnimationEnd,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartScale value) startScale,
    required TResult Function(_ContinueScale value) continueScale,
    required TResult Function(_EndScale value) endScale,
    required TResult Function(_RestartScale value) restartScale,
    required TResult Function(_ViewportChanged value) viewportChanged,
    required TResult Function(_ContentChanged value) contentChanged,
    required TResult Function(_InitialToIdleAnimationEnd value)
        initialToIdleAnimationEnd,
    required TResult Function(_OutOfBoundsToIdleAnimationEnd value)
        outOfBoundsToIdleAnimationEnd,
    required TResult Function(_InertialAnimationEnd value) inertialAnimationEnd,
    required TResult Function(_InertialAnimationStop value)
        inertialAnimationStop,
    required TResult Function(_ScrollingAnimationEnd value)
        scrollingAnimationEnd,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartScale value)? startScale,
    TResult? Function(_ContinueScale value)? continueScale,
    TResult? Function(_EndScale value)? endScale,
    TResult? Function(_RestartScale value)? restartScale,
    TResult? Function(_ViewportChanged value)? viewportChanged,
    TResult? Function(_ContentChanged value)? contentChanged,
    TResult? Function(_InitialToIdleAnimationEnd value)?
        initialToIdleAnimationEnd,
    TResult? Function(_OutOfBoundsToIdleAnimationEnd value)?
        outOfBoundsToIdleAnimationEnd,
    TResult? Function(_InertialAnimationEnd value)? inertialAnimationEnd,
    TResult? Function(_InertialAnimationStop value)? inertialAnimationStop,
    TResult? Function(_ScrollingAnimationEnd value)? scrollingAnimationEnd,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartScale value)? startScale,
    TResult Function(_ContinueScale value)? continueScale,
    TResult Function(_EndScale value)? endScale,
    TResult Function(_RestartScale value)? restartScale,
    TResult Function(_ViewportChanged value)? viewportChanged,
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_InitialToIdleAnimationEnd value)?
        initialToIdleAnimationEnd,
    TResult Function(_OutOfBoundsToIdleAnimationEnd value)?
        outOfBoundsToIdleAnimationEnd,
    TResult Function(_InertialAnimationEnd value)? inertialAnimationEnd,
    TResult Function(_InertialAnimationStop value)? inertialAnimationStop,
    TResult Function(_ScrollingAnimationEnd value)? scrollingAnimationEnd,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScrollingEventCopyWith<$Res> {
  factory $ScrollingEventCopyWith(
          ScrollingEvent value, $Res Function(ScrollingEvent) then) =
      _$ScrollingEventCopyWithImpl<$Res, ScrollingEvent>;
}

/// @nodoc
class _$ScrollingEventCopyWithImpl<$Res, $Val extends ScrollingEvent>
    implements $ScrollingEventCopyWith<$Res> {
  _$ScrollingEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScrollingEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartScaleImplCopyWith<$Res> {
  factory _$$StartScaleImplCopyWith(
          _$StartScaleImpl value, $Res Function(_$StartScaleImpl) then) =
      __$$StartScaleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ScaleStartDetails details});
}

/// @nodoc
class __$$StartScaleImplCopyWithImpl<$Res>
    extends _$ScrollingEventCopyWithImpl<$Res, _$StartScaleImpl>
    implements _$$StartScaleImplCopyWith<$Res> {
  __$$StartScaleImplCopyWithImpl(
      _$StartScaleImpl _value, $Res Function(_$StartScaleImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScrollingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = null,
  }) {
    return _then(_$StartScaleImpl(
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as ScaleStartDetails,
    ));
  }
}

/// @nodoc

class _$StartScaleImpl implements _StartScale {
  const _$StartScaleImpl({required this.details});

  @override
  final ScaleStartDetails details;

  @override
  String toString() {
    return 'ScrollingEvent.startScale(details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartScaleImpl &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode => Object.hash(runtimeType, details);

  /// Create a copy of ScrollingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartScaleImplCopyWith<_$StartScaleImpl> get copyWith =>
      __$$StartScaleImplCopyWithImpl<_$StartScaleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ScaleStartDetails details) startScale,
    required TResult Function(
            ScaleUpdateDetails details, Offset? additionalFocalPoint)
        continueScale,
    required TResult Function(ScaleEndDetails details) endScale,
    required TResult Function(ScaleStartDetails details, Matrix4 matrix)
        restartScale,
    required TResult Function(Size size) viewportChanged,
    required TResult Function(List<DiagramObjectEntity> list) contentChanged,
    required TResult Function() initialToIdleAnimationEnd,
    required TResult Function() outOfBoundsToIdleAnimationEnd,
    required TResult Function(Matrix4 reachedMatrix) inertialAnimationEnd,
    required TResult Function() inertialAnimationStop,
    required TResult Function() scrollingAnimationEnd,
  }) {
    return startScale(details);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ScaleStartDetails details)? startScale,
    TResult? Function(ScaleUpdateDetails details, Offset? additionalFocalPoint)?
        continueScale,
    TResult? Function(ScaleEndDetails details)? endScale,
    TResult? Function(ScaleStartDetails details, Matrix4 matrix)? restartScale,
    TResult? Function(Size size)? viewportChanged,
    TResult? Function(List<DiagramObjectEntity> list)? contentChanged,
    TResult? Function()? initialToIdleAnimationEnd,
    TResult? Function()? outOfBoundsToIdleAnimationEnd,
    TResult? Function(Matrix4 reachedMatrix)? inertialAnimationEnd,
    TResult? Function()? inertialAnimationStop,
    TResult? Function()? scrollingAnimationEnd,
  }) {
    return startScale?.call(details);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ScaleStartDetails details)? startScale,
    TResult Function(ScaleUpdateDetails details, Offset? additionalFocalPoint)?
        continueScale,
    TResult Function(ScaleEndDetails details)? endScale,
    TResult Function(ScaleStartDetails details, Matrix4 matrix)? restartScale,
    TResult Function(Size size)? viewportChanged,
    TResult Function(List<DiagramObjectEntity> list)? contentChanged,
    TResult Function()? initialToIdleAnimationEnd,
    TResult Function()? outOfBoundsToIdleAnimationEnd,
    TResult Function(Matrix4 reachedMatrix)? inertialAnimationEnd,
    TResult Function()? inertialAnimationStop,
    TResult Function()? scrollingAnimationEnd,
    required TResult orElse(),
  }) {
    if (startScale != null) {
      return startScale(details);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartScale value) startScale,
    required TResult Function(_ContinueScale value) continueScale,
    required TResult Function(_EndScale value) endScale,
    required TResult Function(_RestartScale value) restartScale,
    required TResult Function(_ViewportChanged value) viewportChanged,
    required TResult Function(_ContentChanged value) contentChanged,
    required TResult Function(_InitialToIdleAnimationEnd value)
        initialToIdleAnimationEnd,
    required TResult Function(_OutOfBoundsToIdleAnimationEnd value)
        outOfBoundsToIdleAnimationEnd,
    required TResult Function(_InertialAnimationEnd value) inertialAnimationEnd,
    required TResult Function(_InertialAnimationStop value)
        inertialAnimationStop,
    required TResult Function(_ScrollingAnimationEnd value)
        scrollingAnimationEnd,
  }) {
    return startScale(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartScale value)? startScale,
    TResult? Function(_ContinueScale value)? continueScale,
    TResult? Function(_EndScale value)? endScale,
    TResult? Function(_RestartScale value)? restartScale,
    TResult? Function(_ViewportChanged value)? viewportChanged,
    TResult? Function(_ContentChanged value)? contentChanged,
    TResult? Function(_InitialToIdleAnimationEnd value)?
        initialToIdleAnimationEnd,
    TResult? Function(_OutOfBoundsToIdleAnimationEnd value)?
        outOfBoundsToIdleAnimationEnd,
    TResult? Function(_InertialAnimationEnd value)? inertialAnimationEnd,
    TResult? Function(_InertialAnimationStop value)? inertialAnimationStop,
    TResult? Function(_ScrollingAnimationEnd value)? scrollingAnimationEnd,
  }) {
    return startScale?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartScale value)? startScale,
    TResult Function(_ContinueScale value)? continueScale,
    TResult Function(_EndScale value)? endScale,
    TResult Function(_RestartScale value)? restartScale,
    TResult Function(_ViewportChanged value)? viewportChanged,
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_InitialToIdleAnimationEnd value)?
        initialToIdleAnimationEnd,
    TResult Function(_OutOfBoundsToIdleAnimationEnd value)?
        outOfBoundsToIdleAnimationEnd,
    TResult Function(_InertialAnimationEnd value)? inertialAnimationEnd,
    TResult Function(_InertialAnimationStop value)? inertialAnimationStop,
    TResult Function(_ScrollingAnimationEnd value)? scrollingAnimationEnd,
    required TResult orElse(),
  }) {
    if (startScale != null) {
      return startScale(this);
    }
    return orElse();
  }
}

abstract class _StartScale implements ScrollingEvent {
  const factory _StartScale({required final ScaleStartDetails details}) =
      _$StartScaleImpl;

  ScaleStartDetails get details;

  /// Create a copy of ScrollingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartScaleImplCopyWith<_$StartScaleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ContinueScaleImplCopyWith<$Res> {
  factory _$$ContinueScaleImplCopyWith(
          _$ContinueScaleImpl value, $Res Function(_$ContinueScaleImpl) then) =
      __$$ContinueScaleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ScaleUpdateDetails details, Offset? additionalFocalPoint});
}

/// @nodoc
class __$$ContinueScaleImplCopyWithImpl<$Res>
    extends _$ScrollingEventCopyWithImpl<$Res, _$ContinueScaleImpl>
    implements _$$ContinueScaleImplCopyWith<$Res> {
  __$$ContinueScaleImplCopyWithImpl(
      _$ContinueScaleImpl _value, $Res Function(_$ContinueScaleImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScrollingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = null,
    Object? additionalFocalPoint = freezed,
  }) {
    return _then(_$ContinueScaleImpl(
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as ScaleUpdateDetails,
      additionalFocalPoint: freezed == additionalFocalPoint
          ? _value.additionalFocalPoint
          : additionalFocalPoint // ignore: cast_nullable_to_non_nullable
              as Offset?,
    ));
  }
}

/// @nodoc

class _$ContinueScaleImpl implements _ContinueScale {
  const _$ContinueScaleImpl({required this.details, this.additionalFocalPoint});

  @override
  final ScaleUpdateDetails details;
  @override
  final Offset? additionalFocalPoint;

  @override
  String toString() {
    return 'ScrollingEvent.continueScale(details: $details, additionalFocalPoint: $additionalFocalPoint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContinueScaleImpl &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.additionalFocalPoint, additionalFocalPoint) ||
                other.additionalFocalPoint == additionalFocalPoint));
  }

  @override
  int get hashCode => Object.hash(runtimeType, details, additionalFocalPoint);

  /// Create a copy of ScrollingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContinueScaleImplCopyWith<_$ContinueScaleImpl> get copyWith =>
      __$$ContinueScaleImplCopyWithImpl<_$ContinueScaleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ScaleStartDetails details) startScale,
    required TResult Function(
            ScaleUpdateDetails details, Offset? additionalFocalPoint)
        continueScale,
    required TResult Function(ScaleEndDetails details) endScale,
    required TResult Function(ScaleStartDetails details, Matrix4 matrix)
        restartScale,
    required TResult Function(Size size) viewportChanged,
    required TResult Function(List<DiagramObjectEntity> list) contentChanged,
    required TResult Function() initialToIdleAnimationEnd,
    required TResult Function() outOfBoundsToIdleAnimationEnd,
    required TResult Function(Matrix4 reachedMatrix) inertialAnimationEnd,
    required TResult Function() inertialAnimationStop,
    required TResult Function() scrollingAnimationEnd,
  }) {
    return continueScale(details, additionalFocalPoint);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ScaleStartDetails details)? startScale,
    TResult? Function(ScaleUpdateDetails details, Offset? additionalFocalPoint)?
        continueScale,
    TResult? Function(ScaleEndDetails details)? endScale,
    TResult? Function(ScaleStartDetails details, Matrix4 matrix)? restartScale,
    TResult? Function(Size size)? viewportChanged,
    TResult? Function(List<DiagramObjectEntity> list)? contentChanged,
    TResult? Function()? initialToIdleAnimationEnd,
    TResult? Function()? outOfBoundsToIdleAnimationEnd,
    TResult? Function(Matrix4 reachedMatrix)? inertialAnimationEnd,
    TResult? Function()? inertialAnimationStop,
    TResult? Function()? scrollingAnimationEnd,
  }) {
    return continueScale?.call(details, additionalFocalPoint);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ScaleStartDetails details)? startScale,
    TResult Function(ScaleUpdateDetails details, Offset? additionalFocalPoint)?
        continueScale,
    TResult Function(ScaleEndDetails details)? endScale,
    TResult Function(ScaleStartDetails details, Matrix4 matrix)? restartScale,
    TResult Function(Size size)? viewportChanged,
    TResult Function(List<DiagramObjectEntity> list)? contentChanged,
    TResult Function()? initialToIdleAnimationEnd,
    TResult Function()? outOfBoundsToIdleAnimationEnd,
    TResult Function(Matrix4 reachedMatrix)? inertialAnimationEnd,
    TResult Function()? inertialAnimationStop,
    TResult Function()? scrollingAnimationEnd,
    required TResult orElse(),
  }) {
    if (continueScale != null) {
      return continueScale(details, additionalFocalPoint);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartScale value) startScale,
    required TResult Function(_ContinueScale value) continueScale,
    required TResult Function(_EndScale value) endScale,
    required TResult Function(_RestartScale value) restartScale,
    required TResult Function(_ViewportChanged value) viewportChanged,
    required TResult Function(_ContentChanged value) contentChanged,
    required TResult Function(_InitialToIdleAnimationEnd value)
        initialToIdleAnimationEnd,
    required TResult Function(_OutOfBoundsToIdleAnimationEnd value)
        outOfBoundsToIdleAnimationEnd,
    required TResult Function(_InertialAnimationEnd value) inertialAnimationEnd,
    required TResult Function(_InertialAnimationStop value)
        inertialAnimationStop,
    required TResult Function(_ScrollingAnimationEnd value)
        scrollingAnimationEnd,
  }) {
    return continueScale(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartScale value)? startScale,
    TResult? Function(_ContinueScale value)? continueScale,
    TResult? Function(_EndScale value)? endScale,
    TResult? Function(_RestartScale value)? restartScale,
    TResult? Function(_ViewportChanged value)? viewportChanged,
    TResult? Function(_ContentChanged value)? contentChanged,
    TResult? Function(_InitialToIdleAnimationEnd value)?
        initialToIdleAnimationEnd,
    TResult? Function(_OutOfBoundsToIdleAnimationEnd value)?
        outOfBoundsToIdleAnimationEnd,
    TResult? Function(_InertialAnimationEnd value)? inertialAnimationEnd,
    TResult? Function(_InertialAnimationStop value)? inertialAnimationStop,
    TResult? Function(_ScrollingAnimationEnd value)? scrollingAnimationEnd,
  }) {
    return continueScale?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartScale value)? startScale,
    TResult Function(_ContinueScale value)? continueScale,
    TResult Function(_EndScale value)? endScale,
    TResult Function(_RestartScale value)? restartScale,
    TResult Function(_ViewportChanged value)? viewportChanged,
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_InitialToIdleAnimationEnd value)?
        initialToIdleAnimationEnd,
    TResult Function(_OutOfBoundsToIdleAnimationEnd value)?
        outOfBoundsToIdleAnimationEnd,
    TResult Function(_InertialAnimationEnd value)? inertialAnimationEnd,
    TResult Function(_InertialAnimationStop value)? inertialAnimationStop,
    TResult Function(_ScrollingAnimationEnd value)? scrollingAnimationEnd,
    required TResult orElse(),
  }) {
    if (continueScale != null) {
      return continueScale(this);
    }
    return orElse();
  }
}

abstract class _ContinueScale implements ScrollingEvent {
  const factory _ContinueScale(
      {required final ScaleUpdateDetails details,
      final Offset? additionalFocalPoint}) = _$ContinueScaleImpl;

  ScaleUpdateDetails get details;
  Offset? get additionalFocalPoint;

  /// Create a copy of ScrollingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContinueScaleImplCopyWith<_$ContinueScaleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EndScaleImplCopyWith<$Res> {
  factory _$$EndScaleImplCopyWith(
          _$EndScaleImpl value, $Res Function(_$EndScaleImpl) then) =
      __$$EndScaleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ScaleEndDetails details});
}

/// @nodoc
class __$$EndScaleImplCopyWithImpl<$Res>
    extends _$ScrollingEventCopyWithImpl<$Res, _$EndScaleImpl>
    implements _$$EndScaleImplCopyWith<$Res> {
  __$$EndScaleImplCopyWithImpl(
      _$EndScaleImpl _value, $Res Function(_$EndScaleImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScrollingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = null,
  }) {
    return _then(_$EndScaleImpl(
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as ScaleEndDetails,
    ));
  }
}

/// @nodoc

class _$EndScaleImpl implements _EndScale {
  const _$EndScaleImpl({required this.details});

  @override
  final ScaleEndDetails details;

  @override
  String toString() {
    return 'ScrollingEvent.endScale(details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EndScaleImpl &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode => Object.hash(runtimeType, details);

  /// Create a copy of ScrollingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EndScaleImplCopyWith<_$EndScaleImpl> get copyWith =>
      __$$EndScaleImplCopyWithImpl<_$EndScaleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ScaleStartDetails details) startScale,
    required TResult Function(
            ScaleUpdateDetails details, Offset? additionalFocalPoint)
        continueScale,
    required TResult Function(ScaleEndDetails details) endScale,
    required TResult Function(ScaleStartDetails details, Matrix4 matrix)
        restartScale,
    required TResult Function(Size size) viewportChanged,
    required TResult Function(List<DiagramObjectEntity> list) contentChanged,
    required TResult Function() initialToIdleAnimationEnd,
    required TResult Function() outOfBoundsToIdleAnimationEnd,
    required TResult Function(Matrix4 reachedMatrix) inertialAnimationEnd,
    required TResult Function() inertialAnimationStop,
    required TResult Function() scrollingAnimationEnd,
  }) {
    return endScale(details);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ScaleStartDetails details)? startScale,
    TResult? Function(ScaleUpdateDetails details, Offset? additionalFocalPoint)?
        continueScale,
    TResult? Function(ScaleEndDetails details)? endScale,
    TResult? Function(ScaleStartDetails details, Matrix4 matrix)? restartScale,
    TResult? Function(Size size)? viewportChanged,
    TResult? Function(List<DiagramObjectEntity> list)? contentChanged,
    TResult? Function()? initialToIdleAnimationEnd,
    TResult? Function()? outOfBoundsToIdleAnimationEnd,
    TResult? Function(Matrix4 reachedMatrix)? inertialAnimationEnd,
    TResult? Function()? inertialAnimationStop,
    TResult? Function()? scrollingAnimationEnd,
  }) {
    return endScale?.call(details);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ScaleStartDetails details)? startScale,
    TResult Function(ScaleUpdateDetails details, Offset? additionalFocalPoint)?
        continueScale,
    TResult Function(ScaleEndDetails details)? endScale,
    TResult Function(ScaleStartDetails details, Matrix4 matrix)? restartScale,
    TResult Function(Size size)? viewportChanged,
    TResult Function(List<DiagramObjectEntity> list)? contentChanged,
    TResult Function()? initialToIdleAnimationEnd,
    TResult Function()? outOfBoundsToIdleAnimationEnd,
    TResult Function(Matrix4 reachedMatrix)? inertialAnimationEnd,
    TResult Function()? inertialAnimationStop,
    TResult Function()? scrollingAnimationEnd,
    required TResult orElse(),
  }) {
    if (endScale != null) {
      return endScale(details);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartScale value) startScale,
    required TResult Function(_ContinueScale value) continueScale,
    required TResult Function(_EndScale value) endScale,
    required TResult Function(_RestartScale value) restartScale,
    required TResult Function(_ViewportChanged value) viewportChanged,
    required TResult Function(_ContentChanged value) contentChanged,
    required TResult Function(_InitialToIdleAnimationEnd value)
        initialToIdleAnimationEnd,
    required TResult Function(_OutOfBoundsToIdleAnimationEnd value)
        outOfBoundsToIdleAnimationEnd,
    required TResult Function(_InertialAnimationEnd value) inertialAnimationEnd,
    required TResult Function(_InertialAnimationStop value)
        inertialAnimationStop,
    required TResult Function(_ScrollingAnimationEnd value)
        scrollingAnimationEnd,
  }) {
    return endScale(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartScale value)? startScale,
    TResult? Function(_ContinueScale value)? continueScale,
    TResult? Function(_EndScale value)? endScale,
    TResult? Function(_RestartScale value)? restartScale,
    TResult? Function(_ViewportChanged value)? viewportChanged,
    TResult? Function(_ContentChanged value)? contentChanged,
    TResult? Function(_InitialToIdleAnimationEnd value)?
        initialToIdleAnimationEnd,
    TResult? Function(_OutOfBoundsToIdleAnimationEnd value)?
        outOfBoundsToIdleAnimationEnd,
    TResult? Function(_InertialAnimationEnd value)? inertialAnimationEnd,
    TResult? Function(_InertialAnimationStop value)? inertialAnimationStop,
    TResult? Function(_ScrollingAnimationEnd value)? scrollingAnimationEnd,
  }) {
    return endScale?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartScale value)? startScale,
    TResult Function(_ContinueScale value)? continueScale,
    TResult Function(_EndScale value)? endScale,
    TResult Function(_RestartScale value)? restartScale,
    TResult Function(_ViewportChanged value)? viewportChanged,
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_InitialToIdleAnimationEnd value)?
        initialToIdleAnimationEnd,
    TResult Function(_OutOfBoundsToIdleAnimationEnd value)?
        outOfBoundsToIdleAnimationEnd,
    TResult Function(_InertialAnimationEnd value)? inertialAnimationEnd,
    TResult Function(_InertialAnimationStop value)? inertialAnimationStop,
    TResult Function(_ScrollingAnimationEnd value)? scrollingAnimationEnd,
    required TResult orElse(),
  }) {
    if (endScale != null) {
      return endScale(this);
    }
    return orElse();
  }
}

abstract class _EndScale implements ScrollingEvent {
  const factory _EndScale({required final ScaleEndDetails details}) =
      _$EndScaleImpl;

  ScaleEndDetails get details;

  /// Create a copy of ScrollingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EndScaleImplCopyWith<_$EndScaleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RestartScaleImplCopyWith<$Res> {
  factory _$$RestartScaleImplCopyWith(
          _$RestartScaleImpl value, $Res Function(_$RestartScaleImpl) then) =
      __$$RestartScaleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ScaleStartDetails details, Matrix4 matrix});
}

/// @nodoc
class __$$RestartScaleImplCopyWithImpl<$Res>
    extends _$ScrollingEventCopyWithImpl<$Res, _$RestartScaleImpl>
    implements _$$RestartScaleImplCopyWith<$Res> {
  __$$RestartScaleImplCopyWithImpl(
      _$RestartScaleImpl _value, $Res Function(_$RestartScaleImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScrollingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = null,
    Object? matrix = null,
  }) {
    return _then(_$RestartScaleImpl(
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as ScaleStartDetails,
      matrix: null == matrix
          ? _value.matrix
          : matrix // ignore: cast_nullable_to_non_nullable
              as Matrix4,
    ));
  }
}

/// @nodoc

class _$RestartScaleImpl implements _RestartScale {
  const _$RestartScaleImpl({required this.details, required this.matrix});

  @override
  final ScaleStartDetails details;
  @override
  final Matrix4 matrix;

  @override
  String toString() {
    return 'ScrollingEvent.restartScale(details: $details, matrix: $matrix)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestartScaleImpl &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.matrix, matrix) || other.matrix == matrix));
  }

  @override
  int get hashCode => Object.hash(runtimeType, details, matrix);

  /// Create a copy of ScrollingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestartScaleImplCopyWith<_$RestartScaleImpl> get copyWith =>
      __$$RestartScaleImplCopyWithImpl<_$RestartScaleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ScaleStartDetails details) startScale,
    required TResult Function(
            ScaleUpdateDetails details, Offset? additionalFocalPoint)
        continueScale,
    required TResult Function(ScaleEndDetails details) endScale,
    required TResult Function(ScaleStartDetails details, Matrix4 matrix)
        restartScale,
    required TResult Function(Size size) viewportChanged,
    required TResult Function(List<DiagramObjectEntity> list) contentChanged,
    required TResult Function() initialToIdleAnimationEnd,
    required TResult Function() outOfBoundsToIdleAnimationEnd,
    required TResult Function(Matrix4 reachedMatrix) inertialAnimationEnd,
    required TResult Function() inertialAnimationStop,
    required TResult Function() scrollingAnimationEnd,
  }) {
    return restartScale(details, matrix);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ScaleStartDetails details)? startScale,
    TResult? Function(ScaleUpdateDetails details, Offset? additionalFocalPoint)?
        continueScale,
    TResult? Function(ScaleEndDetails details)? endScale,
    TResult? Function(ScaleStartDetails details, Matrix4 matrix)? restartScale,
    TResult? Function(Size size)? viewportChanged,
    TResult? Function(List<DiagramObjectEntity> list)? contentChanged,
    TResult? Function()? initialToIdleAnimationEnd,
    TResult? Function()? outOfBoundsToIdleAnimationEnd,
    TResult? Function(Matrix4 reachedMatrix)? inertialAnimationEnd,
    TResult? Function()? inertialAnimationStop,
    TResult? Function()? scrollingAnimationEnd,
  }) {
    return restartScale?.call(details, matrix);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ScaleStartDetails details)? startScale,
    TResult Function(ScaleUpdateDetails details, Offset? additionalFocalPoint)?
        continueScale,
    TResult Function(ScaleEndDetails details)? endScale,
    TResult Function(ScaleStartDetails details, Matrix4 matrix)? restartScale,
    TResult Function(Size size)? viewportChanged,
    TResult Function(List<DiagramObjectEntity> list)? contentChanged,
    TResult Function()? initialToIdleAnimationEnd,
    TResult Function()? outOfBoundsToIdleAnimationEnd,
    TResult Function(Matrix4 reachedMatrix)? inertialAnimationEnd,
    TResult Function()? inertialAnimationStop,
    TResult Function()? scrollingAnimationEnd,
    required TResult orElse(),
  }) {
    if (restartScale != null) {
      return restartScale(details, matrix);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartScale value) startScale,
    required TResult Function(_ContinueScale value) continueScale,
    required TResult Function(_EndScale value) endScale,
    required TResult Function(_RestartScale value) restartScale,
    required TResult Function(_ViewportChanged value) viewportChanged,
    required TResult Function(_ContentChanged value) contentChanged,
    required TResult Function(_InitialToIdleAnimationEnd value)
        initialToIdleAnimationEnd,
    required TResult Function(_OutOfBoundsToIdleAnimationEnd value)
        outOfBoundsToIdleAnimationEnd,
    required TResult Function(_InertialAnimationEnd value) inertialAnimationEnd,
    required TResult Function(_InertialAnimationStop value)
        inertialAnimationStop,
    required TResult Function(_ScrollingAnimationEnd value)
        scrollingAnimationEnd,
  }) {
    return restartScale(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartScale value)? startScale,
    TResult? Function(_ContinueScale value)? continueScale,
    TResult? Function(_EndScale value)? endScale,
    TResult? Function(_RestartScale value)? restartScale,
    TResult? Function(_ViewportChanged value)? viewportChanged,
    TResult? Function(_ContentChanged value)? contentChanged,
    TResult? Function(_InitialToIdleAnimationEnd value)?
        initialToIdleAnimationEnd,
    TResult? Function(_OutOfBoundsToIdleAnimationEnd value)?
        outOfBoundsToIdleAnimationEnd,
    TResult? Function(_InertialAnimationEnd value)? inertialAnimationEnd,
    TResult? Function(_InertialAnimationStop value)? inertialAnimationStop,
    TResult? Function(_ScrollingAnimationEnd value)? scrollingAnimationEnd,
  }) {
    return restartScale?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartScale value)? startScale,
    TResult Function(_ContinueScale value)? continueScale,
    TResult Function(_EndScale value)? endScale,
    TResult Function(_RestartScale value)? restartScale,
    TResult Function(_ViewportChanged value)? viewportChanged,
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_InitialToIdleAnimationEnd value)?
        initialToIdleAnimationEnd,
    TResult Function(_OutOfBoundsToIdleAnimationEnd value)?
        outOfBoundsToIdleAnimationEnd,
    TResult Function(_InertialAnimationEnd value)? inertialAnimationEnd,
    TResult Function(_InertialAnimationStop value)? inertialAnimationStop,
    TResult Function(_ScrollingAnimationEnd value)? scrollingAnimationEnd,
    required TResult orElse(),
  }) {
    if (restartScale != null) {
      return restartScale(this);
    }
    return orElse();
  }
}

abstract class _RestartScale implements ScrollingEvent {
  const factory _RestartScale(
      {required final ScaleStartDetails details,
      required final Matrix4 matrix}) = _$RestartScaleImpl;

  ScaleStartDetails get details;
  Matrix4 get matrix;

  /// Create a copy of ScrollingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestartScaleImplCopyWith<_$RestartScaleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ViewportChangedImplCopyWith<$Res> {
  factory _$$ViewportChangedImplCopyWith(_$ViewportChangedImpl value,
          $Res Function(_$ViewportChangedImpl) then) =
      __$$ViewportChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Size size});
}

/// @nodoc
class __$$ViewportChangedImplCopyWithImpl<$Res>
    extends _$ScrollingEventCopyWithImpl<$Res, _$ViewportChangedImpl>
    implements _$$ViewportChangedImplCopyWith<$Res> {
  __$$ViewportChangedImplCopyWithImpl(
      _$ViewportChangedImpl _value, $Res Function(_$ViewportChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScrollingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
  }) {
    return _then(_$ViewportChangedImpl(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as Size,
    ));
  }
}

/// @nodoc

class _$ViewportChangedImpl implements _ViewportChanged {
  const _$ViewportChangedImpl({required this.size});

  @override
  final Size size;

  @override
  String toString() {
    return 'ScrollingEvent.viewportChanged(size: $size)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewportChangedImpl &&
            (identical(other.size, size) || other.size == size));
  }

  @override
  int get hashCode => Object.hash(runtimeType, size);

  /// Create a copy of ScrollingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewportChangedImplCopyWith<_$ViewportChangedImpl> get copyWith =>
      __$$ViewportChangedImplCopyWithImpl<_$ViewportChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ScaleStartDetails details) startScale,
    required TResult Function(
            ScaleUpdateDetails details, Offset? additionalFocalPoint)
        continueScale,
    required TResult Function(ScaleEndDetails details) endScale,
    required TResult Function(ScaleStartDetails details, Matrix4 matrix)
        restartScale,
    required TResult Function(Size size) viewportChanged,
    required TResult Function(List<DiagramObjectEntity> list) contentChanged,
    required TResult Function() initialToIdleAnimationEnd,
    required TResult Function() outOfBoundsToIdleAnimationEnd,
    required TResult Function(Matrix4 reachedMatrix) inertialAnimationEnd,
    required TResult Function() inertialAnimationStop,
    required TResult Function() scrollingAnimationEnd,
  }) {
    return viewportChanged(size);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ScaleStartDetails details)? startScale,
    TResult? Function(ScaleUpdateDetails details, Offset? additionalFocalPoint)?
        continueScale,
    TResult? Function(ScaleEndDetails details)? endScale,
    TResult? Function(ScaleStartDetails details, Matrix4 matrix)? restartScale,
    TResult? Function(Size size)? viewportChanged,
    TResult? Function(List<DiagramObjectEntity> list)? contentChanged,
    TResult? Function()? initialToIdleAnimationEnd,
    TResult? Function()? outOfBoundsToIdleAnimationEnd,
    TResult? Function(Matrix4 reachedMatrix)? inertialAnimationEnd,
    TResult? Function()? inertialAnimationStop,
    TResult? Function()? scrollingAnimationEnd,
  }) {
    return viewportChanged?.call(size);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ScaleStartDetails details)? startScale,
    TResult Function(ScaleUpdateDetails details, Offset? additionalFocalPoint)?
        continueScale,
    TResult Function(ScaleEndDetails details)? endScale,
    TResult Function(ScaleStartDetails details, Matrix4 matrix)? restartScale,
    TResult Function(Size size)? viewportChanged,
    TResult Function(List<DiagramObjectEntity> list)? contentChanged,
    TResult Function()? initialToIdleAnimationEnd,
    TResult Function()? outOfBoundsToIdleAnimationEnd,
    TResult Function(Matrix4 reachedMatrix)? inertialAnimationEnd,
    TResult Function()? inertialAnimationStop,
    TResult Function()? scrollingAnimationEnd,
    required TResult orElse(),
  }) {
    if (viewportChanged != null) {
      return viewportChanged(size);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartScale value) startScale,
    required TResult Function(_ContinueScale value) continueScale,
    required TResult Function(_EndScale value) endScale,
    required TResult Function(_RestartScale value) restartScale,
    required TResult Function(_ViewportChanged value) viewportChanged,
    required TResult Function(_ContentChanged value) contentChanged,
    required TResult Function(_InitialToIdleAnimationEnd value)
        initialToIdleAnimationEnd,
    required TResult Function(_OutOfBoundsToIdleAnimationEnd value)
        outOfBoundsToIdleAnimationEnd,
    required TResult Function(_InertialAnimationEnd value) inertialAnimationEnd,
    required TResult Function(_InertialAnimationStop value)
        inertialAnimationStop,
    required TResult Function(_ScrollingAnimationEnd value)
        scrollingAnimationEnd,
  }) {
    return viewportChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartScale value)? startScale,
    TResult? Function(_ContinueScale value)? continueScale,
    TResult? Function(_EndScale value)? endScale,
    TResult? Function(_RestartScale value)? restartScale,
    TResult? Function(_ViewportChanged value)? viewportChanged,
    TResult? Function(_ContentChanged value)? contentChanged,
    TResult? Function(_InitialToIdleAnimationEnd value)?
        initialToIdleAnimationEnd,
    TResult? Function(_OutOfBoundsToIdleAnimationEnd value)?
        outOfBoundsToIdleAnimationEnd,
    TResult? Function(_InertialAnimationEnd value)? inertialAnimationEnd,
    TResult? Function(_InertialAnimationStop value)? inertialAnimationStop,
    TResult? Function(_ScrollingAnimationEnd value)? scrollingAnimationEnd,
  }) {
    return viewportChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartScale value)? startScale,
    TResult Function(_ContinueScale value)? continueScale,
    TResult Function(_EndScale value)? endScale,
    TResult Function(_RestartScale value)? restartScale,
    TResult Function(_ViewportChanged value)? viewportChanged,
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_InitialToIdleAnimationEnd value)?
        initialToIdleAnimationEnd,
    TResult Function(_OutOfBoundsToIdleAnimationEnd value)?
        outOfBoundsToIdleAnimationEnd,
    TResult Function(_InertialAnimationEnd value)? inertialAnimationEnd,
    TResult Function(_InertialAnimationStop value)? inertialAnimationStop,
    TResult Function(_ScrollingAnimationEnd value)? scrollingAnimationEnd,
    required TResult orElse(),
  }) {
    if (viewportChanged != null) {
      return viewportChanged(this);
    }
    return orElse();
  }
}

abstract class _ViewportChanged implements ScrollingEvent {
  const factory _ViewportChanged({required final Size size}) =
      _$ViewportChangedImpl;

  Size get size;

  /// Create a copy of ScrollingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ViewportChangedImplCopyWith<_$ViewportChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ContentChangedImplCopyWith<$Res> {
  factory _$$ContentChangedImplCopyWith(_$ContentChangedImpl value,
          $Res Function(_$ContentChangedImpl) then) =
      __$$ContentChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<DiagramObjectEntity> list});
}

/// @nodoc
class __$$ContentChangedImplCopyWithImpl<$Res>
    extends _$ScrollingEventCopyWithImpl<$Res, _$ContentChangedImpl>
    implements _$$ContentChangedImplCopyWith<$Res> {
  __$$ContentChangedImplCopyWithImpl(
      _$ContentChangedImpl _value, $Res Function(_$ContentChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScrollingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_$ContentChangedImpl(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
    ));
  }
}

/// @nodoc

class _$ContentChangedImpl implements _ContentChanged {
  const _$ContentChangedImpl({required final List<DiagramObjectEntity> list})
      : _list = list;

  final List<DiagramObjectEntity> _list;
  @override
  List<DiagramObjectEntity> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'ScrollingEvent.contentChanged(list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentChangedImpl &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

  /// Create a copy of ScrollingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentChangedImplCopyWith<_$ContentChangedImpl> get copyWith =>
      __$$ContentChangedImplCopyWithImpl<_$ContentChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ScaleStartDetails details) startScale,
    required TResult Function(
            ScaleUpdateDetails details, Offset? additionalFocalPoint)
        continueScale,
    required TResult Function(ScaleEndDetails details) endScale,
    required TResult Function(ScaleStartDetails details, Matrix4 matrix)
        restartScale,
    required TResult Function(Size size) viewportChanged,
    required TResult Function(List<DiagramObjectEntity> list) contentChanged,
    required TResult Function() initialToIdleAnimationEnd,
    required TResult Function() outOfBoundsToIdleAnimationEnd,
    required TResult Function(Matrix4 reachedMatrix) inertialAnimationEnd,
    required TResult Function() inertialAnimationStop,
    required TResult Function() scrollingAnimationEnd,
  }) {
    return contentChanged(list);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ScaleStartDetails details)? startScale,
    TResult? Function(ScaleUpdateDetails details, Offset? additionalFocalPoint)?
        continueScale,
    TResult? Function(ScaleEndDetails details)? endScale,
    TResult? Function(ScaleStartDetails details, Matrix4 matrix)? restartScale,
    TResult? Function(Size size)? viewportChanged,
    TResult? Function(List<DiagramObjectEntity> list)? contentChanged,
    TResult? Function()? initialToIdleAnimationEnd,
    TResult? Function()? outOfBoundsToIdleAnimationEnd,
    TResult? Function(Matrix4 reachedMatrix)? inertialAnimationEnd,
    TResult? Function()? inertialAnimationStop,
    TResult? Function()? scrollingAnimationEnd,
  }) {
    return contentChanged?.call(list);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ScaleStartDetails details)? startScale,
    TResult Function(ScaleUpdateDetails details, Offset? additionalFocalPoint)?
        continueScale,
    TResult Function(ScaleEndDetails details)? endScale,
    TResult Function(ScaleStartDetails details, Matrix4 matrix)? restartScale,
    TResult Function(Size size)? viewportChanged,
    TResult Function(List<DiagramObjectEntity> list)? contentChanged,
    TResult Function()? initialToIdleAnimationEnd,
    TResult Function()? outOfBoundsToIdleAnimationEnd,
    TResult Function(Matrix4 reachedMatrix)? inertialAnimationEnd,
    TResult Function()? inertialAnimationStop,
    TResult Function()? scrollingAnimationEnd,
    required TResult orElse(),
  }) {
    if (contentChanged != null) {
      return contentChanged(list);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartScale value) startScale,
    required TResult Function(_ContinueScale value) continueScale,
    required TResult Function(_EndScale value) endScale,
    required TResult Function(_RestartScale value) restartScale,
    required TResult Function(_ViewportChanged value) viewportChanged,
    required TResult Function(_ContentChanged value) contentChanged,
    required TResult Function(_InitialToIdleAnimationEnd value)
        initialToIdleAnimationEnd,
    required TResult Function(_OutOfBoundsToIdleAnimationEnd value)
        outOfBoundsToIdleAnimationEnd,
    required TResult Function(_InertialAnimationEnd value) inertialAnimationEnd,
    required TResult Function(_InertialAnimationStop value)
        inertialAnimationStop,
    required TResult Function(_ScrollingAnimationEnd value)
        scrollingAnimationEnd,
  }) {
    return contentChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartScale value)? startScale,
    TResult? Function(_ContinueScale value)? continueScale,
    TResult? Function(_EndScale value)? endScale,
    TResult? Function(_RestartScale value)? restartScale,
    TResult? Function(_ViewportChanged value)? viewportChanged,
    TResult? Function(_ContentChanged value)? contentChanged,
    TResult? Function(_InitialToIdleAnimationEnd value)?
        initialToIdleAnimationEnd,
    TResult? Function(_OutOfBoundsToIdleAnimationEnd value)?
        outOfBoundsToIdleAnimationEnd,
    TResult? Function(_InertialAnimationEnd value)? inertialAnimationEnd,
    TResult? Function(_InertialAnimationStop value)? inertialAnimationStop,
    TResult? Function(_ScrollingAnimationEnd value)? scrollingAnimationEnd,
  }) {
    return contentChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartScale value)? startScale,
    TResult Function(_ContinueScale value)? continueScale,
    TResult Function(_EndScale value)? endScale,
    TResult Function(_RestartScale value)? restartScale,
    TResult Function(_ViewportChanged value)? viewportChanged,
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_InitialToIdleAnimationEnd value)?
        initialToIdleAnimationEnd,
    TResult Function(_OutOfBoundsToIdleAnimationEnd value)?
        outOfBoundsToIdleAnimationEnd,
    TResult Function(_InertialAnimationEnd value)? inertialAnimationEnd,
    TResult Function(_InertialAnimationStop value)? inertialAnimationStop,
    TResult Function(_ScrollingAnimationEnd value)? scrollingAnimationEnd,
    required TResult orElse(),
  }) {
    if (contentChanged != null) {
      return contentChanged(this);
    }
    return orElse();
  }
}

abstract class _ContentChanged implements ScrollingEvent {
  const factory _ContentChanged(
      {required final List<DiagramObjectEntity> list}) = _$ContentChangedImpl;

  List<DiagramObjectEntity> get list;

  /// Create a copy of ScrollingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentChangedImplCopyWith<_$ContentChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitialToIdleAnimationEndImplCopyWith<$Res> {
  factory _$$InitialToIdleAnimationEndImplCopyWith(
          _$InitialToIdleAnimationEndImpl value,
          $Res Function(_$InitialToIdleAnimationEndImpl) then) =
      __$$InitialToIdleAnimationEndImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialToIdleAnimationEndImplCopyWithImpl<$Res>
    extends _$ScrollingEventCopyWithImpl<$Res, _$InitialToIdleAnimationEndImpl>
    implements _$$InitialToIdleAnimationEndImplCopyWith<$Res> {
  __$$InitialToIdleAnimationEndImplCopyWithImpl(
      _$InitialToIdleAnimationEndImpl _value,
      $Res Function(_$InitialToIdleAnimationEndImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScrollingEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialToIdleAnimationEndImpl implements _InitialToIdleAnimationEnd {
  const _$InitialToIdleAnimationEndImpl();

  @override
  String toString() {
    return 'ScrollingEvent.initialToIdleAnimationEnd()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialToIdleAnimationEndImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ScaleStartDetails details) startScale,
    required TResult Function(
            ScaleUpdateDetails details, Offset? additionalFocalPoint)
        continueScale,
    required TResult Function(ScaleEndDetails details) endScale,
    required TResult Function(ScaleStartDetails details, Matrix4 matrix)
        restartScale,
    required TResult Function(Size size) viewportChanged,
    required TResult Function(List<DiagramObjectEntity> list) contentChanged,
    required TResult Function() initialToIdleAnimationEnd,
    required TResult Function() outOfBoundsToIdleAnimationEnd,
    required TResult Function(Matrix4 reachedMatrix) inertialAnimationEnd,
    required TResult Function() inertialAnimationStop,
    required TResult Function() scrollingAnimationEnd,
  }) {
    return initialToIdleAnimationEnd();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ScaleStartDetails details)? startScale,
    TResult? Function(ScaleUpdateDetails details, Offset? additionalFocalPoint)?
        continueScale,
    TResult? Function(ScaleEndDetails details)? endScale,
    TResult? Function(ScaleStartDetails details, Matrix4 matrix)? restartScale,
    TResult? Function(Size size)? viewportChanged,
    TResult? Function(List<DiagramObjectEntity> list)? contentChanged,
    TResult? Function()? initialToIdleAnimationEnd,
    TResult? Function()? outOfBoundsToIdleAnimationEnd,
    TResult? Function(Matrix4 reachedMatrix)? inertialAnimationEnd,
    TResult? Function()? inertialAnimationStop,
    TResult? Function()? scrollingAnimationEnd,
  }) {
    return initialToIdleAnimationEnd?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ScaleStartDetails details)? startScale,
    TResult Function(ScaleUpdateDetails details, Offset? additionalFocalPoint)?
        continueScale,
    TResult Function(ScaleEndDetails details)? endScale,
    TResult Function(ScaleStartDetails details, Matrix4 matrix)? restartScale,
    TResult Function(Size size)? viewportChanged,
    TResult Function(List<DiagramObjectEntity> list)? contentChanged,
    TResult Function()? initialToIdleAnimationEnd,
    TResult Function()? outOfBoundsToIdleAnimationEnd,
    TResult Function(Matrix4 reachedMatrix)? inertialAnimationEnd,
    TResult Function()? inertialAnimationStop,
    TResult Function()? scrollingAnimationEnd,
    required TResult orElse(),
  }) {
    if (initialToIdleAnimationEnd != null) {
      return initialToIdleAnimationEnd();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartScale value) startScale,
    required TResult Function(_ContinueScale value) continueScale,
    required TResult Function(_EndScale value) endScale,
    required TResult Function(_RestartScale value) restartScale,
    required TResult Function(_ViewportChanged value) viewportChanged,
    required TResult Function(_ContentChanged value) contentChanged,
    required TResult Function(_InitialToIdleAnimationEnd value)
        initialToIdleAnimationEnd,
    required TResult Function(_OutOfBoundsToIdleAnimationEnd value)
        outOfBoundsToIdleAnimationEnd,
    required TResult Function(_InertialAnimationEnd value) inertialAnimationEnd,
    required TResult Function(_InertialAnimationStop value)
        inertialAnimationStop,
    required TResult Function(_ScrollingAnimationEnd value)
        scrollingAnimationEnd,
  }) {
    return initialToIdleAnimationEnd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartScale value)? startScale,
    TResult? Function(_ContinueScale value)? continueScale,
    TResult? Function(_EndScale value)? endScale,
    TResult? Function(_RestartScale value)? restartScale,
    TResult? Function(_ViewportChanged value)? viewportChanged,
    TResult? Function(_ContentChanged value)? contentChanged,
    TResult? Function(_InitialToIdleAnimationEnd value)?
        initialToIdleAnimationEnd,
    TResult? Function(_OutOfBoundsToIdleAnimationEnd value)?
        outOfBoundsToIdleAnimationEnd,
    TResult? Function(_InertialAnimationEnd value)? inertialAnimationEnd,
    TResult? Function(_InertialAnimationStop value)? inertialAnimationStop,
    TResult? Function(_ScrollingAnimationEnd value)? scrollingAnimationEnd,
  }) {
    return initialToIdleAnimationEnd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartScale value)? startScale,
    TResult Function(_ContinueScale value)? continueScale,
    TResult Function(_EndScale value)? endScale,
    TResult Function(_RestartScale value)? restartScale,
    TResult Function(_ViewportChanged value)? viewportChanged,
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_InitialToIdleAnimationEnd value)?
        initialToIdleAnimationEnd,
    TResult Function(_OutOfBoundsToIdleAnimationEnd value)?
        outOfBoundsToIdleAnimationEnd,
    TResult Function(_InertialAnimationEnd value)? inertialAnimationEnd,
    TResult Function(_InertialAnimationStop value)? inertialAnimationStop,
    TResult Function(_ScrollingAnimationEnd value)? scrollingAnimationEnd,
    required TResult orElse(),
  }) {
    if (initialToIdleAnimationEnd != null) {
      return initialToIdleAnimationEnd(this);
    }
    return orElse();
  }
}

abstract class _InitialToIdleAnimationEnd implements ScrollingEvent {
  const factory _InitialToIdleAnimationEnd() = _$InitialToIdleAnimationEndImpl;
}

/// @nodoc
abstract class _$$OutOfBoundsToIdleAnimationEndImplCopyWith<$Res> {
  factory _$$OutOfBoundsToIdleAnimationEndImplCopyWith(
          _$OutOfBoundsToIdleAnimationEndImpl value,
          $Res Function(_$OutOfBoundsToIdleAnimationEndImpl) then) =
      __$$OutOfBoundsToIdleAnimationEndImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OutOfBoundsToIdleAnimationEndImplCopyWithImpl<$Res>
    extends _$ScrollingEventCopyWithImpl<$Res,
        _$OutOfBoundsToIdleAnimationEndImpl>
    implements _$$OutOfBoundsToIdleAnimationEndImplCopyWith<$Res> {
  __$$OutOfBoundsToIdleAnimationEndImplCopyWithImpl(
      _$OutOfBoundsToIdleAnimationEndImpl _value,
      $Res Function(_$OutOfBoundsToIdleAnimationEndImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScrollingEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OutOfBoundsToIdleAnimationEndImpl
    implements _OutOfBoundsToIdleAnimationEnd {
  const _$OutOfBoundsToIdleAnimationEndImpl();

  @override
  String toString() {
    return 'ScrollingEvent.outOfBoundsToIdleAnimationEnd()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutOfBoundsToIdleAnimationEndImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ScaleStartDetails details) startScale,
    required TResult Function(
            ScaleUpdateDetails details, Offset? additionalFocalPoint)
        continueScale,
    required TResult Function(ScaleEndDetails details) endScale,
    required TResult Function(ScaleStartDetails details, Matrix4 matrix)
        restartScale,
    required TResult Function(Size size) viewportChanged,
    required TResult Function(List<DiagramObjectEntity> list) contentChanged,
    required TResult Function() initialToIdleAnimationEnd,
    required TResult Function() outOfBoundsToIdleAnimationEnd,
    required TResult Function(Matrix4 reachedMatrix) inertialAnimationEnd,
    required TResult Function() inertialAnimationStop,
    required TResult Function() scrollingAnimationEnd,
  }) {
    return outOfBoundsToIdleAnimationEnd();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ScaleStartDetails details)? startScale,
    TResult? Function(ScaleUpdateDetails details, Offset? additionalFocalPoint)?
        continueScale,
    TResult? Function(ScaleEndDetails details)? endScale,
    TResult? Function(ScaleStartDetails details, Matrix4 matrix)? restartScale,
    TResult? Function(Size size)? viewportChanged,
    TResult? Function(List<DiagramObjectEntity> list)? contentChanged,
    TResult? Function()? initialToIdleAnimationEnd,
    TResult? Function()? outOfBoundsToIdleAnimationEnd,
    TResult? Function(Matrix4 reachedMatrix)? inertialAnimationEnd,
    TResult? Function()? inertialAnimationStop,
    TResult? Function()? scrollingAnimationEnd,
  }) {
    return outOfBoundsToIdleAnimationEnd?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ScaleStartDetails details)? startScale,
    TResult Function(ScaleUpdateDetails details, Offset? additionalFocalPoint)?
        continueScale,
    TResult Function(ScaleEndDetails details)? endScale,
    TResult Function(ScaleStartDetails details, Matrix4 matrix)? restartScale,
    TResult Function(Size size)? viewportChanged,
    TResult Function(List<DiagramObjectEntity> list)? contentChanged,
    TResult Function()? initialToIdleAnimationEnd,
    TResult Function()? outOfBoundsToIdleAnimationEnd,
    TResult Function(Matrix4 reachedMatrix)? inertialAnimationEnd,
    TResult Function()? inertialAnimationStop,
    TResult Function()? scrollingAnimationEnd,
    required TResult orElse(),
  }) {
    if (outOfBoundsToIdleAnimationEnd != null) {
      return outOfBoundsToIdleAnimationEnd();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartScale value) startScale,
    required TResult Function(_ContinueScale value) continueScale,
    required TResult Function(_EndScale value) endScale,
    required TResult Function(_RestartScale value) restartScale,
    required TResult Function(_ViewportChanged value) viewportChanged,
    required TResult Function(_ContentChanged value) contentChanged,
    required TResult Function(_InitialToIdleAnimationEnd value)
        initialToIdleAnimationEnd,
    required TResult Function(_OutOfBoundsToIdleAnimationEnd value)
        outOfBoundsToIdleAnimationEnd,
    required TResult Function(_InertialAnimationEnd value) inertialAnimationEnd,
    required TResult Function(_InertialAnimationStop value)
        inertialAnimationStop,
    required TResult Function(_ScrollingAnimationEnd value)
        scrollingAnimationEnd,
  }) {
    return outOfBoundsToIdleAnimationEnd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartScale value)? startScale,
    TResult? Function(_ContinueScale value)? continueScale,
    TResult? Function(_EndScale value)? endScale,
    TResult? Function(_RestartScale value)? restartScale,
    TResult? Function(_ViewportChanged value)? viewportChanged,
    TResult? Function(_ContentChanged value)? contentChanged,
    TResult? Function(_InitialToIdleAnimationEnd value)?
        initialToIdleAnimationEnd,
    TResult? Function(_OutOfBoundsToIdleAnimationEnd value)?
        outOfBoundsToIdleAnimationEnd,
    TResult? Function(_InertialAnimationEnd value)? inertialAnimationEnd,
    TResult? Function(_InertialAnimationStop value)? inertialAnimationStop,
    TResult? Function(_ScrollingAnimationEnd value)? scrollingAnimationEnd,
  }) {
    return outOfBoundsToIdleAnimationEnd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartScale value)? startScale,
    TResult Function(_ContinueScale value)? continueScale,
    TResult Function(_EndScale value)? endScale,
    TResult Function(_RestartScale value)? restartScale,
    TResult Function(_ViewportChanged value)? viewportChanged,
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_InitialToIdleAnimationEnd value)?
        initialToIdleAnimationEnd,
    TResult Function(_OutOfBoundsToIdleAnimationEnd value)?
        outOfBoundsToIdleAnimationEnd,
    TResult Function(_InertialAnimationEnd value)? inertialAnimationEnd,
    TResult Function(_InertialAnimationStop value)? inertialAnimationStop,
    TResult Function(_ScrollingAnimationEnd value)? scrollingAnimationEnd,
    required TResult orElse(),
  }) {
    if (outOfBoundsToIdleAnimationEnd != null) {
      return outOfBoundsToIdleAnimationEnd(this);
    }
    return orElse();
  }
}

abstract class _OutOfBoundsToIdleAnimationEnd implements ScrollingEvent {
  const factory _OutOfBoundsToIdleAnimationEnd() =
      _$OutOfBoundsToIdleAnimationEndImpl;
}

/// @nodoc
abstract class _$$InertialAnimationEndImplCopyWith<$Res> {
  factory _$$InertialAnimationEndImplCopyWith(_$InertialAnimationEndImpl value,
          $Res Function(_$InertialAnimationEndImpl) then) =
      __$$InertialAnimationEndImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Matrix4 reachedMatrix});
}

/// @nodoc
class __$$InertialAnimationEndImplCopyWithImpl<$Res>
    extends _$ScrollingEventCopyWithImpl<$Res, _$InertialAnimationEndImpl>
    implements _$$InertialAnimationEndImplCopyWith<$Res> {
  __$$InertialAnimationEndImplCopyWithImpl(_$InertialAnimationEndImpl _value,
      $Res Function(_$InertialAnimationEndImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScrollingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reachedMatrix = null,
  }) {
    return _then(_$InertialAnimationEndImpl(
      reachedMatrix: null == reachedMatrix
          ? _value.reachedMatrix
          : reachedMatrix // ignore: cast_nullable_to_non_nullable
              as Matrix4,
    ));
  }
}

/// @nodoc

class _$InertialAnimationEndImpl implements _InertialAnimationEnd {
  const _$InertialAnimationEndImpl({required this.reachedMatrix});

  @override
  final Matrix4 reachedMatrix;

  @override
  String toString() {
    return 'ScrollingEvent.inertialAnimationEnd(reachedMatrix: $reachedMatrix)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InertialAnimationEndImpl &&
            (identical(other.reachedMatrix, reachedMatrix) ||
                other.reachedMatrix == reachedMatrix));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reachedMatrix);

  /// Create a copy of ScrollingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InertialAnimationEndImplCopyWith<_$InertialAnimationEndImpl>
      get copyWith =>
          __$$InertialAnimationEndImplCopyWithImpl<_$InertialAnimationEndImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ScaleStartDetails details) startScale,
    required TResult Function(
            ScaleUpdateDetails details, Offset? additionalFocalPoint)
        continueScale,
    required TResult Function(ScaleEndDetails details) endScale,
    required TResult Function(ScaleStartDetails details, Matrix4 matrix)
        restartScale,
    required TResult Function(Size size) viewportChanged,
    required TResult Function(List<DiagramObjectEntity> list) contentChanged,
    required TResult Function() initialToIdleAnimationEnd,
    required TResult Function() outOfBoundsToIdleAnimationEnd,
    required TResult Function(Matrix4 reachedMatrix) inertialAnimationEnd,
    required TResult Function() inertialAnimationStop,
    required TResult Function() scrollingAnimationEnd,
  }) {
    return inertialAnimationEnd(reachedMatrix);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ScaleStartDetails details)? startScale,
    TResult? Function(ScaleUpdateDetails details, Offset? additionalFocalPoint)?
        continueScale,
    TResult? Function(ScaleEndDetails details)? endScale,
    TResult? Function(ScaleStartDetails details, Matrix4 matrix)? restartScale,
    TResult? Function(Size size)? viewportChanged,
    TResult? Function(List<DiagramObjectEntity> list)? contentChanged,
    TResult? Function()? initialToIdleAnimationEnd,
    TResult? Function()? outOfBoundsToIdleAnimationEnd,
    TResult? Function(Matrix4 reachedMatrix)? inertialAnimationEnd,
    TResult? Function()? inertialAnimationStop,
    TResult? Function()? scrollingAnimationEnd,
  }) {
    return inertialAnimationEnd?.call(reachedMatrix);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ScaleStartDetails details)? startScale,
    TResult Function(ScaleUpdateDetails details, Offset? additionalFocalPoint)?
        continueScale,
    TResult Function(ScaleEndDetails details)? endScale,
    TResult Function(ScaleStartDetails details, Matrix4 matrix)? restartScale,
    TResult Function(Size size)? viewportChanged,
    TResult Function(List<DiagramObjectEntity> list)? contentChanged,
    TResult Function()? initialToIdleAnimationEnd,
    TResult Function()? outOfBoundsToIdleAnimationEnd,
    TResult Function(Matrix4 reachedMatrix)? inertialAnimationEnd,
    TResult Function()? inertialAnimationStop,
    TResult Function()? scrollingAnimationEnd,
    required TResult orElse(),
  }) {
    if (inertialAnimationEnd != null) {
      return inertialAnimationEnd(reachedMatrix);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartScale value) startScale,
    required TResult Function(_ContinueScale value) continueScale,
    required TResult Function(_EndScale value) endScale,
    required TResult Function(_RestartScale value) restartScale,
    required TResult Function(_ViewportChanged value) viewportChanged,
    required TResult Function(_ContentChanged value) contentChanged,
    required TResult Function(_InitialToIdleAnimationEnd value)
        initialToIdleAnimationEnd,
    required TResult Function(_OutOfBoundsToIdleAnimationEnd value)
        outOfBoundsToIdleAnimationEnd,
    required TResult Function(_InertialAnimationEnd value) inertialAnimationEnd,
    required TResult Function(_InertialAnimationStop value)
        inertialAnimationStop,
    required TResult Function(_ScrollingAnimationEnd value)
        scrollingAnimationEnd,
  }) {
    return inertialAnimationEnd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartScale value)? startScale,
    TResult? Function(_ContinueScale value)? continueScale,
    TResult? Function(_EndScale value)? endScale,
    TResult? Function(_RestartScale value)? restartScale,
    TResult? Function(_ViewportChanged value)? viewportChanged,
    TResult? Function(_ContentChanged value)? contentChanged,
    TResult? Function(_InitialToIdleAnimationEnd value)?
        initialToIdleAnimationEnd,
    TResult? Function(_OutOfBoundsToIdleAnimationEnd value)?
        outOfBoundsToIdleAnimationEnd,
    TResult? Function(_InertialAnimationEnd value)? inertialAnimationEnd,
    TResult? Function(_InertialAnimationStop value)? inertialAnimationStop,
    TResult? Function(_ScrollingAnimationEnd value)? scrollingAnimationEnd,
  }) {
    return inertialAnimationEnd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartScale value)? startScale,
    TResult Function(_ContinueScale value)? continueScale,
    TResult Function(_EndScale value)? endScale,
    TResult Function(_RestartScale value)? restartScale,
    TResult Function(_ViewportChanged value)? viewportChanged,
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_InitialToIdleAnimationEnd value)?
        initialToIdleAnimationEnd,
    TResult Function(_OutOfBoundsToIdleAnimationEnd value)?
        outOfBoundsToIdleAnimationEnd,
    TResult Function(_InertialAnimationEnd value)? inertialAnimationEnd,
    TResult Function(_InertialAnimationStop value)? inertialAnimationStop,
    TResult Function(_ScrollingAnimationEnd value)? scrollingAnimationEnd,
    required TResult orElse(),
  }) {
    if (inertialAnimationEnd != null) {
      return inertialAnimationEnd(this);
    }
    return orElse();
  }
}

abstract class _InertialAnimationEnd implements ScrollingEvent {
  const factory _InertialAnimationEnd({required final Matrix4 reachedMatrix}) =
      _$InertialAnimationEndImpl;

  Matrix4 get reachedMatrix;

  /// Create a copy of ScrollingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InertialAnimationEndImplCopyWith<_$InertialAnimationEndImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InertialAnimationStopImplCopyWith<$Res> {
  factory _$$InertialAnimationStopImplCopyWith(
          _$InertialAnimationStopImpl value,
          $Res Function(_$InertialAnimationStopImpl) then) =
      __$$InertialAnimationStopImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InertialAnimationStopImplCopyWithImpl<$Res>
    extends _$ScrollingEventCopyWithImpl<$Res, _$InertialAnimationStopImpl>
    implements _$$InertialAnimationStopImplCopyWith<$Res> {
  __$$InertialAnimationStopImplCopyWithImpl(_$InertialAnimationStopImpl _value,
      $Res Function(_$InertialAnimationStopImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScrollingEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InertialAnimationStopImpl implements _InertialAnimationStop {
  const _$InertialAnimationStopImpl();

  @override
  String toString() {
    return 'ScrollingEvent.inertialAnimationStop()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InertialAnimationStopImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ScaleStartDetails details) startScale,
    required TResult Function(
            ScaleUpdateDetails details, Offset? additionalFocalPoint)
        continueScale,
    required TResult Function(ScaleEndDetails details) endScale,
    required TResult Function(ScaleStartDetails details, Matrix4 matrix)
        restartScale,
    required TResult Function(Size size) viewportChanged,
    required TResult Function(List<DiagramObjectEntity> list) contentChanged,
    required TResult Function() initialToIdleAnimationEnd,
    required TResult Function() outOfBoundsToIdleAnimationEnd,
    required TResult Function(Matrix4 reachedMatrix) inertialAnimationEnd,
    required TResult Function() inertialAnimationStop,
    required TResult Function() scrollingAnimationEnd,
  }) {
    return inertialAnimationStop();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ScaleStartDetails details)? startScale,
    TResult? Function(ScaleUpdateDetails details, Offset? additionalFocalPoint)?
        continueScale,
    TResult? Function(ScaleEndDetails details)? endScale,
    TResult? Function(ScaleStartDetails details, Matrix4 matrix)? restartScale,
    TResult? Function(Size size)? viewportChanged,
    TResult? Function(List<DiagramObjectEntity> list)? contentChanged,
    TResult? Function()? initialToIdleAnimationEnd,
    TResult? Function()? outOfBoundsToIdleAnimationEnd,
    TResult? Function(Matrix4 reachedMatrix)? inertialAnimationEnd,
    TResult? Function()? inertialAnimationStop,
    TResult? Function()? scrollingAnimationEnd,
  }) {
    return inertialAnimationStop?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ScaleStartDetails details)? startScale,
    TResult Function(ScaleUpdateDetails details, Offset? additionalFocalPoint)?
        continueScale,
    TResult Function(ScaleEndDetails details)? endScale,
    TResult Function(ScaleStartDetails details, Matrix4 matrix)? restartScale,
    TResult Function(Size size)? viewportChanged,
    TResult Function(List<DiagramObjectEntity> list)? contentChanged,
    TResult Function()? initialToIdleAnimationEnd,
    TResult Function()? outOfBoundsToIdleAnimationEnd,
    TResult Function(Matrix4 reachedMatrix)? inertialAnimationEnd,
    TResult Function()? inertialAnimationStop,
    TResult Function()? scrollingAnimationEnd,
    required TResult orElse(),
  }) {
    if (inertialAnimationStop != null) {
      return inertialAnimationStop();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartScale value) startScale,
    required TResult Function(_ContinueScale value) continueScale,
    required TResult Function(_EndScale value) endScale,
    required TResult Function(_RestartScale value) restartScale,
    required TResult Function(_ViewportChanged value) viewportChanged,
    required TResult Function(_ContentChanged value) contentChanged,
    required TResult Function(_InitialToIdleAnimationEnd value)
        initialToIdleAnimationEnd,
    required TResult Function(_OutOfBoundsToIdleAnimationEnd value)
        outOfBoundsToIdleAnimationEnd,
    required TResult Function(_InertialAnimationEnd value) inertialAnimationEnd,
    required TResult Function(_InertialAnimationStop value)
        inertialAnimationStop,
    required TResult Function(_ScrollingAnimationEnd value)
        scrollingAnimationEnd,
  }) {
    return inertialAnimationStop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartScale value)? startScale,
    TResult? Function(_ContinueScale value)? continueScale,
    TResult? Function(_EndScale value)? endScale,
    TResult? Function(_RestartScale value)? restartScale,
    TResult? Function(_ViewportChanged value)? viewportChanged,
    TResult? Function(_ContentChanged value)? contentChanged,
    TResult? Function(_InitialToIdleAnimationEnd value)?
        initialToIdleAnimationEnd,
    TResult? Function(_OutOfBoundsToIdleAnimationEnd value)?
        outOfBoundsToIdleAnimationEnd,
    TResult? Function(_InertialAnimationEnd value)? inertialAnimationEnd,
    TResult? Function(_InertialAnimationStop value)? inertialAnimationStop,
    TResult? Function(_ScrollingAnimationEnd value)? scrollingAnimationEnd,
  }) {
    return inertialAnimationStop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartScale value)? startScale,
    TResult Function(_ContinueScale value)? continueScale,
    TResult Function(_EndScale value)? endScale,
    TResult Function(_RestartScale value)? restartScale,
    TResult Function(_ViewportChanged value)? viewportChanged,
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_InitialToIdleAnimationEnd value)?
        initialToIdleAnimationEnd,
    TResult Function(_OutOfBoundsToIdleAnimationEnd value)?
        outOfBoundsToIdleAnimationEnd,
    TResult Function(_InertialAnimationEnd value)? inertialAnimationEnd,
    TResult Function(_InertialAnimationStop value)? inertialAnimationStop,
    TResult Function(_ScrollingAnimationEnd value)? scrollingAnimationEnd,
    required TResult orElse(),
  }) {
    if (inertialAnimationStop != null) {
      return inertialAnimationStop(this);
    }
    return orElse();
  }
}

abstract class _InertialAnimationStop implements ScrollingEvent {
  const factory _InertialAnimationStop() = _$InertialAnimationStopImpl;
}

/// @nodoc
abstract class _$$ScrollingAnimationEndImplCopyWith<$Res> {
  factory _$$ScrollingAnimationEndImplCopyWith(
          _$ScrollingAnimationEndImpl value,
          $Res Function(_$ScrollingAnimationEndImpl) then) =
      __$$ScrollingAnimationEndImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ScrollingAnimationEndImplCopyWithImpl<$Res>
    extends _$ScrollingEventCopyWithImpl<$Res, _$ScrollingAnimationEndImpl>
    implements _$$ScrollingAnimationEndImplCopyWith<$Res> {
  __$$ScrollingAnimationEndImplCopyWithImpl(_$ScrollingAnimationEndImpl _value,
      $Res Function(_$ScrollingAnimationEndImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScrollingEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ScrollingAnimationEndImpl implements _ScrollingAnimationEnd {
  const _$ScrollingAnimationEndImpl();

  @override
  String toString() {
    return 'ScrollingEvent.scrollingAnimationEnd()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScrollingAnimationEndImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ScaleStartDetails details) startScale,
    required TResult Function(
            ScaleUpdateDetails details, Offset? additionalFocalPoint)
        continueScale,
    required TResult Function(ScaleEndDetails details) endScale,
    required TResult Function(ScaleStartDetails details, Matrix4 matrix)
        restartScale,
    required TResult Function(Size size) viewportChanged,
    required TResult Function(List<DiagramObjectEntity> list) contentChanged,
    required TResult Function() initialToIdleAnimationEnd,
    required TResult Function() outOfBoundsToIdleAnimationEnd,
    required TResult Function(Matrix4 reachedMatrix) inertialAnimationEnd,
    required TResult Function() inertialAnimationStop,
    required TResult Function() scrollingAnimationEnd,
  }) {
    return scrollingAnimationEnd();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ScaleStartDetails details)? startScale,
    TResult? Function(ScaleUpdateDetails details, Offset? additionalFocalPoint)?
        continueScale,
    TResult? Function(ScaleEndDetails details)? endScale,
    TResult? Function(ScaleStartDetails details, Matrix4 matrix)? restartScale,
    TResult? Function(Size size)? viewportChanged,
    TResult? Function(List<DiagramObjectEntity> list)? contentChanged,
    TResult? Function()? initialToIdleAnimationEnd,
    TResult? Function()? outOfBoundsToIdleAnimationEnd,
    TResult? Function(Matrix4 reachedMatrix)? inertialAnimationEnd,
    TResult? Function()? inertialAnimationStop,
    TResult? Function()? scrollingAnimationEnd,
  }) {
    return scrollingAnimationEnd?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ScaleStartDetails details)? startScale,
    TResult Function(ScaleUpdateDetails details, Offset? additionalFocalPoint)?
        continueScale,
    TResult Function(ScaleEndDetails details)? endScale,
    TResult Function(ScaleStartDetails details, Matrix4 matrix)? restartScale,
    TResult Function(Size size)? viewportChanged,
    TResult Function(List<DiagramObjectEntity> list)? contentChanged,
    TResult Function()? initialToIdleAnimationEnd,
    TResult Function()? outOfBoundsToIdleAnimationEnd,
    TResult Function(Matrix4 reachedMatrix)? inertialAnimationEnd,
    TResult Function()? inertialAnimationStop,
    TResult Function()? scrollingAnimationEnd,
    required TResult orElse(),
  }) {
    if (scrollingAnimationEnd != null) {
      return scrollingAnimationEnd();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartScale value) startScale,
    required TResult Function(_ContinueScale value) continueScale,
    required TResult Function(_EndScale value) endScale,
    required TResult Function(_RestartScale value) restartScale,
    required TResult Function(_ViewportChanged value) viewportChanged,
    required TResult Function(_ContentChanged value) contentChanged,
    required TResult Function(_InitialToIdleAnimationEnd value)
        initialToIdleAnimationEnd,
    required TResult Function(_OutOfBoundsToIdleAnimationEnd value)
        outOfBoundsToIdleAnimationEnd,
    required TResult Function(_InertialAnimationEnd value) inertialAnimationEnd,
    required TResult Function(_InertialAnimationStop value)
        inertialAnimationStop,
    required TResult Function(_ScrollingAnimationEnd value)
        scrollingAnimationEnd,
  }) {
    return scrollingAnimationEnd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartScale value)? startScale,
    TResult? Function(_ContinueScale value)? continueScale,
    TResult? Function(_EndScale value)? endScale,
    TResult? Function(_RestartScale value)? restartScale,
    TResult? Function(_ViewportChanged value)? viewportChanged,
    TResult? Function(_ContentChanged value)? contentChanged,
    TResult? Function(_InitialToIdleAnimationEnd value)?
        initialToIdleAnimationEnd,
    TResult? Function(_OutOfBoundsToIdleAnimationEnd value)?
        outOfBoundsToIdleAnimationEnd,
    TResult? Function(_InertialAnimationEnd value)? inertialAnimationEnd,
    TResult? Function(_InertialAnimationStop value)? inertialAnimationStop,
    TResult? Function(_ScrollingAnimationEnd value)? scrollingAnimationEnd,
  }) {
    return scrollingAnimationEnd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartScale value)? startScale,
    TResult Function(_ContinueScale value)? continueScale,
    TResult Function(_EndScale value)? endScale,
    TResult Function(_RestartScale value)? restartScale,
    TResult Function(_ViewportChanged value)? viewportChanged,
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_InitialToIdleAnimationEnd value)?
        initialToIdleAnimationEnd,
    TResult Function(_OutOfBoundsToIdleAnimationEnd value)?
        outOfBoundsToIdleAnimationEnd,
    TResult Function(_InertialAnimationEnd value)? inertialAnimationEnd,
    TResult Function(_InertialAnimationStop value)? inertialAnimationStop,
    TResult Function(_ScrollingAnimationEnd value)? scrollingAnimationEnd,
    required TResult orElse(),
  }) {
    if (scrollingAnimationEnd != null) {
      return scrollingAnimationEnd(this);
    }
    return orElse();
  }
}

abstract class _ScrollingAnimationEnd implements ScrollingEvent {
  const factory _ScrollingAnimationEnd() = _$ScrollingAnimationEndImpl;
}

/// @nodoc
mixin _$ScrollingState {
  List<DiagramObjectEntity>? get content => throw _privateConstructorUsedError;
  Size? get size => throw _privateConstructorUsedError;
  Rect? get diagramRect => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Matrix4 matrix,
            List<DiagramObjectEntity>? content, Size? size, Rect? diagramRect)
        initial,
    required TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)
        animatingInitialToIdle,
    required TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect)
        idle,
    required TResult Function(
            Matrix4 matrix,
            List<DiagramObjectEntity> content,
            ValueUpdater<Offset> translationUpdater,
            ValueUpdater<double> scaleUpdater,
            Size size,
            Rect diagramRect,
            double squaredDistance,
            DateTime eventDateTime)
        scrolling,
    required TResult Function(
            Matrix4 oldMatrix,
            Matrix4 matrix,
            int animationTimeInMilliseconds,
            List<DiagramObjectEntity> content,
            Size size,
            Rect diagramRect)
        animatingInertialScrolling,
    required TResult Function(List<DiagramObjectEntity> content, Size size,
            Rect diagramRect, ScaleStartDetails details)
        stoppingAnimation,
    required TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)
        animatingFromOutOfBounds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Matrix4 matrix, List<DiagramObjectEntity>? content,
            Size? size, Rect? diagramRect)?
        initial,
    TResult? Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
        animatingInitialToIdle,
    TResult? Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect)?
        idle,
    TResult? Function(
            Matrix4 matrix,
            List<DiagramObjectEntity> content,
            ValueUpdater<Offset> translationUpdater,
            ValueUpdater<double> scaleUpdater,
            Size size,
            Rect diagramRect,
            double squaredDistance,
            DateTime eventDateTime)?
        scrolling,
    TResult? Function(
            Matrix4 oldMatrix,
            Matrix4 matrix,
            int animationTimeInMilliseconds,
            List<DiagramObjectEntity> content,
            Size size,
            Rect diagramRect)?
        animatingInertialScrolling,
    TResult? Function(List<DiagramObjectEntity> content, Size size,
            Rect diagramRect, ScaleStartDetails details)?
        stoppingAnimation,
    TResult? Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
        animatingFromOutOfBounds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Matrix4 matrix, List<DiagramObjectEntity>? content,
            Size? size, Rect? diagramRect)?
        initial,
    TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
        animatingInitialToIdle,
    TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect)?
        idle,
    TResult Function(
            Matrix4 matrix,
            List<DiagramObjectEntity> content,
            ValueUpdater<Offset> translationUpdater,
            ValueUpdater<double> scaleUpdater,
            Size size,
            Rect diagramRect,
            double squaredDistance,
            DateTime eventDateTime)?
        scrolling,
    TResult Function(
            Matrix4 oldMatrix,
            Matrix4 matrix,
            int animationTimeInMilliseconds,
            List<DiagramObjectEntity> content,
            Size size,
            Rect diagramRect)?
        animatingInertialScrolling,
    TResult Function(List<DiagramObjectEntity> content, Size size,
            Rect diagramRect, ScaleStartDetails details)?
        stoppingAnimation,
    TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
        animatingFromOutOfBounds,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ScrollingInitial value) initial,
    required TResult Function(_ScrollingAnimatingInitialToIdle value)
        animatingInitialToIdle,
    required TResult Function(_ScrollingIdle value) idle,
    required TResult Function(_ScrollingScrolling value) scrolling,
    required TResult Function(_ScrollingAnimatingInertialScrolling value)
        animatingInertialScrolling,
    required TResult Function(_StoppingAnimation value) stoppingAnimation,
    required TResult Function(_ScrollingAnimatingFromOutOfBounds value)
        animatingFromOutOfBounds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ScrollingInitial value)? initial,
    TResult? Function(_ScrollingAnimatingInitialToIdle value)?
        animatingInitialToIdle,
    TResult? Function(_ScrollingIdle value)? idle,
    TResult? Function(_ScrollingScrolling value)? scrolling,
    TResult? Function(_ScrollingAnimatingInertialScrolling value)?
        animatingInertialScrolling,
    TResult? Function(_StoppingAnimation value)? stoppingAnimation,
    TResult? Function(_ScrollingAnimatingFromOutOfBounds value)?
        animatingFromOutOfBounds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ScrollingInitial value)? initial,
    TResult Function(_ScrollingAnimatingInitialToIdle value)?
        animatingInitialToIdle,
    TResult Function(_ScrollingIdle value)? idle,
    TResult Function(_ScrollingScrolling value)? scrolling,
    TResult Function(_ScrollingAnimatingInertialScrolling value)?
        animatingInertialScrolling,
    TResult Function(_StoppingAnimation value)? stoppingAnimation,
    TResult Function(_ScrollingAnimatingFromOutOfBounds value)?
        animatingFromOutOfBounds,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ScrollingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScrollingStateCopyWith<ScrollingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScrollingStateCopyWith<$Res> {
  factory $ScrollingStateCopyWith(
          ScrollingState value, $Res Function(ScrollingState) then) =
      _$ScrollingStateCopyWithImpl<$Res, ScrollingState>;
  @useResult
  $Res call({List<DiagramObjectEntity> content, Size size, Rect diagramRect});
}

/// @nodoc
class _$ScrollingStateCopyWithImpl<$Res, $Val extends ScrollingState>
    implements $ScrollingStateCopyWith<$Res> {
  _$ScrollingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScrollingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? size = null,
    Object? diagramRect = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content!
          : content // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
      size: null == size
          ? _value.size!
          : size // ignore: cast_nullable_to_non_nullable
              as Size,
      diagramRect: null == diagramRect
          ? _value.diagramRect!
          : diagramRect // ignore: cast_nullable_to_non_nullable
              as Rect,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScrollingInitialImplCopyWith<$Res>
    implements $ScrollingStateCopyWith<$Res> {
  factory _$$ScrollingInitialImplCopyWith(_$ScrollingInitialImpl value,
          $Res Function(_$ScrollingInitialImpl) then) =
      __$$ScrollingInitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Matrix4 matrix,
      List<DiagramObjectEntity>? content,
      Size? size,
      Rect? diagramRect});
}

/// @nodoc
class __$$ScrollingInitialImplCopyWithImpl<$Res>
    extends _$ScrollingStateCopyWithImpl<$Res, _$ScrollingInitialImpl>
    implements _$$ScrollingInitialImplCopyWith<$Res> {
  __$$ScrollingInitialImplCopyWithImpl(_$ScrollingInitialImpl _value,
      $Res Function(_$ScrollingInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScrollingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matrix = null,
    Object? content = freezed,
    Object? size = freezed,
    Object? diagramRect = freezed,
  }) {
    return _then(_$ScrollingInitialImpl(
      matrix: null == matrix
          ? _value.matrix
          : matrix // ignore: cast_nullable_to_non_nullable
              as Matrix4,
      content: freezed == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as Size?,
      diagramRect: freezed == diagramRect
          ? _value.diagramRect
          : diagramRect // ignore: cast_nullable_to_non_nullable
              as Rect?,
    ));
  }
}

/// @nodoc

class _$ScrollingInitialImpl implements _ScrollingInitial {
  const _$ScrollingInitialImpl(
      {required this.matrix,
      final List<DiagramObjectEntity>? content,
      this.size,
      this.diagramRect})
      : _content = content;

  @override
  final Matrix4 matrix;
  final List<DiagramObjectEntity>? _content;
  @override
  List<DiagramObjectEntity>? get content {
    final value = _content;
    if (value == null) return null;
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Size? size;
  @override
  final Rect? diagramRect;

  @override
  String toString() {
    return 'ScrollingState.initial(matrix: $matrix, content: $content, size: $size, diagramRect: $diagramRect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScrollingInitialImpl &&
            (identical(other.matrix, matrix) || other.matrix == matrix) &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.diagramRect, diagramRect) ||
                other.diagramRect == diagramRect));
  }

  @override
  int get hashCode => Object.hash(runtimeType, matrix,
      const DeepCollectionEquality().hash(_content), size, diagramRect);

  /// Create a copy of ScrollingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScrollingInitialImplCopyWith<_$ScrollingInitialImpl> get copyWith =>
      __$$ScrollingInitialImplCopyWithImpl<_$ScrollingInitialImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Matrix4 matrix,
            List<DiagramObjectEntity>? content, Size? size, Rect? diagramRect)
        initial,
    required TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)
        animatingInitialToIdle,
    required TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect)
        idle,
    required TResult Function(
            Matrix4 matrix,
            List<DiagramObjectEntity> content,
            ValueUpdater<Offset> translationUpdater,
            ValueUpdater<double> scaleUpdater,
            Size size,
            Rect diagramRect,
            double squaredDistance,
            DateTime eventDateTime)
        scrolling,
    required TResult Function(
            Matrix4 oldMatrix,
            Matrix4 matrix,
            int animationTimeInMilliseconds,
            List<DiagramObjectEntity> content,
            Size size,
            Rect diagramRect)
        animatingInertialScrolling,
    required TResult Function(List<DiagramObjectEntity> content, Size size,
            Rect diagramRect, ScaleStartDetails details)
        stoppingAnimation,
    required TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)
        animatingFromOutOfBounds,
  }) {
    return initial(matrix, content, size, diagramRect);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Matrix4 matrix, List<DiagramObjectEntity>? content,
            Size? size, Rect? diagramRect)?
        initial,
    TResult? Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
        animatingInitialToIdle,
    TResult? Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect)?
        idle,
    TResult? Function(
            Matrix4 matrix,
            List<DiagramObjectEntity> content,
            ValueUpdater<Offset> translationUpdater,
            ValueUpdater<double> scaleUpdater,
            Size size,
            Rect diagramRect,
            double squaredDistance,
            DateTime eventDateTime)?
        scrolling,
    TResult? Function(
            Matrix4 oldMatrix,
            Matrix4 matrix,
            int animationTimeInMilliseconds,
            List<DiagramObjectEntity> content,
            Size size,
            Rect diagramRect)?
        animatingInertialScrolling,
    TResult? Function(List<DiagramObjectEntity> content, Size size,
            Rect diagramRect, ScaleStartDetails details)?
        stoppingAnimation,
    TResult? Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
        animatingFromOutOfBounds,
  }) {
    return initial?.call(matrix, content, size, diagramRect);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Matrix4 matrix, List<DiagramObjectEntity>? content,
            Size? size, Rect? diagramRect)?
        initial,
    TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
        animatingInitialToIdle,
    TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect)?
        idle,
    TResult Function(
            Matrix4 matrix,
            List<DiagramObjectEntity> content,
            ValueUpdater<Offset> translationUpdater,
            ValueUpdater<double> scaleUpdater,
            Size size,
            Rect diagramRect,
            double squaredDistance,
            DateTime eventDateTime)?
        scrolling,
    TResult Function(
            Matrix4 oldMatrix,
            Matrix4 matrix,
            int animationTimeInMilliseconds,
            List<DiagramObjectEntity> content,
            Size size,
            Rect diagramRect)?
        animatingInertialScrolling,
    TResult Function(List<DiagramObjectEntity> content, Size size,
            Rect diagramRect, ScaleStartDetails details)?
        stoppingAnimation,
    TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
        animatingFromOutOfBounds,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(matrix, content, size, diagramRect);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ScrollingInitial value) initial,
    required TResult Function(_ScrollingAnimatingInitialToIdle value)
        animatingInitialToIdle,
    required TResult Function(_ScrollingIdle value) idle,
    required TResult Function(_ScrollingScrolling value) scrolling,
    required TResult Function(_ScrollingAnimatingInertialScrolling value)
        animatingInertialScrolling,
    required TResult Function(_StoppingAnimation value) stoppingAnimation,
    required TResult Function(_ScrollingAnimatingFromOutOfBounds value)
        animatingFromOutOfBounds,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ScrollingInitial value)? initial,
    TResult? Function(_ScrollingAnimatingInitialToIdle value)?
        animatingInitialToIdle,
    TResult? Function(_ScrollingIdle value)? idle,
    TResult? Function(_ScrollingScrolling value)? scrolling,
    TResult? Function(_ScrollingAnimatingInertialScrolling value)?
        animatingInertialScrolling,
    TResult? Function(_StoppingAnimation value)? stoppingAnimation,
    TResult? Function(_ScrollingAnimatingFromOutOfBounds value)?
        animatingFromOutOfBounds,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ScrollingInitial value)? initial,
    TResult Function(_ScrollingAnimatingInitialToIdle value)?
        animatingInitialToIdle,
    TResult Function(_ScrollingIdle value)? idle,
    TResult Function(_ScrollingScrolling value)? scrolling,
    TResult Function(_ScrollingAnimatingInertialScrolling value)?
        animatingInertialScrolling,
    TResult Function(_StoppingAnimation value)? stoppingAnimation,
    TResult Function(_ScrollingAnimatingFromOutOfBounds value)?
        animatingFromOutOfBounds,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _ScrollingInitial implements ScrollingState {
  const factory _ScrollingInitial(
      {required final Matrix4 matrix,
      final List<DiagramObjectEntity>? content,
      final Size? size,
      final Rect? diagramRect}) = _$ScrollingInitialImpl;

  Matrix4 get matrix;
  @override
  List<DiagramObjectEntity>? get content;
  @override
  Size? get size;
  @override
  Rect? get diagramRect;

  /// Create a copy of ScrollingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScrollingInitialImplCopyWith<_$ScrollingInitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ScrollingAnimatingInitialToIdleImplCopyWith<$Res>
    implements $ScrollingStateCopyWith<$Res> {
  factory _$$ScrollingAnimatingInitialToIdleImplCopyWith(
          _$ScrollingAnimatingInitialToIdleImpl value,
          $Res Function(_$ScrollingAnimatingInitialToIdleImpl) then) =
      __$$ScrollingAnimatingInitialToIdleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Matrix4 oldMatrix,
      Matrix4 matrix,
      List<DiagramObjectEntity> content,
      Size size,
      Rect diagramRect});
}

/// @nodoc
class __$$ScrollingAnimatingInitialToIdleImplCopyWithImpl<$Res>
    extends _$ScrollingStateCopyWithImpl<$Res,
        _$ScrollingAnimatingInitialToIdleImpl>
    implements _$$ScrollingAnimatingInitialToIdleImplCopyWith<$Res> {
  __$$ScrollingAnimatingInitialToIdleImplCopyWithImpl(
      _$ScrollingAnimatingInitialToIdleImpl _value,
      $Res Function(_$ScrollingAnimatingInitialToIdleImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScrollingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oldMatrix = null,
    Object? matrix = null,
    Object? content = null,
    Object? size = null,
    Object? diagramRect = null,
  }) {
    return _then(_$ScrollingAnimatingInitialToIdleImpl(
      oldMatrix: null == oldMatrix
          ? _value.oldMatrix
          : oldMatrix // ignore: cast_nullable_to_non_nullable
              as Matrix4,
      matrix: null == matrix
          ? _value.matrix
          : matrix // ignore: cast_nullable_to_non_nullable
              as Matrix4,
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as Size,
      diagramRect: null == diagramRect
          ? _value.diagramRect
          : diagramRect // ignore: cast_nullable_to_non_nullable
              as Rect,
    ));
  }
}

/// @nodoc

class _$ScrollingAnimatingInitialToIdleImpl
    implements _ScrollingAnimatingInitialToIdle {
  const _$ScrollingAnimatingInitialToIdleImpl(
      {required this.oldMatrix,
      required this.matrix,
      required final List<DiagramObjectEntity> content,
      required this.size,
      required this.diagramRect})
      : _content = content;

  @override
  final Matrix4 oldMatrix;
  @override
  final Matrix4 matrix;
  final List<DiagramObjectEntity> _content;
  @override
  List<DiagramObjectEntity> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  final Size size;
  @override
  final Rect diagramRect;

  @override
  String toString() {
    return 'ScrollingState.animatingInitialToIdle(oldMatrix: $oldMatrix, matrix: $matrix, content: $content, size: $size, diagramRect: $diagramRect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScrollingAnimatingInitialToIdleImpl &&
            (identical(other.oldMatrix, oldMatrix) ||
                other.oldMatrix == oldMatrix) &&
            (identical(other.matrix, matrix) || other.matrix == matrix) &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.diagramRect, diagramRect) ||
                other.diagramRect == diagramRect));
  }

  @override
  int get hashCode => Object.hash(runtimeType, oldMatrix, matrix,
      const DeepCollectionEquality().hash(_content), size, diagramRect);

  /// Create a copy of ScrollingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScrollingAnimatingInitialToIdleImplCopyWith<
          _$ScrollingAnimatingInitialToIdleImpl>
      get copyWith => __$$ScrollingAnimatingInitialToIdleImplCopyWithImpl<
          _$ScrollingAnimatingInitialToIdleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Matrix4 matrix,
            List<DiagramObjectEntity>? content, Size? size, Rect? diagramRect)
        initial,
    required TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)
        animatingInitialToIdle,
    required TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect)
        idle,
    required TResult Function(
            Matrix4 matrix,
            List<DiagramObjectEntity> content,
            ValueUpdater<Offset> translationUpdater,
            ValueUpdater<double> scaleUpdater,
            Size size,
            Rect diagramRect,
            double squaredDistance,
            DateTime eventDateTime)
        scrolling,
    required TResult Function(
            Matrix4 oldMatrix,
            Matrix4 matrix,
            int animationTimeInMilliseconds,
            List<DiagramObjectEntity> content,
            Size size,
            Rect diagramRect)
        animatingInertialScrolling,
    required TResult Function(List<DiagramObjectEntity> content, Size size,
            Rect diagramRect, ScaleStartDetails details)
        stoppingAnimation,
    required TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)
        animatingFromOutOfBounds,
  }) {
    return animatingInitialToIdle(
        oldMatrix, matrix, content, size, diagramRect);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Matrix4 matrix, List<DiagramObjectEntity>? content,
            Size? size, Rect? diagramRect)?
        initial,
    TResult? Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
        animatingInitialToIdle,
    TResult? Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect)?
        idle,
    TResult? Function(
            Matrix4 matrix,
            List<DiagramObjectEntity> content,
            ValueUpdater<Offset> translationUpdater,
            ValueUpdater<double> scaleUpdater,
            Size size,
            Rect diagramRect,
            double squaredDistance,
            DateTime eventDateTime)?
        scrolling,
    TResult? Function(
            Matrix4 oldMatrix,
            Matrix4 matrix,
            int animationTimeInMilliseconds,
            List<DiagramObjectEntity> content,
            Size size,
            Rect diagramRect)?
        animatingInertialScrolling,
    TResult? Function(List<DiagramObjectEntity> content, Size size,
            Rect diagramRect, ScaleStartDetails details)?
        stoppingAnimation,
    TResult? Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
        animatingFromOutOfBounds,
  }) {
    return animatingInitialToIdle?.call(
        oldMatrix, matrix, content, size, diagramRect);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Matrix4 matrix, List<DiagramObjectEntity>? content,
            Size? size, Rect? diagramRect)?
        initial,
    TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
        animatingInitialToIdle,
    TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect)?
        idle,
    TResult Function(
            Matrix4 matrix,
            List<DiagramObjectEntity> content,
            ValueUpdater<Offset> translationUpdater,
            ValueUpdater<double> scaleUpdater,
            Size size,
            Rect diagramRect,
            double squaredDistance,
            DateTime eventDateTime)?
        scrolling,
    TResult Function(
            Matrix4 oldMatrix,
            Matrix4 matrix,
            int animationTimeInMilliseconds,
            List<DiagramObjectEntity> content,
            Size size,
            Rect diagramRect)?
        animatingInertialScrolling,
    TResult Function(List<DiagramObjectEntity> content, Size size,
            Rect diagramRect, ScaleStartDetails details)?
        stoppingAnimation,
    TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
        animatingFromOutOfBounds,
    required TResult orElse(),
  }) {
    if (animatingInitialToIdle != null) {
      return animatingInitialToIdle(
          oldMatrix, matrix, content, size, diagramRect);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ScrollingInitial value) initial,
    required TResult Function(_ScrollingAnimatingInitialToIdle value)
        animatingInitialToIdle,
    required TResult Function(_ScrollingIdle value) idle,
    required TResult Function(_ScrollingScrolling value) scrolling,
    required TResult Function(_ScrollingAnimatingInertialScrolling value)
        animatingInertialScrolling,
    required TResult Function(_StoppingAnimation value) stoppingAnimation,
    required TResult Function(_ScrollingAnimatingFromOutOfBounds value)
        animatingFromOutOfBounds,
  }) {
    return animatingInitialToIdle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ScrollingInitial value)? initial,
    TResult? Function(_ScrollingAnimatingInitialToIdle value)?
        animatingInitialToIdle,
    TResult? Function(_ScrollingIdle value)? idle,
    TResult? Function(_ScrollingScrolling value)? scrolling,
    TResult? Function(_ScrollingAnimatingInertialScrolling value)?
        animatingInertialScrolling,
    TResult? Function(_StoppingAnimation value)? stoppingAnimation,
    TResult? Function(_ScrollingAnimatingFromOutOfBounds value)?
        animatingFromOutOfBounds,
  }) {
    return animatingInitialToIdle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ScrollingInitial value)? initial,
    TResult Function(_ScrollingAnimatingInitialToIdle value)?
        animatingInitialToIdle,
    TResult Function(_ScrollingIdle value)? idle,
    TResult Function(_ScrollingScrolling value)? scrolling,
    TResult Function(_ScrollingAnimatingInertialScrolling value)?
        animatingInertialScrolling,
    TResult Function(_StoppingAnimation value)? stoppingAnimation,
    TResult Function(_ScrollingAnimatingFromOutOfBounds value)?
        animatingFromOutOfBounds,
    required TResult orElse(),
  }) {
    if (animatingInitialToIdle != null) {
      return animatingInitialToIdle(this);
    }
    return orElse();
  }
}

abstract class _ScrollingAnimatingInitialToIdle implements ScrollingState {
  const factory _ScrollingAnimatingInitialToIdle(
      {required final Matrix4 oldMatrix,
      required final Matrix4 matrix,
      required final List<DiagramObjectEntity> content,
      required final Size size,
      required final Rect diagramRect}) = _$ScrollingAnimatingInitialToIdleImpl;

  Matrix4 get oldMatrix;
  Matrix4 get matrix;
  @override
  List<DiagramObjectEntity> get content;
  @override
  Size get size;
  @override
  Rect get diagramRect;

  /// Create a copy of ScrollingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScrollingAnimatingInitialToIdleImplCopyWith<
          _$ScrollingAnimatingInitialToIdleImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ScrollingIdleImplCopyWith<$Res>
    implements $ScrollingStateCopyWith<$Res> {
  factory _$$ScrollingIdleImplCopyWith(
          _$ScrollingIdleImpl value, $Res Function(_$ScrollingIdleImpl) then) =
      __$$ScrollingIdleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Matrix4 matrix,
      List<DiagramObjectEntity> content,
      Size size,
      Rect diagramRect});
}

/// @nodoc
class __$$ScrollingIdleImplCopyWithImpl<$Res>
    extends _$ScrollingStateCopyWithImpl<$Res, _$ScrollingIdleImpl>
    implements _$$ScrollingIdleImplCopyWith<$Res> {
  __$$ScrollingIdleImplCopyWithImpl(
      _$ScrollingIdleImpl _value, $Res Function(_$ScrollingIdleImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScrollingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matrix = null,
    Object? content = null,
    Object? size = null,
    Object? diagramRect = null,
  }) {
    return _then(_$ScrollingIdleImpl(
      matrix: null == matrix
          ? _value.matrix
          : matrix // ignore: cast_nullable_to_non_nullable
              as Matrix4,
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as Size,
      diagramRect: null == diagramRect
          ? _value.diagramRect
          : diagramRect // ignore: cast_nullable_to_non_nullable
              as Rect,
    ));
  }
}

/// @nodoc

class _$ScrollingIdleImpl implements _ScrollingIdle {
  const _$ScrollingIdleImpl(
      {required this.matrix,
      required final List<DiagramObjectEntity> content,
      required this.size,
      required this.diagramRect})
      : _content = content;

  @override
  final Matrix4 matrix;
  final List<DiagramObjectEntity> _content;
  @override
  List<DiagramObjectEntity> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  final Size size;
  @override
  final Rect diagramRect;

  @override
  String toString() {
    return 'ScrollingState.idle(matrix: $matrix, content: $content, size: $size, diagramRect: $diagramRect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScrollingIdleImpl &&
            (identical(other.matrix, matrix) || other.matrix == matrix) &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.diagramRect, diagramRect) ||
                other.diagramRect == diagramRect));
  }

  @override
  int get hashCode => Object.hash(runtimeType, matrix,
      const DeepCollectionEquality().hash(_content), size, diagramRect);

  /// Create a copy of ScrollingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScrollingIdleImplCopyWith<_$ScrollingIdleImpl> get copyWith =>
      __$$ScrollingIdleImplCopyWithImpl<_$ScrollingIdleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Matrix4 matrix,
            List<DiagramObjectEntity>? content, Size? size, Rect? diagramRect)
        initial,
    required TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)
        animatingInitialToIdle,
    required TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect)
        idle,
    required TResult Function(
            Matrix4 matrix,
            List<DiagramObjectEntity> content,
            ValueUpdater<Offset> translationUpdater,
            ValueUpdater<double> scaleUpdater,
            Size size,
            Rect diagramRect,
            double squaredDistance,
            DateTime eventDateTime)
        scrolling,
    required TResult Function(
            Matrix4 oldMatrix,
            Matrix4 matrix,
            int animationTimeInMilliseconds,
            List<DiagramObjectEntity> content,
            Size size,
            Rect diagramRect)
        animatingInertialScrolling,
    required TResult Function(List<DiagramObjectEntity> content, Size size,
            Rect diagramRect, ScaleStartDetails details)
        stoppingAnimation,
    required TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)
        animatingFromOutOfBounds,
  }) {
    return idle(matrix, content, size, diagramRect);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Matrix4 matrix, List<DiagramObjectEntity>? content,
            Size? size, Rect? diagramRect)?
        initial,
    TResult? Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
        animatingInitialToIdle,
    TResult? Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect)?
        idle,
    TResult? Function(
            Matrix4 matrix,
            List<DiagramObjectEntity> content,
            ValueUpdater<Offset> translationUpdater,
            ValueUpdater<double> scaleUpdater,
            Size size,
            Rect diagramRect,
            double squaredDistance,
            DateTime eventDateTime)?
        scrolling,
    TResult? Function(
            Matrix4 oldMatrix,
            Matrix4 matrix,
            int animationTimeInMilliseconds,
            List<DiagramObjectEntity> content,
            Size size,
            Rect diagramRect)?
        animatingInertialScrolling,
    TResult? Function(List<DiagramObjectEntity> content, Size size,
            Rect diagramRect, ScaleStartDetails details)?
        stoppingAnimation,
    TResult? Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
        animatingFromOutOfBounds,
  }) {
    return idle?.call(matrix, content, size, diagramRect);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Matrix4 matrix, List<DiagramObjectEntity>? content,
            Size? size, Rect? diagramRect)?
        initial,
    TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
        animatingInitialToIdle,
    TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect)?
        idle,
    TResult Function(
            Matrix4 matrix,
            List<DiagramObjectEntity> content,
            ValueUpdater<Offset> translationUpdater,
            ValueUpdater<double> scaleUpdater,
            Size size,
            Rect diagramRect,
            double squaredDistance,
            DateTime eventDateTime)?
        scrolling,
    TResult Function(
            Matrix4 oldMatrix,
            Matrix4 matrix,
            int animationTimeInMilliseconds,
            List<DiagramObjectEntity> content,
            Size size,
            Rect diagramRect)?
        animatingInertialScrolling,
    TResult Function(List<DiagramObjectEntity> content, Size size,
            Rect diagramRect, ScaleStartDetails details)?
        stoppingAnimation,
    TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
        animatingFromOutOfBounds,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(matrix, content, size, diagramRect);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ScrollingInitial value) initial,
    required TResult Function(_ScrollingAnimatingInitialToIdle value)
        animatingInitialToIdle,
    required TResult Function(_ScrollingIdle value) idle,
    required TResult Function(_ScrollingScrolling value) scrolling,
    required TResult Function(_ScrollingAnimatingInertialScrolling value)
        animatingInertialScrolling,
    required TResult Function(_StoppingAnimation value) stoppingAnimation,
    required TResult Function(_ScrollingAnimatingFromOutOfBounds value)
        animatingFromOutOfBounds,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ScrollingInitial value)? initial,
    TResult? Function(_ScrollingAnimatingInitialToIdle value)?
        animatingInitialToIdle,
    TResult? Function(_ScrollingIdle value)? idle,
    TResult? Function(_ScrollingScrolling value)? scrolling,
    TResult? Function(_ScrollingAnimatingInertialScrolling value)?
        animatingInertialScrolling,
    TResult? Function(_StoppingAnimation value)? stoppingAnimation,
    TResult? Function(_ScrollingAnimatingFromOutOfBounds value)?
        animatingFromOutOfBounds,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ScrollingInitial value)? initial,
    TResult Function(_ScrollingAnimatingInitialToIdle value)?
        animatingInitialToIdle,
    TResult Function(_ScrollingIdle value)? idle,
    TResult Function(_ScrollingScrolling value)? scrolling,
    TResult Function(_ScrollingAnimatingInertialScrolling value)?
        animatingInertialScrolling,
    TResult Function(_StoppingAnimation value)? stoppingAnimation,
    TResult Function(_ScrollingAnimatingFromOutOfBounds value)?
        animatingFromOutOfBounds,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _ScrollingIdle implements ScrollingState {
  const factory _ScrollingIdle(
      {required final Matrix4 matrix,
      required final List<DiagramObjectEntity> content,
      required final Size size,
      required final Rect diagramRect}) = _$ScrollingIdleImpl;

  Matrix4 get matrix;
  @override
  List<DiagramObjectEntity> get content;
  @override
  Size get size;
  @override
  Rect get diagramRect;

  /// Create a copy of ScrollingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScrollingIdleImplCopyWith<_$ScrollingIdleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ScrollingScrollingImplCopyWith<$Res>
    implements $ScrollingStateCopyWith<$Res> {
  factory _$$ScrollingScrollingImplCopyWith(_$ScrollingScrollingImpl value,
          $Res Function(_$ScrollingScrollingImpl) then) =
      __$$ScrollingScrollingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Matrix4 matrix,
      List<DiagramObjectEntity> content,
      ValueUpdater<Offset> translationUpdater,
      ValueUpdater<double> scaleUpdater,
      Size size,
      Rect diagramRect,
      double squaredDistance,
      DateTime eventDateTime});
}

/// @nodoc
class __$$ScrollingScrollingImplCopyWithImpl<$Res>
    extends _$ScrollingStateCopyWithImpl<$Res, _$ScrollingScrollingImpl>
    implements _$$ScrollingScrollingImplCopyWith<$Res> {
  __$$ScrollingScrollingImplCopyWithImpl(_$ScrollingScrollingImpl _value,
      $Res Function(_$ScrollingScrollingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScrollingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matrix = null,
    Object? content = null,
    Object? translationUpdater = null,
    Object? scaleUpdater = null,
    Object? size = null,
    Object? diagramRect = null,
    Object? squaredDistance = null,
    Object? eventDateTime = null,
  }) {
    return _then(_$ScrollingScrollingImpl(
      matrix: null == matrix
          ? _value.matrix
          : matrix // ignore: cast_nullable_to_non_nullable
              as Matrix4,
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
      translationUpdater: null == translationUpdater
          ? _value.translationUpdater
          : translationUpdater // ignore: cast_nullable_to_non_nullable
              as ValueUpdater<Offset>,
      scaleUpdater: null == scaleUpdater
          ? _value.scaleUpdater
          : scaleUpdater // ignore: cast_nullable_to_non_nullable
              as ValueUpdater<double>,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as Size,
      diagramRect: null == diagramRect
          ? _value.diagramRect
          : diagramRect // ignore: cast_nullable_to_non_nullable
              as Rect,
      squaredDistance: null == squaredDistance
          ? _value.squaredDistance
          : squaredDistance // ignore: cast_nullable_to_non_nullable
              as double,
      eventDateTime: null == eventDateTime
          ? _value.eventDateTime
          : eventDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$ScrollingScrollingImpl implements _ScrollingScrolling {
  const _$ScrollingScrollingImpl(
      {required this.matrix,
      required final List<DiagramObjectEntity> content,
      required this.translationUpdater,
      required this.scaleUpdater,
      required this.size,
      required this.diagramRect,
      required this.squaredDistance,
      required this.eventDateTime})
      : _content = content;

  @override
  final Matrix4 matrix;
  final List<DiagramObjectEntity> _content;
  @override
  List<DiagramObjectEntity> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  final ValueUpdater<Offset> translationUpdater;
  @override
  final ValueUpdater<double> scaleUpdater;
  @override
  final Size size;
  @override
  final Rect diagramRect;
  @override
  final double squaredDistance;
  @override
  final DateTime eventDateTime;

  @override
  String toString() {
    return 'ScrollingState.scrolling(matrix: $matrix, content: $content, translationUpdater: $translationUpdater, scaleUpdater: $scaleUpdater, size: $size, diagramRect: $diagramRect, squaredDistance: $squaredDistance, eventDateTime: $eventDateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScrollingScrollingImpl &&
            (identical(other.matrix, matrix) || other.matrix == matrix) &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.translationUpdater, translationUpdater) ||
                other.translationUpdater == translationUpdater) &&
            (identical(other.scaleUpdater, scaleUpdater) ||
                other.scaleUpdater == scaleUpdater) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.diagramRect, diagramRect) ||
                other.diagramRect == diagramRect) &&
            (identical(other.squaredDistance, squaredDistance) ||
                other.squaredDistance == squaredDistance) &&
            (identical(other.eventDateTime, eventDateTime) ||
                other.eventDateTime == eventDateTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      matrix,
      const DeepCollectionEquality().hash(_content),
      translationUpdater,
      scaleUpdater,
      size,
      diagramRect,
      squaredDistance,
      eventDateTime);

  /// Create a copy of ScrollingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScrollingScrollingImplCopyWith<_$ScrollingScrollingImpl> get copyWith =>
      __$$ScrollingScrollingImplCopyWithImpl<_$ScrollingScrollingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Matrix4 matrix,
            List<DiagramObjectEntity>? content, Size? size, Rect? diagramRect)
        initial,
    required TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)
        animatingInitialToIdle,
    required TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect)
        idle,
    required TResult Function(
            Matrix4 matrix,
            List<DiagramObjectEntity> content,
            ValueUpdater<Offset> translationUpdater,
            ValueUpdater<double> scaleUpdater,
            Size size,
            Rect diagramRect,
            double squaredDistance,
            DateTime eventDateTime)
        scrolling,
    required TResult Function(
            Matrix4 oldMatrix,
            Matrix4 matrix,
            int animationTimeInMilliseconds,
            List<DiagramObjectEntity> content,
            Size size,
            Rect diagramRect)
        animatingInertialScrolling,
    required TResult Function(List<DiagramObjectEntity> content, Size size,
            Rect diagramRect, ScaleStartDetails details)
        stoppingAnimation,
    required TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)
        animatingFromOutOfBounds,
  }) {
    return scrolling(matrix, content, translationUpdater, scaleUpdater, size,
        diagramRect, squaredDistance, eventDateTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Matrix4 matrix, List<DiagramObjectEntity>? content,
            Size? size, Rect? diagramRect)?
        initial,
    TResult? Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
        animatingInitialToIdle,
    TResult? Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect)?
        idle,
    TResult? Function(
            Matrix4 matrix,
            List<DiagramObjectEntity> content,
            ValueUpdater<Offset> translationUpdater,
            ValueUpdater<double> scaleUpdater,
            Size size,
            Rect diagramRect,
            double squaredDistance,
            DateTime eventDateTime)?
        scrolling,
    TResult? Function(
            Matrix4 oldMatrix,
            Matrix4 matrix,
            int animationTimeInMilliseconds,
            List<DiagramObjectEntity> content,
            Size size,
            Rect diagramRect)?
        animatingInertialScrolling,
    TResult? Function(List<DiagramObjectEntity> content, Size size,
            Rect diagramRect, ScaleStartDetails details)?
        stoppingAnimation,
    TResult? Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
        animatingFromOutOfBounds,
  }) {
    return scrolling?.call(matrix, content, translationUpdater, scaleUpdater,
        size, diagramRect, squaredDistance, eventDateTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Matrix4 matrix, List<DiagramObjectEntity>? content,
            Size? size, Rect? diagramRect)?
        initial,
    TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
        animatingInitialToIdle,
    TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect)?
        idle,
    TResult Function(
            Matrix4 matrix,
            List<DiagramObjectEntity> content,
            ValueUpdater<Offset> translationUpdater,
            ValueUpdater<double> scaleUpdater,
            Size size,
            Rect diagramRect,
            double squaredDistance,
            DateTime eventDateTime)?
        scrolling,
    TResult Function(
            Matrix4 oldMatrix,
            Matrix4 matrix,
            int animationTimeInMilliseconds,
            List<DiagramObjectEntity> content,
            Size size,
            Rect diagramRect)?
        animatingInertialScrolling,
    TResult Function(List<DiagramObjectEntity> content, Size size,
            Rect diagramRect, ScaleStartDetails details)?
        stoppingAnimation,
    TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
        animatingFromOutOfBounds,
    required TResult orElse(),
  }) {
    if (scrolling != null) {
      return scrolling(matrix, content, translationUpdater, scaleUpdater, size,
          diagramRect, squaredDistance, eventDateTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ScrollingInitial value) initial,
    required TResult Function(_ScrollingAnimatingInitialToIdle value)
        animatingInitialToIdle,
    required TResult Function(_ScrollingIdle value) idle,
    required TResult Function(_ScrollingScrolling value) scrolling,
    required TResult Function(_ScrollingAnimatingInertialScrolling value)
        animatingInertialScrolling,
    required TResult Function(_StoppingAnimation value) stoppingAnimation,
    required TResult Function(_ScrollingAnimatingFromOutOfBounds value)
        animatingFromOutOfBounds,
  }) {
    return scrolling(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ScrollingInitial value)? initial,
    TResult? Function(_ScrollingAnimatingInitialToIdle value)?
        animatingInitialToIdle,
    TResult? Function(_ScrollingIdle value)? idle,
    TResult? Function(_ScrollingScrolling value)? scrolling,
    TResult? Function(_ScrollingAnimatingInertialScrolling value)?
        animatingInertialScrolling,
    TResult? Function(_StoppingAnimation value)? stoppingAnimation,
    TResult? Function(_ScrollingAnimatingFromOutOfBounds value)?
        animatingFromOutOfBounds,
  }) {
    return scrolling?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ScrollingInitial value)? initial,
    TResult Function(_ScrollingAnimatingInitialToIdle value)?
        animatingInitialToIdle,
    TResult Function(_ScrollingIdle value)? idle,
    TResult Function(_ScrollingScrolling value)? scrolling,
    TResult Function(_ScrollingAnimatingInertialScrolling value)?
        animatingInertialScrolling,
    TResult Function(_StoppingAnimation value)? stoppingAnimation,
    TResult Function(_ScrollingAnimatingFromOutOfBounds value)?
        animatingFromOutOfBounds,
    required TResult orElse(),
  }) {
    if (scrolling != null) {
      return scrolling(this);
    }
    return orElse();
  }
}

abstract class _ScrollingScrolling implements ScrollingState {
  const factory _ScrollingScrolling(
      {required final Matrix4 matrix,
      required final List<DiagramObjectEntity> content,
      required final ValueUpdater<Offset> translationUpdater,
      required final ValueUpdater<double> scaleUpdater,
      required final Size size,
      required final Rect diagramRect,
      required final double squaredDistance,
      required final DateTime eventDateTime}) = _$ScrollingScrollingImpl;

  Matrix4 get matrix;
  @override
  List<DiagramObjectEntity> get content;
  ValueUpdater<Offset> get translationUpdater;
  ValueUpdater<double> get scaleUpdater;
  @override
  Size get size;
  @override
  Rect get diagramRect;
  double get squaredDistance;
  DateTime get eventDateTime;

  /// Create a copy of ScrollingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScrollingScrollingImplCopyWith<_$ScrollingScrollingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ScrollingAnimatingInertialScrollingImplCopyWith<$Res>
    implements $ScrollingStateCopyWith<$Res> {
  factory _$$ScrollingAnimatingInertialScrollingImplCopyWith(
          _$ScrollingAnimatingInertialScrollingImpl value,
          $Res Function(_$ScrollingAnimatingInertialScrollingImpl) then) =
      __$$ScrollingAnimatingInertialScrollingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Matrix4 oldMatrix,
      Matrix4 matrix,
      int animationTimeInMilliseconds,
      List<DiagramObjectEntity> content,
      Size size,
      Rect diagramRect});
}

/// @nodoc
class __$$ScrollingAnimatingInertialScrollingImplCopyWithImpl<$Res>
    extends _$ScrollingStateCopyWithImpl<$Res,
        _$ScrollingAnimatingInertialScrollingImpl>
    implements _$$ScrollingAnimatingInertialScrollingImplCopyWith<$Res> {
  __$$ScrollingAnimatingInertialScrollingImplCopyWithImpl(
      _$ScrollingAnimatingInertialScrollingImpl _value,
      $Res Function(_$ScrollingAnimatingInertialScrollingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScrollingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oldMatrix = null,
    Object? matrix = null,
    Object? animationTimeInMilliseconds = null,
    Object? content = null,
    Object? size = null,
    Object? diagramRect = null,
  }) {
    return _then(_$ScrollingAnimatingInertialScrollingImpl(
      oldMatrix: null == oldMatrix
          ? _value.oldMatrix
          : oldMatrix // ignore: cast_nullable_to_non_nullable
              as Matrix4,
      matrix: null == matrix
          ? _value.matrix
          : matrix // ignore: cast_nullable_to_non_nullable
              as Matrix4,
      animationTimeInMilliseconds: null == animationTimeInMilliseconds
          ? _value.animationTimeInMilliseconds
          : animationTimeInMilliseconds // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as Size,
      diagramRect: null == diagramRect
          ? _value.diagramRect
          : diagramRect // ignore: cast_nullable_to_non_nullable
              as Rect,
    ));
  }
}

/// @nodoc

class _$ScrollingAnimatingInertialScrollingImpl
    implements _ScrollingAnimatingInertialScrolling {
  const _$ScrollingAnimatingInertialScrollingImpl(
      {required this.oldMatrix,
      required this.matrix,
      required this.animationTimeInMilliseconds,
      required final List<DiagramObjectEntity> content,
      required this.size,
      required this.diagramRect})
      : _content = content;

  @override
  final Matrix4 oldMatrix;
  @override
  final Matrix4 matrix;
  @override
  final int animationTimeInMilliseconds;
  final List<DiagramObjectEntity> _content;
  @override
  List<DiagramObjectEntity> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  final Size size;
  @override
  final Rect diagramRect;

  @override
  String toString() {
    return 'ScrollingState.animatingInertialScrolling(oldMatrix: $oldMatrix, matrix: $matrix, animationTimeInMilliseconds: $animationTimeInMilliseconds, content: $content, size: $size, diagramRect: $diagramRect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScrollingAnimatingInertialScrollingImpl &&
            (identical(other.oldMatrix, oldMatrix) ||
                other.oldMatrix == oldMatrix) &&
            (identical(other.matrix, matrix) || other.matrix == matrix) &&
            (identical(other.animationTimeInMilliseconds,
                    animationTimeInMilliseconds) ||
                other.animationTimeInMilliseconds ==
                    animationTimeInMilliseconds) &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.diagramRect, diagramRect) ||
                other.diagramRect == diagramRect));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      oldMatrix,
      matrix,
      animationTimeInMilliseconds,
      const DeepCollectionEquality().hash(_content),
      size,
      diagramRect);

  /// Create a copy of ScrollingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScrollingAnimatingInertialScrollingImplCopyWith<
          _$ScrollingAnimatingInertialScrollingImpl>
      get copyWith => __$$ScrollingAnimatingInertialScrollingImplCopyWithImpl<
          _$ScrollingAnimatingInertialScrollingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Matrix4 matrix,
            List<DiagramObjectEntity>? content, Size? size, Rect? diagramRect)
        initial,
    required TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)
        animatingInitialToIdle,
    required TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect)
        idle,
    required TResult Function(
            Matrix4 matrix,
            List<DiagramObjectEntity> content,
            ValueUpdater<Offset> translationUpdater,
            ValueUpdater<double> scaleUpdater,
            Size size,
            Rect diagramRect,
            double squaredDistance,
            DateTime eventDateTime)
        scrolling,
    required TResult Function(
            Matrix4 oldMatrix,
            Matrix4 matrix,
            int animationTimeInMilliseconds,
            List<DiagramObjectEntity> content,
            Size size,
            Rect diagramRect)
        animatingInertialScrolling,
    required TResult Function(List<DiagramObjectEntity> content, Size size,
            Rect diagramRect, ScaleStartDetails details)
        stoppingAnimation,
    required TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)
        animatingFromOutOfBounds,
  }) {
    return animatingInertialScrolling(oldMatrix, matrix,
        animationTimeInMilliseconds, content, size, diagramRect);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Matrix4 matrix, List<DiagramObjectEntity>? content,
            Size? size, Rect? diagramRect)?
        initial,
    TResult? Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
        animatingInitialToIdle,
    TResult? Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect)?
        idle,
    TResult? Function(
            Matrix4 matrix,
            List<DiagramObjectEntity> content,
            ValueUpdater<Offset> translationUpdater,
            ValueUpdater<double> scaleUpdater,
            Size size,
            Rect diagramRect,
            double squaredDistance,
            DateTime eventDateTime)?
        scrolling,
    TResult? Function(
            Matrix4 oldMatrix,
            Matrix4 matrix,
            int animationTimeInMilliseconds,
            List<DiagramObjectEntity> content,
            Size size,
            Rect diagramRect)?
        animatingInertialScrolling,
    TResult? Function(List<DiagramObjectEntity> content, Size size,
            Rect diagramRect, ScaleStartDetails details)?
        stoppingAnimation,
    TResult? Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
        animatingFromOutOfBounds,
  }) {
    return animatingInertialScrolling?.call(oldMatrix, matrix,
        animationTimeInMilliseconds, content, size, diagramRect);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Matrix4 matrix, List<DiagramObjectEntity>? content,
            Size? size, Rect? diagramRect)?
        initial,
    TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
        animatingInitialToIdle,
    TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect)?
        idle,
    TResult Function(
            Matrix4 matrix,
            List<DiagramObjectEntity> content,
            ValueUpdater<Offset> translationUpdater,
            ValueUpdater<double> scaleUpdater,
            Size size,
            Rect diagramRect,
            double squaredDistance,
            DateTime eventDateTime)?
        scrolling,
    TResult Function(
            Matrix4 oldMatrix,
            Matrix4 matrix,
            int animationTimeInMilliseconds,
            List<DiagramObjectEntity> content,
            Size size,
            Rect diagramRect)?
        animatingInertialScrolling,
    TResult Function(List<DiagramObjectEntity> content, Size size,
            Rect diagramRect, ScaleStartDetails details)?
        stoppingAnimation,
    TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
        animatingFromOutOfBounds,
    required TResult orElse(),
  }) {
    if (animatingInertialScrolling != null) {
      return animatingInertialScrolling(oldMatrix, matrix,
          animationTimeInMilliseconds, content, size, diagramRect);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ScrollingInitial value) initial,
    required TResult Function(_ScrollingAnimatingInitialToIdle value)
        animatingInitialToIdle,
    required TResult Function(_ScrollingIdle value) idle,
    required TResult Function(_ScrollingScrolling value) scrolling,
    required TResult Function(_ScrollingAnimatingInertialScrolling value)
        animatingInertialScrolling,
    required TResult Function(_StoppingAnimation value) stoppingAnimation,
    required TResult Function(_ScrollingAnimatingFromOutOfBounds value)
        animatingFromOutOfBounds,
  }) {
    return animatingInertialScrolling(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ScrollingInitial value)? initial,
    TResult? Function(_ScrollingAnimatingInitialToIdle value)?
        animatingInitialToIdle,
    TResult? Function(_ScrollingIdle value)? idle,
    TResult? Function(_ScrollingScrolling value)? scrolling,
    TResult? Function(_ScrollingAnimatingInertialScrolling value)?
        animatingInertialScrolling,
    TResult? Function(_StoppingAnimation value)? stoppingAnimation,
    TResult? Function(_ScrollingAnimatingFromOutOfBounds value)?
        animatingFromOutOfBounds,
  }) {
    return animatingInertialScrolling?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ScrollingInitial value)? initial,
    TResult Function(_ScrollingAnimatingInitialToIdle value)?
        animatingInitialToIdle,
    TResult Function(_ScrollingIdle value)? idle,
    TResult Function(_ScrollingScrolling value)? scrolling,
    TResult Function(_ScrollingAnimatingInertialScrolling value)?
        animatingInertialScrolling,
    TResult Function(_StoppingAnimation value)? stoppingAnimation,
    TResult Function(_ScrollingAnimatingFromOutOfBounds value)?
        animatingFromOutOfBounds,
    required TResult orElse(),
  }) {
    if (animatingInertialScrolling != null) {
      return animatingInertialScrolling(this);
    }
    return orElse();
  }
}

abstract class _ScrollingAnimatingInertialScrolling implements ScrollingState {
  const factory _ScrollingAnimatingInertialScrolling(
          {required final Matrix4 oldMatrix,
          required final Matrix4 matrix,
          required final int animationTimeInMilliseconds,
          required final List<DiagramObjectEntity> content,
          required final Size size,
          required final Rect diagramRect}) =
      _$ScrollingAnimatingInertialScrollingImpl;

  Matrix4 get oldMatrix;
  Matrix4 get matrix;
  int get animationTimeInMilliseconds;
  @override
  List<DiagramObjectEntity> get content;
  @override
  Size get size;
  @override
  Rect get diagramRect;

  /// Create a copy of ScrollingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScrollingAnimatingInertialScrollingImplCopyWith<
          _$ScrollingAnimatingInertialScrollingImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StoppingAnimationImplCopyWith<$Res>
    implements $ScrollingStateCopyWith<$Res> {
  factory _$$StoppingAnimationImplCopyWith(_$StoppingAnimationImpl value,
          $Res Function(_$StoppingAnimationImpl) then) =
      __$$StoppingAnimationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DiagramObjectEntity> content,
      Size size,
      Rect diagramRect,
      ScaleStartDetails details});
}

/// @nodoc
class __$$StoppingAnimationImplCopyWithImpl<$Res>
    extends _$ScrollingStateCopyWithImpl<$Res, _$StoppingAnimationImpl>
    implements _$$StoppingAnimationImplCopyWith<$Res> {
  __$$StoppingAnimationImplCopyWithImpl(_$StoppingAnimationImpl _value,
      $Res Function(_$StoppingAnimationImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScrollingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? size = null,
    Object? diagramRect = null,
    Object? details = null,
  }) {
    return _then(_$StoppingAnimationImpl(
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as Size,
      diagramRect: null == diagramRect
          ? _value.diagramRect
          : diagramRect // ignore: cast_nullable_to_non_nullable
              as Rect,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as ScaleStartDetails,
    ));
  }
}

/// @nodoc

class _$StoppingAnimationImpl implements _StoppingAnimation {
  const _$StoppingAnimationImpl(
      {required final List<DiagramObjectEntity> content,
      required this.size,
      required this.diagramRect,
      required this.details})
      : _content = content;

  final List<DiagramObjectEntity> _content;
  @override
  List<DiagramObjectEntity> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  final Size size;
  @override
  final Rect diagramRect;
  @override
  final ScaleStartDetails details;

  @override
  String toString() {
    return 'ScrollingState.stoppingAnimation(content: $content, size: $size, diagramRect: $diagramRect, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoppingAnimationImpl &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.diagramRect, diagramRect) ||
                other.diagramRect == diagramRect) &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_content),
      size,
      diagramRect,
      details);

  /// Create a copy of ScrollingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoppingAnimationImplCopyWith<_$StoppingAnimationImpl> get copyWith =>
      __$$StoppingAnimationImplCopyWithImpl<_$StoppingAnimationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Matrix4 matrix,
            List<DiagramObjectEntity>? content, Size? size, Rect? diagramRect)
        initial,
    required TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)
        animatingInitialToIdle,
    required TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect)
        idle,
    required TResult Function(
            Matrix4 matrix,
            List<DiagramObjectEntity> content,
            ValueUpdater<Offset> translationUpdater,
            ValueUpdater<double> scaleUpdater,
            Size size,
            Rect diagramRect,
            double squaredDistance,
            DateTime eventDateTime)
        scrolling,
    required TResult Function(
            Matrix4 oldMatrix,
            Matrix4 matrix,
            int animationTimeInMilliseconds,
            List<DiagramObjectEntity> content,
            Size size,
            Rect diagramRect)
        animatingInertialScrolling,
    required TResult Function(List<DiagramObjectEntity> content, Size size,
            Rect diagramRect, ScaleStartDetails details)
        stoppingAnimation,
    required TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)
        animatingFromOutOfBounds,
  }) {
    return stoppingAnimation(content, size, diagramRect, details);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Matrix4 matrix, List<DiagramObjectEntity>? content,
            Size? size, Rect? diagramRect)?
        initial,
    TResult? Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
        animatingInitialToIdle,
    TResult? Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect)?
        idle,
    TResult? Function(
            Matrix4 matrix,
            List<DiagramObjectEntity> content,
            ValueUpdater<Offset> translationUpdater,
            ValueUpdater<double> scaleUpdater,
            Size size,
            Rect diagramRect,
            double squaredDistance,
            DateTime eventDateTime)?
        scrolling,
    TResult? Function(
            Matrix4 oldMatrix,
            Matrix4 matrix,
            int animationTimeInMilliseconds,
            List<DiagramObjectEntity> content,
            Size size,
            Rect diagramRect)?
        animatingInertialScrolling,
    TResult? Function(List<DiagramObjectEntity> content, Size size,
            Rect diagramRect, ScaleStartDetails details)?
        stoppingAnimation,
    TResult? Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
        animatingFromOutOfBounds,
  }) {
    return stoppingAnimation?.call(content, size, diagramRect, details);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Matrix4 matrix, List<DiagramObjectEntity>? content,
            Size? size, Rect? diagramRect)?
        initial,
    TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
        animatingInitialToIdle,
    TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect)?
        idle,
    TResult Function(
            Matrix4 matrix,
            List<DiagramObjectEntity> content,
            ValueUpdater<Offset> translationUpdater,
            ValueUpdater<double> scaleUpdater,
            Size size,
            Rect diagramRect,
            double squaredDistance,
            DateTime eventDateTime)?
        scrolling,
    TResult Function(
            Matrix4 oldMatrix,
            Matrix4 matrix,
            int animationTimeInMilliseconds,
            List<DiagramObjectEntity> content,
            Size size,
            Rect diagramRect)?
        animatingInertialScrolling,
    TResult Function(List<DiagramObjectEntity> content, Size size,
            Rect diagramRect, ScaleStartDetails details)?
        stoppingAnimation,
    TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
        animatingFromOutOfBounds,
    required TResult orElse(),
  }) {
    if (stoppingAnimation != null) {
      return stoppingAnimation(content, size, diagramRect, details);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ScrollingInitial value) initial,
    required TResult Function(_ScrollingAnimatingInitialToIdle value)
        animatingInitialToIdle,
    required TResult Function(_ScrollingIdle value) idle,
    required TResult Function(_ScrollingScrolling value) scrolling,
    required TResult Function(_ScrollingAnimatingInertialScrolling value)
        animatingInertialScrolling,
    required TResult Function(_StoppingAnimation value) stoppingAnimation,
    required TResult Function(_ScrollingAnimatingFromOutOfBounds value)
        animatingFromOutOfBounds,
  }) {
    return stoppingAnimation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ScrollingInitial value)? initial,
    TResult? Function(_ScrollingAnimatingInitialToIdle value)?
        animatingInitialToIdle,
    TResult? Function(_ScrollingIdle value)? idle,
    TResult? Function(_ScrollingScrolling value)? scrolling,
    TResult? Function(_ScrollingAnimatingInertialScrolling value)?
        animatingInertialScrolling,
    TResult? Function(_StoppingAnimation value)? stoppingAnimation,
    TResult? Function(_ScrollingAnimatingFromOutOfBounds value)?
        animatingFromOutOfBounds,
  }) {
    return stoppingAnimation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ScrollingInitial value)? initial,
    TResult Function(_ScrollingAnimatingInitialToIdle value)?
        animatingInitialToIdle,
    TResult Function(_ScrollingIdle value)? idle,
    TResult Function(_ScrollingScrolling value)? scrolling,
    TResult Function(_ScrollingAnimatingInertialScrolling value)?
        animatingInertialScrolling,
    TResult Function(_StoppingAnimation value)? stoppingAnimation,
    TResult Function(_ScrollingAnimatingFromOutOfBounds value)?
        animatingFromOutOfBounds,
    required TResult orElse(),
  }) {
    if (stoppingAnimation != null) {
      return stoppingAnimation(this);
    }
    return orElse();
  }
}

abstract class _StoppingAnimation implements ScrollingState {
  const factory _StoppingAnimation(
      {required final List<DiagramObjectEntity> content,
      required final Size size,
      required final Rect diagramRect,
      required final ScaleStartDetails details}) = _$StoppingAnimationImpl;

  @override
  List<DiagramObjectEntity> get content;
  @override
  Size get size;
  @override
  Rect get diagramRect;
  ScaleStartDetails get details;

  /// Create a copy of ScrollingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoppingAnimationImplCopyWith<_$StoppingAnimationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ScrollingAnimatingFromOutOfBoundsImplCopyWith<$Res>
    implements $ScrollingStateCopyWith<$Res> {
  factory _$$ScrollingAnimatingFromOutOfBoundsImplCopyWith(
          _$ScrollingAnimatingFromOutOfBoundsImpl value,
          $Res Function(_$ScrollingAnimatingFromOutOfBoundsImpl) then) =
      __$$ScrollingAnimatingFromOutOfBoundsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Matrix4 oldMatrix,
      Matrix4 matrix,
      List<DiagramObjectEntity> content,
      Size size,
      Rect diagramRect});
}

/// @nodoc
class __$$ScrollingAnimatingFromOutOfBoundsImplCopyWithImpl<$Res>
    extends _$ScrollingStateCopyWithImpl<$Res,
        _$ScrollingAnimatingFromOutOfBoundsImpl>
    implements _$$ScrollingAnimatingFromOutOfBoundsImplCopyWith<$Res> {
  __$$ScrollingAnimatingFromOutOfBoundsImplCopyWithImpl(
      _$ScrollingAnimatingFromOutOfBoundsImpl _value,
      $Res Function(_$ScrollingAnimatingFromOutOfBoundsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScrollingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oldMatrix = null,
    Object? matrix = null,
    Object? content = null,
    Object? size = null,
    Object? diagramRect = null,
  }) {
    return _then(_$ScrollingAnimatingFromOutOfBoundsImpl(
      oldMatrix: null == oldMatrix
          ? _value.oldMatrix
          : oldMatrix // ignore: cast_nullable_to_non_nullable
              as Matrix4,
      matrix: null == matrix
          ? _value.matrix
          : matrix // ignore: cast_nullable_to_non_nullable
              as Matrix4,
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as Size,
      diagramRect: null == diagramRect
          ? _value.diagramRect
          : diagramRect // ignore: cast_nullable_to_non_nullable
              as Rect,
    ));
  }
}

/// @nodoc

class _$ScrollingAnimatingFromOutOfBoundsImpl
    implements _ScrollingAnimatingFromOutOfBounds {
  const _$ScrollingAnimatingFromOutOfBoundsImpl(
      {required this.oldMatrix,
      required this.matrix,
      required final List<DiagramObjectEntity> content,
      required this.size,
      required this.diagramRect})
      : _content = content;

  @override
  final Matrix4 oldMatrix;
  @override
  final Matrix4 matrix;
  final List<DiagramObjectEntity> _content;
  @override
  List<DiagramObjectEntity> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  final Size size;
  @override
  final Rect diagramRect;

  @override
  String toString() {
    return 'ScrollingState.animatingFromOutOfBounds(oldMatrix: $oldMatrix, matrix: $matrix, content: $content, size: $size, diagramRect: $diagramRect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScrollingAnimatingFromOutOfBoundsImpl &&
            (identical(other.oldMatrix, oldMatrix) ||
                other.oldMatrix == oldMatrix) &&
            (identical(other.matrix, matrix) || other.matrix == matrix) &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.diagramRect, diagramRect) ||
                other.diagramRect == diagramRect));
  }

  @override
  int get hashCode => Object.hash(runtimeType, oldMatrix, matrix,
      const DeepCollectionEquality().hash(_content), size, diagramRect);

  /// Create a copy of ScrollingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScrollingAnimatingFromOutOfBoundsImplCopyWith<
          _$ScrollingAnimatingFromOutOfBoundsImpl>
      get copyWith => __$$ScrollingAnimatingFromOutOfBoundsImplCopyWithImpl<
          _$ScrollingAnimatingFromOutOfBoundsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Matrix4 matrix,
            List<DiagramObjectEntity>? content, Size? size, Rect? diagramRect)
        initial,
    required TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)
        animatingInitialToIdle,
    required TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect)
        idle,
    required TResult Function(
            Matrix4 matrix,
            List<DiagramObjectEntity> content,
            ValueUpdater<Offset> translationUpdater,
            ValueUpdater<double> scaleUpdater,
            Size size,
            Rect diagramRect,
            double squaredDistance,
            DateTime eventDateTime)
        scrolling,
    required TResult Function(
            Matrix4 oldMatrix,
            Matrix4 matrix,
            int animationTimeInMilliseconds,
            List<DiagramObjectEntity> content,
            Size size,
            Rect diagramRect)
        animatingInertialScrolling,
    required TResult Function(List<DiagramObjectEntity> content, Size size,
            Rect diagramRect, ScaleStartDetails details)
        stoppingAnimation,
    required TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)
        animatingFromOutOfBounds,
  }) {
    return animatingFromOutOfBounds(
        oldMatrix, matrix, content, size, diagramRect);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Matrix4 matrix, List<DiagramObjectEntity>? content,
            Size? size, Rect? diagramRect)?
        initial,
    TResult? Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
        animatingInitialToIdle,
    TResult? Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect)?
        idle,
    TResult? Function(
            Matrix4 matrix,
            List<DiagramObjectEntity> content,
            ValueUpdater<Offset> translationUpdater,
            ValueUpdater<double> scaleUpdater,
            Size size,
            Rect diagramRect,
            double squaredDistance,
            DateTime eventDateTime)?
        scrolling,
    TResult? Function(
            Matrix4 oldMatrix,
            Matrix4 matrix,
            int animationTimeInMilliseconds,
            List<DiagramObjectEntity> content,
            Size size,
            Rect diagramRect)?
        animatingInertialScrolling,
    TResult? Function(List<DiagramObjectEntity> content, Size size,
            Rect diagramRect, ScaleStartDetails details)?
        stoppingAnimation,
    TResult? Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
        animatingFromOutOfBounds,
  }) {
    return animatingFromOutOfBounds?.call(
        oldMatrix, matrix, content, size, diagramRect);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Matrix4 matrix, List<DiagramObjectEntity>? content,
            Size? size, Rect? diagramRect)?
        initial,
    TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
        animatingInitialToIdle,
    TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect)?
        idle,
    TResult Function(
            Matrix4 matrix,
            List<DiagramObjectEntity> content,
            ValueUpdater<Offset> translationUpdater,
            ValueUpdater<double> scaleUpdater,
            Size size,
            Rect diagramRect,
            double squaredDistance,
            DateTime eventDateTime)?
        scrolling,
    TResult Function(
            Matrix4 oldMatrix,
            Matrix4 matrix,
            int animationTimeInMilliseconds,
            List<DiagramObjectEntity> content,
            Size size,
            Rect diagramRect)?
        animatingInertialScrolling,
    TResult Function(List<DiagramObjectEntity> content, Size size,
            Rect diagramRect, ScaleStartDetails details)?
        stoppingAnimation,
    TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
        animatingFromOutOfBounds,
    required TResult orElse(),
  }) {
    if (animatingFromOutOfBounds != null) {
      return animatingFromOutOfBounds(
          oldMatrix, matrix, content, size, diagramRect);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ScrollingInitial value) initial,
    required TResult Function(_ScrollingAnimatingInitialToIdle value)
        animatingInitialToIdle,
    required TResult Function(_ScrollingIdle value) idle,
    required TResult Function(_ScrollingScrolling value) scrolling,
    required TResult Function(_ScrollingAnimatingInertialScrolling value)
        animatingInertialScrolling,
    required TResult Function(_StoppingAnimation value) stoppingAnimation,
    required TResult Function(_ScrollingAnimatingFromOutOfBounds value)
        animatingFromOutOfBounds,
  }) {
    return animatingFromOutOfBounds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ScrollingInitial value)? initial,
    TResult? Function(_ScrollingAnimatingInitialToIdle value)?
        animatingInitialToIdle,
    TResult? Function(_ScrollingIdle value)? idle,
    TResult? Function(_ScrollingScrolling value)? scrolling,
    TResult? Function(_ScrollingAnimatingInertialScrolling value)?
        animatingInertialScrolling,
    TResult? Function(_StoppingAnimation value)? stoppingAnimation,
    TResult? Function(_ScrollingAnimatingFromOutOfBounds value)?
        animatingFromOutOfBounds,
  }) {
    return animatingFromOutOfBounds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ScrollingInitial value)? initial,
    TResult Function(_ScrollingAnimatingInitialToIdle value)?
        animatingInitialToIdle,
    TResult Function(_ScrollingIdle value)? idle,
    TResult Function(_ScrollingScrolling value)? scrolling,
    TResult Function(_ScrollingAnimatingInertialScrolling value)?
        animatingInertialScrolling,
    TResult Function(_StoppingAnimation value)? stoppingAnimation,
    TResult Function(_ScrollingAnimatingFromOutOfBounds value)?
        animatingFromOutOfBounds,
    required TResult orElse(),
  }) {
    if (animatingFromOutOfBounds != null) {
      return animatingFromOutOfBounds(this);
    }
    return orElse();
  }
}

abstract class _ScrollingAnimatingFromOutOfBounds implements ScrollingState {
  const factory _ScrollingAnimatingFromOutOfBounds(
          {required final Matrix4 oldMatrix,
          required final Matrix4 matrix,
          required final List<DiagramObjectEntity> content,
          required final Size size,
          required final Rect diagramRect}) =
      _$ScrollingAnimatingFromOutOfBoundsImpl;

  Matrix4 get oldMatrix;
  Matrix4 get matrix;
  @override
  List<DiagramObjectEntity> get content;
  @override
  Size get size;
  @override
  Rect get diagramRect;

  /// Create a copy of ScrollingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScrollingAnimatingFromOutOfBoundsImplCopyWith<
          _$ScrollingAnimatingFromOutOfBoundsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ScrollingDynamicParams {
  List<DiagramObjectEntity> get content => throw _privateConstructorUsedError;
  double get minStaticX => throw _privateConstructorUsedError;
  double get minDynamicX => throw _privateConstructorUsedError;
  double get maxStaticX => throw _privateConstructorUsedError;
  double get maxDynamicX => throw _privateConstructorUsedError;
  double get minStaticY => throw _privateConstructorUsedError;
  double get minDynamicY => throw _privateConstructorUsedError;
  double get maxStaticY => throw _privateConstructorUsedError;
  double get maxDynamicY => throw _privateConstructorUsedError;
  double get minStaticScale => throw _privateConstructorUsedError;
  double get minDynamicScale => throw _privateConstructorUsedError;
  double get maxStaticScale => throw _privateConstructorUsedError;
  double get maxDynamicScale => throw _privateConstructorUsedError;
  Offset get hardOffset => throw _privateConstructorUsedError;
  double get scale => throw _privateConstructorUsedError;
  Size get size => throw _privateConstructorUsedError;
  Rect get contentRect => throw _privateConstructorUsedError;

  /// Create a copy of ScrollingDynamicParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScrollingDynamicParamsCopyWith<ScrollingDynamicParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScrollingDynamicParamsCopyWith<$Res> {
  factory $ScrollingDynamicParamsCopyWith(ScrollingDynamicParams value,
          $Res Function(ScrollingDynamicParams) then) =
      _$ScrollingDynamicParamsCopyWithImpl<$Res, ScrollingDynamicParams>;
  @useResult
  $Res call(
      {List<DiagramObjectEntity> content,
      double minStaticX,
      double minDynamicX,
      double maxStaticX,
      double maxDynamicX,
      double minStaticY,
      double minDynamicY,
      double maxStaticY,
      double maxDynamicY,
      double minStaticScale,
      double minDynamicScale,
      double maxStaticScale,
      double maxDynamicScale,
      Offset hardOffset,
      double scale,
      Size size,
      Rect contentRect});
}

/// @nodoc
class _$ScrollingDynamicParamsCopyWithImpl<$Res,
        $Val extends ScrollingDynamicParams>
    implements $ScrollingDynamicParamsCopyWith<$Res> {
  _$ScrollingDynamicParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScrollingDynamicParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? minStaticX = null,
    Object? minDynamicX = null,
    Object? maxStaticX = null,
    Object? maxDynamicX = null,
    Object? minStaticY = null,
    Object? minDynamicY = null,
    Object? maxStaticY = null,
    Object? maxDynamicY = null,
    Object? minStaticScale = null,
    Object? minDynamicScale = null,
    Object? maxStaticScale = null,
    Object? maxDynamicScale = null,
    Object? hardOffset = null,
    Object? scale = null,
    Object? size = null,
    Object? contentRect = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
      minStaticX: null == minStaticX
          ? _value.minStaticX
          : minStaticX // ignore: cast_nullable_to_non_nullable
              as double,
      minDynamicX: null == minDynamicX
          ? _value.minDynamicX
          : minDynamicX // ignore: cast_nullable_to_non_nullable
              as double,
      maxStaticX: null == maxStaticX
          ? _value.maxStaticX
          : maxStaticX // ignore: cast_nullable_to_non_nullable
              as double,
      maxDynamicX: null == maxDynamicX
          ? _value.maxDynamicX
          : maxDynamicX // ignore: cast_nullable_to_non_nullable
              as double,
      minStaticY: null == minStaticY
          ? _value.minStaticY
          : minStaticY // ignore: cast_nullable_to_non_nullable
              as double,
      minDynamicY: null == minDynamicY
          ? _value.minDynamicY
          : minDynamicY // ignore: cast_nullable_to_non_nullable
              as double,
      maxStaticY: null == maxStaticY
          ? _value.maxStaticY
          : maxStaticY // ignore: cast_nullable_to_non_nullable
              as double,
      maxDynamicY: null == maxDynamicY
          ? _value.maxDynamicY
          : maxDynamicY // ignore: cast_nullable_to_non_nullable
              as double,
      minStaticScale: null == minStaticScale
          ? _value.minStaticScale
          : minStaticScale // ignore: cast_nullable_to_non_nullable
              as double,
      minDynamicScale: null == minDynamicScale
          ? _value.minDynamicScale
          : minDynamicScale // ignore: cast_nullable_to_non_nullable
              as double,
      maxStaticScale: null == maxStaticScale
          ? _value.maxStaticScale
          : maxStaticScale // ignore: cast_nullable_to_non_nullable
              as double,
      maxDynamicScale: null == maxDynamicScale
          ? _value.maxDynamicScale
          : maxDynamicScale // ignore: cast_nullable_to_non_nullable
              as double,
      hardOffset: null == hardOffset
          ? _value.hardOffset
          : hardOffset // ignore: cast_nullable_to_non_nullable
              as Offset,
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as Size,
      contentRect: null == contentRect
          ? _value.contentRect
          : contentRect // ignore: cast_nullable_to_non_nullable
              as Rect,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScrollingDynamicParamsImplCopyWith<$Res>
    implements $ScrollingDynamicParamsCopyWith<$Res> {
  factory _$$ScrollingDynamicParamsImplCopyWith(
          _$ScrollingDynamicParamsImpl value,
          $Res Function(_$ScrollingDynamicParamsImpl) then) =
      __$$ScrollingDynamicParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DiagramObjectEntity> content,
      double minStaticX,
      double minDynamicX,
      double maxStaticX,
      double maxDynamicX,
      double minStaticY,
      double minDynamicY,
      double maxStaticY,
      double maxDynamicY,
      double minStaticScale,
      double minDynamicScale,
      double maxStaticScale,
      double maxDynamicScale,
      Offset hardOffset,
      double scale,
      Size size,
      Rect contentRect});
}

/// @nodoc
class __$$ScrollingDynamicParamsImplCopyWithImpl<$Res>
    extends _$ScrollingDynamicParamsCopyWithImpl<$Res,
        _$ScrollingDynamicParamsImpl>
    implements _$$ScrollingDynamicParamsImplCopyWith<$Res> {
  __$$ScrollingDynamicParamsImplCopyWithImpl(
      _$ScrollingDynamicParamsImpl _value,
      $Res Function(_$ScrollingDynamicParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScrollingDynamicParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? minStaticX = null,
    Object? minDynamicX = null,
    Object? maxStaticX = null,
    Object? maxDynamicX = null,
    Object? minStaticY = null,
    Object? minDynamicY = null,
    Object? maxStaticY = null,
    Object? maxDynamicY = null,
    Object? minStaticScale = null,
    Object? minDynamicScale = null,
    Object? maxStaticScale = null,
    Object? maxDynamicScale = null,
    Object? hardOffset = null,
    Object? scale = null,
    Object? size = null,
    Object? contentRect = null,
  }) {
    return _then(_$ScrollingDynamicParamsImpl(
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
      minStaticX: null == minStaticX
          ? _value.minStaticX
          : minStaticX // ignore: cast_nullable_to_non_nullable
              as double,
      minDynamicX: null == minDynamicX
          ? _value.minDynamicX
          : minDynamicX // ignore: cast_nullable_to_non_nullable
              as double,
      maxStaticX: null == maxStaticX
          ? _value.maxStaticX
          : maxStaticX // ignore: cast_nullable_to_non_nullable
              as double,
      maxDynamicX: null == maxDynamicX
          ? _value.maxDynamicX
          : maxDynamicX // ignore: cast_nullable_to_non_nullable
              as double,
      minStaticY: null == minStaticY
          ? _value.minStaticY
          : minStaticY // ignore: cast_nullable_to_non_nullable
              as double,
      minDynamicY: null == minDynamicY
          ? _value.minDynamicY
          : minDynamicY // ignore: cast_nullable_to_non_nullable
              as double,
      maxStaticY: null == maxStaticY
          ? _value.maxStaticY
          : maxStaticY // ignore: cast_nullable_to_non_nullable
              as double,
      maxDynamicY: null == maxDynamicY
          ? _value.maxDynamicY
          : maxDynamicY // ignore: cast_nullable_to_non_nullable
              as double,
      minStaticScale: null == minStaticScale
          ? _value.minStaticScale
          : minStaticScale // ignore: cast_nullable_to_non_nullable
              as double,
      minDynamicScale: null == minDynamicScale
          ? _value.minDynamicScale
          : minDynamicScale // ignore: cast_nullable_to_non_nullable
              as double,
      maxStaticScale: null == maxStaticScale
          ? _value.maxStaticScale
          : maxStaticScale // ignore: cast_nullable_to_non_nullable
              as double,
      maxDynamicScale: null == maxDynamicScale
          ? _value.maxDynamicScale
          : maxDynamicScale // ignore: cast_nullable_to_non_nullable
              as double,
      hardOffset: null == hardOffset
          ? _value.hardOffset
          : hardOffset // ignore: cast_nullable_to_non_nullable
              as Offset,
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as Size,
      contentRect: null == contentRect
          ? _value.contentRect
          : contentRect // ignore: cast_nullable_to_non_nullable
              as Rect,
    ));
  }
}

/// @nodoc

class _$ScrollingDynamicParamsImpl implements _ScrollingDynamicParams {
  const _$ScrollingDynamicParamsImpl(
      {required final List<DiagramObjectEntity> content,
      required this.minStaticX,
      required this.minDynamicX,
      required this.maxStaticX,
      required this.maxDynamicX,
      required this.minStaticY,
      required this.minDynamicY,
      required this.maxStaticY,
      required this.maxDynamicY,
      required this.minStaticScale,
      required this.minDynamicScale,
      required this.maxStaticScale,
      required this.maxDynamicScale,
      required this.hardOffset,
      required this.scale,
      required this.size,
      required this.contentRect})
      : _content = content;

  final List<DiagramObjectEntity> _content;
  @override
  List<DiagramObjectEntity> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  final double minStaticX;
  @override
  final double minDynamicX;
  @override
  final double maxStaticX;
  @override
  final double maxDynamicX;
  @override
  final double minStaticY;
  @override
  final double minDynamicY;
  @override
  final double maxStaticY;
  @override
  final double maxDynamicY;
  @override
  final double minStaticScale;
  @override
  final double minDynamicScale;
  @override
  final double maxStaticScale;
  @override
  final double maxDynamicScale;
  @override
  final Offset hardOffset;
  @override
  final double scale;
  @override
  final Size size;
  @override
  final Rect contentRect;

  @override
  String toString() {
    return 'ScrollingDynamicParams(content: $content, minStaticX: $minStaticX, minDynamicX: $minDynamicX, maxStaticX: $maxStaticX, maxDynamicX: $maxDynamicX, minStaticY: $minStaticY, minDynamicY: $minDynamicY, maxStaticY: $maxStaticY, maxDynamicY: $maxDynamicY, minStaticScale: $minStaticScale, minDynamicScale: $minDynamicScale, maxStaticScale: $maxStaticScale, maxDynamicScale: $maxDynamicScale, hardOffset: $hardOffset, scale: $scale, size: $size, contentRect: $contentRect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScrollingDynamicParamsImpl &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.minStaticX, minStaticX) ||
                other.minStaticX == minStaticX) &&
            (identical(other.minDynamicX, minDynamicX) ||
                other.minDynamicX == minDynamicX) &&
            (identical(other.maxStaticX, maxStaticX) ||
                other.maxStaticX == maxStaticX) &&
            (identical(other.maxDynamicX, maxDynamicX) ||
                other.maxDynamicX == maxDynamicX) &&
            (identical(other.minStaticY, minStaticY) ||
                other.minStaticY == minStaticY) &&
            (identical(other.minDynamicY, minDynamicY) ||
                other.minDynamicY == minDynamicY) &&
            (identical(other.maxStaticY, maxStaticY) ||
                other.maxStaticY == maxStaticY) &&
            (identical(other.maxDynamicY, maxDynamicY) ||
                other.maxDynamicY == maxDynamicY) &&
            (identical(other.minStaticScale, minStaticScale) ||
                other.minStaticScale == minStaticScale) &&
            (identical(other.minDynamicScale, minDynamicScale) ||
                other.minDynamicScale == minDynamicScale) &&
            (identical(other.maxStaticScale, maxStaticScale) ||
                other.maxStaticScale == maxStaticScale) &&
            (identical(other.maxDynamicScale, maxDynamicScale) ||
                other.maxDynamicScale == maxDynamicScale) &&
            (identical(other.hardOffset, hardOffset) ||
                other.hardOffset == hardOffset) &&
            (identical(other.scale, scale) || other.scale == scale) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.contentRect, contentRect) ||
                other.contentRect == contentRect));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_content),
      minStaticX,
      minDynamicX,
      maxStaticX,
      maxDynamicX,
      minStaticY,
      minDynamicY,
      maxStaticY,
      maxDynamicY,
      minStaticScale,
      minDynamicScale,
      maxStaticScale,
      maxDynamicScale,
      hardOffset,
      scale,
      size,
      contentRect);

  /// Create a copy of ScrollingDynamicParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScrollingDynamicParamsImplCopyWith<_$ScrollingDynamicParamsImpl>
      get copyWith => __$$ScrollingDynamicParamsImplCopyWithImpl<
          _$ScrollingDynamicParamsImpl>(this, _$identity);
}

abstract class _ScrollingDynamicParams implements ScrollingDynamicParams {
  const factory _ScrollingDynamicParams(
      {required final List<DiagramObjectEntity> content,
      required final double minStaticX,
      required final double minDynamicX,
      required final double maxStaticX,
      required final double maxDynamicX,
      required final double minStaticY,
      required final double minDynamicY,
      required final double maxStaticY,
      required final double maxDynamicY,
      required final double minStaticScale,
      required final double minDynamicScale,
      required final double maxStaticScale,
      required final double maxDynamicScale,
      required final Offset hardOffset,
      required final double scale,
      required final Size size,
      required final Rect contentRect}) = _$ScrollingDynamicParamsImpl;

  @override
  List<DiagramObjectEntity> get content;
  @override
  double get minStaticX;
  @override
  double get minDynamicX;
  @override
  double get maxStaticX;
  @override
  double get maxDynamicX;
  @override
  double get minStaticY;
  @override
  double get minDynamicY;
  @override
  double get maxStaticY;
  @override
  double get maxDynamicY;
  @override
  double get minStaticScale;
  @override
  double get minDynamicScale;
  @override
  double get maxStaticScale;
  @override
  double get maxDynamicScale;
  @override
  Offset get hardOffset;
  @override
  double get scale;
  @override
  Size get size;
  @override
  Rect get contentRect;

  /// Create a copy of ScrollingDynamicParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScrollingDynamicParamsImplCopyWith<_$ScrollingDynamicParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
