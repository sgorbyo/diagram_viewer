// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transform_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransformEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Transform2D transform) updateTransform,
    required TResult Function(
            double scale, Offset focalPoint, Transform2D currentTransform)
        zoom,
    required TResult Function(Offset delta, Transform2D currentTransform) pan,
    required TResult Function() reset,
    required TResult Function(Rect diagramRect, Size viewportSize)
        updateDiagramBounds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Transform2D transform)? updateTransform,
    TResult? Function(
            double scale, Offset focalPoint, Transform2D currentTransform)?
        zoom,
    TResult? Function(Offset delta, Transform2D currentTransform)? pan,
    TResult? Function()? reset,
    TResult? Function(Rect diagramRect, Size viewportSize)? updateDiagramBounds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Transform2D transform)? updateTransform,
    TResult Function(
            double scale, Offset focalPoint, Transform2D currentTransform)?
        zoom,
    TResult Function(Offset delta, Transform2D currentTransform)? pan,
    TResult Function()? reset,
    TResult Function(Rect diagramRect, Size viewportSize)? updateDiagramBounds,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateTransform value) updateTransform,
    required TResult Function(_Zoom value) zoom,
    required TResult Function(_Pan value) pan,
    required TResult Function(_Reset value) reset,
    required TResult Function(_UpdateDiagramBounds value) updateDiagramBounds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateTransform value)? updateTransform,
    TResult? Function(_Zoom value)? zoom,
    TResult? Function(_Pan value)? pan,
    TResult? Function(_Reset value)? reset,
    TResult? Function(_UpdateDiagramBounds value)? updateDiagramBounds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateTransform value)? updateTransform,
    TResult Function(_Zoom value)? zoom,
    TResult Function(_Pan value)? pan,
    TResult Function(_Reset value)? reset,
    TResult Function(_UpdateDiagramBounds value)? updateDiagramBounds,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransformEventCopyWith<$Res> {
  factory $TransformEventCopyWith(
          TransformEvent value, $Res Function(TransformEvent) then) =
      _$TransformEventCopyWithImpl<$Res, TransformEvent>;
}

/// @nodoc
class _$TransformEventCopyWithImpl<$Res, $Val extends TransformEvent>
    implements $TransformEventCopyWith<$Res> {
  _$TransformEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransformEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$UpdateTransformImplCopyWith<$Res> {
  factory _$$UpdateTransformImplCopyWith(_$UpdateTransformImpl value,
          $Res Function(_$UpdateTransformImpl) then) =
      __$$UpdateTransformImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Transform2D transform});

  $Transform2DCopyWith<$Res> get transform;
}

/// @nodoc
class __$$UpdateTransformImplCopyWithImpl<$Res>
    extends _$TransformEventCopyWithImpl<$Res, _$UpdateTransformImpl>
    implements _$$UpdateTransformImplCopyWith<$Res> {
  __$$UpdateTransformImplCopyWithImpl(
      _$UpdateTransformImpl _value, $Res Function(_$UpdateTransformImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransformEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transform = null,
  }) {
    return _then(_$UpdateTransformImpl(
      transform: null == transform
          ? _value.transform
          : transform // ignore: cast_nullable_to_non_nullable
              as Transform2D,
    ));
  }

  /// Create a copy of TransformEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Transform2DCopyWith<$Res> get transform {
    return $Transform2DCopyWith<$Res>(_value.transform, (value) {
      return _then(_value.copyWith(transform: value));
    });
  }
}

/// @nodoc

class _$UpdateTransformImpl implements _UpdateTransform {
  const _$UpdateTransformImpl({required this.transform});

  @override
  final Transform2D transform;

