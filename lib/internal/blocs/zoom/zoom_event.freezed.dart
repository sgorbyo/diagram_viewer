// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'zoom_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ZoomEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double scrollDelta, Offset screenPosition,
            Transform2D currentTransform)
        mouseWheelZoom,
    required TResult Function(
            double scale, Offset screenPosition, Transform2D currentTransform)
        pinchZoom,
    required TResult Function(bool zoomIn, Transform2D currentTransform)
        keyboardZoom,
    required TResult Function() executeBounceBack,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double scrollDelta, Offset screenPosition,
            Transform2D currentTransform)?
        mouseWheelZoom,
    TResult? Function(
            double scale, Offset screenPosition, Transform2D currentTransform)?
        pinchZoom,
    TResult? Function(bool zoomIn, Transform2D currentTransform)? keyboardZoom,
    TResult? Function()? executeBounceBack,
    TResult? Function()? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double scrollDelta, Offset screenPosition,
            Transform2D currentTransform)?
        mouseWheelZoom,
    TResult Function(
            double scale, Offset screenPosition, Transform2D currentTransform)?
        pinchZoom,
    TResult Function(bool zoomIn, Transform2D currentTransform)? keyboardZoom,
    TResult Function()? executeBounceBack,
    TResult Function()? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MouseWheelZoom value) mouseWheelZoom,
    required TResult Function(_PinchZoom value) pinchZoom,
    required TResult Function(_KeyboardZoom value) keyboardZoom,
    required TResult Function(_ExecuteBounceBack value) executeBounceBack,
    required TResult Function(_Reset value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MouseWheelZoom value)? mouseWheelZoom,
    TResult? Function(_PinchZoom value)? pinchZoom,
    TResult? Function(_KeyboardZoom value)? keyboardZoom,
    TResult? Function(_ExecuteBounceBack value)? executeBounceBack,
    TResult? Function(_Reset value)? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MouseWheelZoom value)? mouseWheelZoom,
    TResult Function(_PinchZoom value)? pinchZoom,
    TResult Function(_KeyboardZoom value)? keyboardZoom,
    TResult Function(_ExecuteBounceBack value)? executeBounceBack,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZoomEventCopyWith<$Res> {
  factory $ZoomEventCopyWith(ZoomEvent value, $Res Function(ZoomEvent) then) =
      _$ZoomEventCopyWithImpl<$Res, ZoomEvent>;
}

/// @nodoc
class _$ZoomEventCopyWithImpl<$Res, $Val extends ZoomEvent>
    implements $ZoomEventCopyWith<$Res> {
  _$ZoomEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ZoomEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$MouseWheelZoomImplCopyWith<$Res> {
  factory _$$MouseWheelZoomImplCopyWith(_$MouseWheelZoomImpl value,
          $Res Function(_$MouseWheelZoomImpl) then) =
      __$$MouseWheelZoomImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {double scrollDelta,
      Offset screenPosition,
      Transform2D currentTransform});

  $Transform2DCopyWith<$Res> get currentTransform;
}

/// @nodoc
class __$$MouseWheelZoomImplCopyWithImpl<$Res>
    extends _$ZoomEventCopyWithImpl<$Res, _$MouseWheelZoomImpl>
    implements _$$MouseWheelZoomImplCopyWith<$Res> {
  __$$MouseWheelZoomImplCopyWithImpl(
      _$MouseWheelZoomImpl _value, $Res Function(_$MouseWheelZoomImpl) _then)
      : super(_value, _then);

  /// Create a copy of ZoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scrollDelta = null,
    Object? screenPosition = null,
    Object? currentTransform = null,
  }) {
    return _then(_$MouseWheelZoomImpl(
      scrollDelta: null == scrollDelta
          ? _value.scrollDelta
          : scrollDelta // ignore: cast_nullable_to_non_nullable
              as double,
      screenPosition: null == screenPosition
          ? _value.screenPosition
          : screenPosition // ignore: cast_nullable_to_non_nullable
              as Offset,
      currentTransform: null == currentTransform
          ? _value.currentTransform
          : currentTransform // ignore: cast_nullable_to_non_nullable
              as Transform2D,
    ));
  }

  /// Create a copy of ZoomEvent
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

