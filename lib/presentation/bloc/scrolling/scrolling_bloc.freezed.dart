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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
}

/// @nodoc
abstract class _$$_StartScaleCopyWith<$Res> {
  factory _$$_StartScaleCopyWith(
          _$_StartScale value, $Res Function(_$_StartScale) then) =
      __$$_StartScaleCopyWithImpl<$Res>;
  @useResult
  $Res call({ScaleStartDetails details});
}

/// @nodoc
class __$$_StartScaleCopyWithImpl<$Res>
    extends _$ScrollingEventCopyWithImpl<$Res, _$_StartScale>
    implements _$$_StartScaleCopyWith<$Res> {
  __$$_StartScaleCopyWithImpl(
      _$_StartScale _value, $Res Function(_$_StartScale) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = null,
  }) {
    return _then(_$_StartScale(
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as ScaleStartDetails,
    ));
  }
}

/// @nodoc

class _$_StartScale implements _StartScale {
  const _$_StartScale({required this.details});

  @override
  final ScaleStartDetails details;

  @override
  String toString() {
    return 'ScrollingEvent.startScale(details: $details)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StartScale &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode => Object.hash(runtimeType, details);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StartScaleCopyWith<_$_StartScale> get copyWith =>
      __$$_StartScaleCopyWithImpl<_$_StartScale>(this, _$identity);

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
      _$_StartScale;

  ScaleStartDetails get details;
  @JsonKey(ignore: true)
  _$$_StartScaleCopyWith<_$_StartScale> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ContinueScaleCopyWith<$Res> {
  factory _$$_ContinueScaleCopyWith(
          _$_ContinueScale value, $Res Function(_$_ContinueScale) then) =
      __$$_ContinueScaleCopyWithImpl<$Res>;
  @useResult
  $Res call({ScaleUpdateDetails details, Offset? additionalFocalPoint});
}

/// @nodoc
class __$$_ContinueScaleCopyWithImpl<$Res>
    extends _$ScrollingEventCopyWithImpl<$Res, _$_ContinueScale>
    implements _$$_ContinueScaleCopyWith<$Res> {
  __$$_ContinueScaleCopyWithImpl(
      _$_ContinueScale _value, $Res Function(_$_ContinueScale) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = null,
    Object? additionalFocalPoint = freezed,
  }) {
    return _then(_$_ContinueScale(
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

class _$_ContinueScale implements _ContinueScale {
  const _$_ContinueScale({required this.details, this.additionalFocalPoint});

  @override
  final ScaleUpdateDetails details;
  @override
  final Offset? additionalFocalPoint;

  @override
  String toString() {
    return 'ScrollingEvent.continueScale(details: $details, additionalFocalPoint: $additionalFocalPoint)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContinueScale &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.additionalFocalPoint, additionalFocalPoint) ||
                other.additionalFocalPoint == additionalFocalPoint));
  }

  @override
  int get hashCode => Object.hash(runtimeType, details, additionalFocalPoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContinueScaleCopyWith<_$_ContinueScale> get copyWith =>
      __$$_ContinueScaleCopyWithImpl<_$_ContinueScale>(this, _$identity);

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
      final Offset? additionalFocalPoint}) = _$_ContinueScale;

  ScaleUpdateDetails get details;
  Offset? get additionalFocalPoint;
  @JsonKey(ignore: true)
  _$$_ContinueScaleCopyWith<_$_ContinueScale> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_EndScaleCopyWith<$Res> {
  factory _$$_EndScaleCopyWith(
          _$_EndScale value, $Res Function(_$_EndScale) then) =
      __$$_EndScaleCopyWithImpl<$Res>;
  @useResult
  $Res call({ScaleEndDetails details});
}

/// @nodoc
class __$$_EndScaleCopyWithImpl<$Res>
    extends _$ScrollingEventCopyWithImpl<$Res, _$_EndScale>
    implements _$$_EndScaleCopyWith<$Res> {
  __$$_EndScaleCopyWithImpl(
      _$_EndScale _value, $Res Function(_$_EndScale) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = null,
  }) {
    return _then(_$_EndScale(
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as ScaleEndDetails,
    ));
  }
}

/// @nodoc

class _$_EndScale implements _EndScale {
  const _$_EndScale({required this.details});

  @override
  final ScaleEndDetails details;

  @override
  String toString() {
    return 'ScrollingEvent.endScale(details: $details)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EndScale &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode => Object.hash(runtimeType, details);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EndScaleCopyWith<_$_EndScale> get copyWith =>
      __$$_EndScaleCopyWithImpl<_$_EndScale>(this, _$identity);

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
      _$_EndScale;

  ScaleEndDetails get details;
  @JsonKey(ignore: true)
  _$$_EndScaleCopyWith<_$_EndScale> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RestartScaleCopyWith<$Res> {
  factory _$$_RestartScaleCopyWith(
          _$_RestartScale value, $Res Function(_$_RestartScale) then) =
      __$$_RestartScaleCopyWithImpl<$Res>;
  @useResult
  $Res call({ScaleStartDetails details, Matrix4 matrix});
}

/// @nodoc
class __$$_RestartScaleCopyWithImpl<$Res>
    extends _$ScrollingEventCopyWithImpl<$Res, _$_RestartScale>
    implements _$$_RestartScaleCopyWith<$Res> {
  __$$_RestartScaleCopyWithImpl(
      _$_RestartScale _value, $Res Function(_$_RestartScale) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = null,
    Object? matrix = null,
  }) {
    return _then(_$_RestartScale(
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

class _$_RestartScale implements _RestartScale {
  const _$_RestartScale({required this.details, required this.matrix});

  @override
  final ScaleStartDetails details;
  @override
  final Matrix4 matrix;

  @override
  String toString() {
    return 'ScrollingEvent.restartScale(details: $details, matrix: $matrix)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RestartScale &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.matrix, matrix) || other.matrix == matrix));
  }

  @override
  int get hashCode => Object.hash(runtimeType, details, matrix);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RestartScaleCopyWith<_$_RestartScale> get copyWith =>
      __$$_RestartScaleCopyWithImpl<_$_RestartScale>(this, _$identity);

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
      required final Matrix4 matrix}) = _$_RestartScale;

  ScaleStartDetails get details;
  Matrix4 get matrix;
  @JsonKey(ignore: true)
  _$$_RestartScaleCopyWith<_$_RestartScale> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ViewportChangedCopyWith<$Res> {
  factory _$$_ViewportChangedCopyWith(
          _$_ViewportChanged value, $Res Function(_$_ViewportChanged) then) =
      __$$_ViewportChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({Size size});
}

/// @nodoc
class __$$_ViewportChangedCopyWithImpl<$Res>
    extends _$ScrollingEventCopyWithImpl<$Res, _$_ViewportChanged>
    implements _$$_ViewportChangedCopyWith<$Res> {
  __$$_ViewportChangedCopyWithImpl(
      _$_ViewportChanged _value, $Res Function(_$_ViewportChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
  }) {
    return _then(_$_ViewportChanged(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as Size,
    ));
  }
}

/// @nodoc

class _$_ViewportChanged implements _ViewportChanged {
  const _$_ViewportChanged({required this.size});

  @override
  final Size size;

  @override
  String toString() {
    return 'ScrollingEvent.viewportChanged(size: $size)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ViewportChanged &&
            (identical(other.size, size) || other.size == size));
  }

  @override
  int get hashCode => Object.hash(runtimeType, size);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ViewportChangedCopyWith<_$_ViewportChanged> get copyWith =>
      __$$_ViewportChangedCopyWithImpl<_$_ViewportChanged>(this, _$identity);

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
      _$_ViewportChanged;

  Size get size;
  @JsonKey(ignore: true)
  _$$_ViewportChangedCopyWith<_$_ViewportChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ContentChangedCopyWith<$Res> {
  factory _$$_ContentChangedCopyWith(
          _$_ContentChanged value, $Res Function(_$_ContentChanged) then) =
      __$$_ContentChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<DiagramObjectEntity> list});
}

/// @nodoc
class __$$_ContentChangedCopyWithImpl<$Res>
    extends _$ScrollingEventCopyWithImpl<$Res, _$_ContentChanged>
    implements _$$_ContentChangedCopyWith<$Res> {
  __$$_ContentChangedCopyWithImpl(
      _$_ContentChanged _value, $Res Function(_$_ContentChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_$_ContentChanged(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
    ));
  }
}

/// @nodoc

class _$_ContentChanged implements _ContentChanged {
  const _$_ContentChanged({required final List<DiagramObjectEntity> list})
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContentChanged &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContentChangedCopyWith<_$_ContentChanged> get copyWith =>
      __$$_ContentChangedCopyWithImpl<_$_ContentChanged>(this, _$identity);

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
      {required final List<DiagramObjectEntity> list}) = _$_ContentChanged;

  List<DiagramObjectEntity> get list;
  @JsonKey(ignore: true)
  _$$_ContentChangedCopyWith<_$_ContentChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_InitialToIdleAnimationEndCopyWith<$Res> {
  factory _$$_InitialToIdleAnimationEndCopyWith(
          _$_InitialToIdleAnimationEnd value,
          $Res Function(_$_InitialToIdleAnimationEnd) then) =
      __$$_InitialToIdleAnimationEndCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialToIdleAnimationEndCopyWithImpl<$Res>
    extends _$ScrollingEventCopyWithImpl<$Res, _$_InitialToIdleAnimationEnd>
    implements _$$_InitialToIdleAnimationEndCopyWith<$Res> {
  __$$_InitialToIdleAnimationEndCopyWithImpl(
      _$_InitialToIdleAnimationEnd _value,
      $Res Function(_$_InitialToIdleAnimationEnd) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_InitialToIdleAnimationEnd implements _InitialToIdleAnimationEnd {
  const _$_InitialToIdleAnimationEnd();

  @override
  String toString() {
    return 'ScrollingEvent.initialToIdleAnimationEnd()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InitialToIdleAnimationEnd);
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
  const factory _InitialToIdleAnimationEnd() = _$_InitialToIdleAnimationEnd;
}

/// @nodoc
abstract class _$$_OutOfBoundsToIdleAnimationEndCopyWith<$Res> {
  factory _$$_OutOfBoundsToIdleAnimationEndCopyWith(
          _$_OutOfBoundsToIdleAnimationEnd value,
          $Res Function(_$_OutOfBoundsToIdleAnimationEnd) then) =
      __$$_OutOfBoundsToIdleAnimationEndCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_OutOfBoundsToIdleAnimationEndCopyWithImpl<$Res>
    extends _$ScrollingEventCopyWithImpl<$Res, _$_OutOfBoundsToIdleAnimationEnd>
    implements _$$_OutOfBoundsToIdleAnimationEndCopyWith<$Res> {
  __$$_OutOfBoundsToIdleAnimationEndCopyWithImpl(
      _$_OutOfBoundsToIdleAnimationEnd _value,
      $Res Function(_$_OutOfBoundsToIdleAnimationEnd) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_OutOfBoundsToIdleAnimationEnd
    implements _OutOfBoundsToIdleAnimationEnd {
  const _$_OutOfBoundsToIdleAnimationEnd();

  @override
  String toString() {
    return 'ScrollingEvent.outOfBoundsToIdleAnimationEnd()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OutOfBoundsToIdleAnimationEnd);
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
      _$_OutOfBoundsToIdleAnimationEnd;
}

/// @nodoc
abstract class _$$_InertialAnimationEndCopyWith<$Res> {
  factory _$$_InertialAnimationEndCopyWith(_$_InertialAnimationEnd value,
          $Res Function(_$_InertialAnimationEnd) then) =
      __$$_InertialAnimationEndCopyWithImpl<$Res>;
  @useResult
  $Res call({Matrix4 reachedMatrix});
}

/// @nodoc
class __$$_InertialAnimationEndCopyWithImpl<$Res>
    extends _$ScrollingEventCopyWithImpl<$Res, _$_InertialAnimationEnd>
    implements _$$_InertialAnimationEndCopyWith<$Res> {
  __$$_InertialAnimationEndCopyWithImpl(_$_InertialAnimationEnd _value,
      $Res Function(_$_InertialAnimationEnd) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reachedMatrix = null,
  }) {
    return _then(_$_InertialAnimationEnd(
      reachedMatrix: null == reachedMatrix
          ? _value.reachedMatrix
          : reachedMatrix // ignore: cast_nullable_to_non_nullable
              as Matrix4,
    ));
  }
}

/// @nodoc

class _$_InertialAnimationEnd implements _InertialAnimationEnd {
  const _$_InertialAnimationEnd({required this.reachedMatrix});

  @override
  final Matrix4 reachedMatrix;

  @override
  String toString() {
    return 'ScrollingEvent.inertialAnimationEnd(reachedMatrix: $reachedMatrix)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InertialAnimationEnd &&
            (identical(other.reachedMatrix, reachedMatrix) ||
                other.reachedMatrix == reachedMatrix));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reachedMatrix);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InertialAnimationEndCopyWith<_$_InertialAnimationEnd> get copyWith =>
      __$$_InertialAnimationEndCopyWithImpl<_$_InertialAnimationEnd>(
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
      _$_InertialAnimationEnd;

  Matrix4 get reachedMatrix;
  @JsonKey(ignore: true)
  _$$_InertialAnimationEndCopyWith<_$_InertialAnimationEnd> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_InertialAnimationStopCopyWith<$Res> {
  factory _$$_InertialAnimationStopCopyWith(_$_InertialAnimationStop value,
          $Res Function(_$_InertialAnimationStop) then) =
      __$$_InertialAnimationStopCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InertialAnimationStopCopyWithImpl<$Res>
    extends _$ScrollingEventCopyWithImpl<$Res, _$_InertialAnimationStop>
    implements _$$_InertialAnimationStopCopyWith<$Res> {
  __$$_InertialAnimationStopCopyWithImpl(_$_InertialAnimationStop _value,
      $Res Function(_$_InertialAnimationStop) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_InertialAnimationStop implements _InertialAnimationStop {
  const _$_InertialAnimationStop();

  @override
  String toString() {
    return 'ScrollingEvent.inertialAnimationStop()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_InertialAnimationStop);
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
  const factory _InertialAnimationStop() = _$_InertialAnimationStop;
}

/// @nodoc
abstract class _$$_ScrollingAnimationEndCopyWith<$Res> {
  factory _$$_ScrollingAnimationEndCopyWith(_$_ScrollingAnimationEnd value,
          $Res Function(_$_ScrollingAnimationEnd) then) =
      __$$_ScrollingAnimationEndCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ScrollingAnimationEndCopyWithImpl<$Res>
    extends _$ScrollingEventCopyWithImpl<$Res, _$_ScrollingAnimationEnd>
    implements _$$_ScrollingAnimationEndCopyWith<$Res> {
  __$$_ScrollingAnimationEndCopyWithImpl(_$_ScrollingAnimationEnd _value,
      $Res Function(_$_ScrollingAnimationEnd) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ScrollingAnimationEnd implements _ScrollingAnimationEnd {
  const _$_ScrollingAnimationEnd();

  @override
  String toString() {
    return 'ScrollingEvent.scrollingAnimationEnd()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ScrollingAnimationEnd);
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
  const factory _ScrollingAnimationEnd() = _$_ScrollingAnimationEnd;
}

/// @nodoc
mixin _$ScrollingState {
  Matrix4 get matrix => throw _privateConstructorUsedError;
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
    required TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content, Size size, Rect diagramRect)
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
    required TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect, ScaleStartDetails details)
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
    TResult? Function(Matrix4 matrix, List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
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
    TResult? Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect, ScaleStartDetails details)?
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
    TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
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
    TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect, ScaleStartDetails details)?
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

  @JsonKey(ignore: true)
  $ScrollingStateCopyWith<ScrollingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScrollingStateCopyWith<$Res> {
  factory $ScrollingStateCopyWith(
          ScrollingState value, $Res Function(ScrollingState) then) =
      _$ScrollingStateCopyWithImpl<$Res, ScrollingState>;
  @useResult
  $Res call(
      {Matrix4 matrix,
      List<DiagramObjectEntity> content,
      Size size,
      Rect diagramRect});
}

/// @nodoc
class _$ScrollingStateCopyWithImpl<$Res, $Val extends ScrollingState>
    implements $ScrollingStateCopyWith<$Res> {
  _$ScrollingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matrix = null,
    Object? content = null,
    Object? size = null,
    Object? diagramRect = null,
  }) {
    return _then(_value.copyWith(
      matrix: null == matrix
          ? _value.matrix
          : matrix // ignore: cast_nullable_to_non_nullable
              as Matrix4,
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
abstract class _$$_ScrollingInitialCopyWith<$Res>
    implements $ScrollingStateCopyWith<$Res> {
  factory _$$_ScrollingInitialCopyWith(
          _$_ScrollingInitial value, $Res Function(_$_ScrollingInitial) then) =
      __$$_ScrollingInitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Matrix4 matrix,
      List<DiagramObjectEntity>? content,
      Size? size,
      Rect? diagramRect});
}

/// @nodoc
class __$$_ScrollingInitialCopyWithImpl<$Res>
    extends _$ScrollingStateCopyWithImpl<$Res, _$_ScrollingInitial>
    implements _$$_ScrollingInitialCopyWith<$Res> {
  __$$_ScrollingInitialCopyWithImpl(
      _$_ScrollingInitial _value, $Res Function(_$_ScrollingInitial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matrix = null,
    Object? content = freezed,
    Object? size = freezed,
    Object? diagramRect = freezed,
  }) {
    return _then(_$_ScrollingInitial(
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

class _$_ScrollingInitial implements _ScrollingInitial {
  const _$_ScrollingInitial(
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScrollingInitial &&
            (identical(other.matrix, matrix) || other.matrix == matrix) &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.diagramRect, diagramRect) ||
                other.diagramRect == diagramRect));
  }

  @override
  int get hashCode => Object.hash(runtimeType, matrix,
      const DeepCollectionEquality().hash(_content), size, diagramRect);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScrollingInitialCopyWith<_$_ScrollingInitial> get copyWith =>
      __$$_ScrollingInitialCopyWithImpl<_$_ScrollingInitial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Matrix4 matrix,
            List<DiagramObjectEntity>? content, Size? size, Rect? diagramRect)
        initial,
    required TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)
        animatingInitialToIdle,
    required TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content, Size size, Rect diagramRect)
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
    required TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect, ScaleStartDetails details)
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
    TResult? Function(Matrix4 matrix, List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
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
    TResult? Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect, ScaleStartDetails details)?
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
    TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
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
    TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect, ScaleStartDetails details)?
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
      final Rect? diagramRect}) = _$_ScrollingInitial;

  @override
  Matrix4 get matrix;
  @override
  List<DiagramObjectEntity>? get content;
  @override
  Size? get size;
  @override
  Rect? get diagramRect;
  @override
  @JsonKey(ignore: true)
  _$$_ScrollingInitialCopyWith<_$_ScrollingInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ScrollingAnimatingInitialToIdleCopyWith<$Res>
    implements $ScrollingStateCopyWith<$Res> {
  factory _$$_ScrollingAnimatingInitialToIdleCopyWith(
          _$_ScrollingAnimatingInitialToIdle value,
          $Res Function(_$_ScrollingAnimatingInitialToIdle) then) =
      __$$_ScrollingAnimatingInitialToIdleCopyWithImpl<$Res>;
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
class __$$_ScrollingAnimatingInitialToIdleCopyWithImpl<$Res>
    extends _$ScrollingStateCopyWithImpl<$Res,
        _$_ScrollingAnimatingInitialToIdle>
    implements _$$_ScrollingAnimatingInitialToIdleCopyWith<$Res> {
  __$$_ScrollingAnimatingInitialToIdleCopyWithImpl(
      _$_ScrollingAnimatingInitialToIdle _value,
      $Res Function(_$_ScrollingAnimatingInitialToIdle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oldMatrix = null,
    Object? matrix = null,
    Object? content = null,
    Object? size = null,
    Object? diagramRect = null,
  }) {
    return _then(_$_ScrollingAnimatingInitialToIdle(
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

class _$_ScrollingAnimatingInitialToIdle
    implements _ScrollingAnimatingInitialToIdle {
  const _$_ScrollingAnimatingInitialToIdle(
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScrollingAnimatingInitialToIdle &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScrollingAnimatingInitialToIdleCopyWith<
          _$_ScrollingAnimatingInitialToIdle>
      get copyWith => __$$_ScrollingAnimatingInitialToIdleCopyWithImpl<
          _$_ScrollingAnimatingInitialToIdle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Matrix4 matrix,
            List<DiagramObjectEntity>? content, Size? size, Rect? diagramRect)
        initial,
    required TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)
        animatingInitialToIdle,
    required TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content, Size size, Rect diagramRect)
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
    required TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect, ScaleStartDetails details)
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
    TResult? Function(Matrix4 matrix, List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
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
    TResult? Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect, ScaleStartDetails details)?
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
    TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
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
    TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect, ScaleStartDetails details)?
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
      required final Rect diagramRect}) = _$_ScrollingAnimatingInitialToIdle;

  Matrix4 get oldMatrix;
  @override
  Matrix4 get matrix;
  @override
  List<DiagramObjectEntity> get content;
  @override
  Size get size;
  @override
  Rect get diagramRect;
  @override
  @JsonKey(ignore: true)
  _$$_ScrollingAnimatingInitialToIdleCopyWith<
          _$_ScrollingAnimatingInitialToIdle>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ScrollingIdleCopyWith<$Res>
    implements $ScrollingStateCopyWith<$Res> {
  factory _$$_ScrollingIdleCopyWith(
          _$_ScrollingIdle value, $Res Function(_$_ScrollingIdle) then) =
      __$$_ScrollingIdleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Matrix4 matrix,
      List<DiagramObjectEntity> content,
      Size size,
      Rect diagramRect});
}

/// @nodoc
class __$$_ScrollingIdleCopyWithImpl<$Res>
    extends _$ScrollingStateCopyWithImpl<$Res, _$_ScrollingIdle>
    implements _$$_ScrollingIdleCopyWith<$Res> {
  __$$_ScrollingIdleCopyWithImpl(
      _$_ScrollingIdle _value, $Res Function(_$_ScrollingIdle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matrix = null,
    Object? content = null,
    Object? size = null,
    Object? diagramRect = null,
  }) {
    return _then(_$_ScrollingIdle(
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

class _$_ScrollingIdle implements _ScrollingIdle {
  const _$_ScrollingIdle(
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScrollingIdle &&
            (identical(other.matrix, matrix) || other.matrix == matrix) &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.diagramRect, diagramRect) ||
                other.diagramRect == diagramRect));
  }

  @override
  int get hashCode => Object.hash(runtimeType, matrix,
      const DeepCollectionEquality().hash(_content), size, diagramRect);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScrollingIdleCopyWith<_$_ScrollingIdle> get copyWith =>
      __$$_ScrollingIdleCopyWithImpl<_$_ScrollingIdle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Matrix4 matrix,
            List<DiagramObjectEntity>? content, Size? size, Rect? diagramRect)
        initial,
    required TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)
        animatingInitialToIdle,
    required TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content, Size size, Rect diagramRect)
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
    required TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect, ScaleStartDetails details)
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
    TResult? Function(Matrix4 matrix, List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
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
    TResult? Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect, ScaleStartDetails details)?
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
    TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
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
    TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect, ScaleStartDetails details)?
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
      required final Rect diagramRect}) = _$_ScrollingIdle;

  @override
  Matrix4 get matrix;
  @override
  List<DiagramObjectEntity> get content;
  @override
  Size get size;
  @override
  Rect get diagramRect;
  @override
  @JsonKey(ignore: true)
  _$$_ScrollingIdleCopyWith<_$_ScrollingIdle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ScrollingScrollingCopyWith<$Res>
    implements $ScrollingStateCopyWith<$Res> {
  factory _$$_ScrollingScrollingCopyWith(_$_ScrollingScrolling value,
          $Res Function(_$_ScrollingScrolling) then) =
      __$$_ScrollingScrollingCopyWithImpl<$Res>;
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
class __$$_ScrollingScrollingCopyWithImpl<$Res>
    extends _$ScrollingStateCopyWithImpl<$Res, _$_ScrollingScrolling>
    implements _$$_ScrollingScrollingCopyWith<$Res> {
  __$$_ScrollingScrollingCopyWithImpl(
      _$_ScrollingScrolling _value, $Res Function(_$_ScrollingScrolling) _then)
      : super(_value, _then);

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
    return _then(_$_ScrollingScrolling(
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

class _$_ScrollingScrolling implements _ScrollingScrolling {
  const _$_ScrollingScrolling(
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScrollingScrolling &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScrollingScrollingCopyWith<_$_ScrollingScrolling> get copyWith =>
      __$$_ScrollingScrollingCopyWithImpl<_$_ScrollingScrolling>(
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
    required TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content, Size size, Rect diagramRect)
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
    required TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect, ScaleStartDetails details)
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
    TResult? Function(Matrix4 matrix, List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
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
    TResult? Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect, ScaleStartDetails details)?
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
    TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
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
    TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect, ScaleStartDetails details)?
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
      required final DateTime eventDateTime}) = _$_ScrollingScrolling;

  @override
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
  @override
  @JsonKey(ignore: true)
  _$$_ScrollingScrollingCopyWith<_$_ScrollingScrolling> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ScrollingAnimatingInertialScrollingCopyWith<$Res>
    implements $ScrollingStateCopyWith<$Res> {
  factory _$$_ScrollingAnimatingInertialScrollingCopyWith(
          _$_ScrollingAnimatingInertialScrolling value,
          $Res Function(_$_ScrollingAnimatingInertialScrolling) then) =
      __$$_ScrollingAnimatingInertialScrollingCopyWithImpl<$Res>;
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
class __$$_ScrollingAnimatingInertialScrollingCopyWithImpl<$Res>
    extends _$ScrollingStateCopyWithImpl<$Res,
        _$_ScrollingAnimatingInertialScrolling>
    implements _$$_ScrollingAnimatingInertialScrollingCopyWith<$Res> {
  __$$_ScrollingAnimatingInertialScrollingCopyWithImpl(
      _$_ScrollingAnimatingInertialScrolling _value,
      $Res Function(_$_ScrollingAnimatingInertialScrolling) _then)
      : super(_value, _then);

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
    return _then(_$_ScrollingAnimatingInertialScrolling(
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

class _$_ScrollingAnimatingInertialScrolling
    implements _ScrollingAnimatingInertialScrolling {
  const _$_ScrollingAnimatingInertialScrolling(
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScrollingAnimatingInertialScrolling &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScrollingAnimatingInertialScrollingCopyWith<
          _$_ScrollingAnimatingInertialScrolling>
      get copyWith => __$$_ScrollingAnimatingInertialScrollingCopyWithImpl<
          _$_ScrollingAnimatingInertialScrolling>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Matrix4 matrix,
            List<DiagramObjectEntity>? content, Size? size, Rect? diagramRect)
        initial,
    required TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)
        animatingInitialToIdle,
    required TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content, Size size, Rect diagramRect)
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
    required TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect, ScaleStartDetails details)
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
    TResult? Function(Matrix4 matrix, List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
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
    TResult? Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect, ScaleStartDetails details)?
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
    TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
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
    TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect, ScaleStartDetails details)?
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
      _$_ScrollingAnimatingInertialScrolling;

  Matrix4 get oldMatrix;
  @override
  Matrix4 get matrix;
  int get animationTimeInMilliseconds;
  @override
  List<DiagramObjectEntity> get content;
  @override
  Size get size;
  @override
  Rect get diagramRect;
  @override
  @JsonKey(ignore: true)
  _$$_ScrollingAnimatingInertialScrollingCopyWith<
          _$_ScrollingAnimatingInertialScrolling>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_StoppingAnimationCopyWith<$Res>
    implements $ScrollingStateCopyWith<$Res> {
  factory _$$_StoppingAnimationCopyWith(_$_StoppingAnimation value,
          $Res Function(_$_StoppingAnimation) then) =
      __$$_StoppingAnimationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Matrix4 matrix,
      List<DiagramObjectEntity> content,
      Size size,
      Rect diagramRect,
      ScaleStartDetails details});
}

/// @nodoc
class __$$_StoppingAnimationCopyWithImpl<$Res>
    extends _$ScrollingStateCopyWithImpl<$Res, _$_StoppingAnimation>
    implements _$$_StoppingAnimationCopyWith<$Res> {
  __$$_StoppingAnimationCopyWithImpl(
      _$_StoppingAnimation _value, $Res Function(_$_StoppingAnimation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matrix = null,
    Object? content = null,
    Object? size = null,
    Object? diagramRect = null,
    Object? details = null,
  }) {
    return _then(_$_StoppingAnimation(
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
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as ScaleStartDetails,
    ));
  }
}

/// @nodoc

class _$_StoppingAnimation implements _StoppingAnimation {
  const _$_StoppingAnimation(
      {required this.matrix,
      required final List<DiagramObjectEntity> content,
      required this.size,
      required this.diagramRect,
      required this.details})
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
  final ScaleStartDetails details;

  @override
  String toString() {
    return 'ScrollingState.stoppingAnimation(matrix: $matrix, content: $content, size: $size, diagramRect: $diagramRect, details: $details)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoppingAnimation &&
            (identical(other.matrix, matrix) || other.matrix == matrix) &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.diagramRect, diagramRect) ||
                other.diagramRect == diagramRect) &&
            (identical(other.details, details) || other.details == details));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      matrix,
      const DeepCollectionEquality().hash(_content),
      size,
      diagramRect,
      details);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoppingAnimationCopyWith<_$_StoppingAnimation> get copyWith =>
      __$$_StoppingAnimationCopyWithImpl<_$_StoppingAnimation>(
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
    required TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content, Size size, Rect diagramRect)
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
    required TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect, ScaleStartDetails details)
        stoppingAnimation,
    required TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)
        animatingFromOutOfBounds,
  }) {
    return stoppingAnimation(matrix, content, size, diagramRect, details);
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
    TResult? Function(Matrix4 matrix, List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
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
    TResult? Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect, ScaleStartDetails details)?
        stoppingAnimation,
    TResult? Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
        animatingFromOutOfBounds,
  }) {
    return stoppingAnimation?.call(matrix, content, size, diagramRect, details);
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
    TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
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
    TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect, ScaleStartDetails details)?
        stoppingAnimation,
    TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
        animatingFromOutOfBounds,
    required TResult orElse(),
  }) {
    if (stoppingAnimation != null) {
      return stoppingAnimation(matrix, content, size, diagramRect, details);
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
      {required final Matrix4 matrix,
      required final List<DiagramObjectEntity> content,
      required final Size size,
      required final Rect diagramRect,
      required final ScaleStartDetails details}) = _$_StoppingAnimation;

  @override
  Matrix4 get matrix;
  @override
  List<DiagramObjectEntity> get content;
  @override
  Size get size;
  @override
  Rect get diagramRect;
  ScaleStartDetails get details;
  @override
  @JsonKey(ignore: true)
  _$$_StoppingAnimationCopyWith<_$_StoppingAnimation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ScrollingAnimatingFromOutOfBoundsCopyWith<$Res>
    implements $ScrollingStateCopyWith<$Res> {
  factory _$$_ScrollingAnimatingFromOutOfBoundsCopyWith(
          _$_ScrollingAnimatingFromOutOfBounds value,
          $Res Function(_$_ScrollingAnimatingFromOutOfBounds) then) =
      __$$_ScrollingAnimatingFromOutOfBoundsCopyWithImpl<$Res>;
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
class __$$_ScrollingAnimatingFromOutOfBoundsCopyWithImpl<$Res>
    extends _$ScrollingStateCopyWithImpl<$Res,
        _$_ScrollingAnimatingFromOutOfBounds>
    implements _$$_ScrollingAnimatingFromOutOfBoundsCopyWith<$Res> {
  __$$_ScrollingAnimatingFromOutOfBoundsCopyWithImpl(
      _$_ScrollingAnimatingFromOutOfBounds _value,
      $Res Function(_$_ScrollingAnimatingFromOutOfBounds) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? oldMatrix = null,
    Object? matrix = null,
    Object? content = null,
    Object? size = null,
    Object? diagramRect = null,
  }) {
    return _then(_$_ScrollingAnimatingFromOutOfBounds(
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

class _$_ScrollingAnimatingFromOutOfBounds
    implements _ScrollingAnimatingFromOutOfBounds {
  const _$_ScrollingAnimatingFromOutOfBounds(
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScrollingAnimatingFromOutOfBounds &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScrollingAnimatingFromOutOfBoundsCopyWith<
          _$_ScrollingAnimatingFromOutOfBounds>
      get copyWith => __$$_ScrollingAnimatingFromOutOfBoundsCopyWithImpl<
          _$_ScrollingAnimatingFromOutOfBounds>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Matrix4 matrix,
            List<DiagramObjectEntity>? content, Size? size, Rect? diagramRect)
        initial,
    required TResult Function(Matrix4 oldMatrix, Matrix4 matrix,
            List<DiagramObjectEntity> content, Size size, Rect diagramRect)
        animatingInitialToIdle,
    required TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content, Size size, Rect diagramRect)
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
    required TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect, ScaleStartDetails details)
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
    TResult? Function(Matrix4 matrix, List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
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
    TResult? Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect, ScaleStartDetails details)?
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
    TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content, Size size, Rect diagramRect)?
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
    TResult Function(Matrix4 matrix, List<DiagramObjectEntity> content,
            Size size, Rect diagramRect, ScaleStartDetails details)?
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
      required final Rect diagramRect}) = _$_ScrollingAnimatingFromOutOfBounds;

  Matrix4 get oldMatrix;
  @override
  Matrix4 get matrix;
  @override
  List<DiagramObjectEntity> get content;
  @override
  Size get size;
  @override
  Rect get diagramRect;
  @override
  @JsonKey(ignore: true)
  _$$_ScrollingAnimatingFromOutOfBoundsCopyWith<
          _$_ScrollingAnimatingFromOutOfBounds>
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

  @JsonKey(ignore: true)
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
abstract class _$$_ScrollingDynamicParamsCopyWith<$Res>
    implements $ScrollingDynamicParamsCopyWith<$Res> {
  factory _$$_ScrollingDynamicParamsCopyWith(_$_ScrollingDynamicParams value,
          $Res Function(_$_ScrollingDynamicParams) then) =
      __$$_ScrollingDynamicParamsCopyWithImpl<$Res>;
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
class __$$_ScrollingDynamicParamsCopyWithImpl<$Res>
    extends _$ScrollingDynamicParamsCopyWithImpl<$Res,
        _$_ScrollingDynamicParams>
    implements _$$_ScrollingDynamicParamsCopyWith<$Res> {
  __$$_ScrollingDynamicParamsCopyWithImpl(_$_ScrollingDynamicParams _value,
      $Res Function(_$_ScrollingDynamicParams) _then)
      : super(_value, _then);

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
    return _then(_$_ScrollingDynamicParams(
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

class _$_ScrollingDynamicParams implements _ScrollingDynamicParams {
  const _$_ScrollingDynamicParams(
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ScrollingDynamicParams &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScrollingDynamicParamsCopyWith<_$_ScrollingDynamicParams> get copyWith =>
      __$$_ScrollingDynamicParamsCopyWithImpl<_$_ScrollingDynamicParams>(
          this, _$identity);
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
      required final Rect contentRect}) = _$_ScrollingDynamicParams;

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
  @override
  @JsonKey(ignore: true)
  _$$_ScrollingDynamicParamsCopyWith<_$_ScrollingDynamicParams> get copyWith =>
      throw _privateConstructorUsedError;
}