  @override
  String toString() {
    return 'TransformEvent.updateTransform(transform: $transform)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTransformImpl &&
            (identical(other.transform, transform) ||
                other.transform == transform));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transform);

  /// Create a copy of TransformEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTransformImplCopyWith<_$UpdateTransformImpl> get copyWith =>
      __$$UpdateTransformImplCopyWithImpl<_$UpdateTransformImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Transform2D transform) updateTransform,
    required TResult Function(
            double scale, Offset focalPoint, Transform2D currentTransform)
        zoom,
    required TResult Function(Offset delta, Transform2D currentTransform) pan,
    required TResult Function() reset,
    required TResult Function(Rect diagramRect, Size viewportSize)
        updateDiagramBounds,
  }) {
    return updateTransform(transform);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Transform2D transform)? updateTransform,
    TResult? Function(
            double scale, Offset focalPoint, Transform2D currentTransform)?
        zoom,
    TResult? Function(Offset delta, Transform2D currentTransform)? pan,
    TResult? Function()? reset,
    TResult? Function(Rect diagramRect, Size viewportSize)? updateDiagramBounds,
  }) {
    return updateTransform?.call(transform);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Transform2D transform)? updateTransform,
    TResult Function(
            double scale, Offset focalPoint, Transform2D currentTransform)?
        zoom,
    TResult Function(Offset delta, Transform2D currentTransform)? pan,
    TResult Function()? reset,
    TResult Function(Rect diagramRect, Size viewportSize)? updateDiagramBounds,
    required TResult orElse(),
  }) {
    if (updateTransform != null) {
      return updateTransform(transform);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateTransform value) updateTransform,
    required TResult Function(_Zoom value) zoom,
    required TResult Function(_Pan value) pan,
    required TResult Function(_Reset value) reset,
    required TResult Function(_UpdateDiagramBounds value) updateDiagramBounds,
  }) {
    return updateTransform(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateTransform value)? updateTransform,
    TResult? Function(_Zoom value)? zoom,
    TResult? Function(_Pan value)? pan,
    TResult? Function(_Reset value)? reset,
    TResult? Function(_UpdateDiagramBounds value)? updateDiagramBounds,
  }) {
    return updateTransform?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateTransform value)? updateTransform,
    TResult Function(_Zoom value)? zoom,
    TResult Function(_Pan value)? pan,
    TResult Function(_Reset value)? reset,
    TResult Function(_UpdateDiagramBounds value)? updateDiagramBounds,
    required TResult orElse(),
  }) {
    if (updateTransform != null) {
      return updateTransform(this);
    }
    return orElse();
  }
}

abstract class _UpdateTransform implements TransformEvent {
  const factory _UpdateTransform({required final Transform2D transform}) =
      _$UpdateTransformImpl;

  Transform2D get transform;

  /// Create a copy of TransformEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateTransformImplCopyWith<_$UpdateTransformImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ZoomImplCopyWith<$Res> {
  factory _$$ZoomImplCopyWith(
          _$ZoomImpl value, $Res Function(_$ZoomImpl) then) =
      __$$ZoomImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double scale, Offset focalPoint, Transform2D currentTransform});

  $Transform2DCopyWith<$Res> get currentTransform;
}

/// @nodoc
class __$$ZoomImplCopyWithImpl<$Res>
    extends _$TransformEventCopyWithImpl<$Res, _$ZoomImpl>
    implements _$$ZoomImplCopyWith<$Res> {
  __$$ZoomImplCopyWithImpl(_$ZoomImpl _value, $Res Function(_$ZoomImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransformEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scale = null,
    Object? focalPoint = null,
    Object? currentTransform = null,
  }) {
    return _then(_$ZoomImpl(
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double,
      focalPoint: null == focalPoint
          ? _value.focalPoint
          : focalPoint // ignore: cast_nullable_to_non_nullable
              as Offset,
      currentTransform: null == currentTransform
          ? _value.currentTransform
          : currentTransform // ignore: cast_nullable_to_non_nullable
              as Transform2D,
    ));
  }

  /// Create a copy of TransformEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Transform2DCopyWith<$Res> get currentTransform {
    return $Transform2DCopyWith<$Res>(_value.currentTransform, (value) {
      return _then(_value.copyWith(currentTransform: value));
    });
  }
}

/// @nodoc

class _$ZoomImpl implements _Zoom {
  const _$ZoomImpl(
      {required this.scale,
      required this.focalPoint,
      required this.currentTransform});

  @override
  final double scale;
  @override
  final Offset focalPoint;
  @override
  final Transform2D currentTransform;