class _$MouseWheelZoomImpl implements _MouseWheelZoom {
  const _$MouseWheelZoomImpl(
      {required this.scrollDelta,
      required this.screenPosition,
      required this.currentTransform});

  @override
  final double scrollDelta;
  @override
  final Offset screenPosition;
  @override
  final Transform2D currentTransform;

  @override
  String toString() {
    return 'ZoomEvent.mouseWheelZoom(scrollDelta: $scrollDelta, screenPosition: $screenPosition, currentTransform: $currentTransform)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MouseWheelZoomImpl &&
            (identical(other.scrollDelta, scrollDelta) ||
                other.scrollDelta == scrollDelta) &&
            (identical(other.screenPosition, screenPosition) ||
                other.screenPosition == screenPosition) &&
            (identical(other.currentTransform, currentTransform) ||
                other.currentTransform == currentTransform));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, scrollDelta, screenPosition, currentTransform);

  /// Create a copy of ZoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MouseWheelZoomImplCopyWith<_$MouseWheelZoomImpl> get copyWith =>
      __$$MouseWheelZoomImplCopyWithImpl<_$MouseWheelZoomImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double scrollDelta, Offset screenPosition,
            Transform2D currentTransform)
        mouseWheelZoom,
    required TResult Function(
            double scale, Offset screenPosition, Transform2D currentTransform)
        pinchZoom,
    required TResult Function(bool zoomIn, Transform2D currentTransform)
        keyboardZoom,
    required TResult Function() executeBounceBack,
    required TResult Function() reset,
  }) {
    return mouseWheelZoom(scrollDelta, screenPosition, currentTransform);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double scrollDelta, Offset screenPosition,
            Transform2D currentTransform)?
        mouseWheelZoom,
    TResult? Function(
            double scale, Offset screenPosition, Transform2D currentTransform)?
        pinchZoom,
    TResult? Function(bool zoomIn, Transform2D currentTransform)? keyboardZoom,
    TResult? Function()? executeBounceBack,
    TResult? Function()? reset,
  }) {
    return mouseWheelZoom?.call(scrollDelta, screenPosition, currentTransform);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double scrollDelta, Offset screenPosition,
            Transform2D currentTransform)?
        mouseWheelZoom,
    TResult Function(
            double scale, Offset screenPosition, Transform2D currentTransform)?
        pinchZoom,
    TResult Function(bool zoomIn, Transform2D currentTransform)? keyboardZoom,
    TResult Function()? executeBounceBack,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (mouseWheelZoom != null) {
      return mouseWheelZoom(scrollDelta, screenPosition, currentTransform);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MouseWheelZoom value) mouseWheelZoom,
    required TResult Function(_PinchZoom value) pinchZoom,
    required TResult Function(_KeyboardZoom value) keyboardZoom,
    required TResult Function(_ExecuteBounceBack value) executeBounceBack,
    required TResult Function(_Reset value) reset,
  }) {
    return mouseWheelZoom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MouseWheelZoom value)? mouseWheelZoom,
    TResult? Function(_PinchZoom value)? pinchZoom,
    TResult? Function(_KeyboardZoom value)? keyboardZoom,
    TResult? Function(_ExecuteBounceBack value)? executeBounceBack,
    TResult? Function(_Reset value)? reset,
  }) {
    return mouseWheelZoom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MouseWheelZoom value)? mouseWheelZoom,
    TResult Function(_PinchZoom value)? pinchZoom,
    TResult Function(_KeyboardZoom value)? keyboardZoom,
    TResult Function(_ExecuteBounceBack value)? executeBounceBack,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (mouseWheelZoom != null) {
      return mouseWheelZoom(this);
    }
    return orElse();
  }
}

abstract class _MouseWheelZoom implements ZoomEvent {
  const factory _MouseWheelZoom(
      {required final double scrollDelta,
      required final Offset screenPosition,
      required final Transform2D currentTransform}) = _$MouseWheelZoomImpl;

  double get scrollDelta;
  Offset get screenPosition;
  Transform2D get currentTransform;