  @override
  String toString() {
    return 'TransformEvent.zoom(scale: $scale, focalPoint: $focalPoint, currentTransform: $currentTransform)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZoomImpl &&
            (identical(other.scale, scale) || other.scale == scale) &&
            (identical(other.focalPoint, focalPoint) ||
                other.focalPoint == focalPoint) &&
            (identical(other.currentTransform, currentTransform) ||
                other.currentTransform == currentTransform));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, scale, focalPoint, currentTransform);

  /// Create a copy of TransformEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ZoomImplCopyWith<_$ZoomImpl> get copyWith =>
      __$$ZoomImplCopyWithImpl<_$ZoomImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Transform2D transform) updateTransform,
    required TResult Function(
            double scale, Offset focalPoint, Transform2D currentTransform)
        zoom,
    required TResult Function(Offset delta, Transform2D currentTransform) pan,
    required TResult Function() reset,
    required TResult Function(Rect diagramRect, Size viewportSize)
        updateDiagramBounds,
  }) {
    return zoom(scale, focalPoint, currentTransform);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Transform2D transform)? updateTransform,
    TResult? Function(
            double scale, Offset focalPoint, Transform2D currentTransform)?
        zoom,
    TResult? Function(Offset delta, Transform2D currentTransform)? pan,
    TResult? Function()? reset,
    TResult? Function(Rect diagramRect, Size viewportSize)? updateDiagramBounds,
  }) {
    return zoom?.call(scale, focalPoint, currentTransform);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Transform2D transform)? updateTransform,
    TResult Function(
            double scale, Offset focalPoint, Transform2D currentTransform)?
        zoom,
    TResult Function(Offset delta, Transform2D currentTransform)? pan,
    TResult Function()? reset,
    TResult Function(Rect diagramRect, Size viewportSize)? updateDiagramBounds,
    required TResult orElse(),
  }) {
    if (zoom != null) {
      return zoom(scale, focalPoint, currentTransform);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateTransform value) updateTransform,
    required TResult Function(_Zoom value) zoom,
    required TResult Function(_Pan value) pan,
    required TResult Function(_Reset value) reset,
    required TResult Function(_UpdateDiagramBounds value) updateDiagramBounds,
  }) {
    return zoom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateTransform value)? updateTransform,
    TResult? Function(_Zoom value)? zoom,
    TResult? Function(_Pan value)? pan,
    TResult? Function(_Reset value)? reset,
    TResult? Function(_UpdateDiagramBounds value)? updateDiagramBounds,
  }) {
    return zoom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateTransform value)? updateTransform,
    TResult Function(_Zoom value)? zoom,
    TResult Function(_Pan value)? pan,
    TResult Function(_Reset value)? reset,
    TResult Function(_UpdateDiagramBounds value)? updateDiagramBounds,
    required TResult orElse(),
  }) {
    if (zoom != null) {
      return zoom(this);
    }
    return orElse();
  }
}

abstract class _Zoom implements TransformEvent {
  const factory _Zoom(
      {required final double scale,
      required final Offset focalPoint,
      required final Transform2D currentTransform}) = _$ZoomImpl;

  double get scale;
  Offset get focalPoint;
  Transform2D get currentTransform;

  /// Create a copy of TransformEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ZoomImplCopyWith<_$ZoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PanImplCopyWith<$Res> {
  factory _$$PanImplCopyWith(_$PanImpl value, $Res Function(_$PanImpl) then) =
      __$$PanImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Offset delta, Transform2D currentTransform});

  $Transform2DCopyWith<$Res> get currentTransform;
}

/// @nodoc
class __$$PanImplCopyWithImpl<$Res>
    extends _$TransformEventCopyWithImpl<$Res, _$PanImpl>
    implements _$$PanImplCopyWith<$Res> {
  __$$PanImplCopyWithImpl(_$PanImpl _value, $Res Function(_$PanImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransformEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? delta = null,
    Object? currentTransform = null,
  }) {
    return _then(_$PanImpl(
      delta: null == delta
          ? _value.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as Offset,
      currentTransform: null == currentTransform
          ? _value.currentTransform
          : currentTransform // ignore: cast_nullable_to_non_nullable
              as Transform2D,
    ));
  }

  /// Create a copy of TransformEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Transform2DCopyWith<$Res> get currentTransform {
    return $Transform2DCopyWith<$Res>(_value.currentTransform, (value) {
      return _then(_value.copyWith(currentTransform: value));
    });
  }
}

/// @nodoc

class _$PanImpl implements _Pan {
  const _$PanImpl({required this.delta, required this.currentTransform});

  @override
  final Offset delta;
  @override
  final Transform2D currentTransform;