  /// Create a copy of ZoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MouseWheelZoomImplCopyWith<_$MouseWheelZoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PinchZoomImplCopyWith<$Res> {
  factory _$$PinchZoomImplCopyWith(
          _$PinchZoomImpl value, $Res Function(_$PinchZoomImpl) then) =
      __$$PinchZoomImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {double scale, Offset screenPosition, Transform2D currentTransform});

  $Transform2DCopyWith<$Res> get currentTransform;
}

/// @nodoc
class __$$PinchZoomImplCopyWithImpl<$Res>
    extends _$ZoomEventCopyWithImpl<$Res, _$PinchZoomImpl>
    implements _$$PinchZoomImplCopyWith<$Res> {
  __$$PinchZoomImplCopyWithImpl(
      _$PinchZoomImpl _value, $Res Function(_$PinchZoomImpl) _then)
      : super(_value, _then);

  /// Create a copy of ZoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scale = null,
    Object? screenPosition = null,
    Object? currentTransform = null,
  }) {
    return _then(_$PinchZoomImpl(
      scale: null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double,
      screenPosition: null == screenPosition
          ? _value.screenPosition
          : screenPosition // ignore: cast_nullable_to_non_nullable
              as Offset,
      currentTransform: null == currentTransform
          ? _value.currentTransform
          : currentTransform // ignore: cast_nullable_to_non_nullable
              as Transform2D,
    ));
  }

  /// Create a copy of ZoomEvent
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

class _$PinchZoomImpl implements _PinchZoom {
  const _$PinchZoomImpl(
      {required this.scale,
      required this.screenPosition,
      required this.currentTransform});

  @override
  final double scale;
  @override
  final Offset screenPosition;
  @override
  final Transform2D currentTransform;

  @override
  String toString() {
    return 'ZoomEvent.pinchZoom(scale: $scale, screenPosition: $screenPosition, currentTransform: $currentTransform)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PinchZoomImpl &&
            (identical(other.scale, scale) || other.scale == scale) &&
            (identical(other.screenPosition, screenPosition) ||
                other.screenPosition == screenPosition) &&
            (identical(other.currentTransform, currentTransform) ||
                other.currentTransform == currentTransform));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, scale, screenPosition, currentTransform);

  /// Create a copy of ZoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PinchZoomImplCopyWith<_$PinchZoomImpl> get copyWith =>
      __$$PinchZoomImplCopyWithImpl<_$PinchZoomImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double scrollDelta, Offset screenPosition,
            Transform2D currentTransform)
        mouseWheelZoom,
    required TResult Function(
            double scale, Offset screenPosition, Transform2D currentTransform)
        pinchZoom,
    required TResult Function(bool zoomIn, Transform2D currentTransform)
        keyboardZoom,
    required TResult Function() executeBounceBack,
    required TResult Function() reset,
  }) {
    return pinchZoom(scale, screenPosition, currentTransform);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double scrollDelta, Offset screenPosition,
            Transform2D currentTransform)?
        mouseWheelZoom,
    TResult? Function(
            double scale, Offset screenPosition, Transform2D currentTransform)?
        pinchZoom,
    TResult? Function(bool zoomIn, Transform2D currentTransform)? keyboardZoom,
    TResult? Function()? executeBounceBack,
    TResult? Function()? reset,
  }) {
    return pinchZoom?.call(scale, screenPosition, currentTransform);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double scrollDelta, Offset screenPosition,
            Transform2D currentTransform)?
        mouseWheelZoom,
    TResult Function(
            double scale, Offset screenPosition, Transform2D currentTransform)?
        pinchZoom,
    TResult Function(bool zoomIn, Transform2D currentTransform)? keyboardZoom,
    TResult Function()? executeBounceBack,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (pinchZoom != null) {
      return pinchZoom(scale, screenPosition, currentTransform);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MouseWheelZoom value) mouseWheelZoom,
    required TResult Function(_PinchZoom value) pinchZoom,
    required TResult Function(_KeyboardZoom value) keyboardZoom,
    required TResult Function(_ExecuteBounceBack value) executeBounceBack,
    required TResult Function(_Reset value) reset,
  }) {
    return pinchZoom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MouseWheelZoom value)? mouseWheelZoom,
    TResult? Function(_PinchZoom value)? pinchZoom,
    TResult? Function(_KeyboardZoom value)? keyboardZoom,
    TResult? Function(_ExecuteBounceBack value)? executeBounceBack,
    TResult? Function(_Reset value)? reset,
  }) {
    return pinchZoom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MouseWheelZoom value)? mouseWheelZoom,
    TResult Function(_PinchZoom value)? pinchZoom,
    TResult Function(_KeyboardZoom value)? keyboardZoom,
    TResult Function(_ExecuteBounceBack value)? executeBounceBack,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (pinchZoom != null) {
      return pinchZoom(this);
    }
    return orElse();
  }
}

abstract class _PinchZoom implements ZoomEvent {
  const factory _PinchZoom(
      {required final double scale,
      required final Offset screenPosition,
      required final Transform2D currentTransform}) = _$PinchZoomImpl;

  double get scale;
  Offset get screenPosition;
  Transform2D get currentTransform;

  /// Create a copy of ZoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PinchZoomImplCopyWith<_$PinchZoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$KeyboardZoomImplCopyWith<$Res> {
  factory _$$KeyboardZoomImplCopyWith(
          _$KeyboardZoomImpl value, $Res Function(_$KeyboardZoomImpl) then) =
      __$$KeyboardZoomImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool zoomIn, Transform2D currentTransform});

  $Transform2DCopyWith<$Res> get currentTransform;
}

/// @nodoc
class __$$KeyboardZoomImplCopyWithImpl<$Res>
    extends _$ZoomEventCopyWithImpl<$Res, _$KeyboardZoomImpl>
    implements _$$KeyboardZoomImplCopyWith<$Res> {
  __$$KeyboardZoomImplCopyWithImpl(
      _$KeyboardZoomImpl _value, $Res Function(_$KeyboardZoomImpl) _then)
      : super(_value, _then);

  /// Create a copy of ZoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zoomIn = null,
    Object? currentTransform = null,
  }) {
    return _then(_$KeyboardZoomImpl(
      zoomIn: null == zoomIn
          ? _value.zoomIn
          : zoomIn // ignore: cast_nullable_to_non_nullable
              as bool,
      currentTransform: null == currentTransform
          ? _value.currentTransform
          : currentTransform // ignore: cast_nullable_to_non_nullable
              as Transform2D,
    ));
  }

  /// Create a copy of ZoomEvent
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

class _$KeyboardZoomImpl implements _KeyboardZoom {
  const _$KeyboardZoomImpl(
      {required this.zoomIn, required this.currentTransform});

  @override
  final bool zoomIn;
  @override
  final Transform2D currentTransform;