  @override
  String toString() {
    return 'TransformEvent.pan(delta: $delta, currentTransform: $currentTransform)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PanImpl &&
            (identical(other.delta, delta) || other.delta == delta) &&
            (identical(other.currentTransform, currentTransform) ||
                other.currentTransform == currentTransform));
  }

  @override
  int get hashCode => Object.hash(runtimeType, delta, currentTransform);

  /// Create a copy of TransformEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PanImplCopyWith<_$PanImpl> get copyWith =>
      __$$PanImplCopyWithImpl<_$PanImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Transform2D transform) updateTransform,
    required TResult Function(
            double scale, Offset focalPoint, Transform2D currentTransform)
        zoom,
    required TResult Function(Offset delta, Transform2D currentTransform) pan,
    required TResult Function() reset,
    required TResult Function(Rect diagramRect, Size viewportSize)
        updateDiagramBounds,
  }) {
    return pan(delta, currentTransform);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Transform2D transform)? updateTransform,
    TResult? Function(
            double scale, Offset focalPoint, Transform2D currentTransform)?
        zoom,
    TResult? Function(Offset delta, Transform2D currentTransform)? pan,
    TResult? Function()? reset,
    TResult? Function(Rect diagramRect, Size viewportSize)? updateDiagramBounds,
  }) {
    return pan?.call(delta, currentTransform);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Transform2D transform)? updateTransform,
    TResult Function(
            double scale, Offset focalPoint, Transform2D currentTransform)?
        zoom,
    TResult Function(Offset delta, Transform2D currentTransform)? pan,
    TResult Function()? reset,
    TResult Function(Rect diagramRect, Size viewportSize)? updateDiagramBounds,
    required TResult orElse(),
  }) {
    if (pan != null) {
      return pan(delta, currentTransform);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateTransform value) updateTransform,
    required TResult Function(_Zoom value) zoom,
    required TResult Function(_Pan value) pan,
    required TResult Function(_Reset value) reset,
    required TResult Function(_UpdateDiagramBounds value) updateDiagramBounds,
  }) {
    return pan(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateTransform value)? updateTransform,
    TResult? Function(_Zoom value)? zoom,
    TResult? Function(_Pan value)? pan,
    TResult? Function(_Reset value)? reset,
    TResult? Function(_UpdateDiagramBounds value)? updateDiagramBounds,
  }) {
    return pan?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateTransform value)? updateTransform,
    TResult Function(_Zoom value)? zoom,
    TResult Function(_Pan value)? pan,
    TResult Function(_Reset value)? reset,
    TResult Function(_UpdateDiagramBounds value)? updateDiagramBounds,
    required TResult orElse(),
  }) {
    if (pan != null) {
      return pan(this);
    }
    return orElse();
  }
}

abstract class _Pan implements TransformEvent {
  const factory _Pan(
      {required final Offset delta,
      required final Transform2D currentTransform}) = _$PanImpl;

  Offset get delta;
  Transform2D get currentTransform;

  /// Create a copy of TransformEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PanImplCopyWith<_$PanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetImplCopyWith<$Res> {
  factory _$$ResetImplCopyWith(
          _$ResetImpl value, $Res Function(_$ResetImpl) then) =
      __$$ResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetImplCopyWithImpl<$Res>
    extends _$TransformEventCopyWithImpl<$Res, _$ResetImpl>
    implements _$$ResetImplCopyWith<$Res> {
  __$$ResetImplCopyWithImpl(
      _$ResetImpl _value, $Res Function(_$ResetImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransformEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetImpl implements _Reset {
  const _$ResetImpl();

  @override
  String toString() {
    return 'TransformEvent.reset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Transform2D transform) updateTransform,
    required TResult Function(
            double scale, Offset focalPoint, Transform2D currentTransform)
        zoom,
    required TResult Function(Offset delta, Transform2D currentTransform) pan,
    required TResult Function() reset,
    required TResult Function(Rect diagramRect, Size viewportSize)
        updateDiagramBounds,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Transform2D transform)? updateTransform,
    TResult? Function(
            double scale, Offset focalPoint, Transform2D currentTransform)?
        zoom,
    TResult? Function(Offset delta, Transform2D currentTransform)? pan,
    TResult? Function()? reset,
    TResult? Function(Rect diagramRect, Size viewportSize)? updateDiagramBounds,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Transform2D transform)? updateTransform,
    TResult Function(
            double scale, Offset focalPoint, Transform2D currentTransform)?
        zoom,
    TResult Function(Offset delta, Transform2D currentTransform)? pan,
    TResult Function()? reset,
    TResult Function(Rect diagramRect, Size viewportSize)? updateDiagramBounds,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateTransform value) updateTransform,
    required TResult Function(_Zoom value) zoom,
    required TResult Function(_Pan value) pan,
    required TResult Function(_Reset value) reset,
    required TResult Function(_UpdateDiagramBounds value) updateDiagramBounds,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateTransform value)? updateTransform,
    TResult? Function(_Zoom value)? zoom,
    TResult? Function(_Pan value)? pan,
    TResult? Function(_Reset value)? reset,
    TResult? Function(_UpdateDiagramBounds value)? updateDiagramBounds,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateTransform value)? updateTransform,
    TResult Function(_Zoom value)? zoom,
    TResult Function(_Pan value)? pan,
    TResult Function(_Reset value)? reset,
    TResult Function(_UpdateDiagramBounds value)? updateDiagramBounds,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class _Reset implements TransformEvent {
  const factory _Reset() = _$ResetImpl;
}

/// @nodoc
abstract class _$$UpdateDiagramBoundsImplCopyWith<$Res> {
  factory _$$UpdateDiagramBoundsImplCopyWith(_$UpdateDiagramBoundsImpl value,
          $Res Function(_$UpdateDiagramBoundsImpl) then) =
      __$$UpdateDiagramBoundsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Rect diagramRect, Size viewportSize});
}