  @override
  String toString() {
    return 'ZoomEvent.keyboardZoom(zoomIn: $zoomIn, currentTransform: $currentTransform)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KeyboardZoomImpl &&
            (identical(other.zoomIn, zoomIn) || other.zoomIn == zoomIn) &&
            (identical(other.currentTransform, currentTransform) ||
                other.currentTransform == currentTransform));
  }

  @override
  int get hashCode => Object.hash(runtimeType, zoomIn, currentTransform);

  /// Create a copy of ZoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KeyboardZoomImplCopyWith<_$KeyboardZoomImpl> get copyWith =>
      __$$KeyboardZoomImplCopyWithImpl<_$KeyboardZoomImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double scrollDelta, Offset screenPosition,
            Transform2D currentTransform)
        mouseWheelZoom,
    required TResult Function(
            double scale, Offset screenPosition, Transform2D currentTransform)
        pinchZoom,
    required TResult Function(bool zoomIn, Transform2D currentTransform)
        keyboardZoom,
    required TResult Function() executeBounceBack,
    required TResult Function() reset,
  }) {
    return keyboardZoom(zoomIn, currentTransform);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double scrollDelta, Offset screenPosition,
            Transform2D currentTransform)?
        mouseWheelZoom,
    TResult? Function(
            double scale, Offset screenPosition, Transform2D currentTransform)?
        pinchZoom,
    TResult? Function(bool zoomIn, Transform2D currentTransform)? keyboardZoom,
    TResult? Function()? executeBounceBack,
    TResult? Function()? reset,
  }) {
    return keyboardZoom?.call(zoomIn, currentTransform);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double scrollDelta, Offset screenPosition,
            Transform2D currentTransform)?
        mouseWheelZoom,
    TResult Function(
            double scale, Offset screenPosition, Transform2D currentTransform)?
        pinchZoom,
    TResult Function(bool zoomIn, Transform2D currentTransform)? keyboardZoom,
    TResult Function()? executeBounceBack,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (keyboardZoom != null) {
      return keyboardZoom(zoomIn, currentTransform);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MouseWheelZoom value) mouseWheelZoom,
    required TResult Function(_PinchZoom value) pinchZoom,
    required TResult Function(_KeyboardZoom value) keyboardZoom,
    required TResult Function(_ExecuteBounceBack value) executeBounceBack,
    required TResult Function(_Reset value) reset,
  }) {
    return keyboardZoom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MouseWheelZoom value)? mouseWheelZoom,
    TResult? Function(_PinchZoom value)? pinchZoom,
    TResult? Function(_KeyboardZoom value)? keyboardZoom,
    TResult? Function(_ExecuteBounceBack value)? executeBounceBack,
    TResult? Function(_Reset value)? reset,
  }) {
    return keyboardZoom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MouseWheelZoom value)? mouseWheelZoom,
    TResult Function(_PinchZoom value)? pinchZoom,
    TResult Function(_KeyboardZoom value)? keyboardZoom,
    TResult Function(_ExecuteBounceBack value)? executeBounceBack,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (keyboardZoom != null) {
      return keyboardZoom(this);
    }
    return orElse();
  }
}

abstract class _KeyboardZoom implements ZoomEvent {
  const factory _KeyboardZoom(
      {required final bool zoomIn,
      required final Transform2D currentTransform}) = _$KeyboardZoomImpl;

  bool get zoomIn;
  Transform2D get currentTransform;

  /// Create a copy of ZoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KeyboardZoomImplCopyWith<_$KeyboardZoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExecuteBounceBackImplCopyWith<$Res> {
  factory _$$ExecuteBounceBackImplCopyWith(_$ExecuteBounceBackImpl value,
          $Res Function(_$ExecuteBounceBackImpl) then) =
      __$$ExecuteBounceBackImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExecuteBounceBackImplCopyWithImpl<$Res>
    extends _$ZoomEventCopyWithImpl<$Res, _$ExecuteBounceBackImpl>
    implements _$$ExecuteBounceBackImplCopyWith<$Res> {
  __$$ExecuteBounceBackImplCopyWithImpl(_$ExecuteBounceBackImpl _value,
      $Res Function(_$ExecuteBounceBackImpl) _then)
      : super(_value, _then);

  /// Create a copy of ZoomEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ExecuteBounceBackImpl implements _ExecuteBounceBack {
  const _$ExecuteBounceBackImpl();

  @override
  String toString() {
    return 'ZoomEvent.executeBounceBack()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ExecuteBounceBackImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double scrollDelta, Offset screenPosition,
            Transform2D currentTransform)
        mouseWheelZoom,
    required TResult Function(
            double scale, Offset screenPosition, Transform2D currentTransform)
        pinchZoom,
    required TResult Function(bool zoomIn, Transform2D currentTransform)
        keyboardZoom,
    required TResult Function() executeBounceBack,
    required TResult Function() reset,
  }) {
    return executeBounceBack();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double scrollDelta, Offset screenPosition,
            Transform2D currentTransform)?
        mouseWheelZoom,
    TResult? Function(
            double scale, Offset screenPosition, Transform2D currentTransform)?
        pinchZoom,
    TResult? Function(bool zoomIn, Transform2D currentTransform)? keyboardZoom,
    TResult? Function()? executeBounceBack,
    TResult? Function()? reset,
  }) {
    return executeBounceBack?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double scrollDelta, Offset screenPosition,
            Transform2D currentTransform)?
        mouseWheelZoom,
    TResult Function(
            double scale, Offset screenPosition, Transform2D currentTransform)?
        pinchZoom,
    TResult Function(bool zoomIn, Transform2D currentTransform)? keyboardZoom,
    TResult Function()? executeBounceBack,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (executeBounceBack != null) {
      return executeBounceBack();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MouseWheelZoom value) mouseWheelZoom,
    required TResult Function(_PinchZoom value) pinchZoom,
    required TResult Function(_KeyboardZoom value) keyboardZoom,
    required TResult Function(_ExecuteBounceBack value) executeBounceBack,
    required TResult Function(_Reset value) reset,
  }) {
    return executeBounceBack(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MouseWheelZoom value)? mouseWheelZoom,
    TResult? Function(_PinchZoom value)? pinchZoom,
    TResult? Function(_KeyboardZoom value)? keyboardZoom,
    TResult? Function(_ExecuteBounceBack value)? executeBounceBack,
    TResult? Function(_Reset value)? reset,
  }) {
    return executeBounceBack?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MouseWheelZoom value)? mouseWheelZoom,
    TResult Function(_PinchZoom value)? pinchZoom,
    TResult Function(_KeyboardZoom value)? keyboardZoom,
    TResult Function(_ExecuteBounceBack value)? executeBounceBack,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (executeBounceBack != null) {
      return executeBounceBack(this);
    }
    return orElse();
  }
}

abstract class _ExecuteBounceBack implements ZoomEvent {
  const factory _ExecuteBounceBack() = _$ExecuteBounceBackImpl;
}

/// @nodoc
abstract class _$$ResetImplCopyWith<$Res> {
  factory _$$ResetImplCopyWith(
          _$ResetImpl value, $Res Function(_$ResetImpl) then) =
      __$$ResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetImplCopyWithImpl<$Res>
    extends _$ZoomEventCopyWithImpl<$Res, _$ResetImpl>
    implements _$$ResetImplCopyWith<$Res> {
  __$$ResetImplCopyWithImpl(
      _$ResetImpl _value, $Res Function(_$ResetImpl) _then)
      : super(_value, _then);

  /// Create a copy of ZoomEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetImpl implements _Reset {
  const _$ResetImpl();

  @override
  String toString() {
    return 'ZoomEvent.reset()';
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
    required TResult Function(double scrollDelta, Offset screenPosition,
            Transform2D currentTransform)
        mouseWheelZoom,
    required TResult Function(
            double scale, Offset screenPosition, Transform2D currentTransform)
        pinchZoom,
    required TResult Function(bool zoomIn, Transform2D currentTransform)
        keyboardZoom,
    required TResult Function() executeBounceBack,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double scrollDelta, Offset screenPosition,
            Transform2D currentTransform)?
        mouseWheelZoom,
    TResult? Function(
            double scale, Offset screenPosition, Transform2D currentTransform)?
        pinchZoom,
    TResult? Function(bool zoomIn, Transform2D currentTransform)? keyboardZoom,
    TResult? Function()? executeBounceBack,
    TResult? Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double scrollDelta, Offset screenPosition,
            Transform2D currentTransform)?
        mouseWheelZoom,
    TResult Function(
            double scale, Offset screenPosition, Transform2D currentTransform)?
        pinchZoom,
    TResult Function(bool zoomIn, Transform2D currentTransform)? keyboardZoom,
    TResult Function()? executeBounceBack,
    TResult Function()? reset,
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
    required TResult Function(_MouseWheelZoom value) mouseWheelZoom,
    required TResult Function(_PinchZoom value) pinchZoom,
    required TResult Function(_KeyboardZoom value) keyboardZoom,
    required TResult Function(_ExecuteBounceBack value) executeBounceBack,
    required TResult Function(_Reset value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MouseWheelZoom value)? mouseWheelZoom,
    TResult? Function(_PinchZoom value)? pinchZoom,
    TResult? Function(_KeyboardZoom value)? keyboardZoom,
    TResult? Function(_ExecuteBounceBack value)? executeBounceBack,
    TResult? Function(_Reset value)? reset,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MouseWheelZoom value)? mouseWheelZoom,
    TResult Function(_PinchZoom value)? pinchZoom,
    TResult Function(_KeyboardZoom value)? keyboardZoom,
    TResult Function(_ExecuteBounceBack value)? executeBounceBack,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class _Reset implements ZoomEvent {
  const factory _Reset() = _$ResetImpl;
}