/// @nodoc
class __$$UpdateDiagramBoundsImplCopyWithImpl<$Res>
    extends _$TransformEventCopyWithImpl<$Res, _$UpdateDiagramBoundsImpl>
    implements _$$UpdateDiagramBoundsImplCopyWith<$Res> {
  __$$UpdateDiagramBoundsImplCopyWithImpl(_$UpdateDiagramBoundsImpl _value,
      $Res Function(_$UpdateDiagramBoundsImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransformEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? diagramRect = null,
    Object? viewportSize = null,
  }) {
    return _then(_$UpdateDiagramBoundsImpl(
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

class _$UpdateDiagramBoundsImpl implements _UpdateDiagramBounds {
  const _$UpdateDiagramBoundsImpl(
      {required this.diagramRect, required this.viewportSize});

  @override
  final Rect diagramRect;
  @override
  final Size viewportSize;

  @override
  String toString() {
    return 'TransformEvent.updateDiagramBounds(diagramRect: $diagramRect, viewportSize: $viewportSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateDiagramBoundsImpl &&
            (identical(other.diagramRect, diagramRect) ||
                other.diagramRect == diagramRect) &&
            (identical(other.viewportSize, viewportSize) ||
                other.viewportSize == viewportSize));
  }

  @override
  int get hashCode => Object.hash(runtimeType, diagramRect, viewportSize);

  /// Create a copy of TransformEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateDiagramBoundsImplCopyWith<_$UpdateDiagramBoundsImpl> get copyWith =>
      __$$UpdateDiagramBoundsImplCopyWithImpl<_$UpdateDiagramBoundsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Transform2D transform) updateTransform,
    required TResult Function(
            double scale, Offset focalPoint, Transform2D currentTransform)
        zoom,
    required TResult Function(Offset delta, Transform2D currentTransform) pan,
    required TResult Function() reset,
    required TResult Function(Rect diagramRect, Size viewportSize)
        updateDiagramBounds,
  }) {
    return updateDiagramBounds(diagramRect, viewportSize);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Transform2D transform)? updateTransform,
    TResult? Function(
            double scale, Offset focalPoint, Transform2D currentTransform)?
        zoom,
    TResult? Function(Offset delta, Transform2D currentTransform)? pan,
    TResult? Function()? reset,
    TResult? Function(Rect diagramRect, Size viewportSize)? updateDiagramBounds,
  }) {
    return updateDiagramBounds?.call(diagramRect, viewportSize);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Transform2D transform)? updateTransform,
    TResult Function(
            double scale, Offset focalPoint, Transform2D currentTransform)?
        zoom,
    TResult Function(Offset delta, Transform2D currentTransform)? pan,
    TResult Function()? reset,
    TResult Function(Rect diagramRect, Size viewportSize)? updateDiagramBounds,
    required TResult orElse(),
  }) {
    if (updateDiagramBounds != null) {
      return updateDiagramBounds(diagramRect, viewportSize);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateTransform value) updateTransform,
    required TResult Function(_Zoom value) zoom,
    required TResult Function(_Pan value) pan,
    required TResult Function(_Reset value) reset,
    required TResult Function(_UpdateDiagramBounds value) updateDiagramBounds,
  }) {
    return updateDiagramBounds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateTransform value)? updateTransform,
    TResult? Function(_Zoom value)? zoom,
    TResult? Function(_Pan value)? pan,
    TResult? Function(_Reset value)? reset,
    TResult? Function(_UpdateDiagramBounds value)? updateDiagramBounds,
  }) {
    return updateDiagramBounds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateTransform value)? updateTransform,
    TResult Function(_Zoom value)? zoom,
    TResult Function(_Pan value)? pan,
    TResult Function(_Reset value)? reset,
    TResult Function(_UpdateDiagramBounds value)? updateDiagramBounds,
    required TResult orElse(),
  }) {
    if (updateDiagramBounds != null) {
      return updateDiagramBounds(this);
    }
    return orElse();
  }
}

abstract class _UpdateDiagramBounds implements TransformEvent {
  const factory _UpdateDiagramBounds(
      {required final Rect diagramRect,
      required final Size viewportSize}) = _$UpdateDiagramBoundsImpl;

  Rect get diagramRect;
  Size get viewportSize;

  /// Create a copy of TransformEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateDiagramBoundsImplCopyWith<_$UpdateDiagramBoundsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
