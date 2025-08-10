// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pan_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PanEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Offset delta, Transform2D currentTransform) pan,
    required TResult Function(Offset direction, Transform2D currentTransform)
        keyboardPan,
    required TResult Function(Transform2D currentTransform) autoCenter,
    required TResult Function() reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Offset delta, Transform2D currentTransform)? pan,
    TResult? Function(Offset direction, Transform2D currentTransform)?
        keyboardPan,
    TResult? Function(Transform2D currentTransform)? autoCenter,
    TResult? Function()? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Offset delta, Transform2D currentTransform)? pan,
    TResult Function(Offset direction, Transform2D currentTransform)?
        keyboardPan,
    TResult Function(Transform2D currentTransform)? autoCenter,
    TResult Function()? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Pan value) pan,
    required TResult Function(_KeyboardPan value) keyboardPan,
    required TResult Function(_AutoCenter value) autoCenter,
    required TResult Function(_Reset value) reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Pan value)? pan,
    TResult? Function(_KeyboardPan value)? keyboardPan,
    TResult? Function(_AutoCenter value)? autoCenter,
    TResult? Function(_Reset value)? reset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Pan value)? pan,
    TResult Function(_KeyboardPan value)? keyboardPan,
    TResult Function(_AutoCenter value)? autoCenter,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PanEventCopyWith<$Res> {
  factory $PanEventCopyWith(PanEvent value, $Res Function(PanEvent) then) =
      _$PanEventCopyWithImpl<$Res, PanEvent>;
}

/// @nodoc
class _$PanEventCopyWithImpl<$Res, $Val extends PanEvent>
    implements $PanEventCopyWith<$Res> {
  _$PanEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PanEvent
  /// with the given fields replaced by the non-null parameter values.
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
    extends _$PanEventCopyWithImpl<$Res, _$PanImpl>
    implements _$$PanImplCopyWith<$Res> {
  __$$PanImplCopyWithImpl(_$PanImpl _value, $Res Function(_$PanImpl) _then)
      : super(_value, _then);

  /// Create a copy of PanEvent
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

  /// Create a copy of PanEvent
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
    return 'PanEvent.pan(delta: $delta, currentTransform: $currentTransform)';
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

  /// Create a copy of PanEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PanImplCopyWith<_$PanImpl> get copyWith =>
      __$$PanImplCopyWithImpl<_$PanImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Offset delta, Transform2D currentTransform) pan,
    required TResult Function(Offset direction, Transform2D currentTransform)
        keyboardPan,
    required TResult Function(Transform2D currentTransform) autoCenter,
    required TResult Function() reset,
  }) {
    return pan(delta, currentTransform);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Offset delta, Transform2D currentTransform)? pan,
    TResult? Function(Offset direction, Transform2D currentTransform)?
        keyboardPan,
    TResult? Function(Transform2D currentTransform)? autoCenter,
    TResult? Function()? reset,
  }) {
    return pan?.call(delta, currentTransform);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Offset delta, Transform2D currentTransform)? pan,
    TResult Function(Offset direction, Transform2D currentTransform)?
        keyboardPan,
    TResult Function(Transform2D currentTransform)? autoCenter,
    TResult Function()? reset,
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
    required TResult Function(_Pan value) pan,
    required TResult Function(_KeyboardPan value) keyboardPan,
    required TResult Function(_AutoCenter value) autoCenter,
    required TResult Function(_Reset value) reset,
  }) {
    return pan(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Pan value)? pan,
    TResult? Function(_KeyboardPan value)? keyboardPan,
    TResult? Function(_AutoCenter value)? autoCenter,
    TResult? Function(_Reset value)? reset,
  }) {
    return pan?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Pan value)? pan,
    TResult Function(_KeyboardPan value)? keyboardPan,
    TResult Function(_AutoCenter value)? autoCenter,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (pan != null) {
      return pan(this);
    }
    return orElse();
  }
}

abstract class _Pan implements PanEvent {
  const factory _Pan(
      {required final Offset delta,
      required final Transform2D currentTransform}) = _$PanImpl;

  Offset get delta;
  Transform2D get currentTransform;

  /// Create a copy of PanEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PanImplCopyWith<_$PanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$KeyboardPanImplCopyWith<$Res> {
  factory _$$KeyboardPanImplCopyWith(
          _$KeyboardPanImpl value, $Res Function(_$KeyboardPanImpl) then) =
      __$$KeyboardPanImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Offset direction, Transform2D currentTransform});

  $Transform2DCopyWith<$Res> get currentTransform;
}

/// @nodoc
class __$$KeyboardPanImplCopyWithImpl<$Res>
    extends _$PanEventCopyWithImpl<$Res, _$KeyboardPanImpl>
    implements _$$KeyboardPanImplCopyWith<$Res> {
  __$$KeyboardPanImplCopyWithImpl(
      _$KeyboardPanImpl _value, $Res Function(_$KeyboardPanImpl) _then)
      : super(_value, _then);

  /// Create a copy of PanEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? direction = null,
    Object? currentTransform = null,
  }) {
    return _then(_$KeyboardPanImpl(
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as Offset,
      currentTransform: null == currentTransform
          ? _value.currentTransform
          : currentTransform // ignore: cast_nullable_to_non_nullable
              as Transform2D,
    ));
  }

  /// Create a copy of PanEvent
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

class _$KeyboardPanImpl implements _KeyboardPan {
  const _$KeyboardPanImpl(
      {required this.direction, required this.currentTransform});

  @override
  final Offset direction;
  @override
  final Transform2D currentTransform;

  @override
  String toString() {
    return 'PanEvent.keyboardPan(direction: $direction, currentTransform: $currentTransform)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KeyboardPanImpl &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.currentTransform, currentTransform) ||
                other.currentTransform == currentTransform));
  }

  @override
  int get hashCode => Object.hash(runtimeType, direction, currentTransform);

  /// Create a copy of PanEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$KeyboardPanImplCopyWith<_$KeyboardPanImpl> get copyWith =>
      __$$KeyboardPanImplCopyWithImpl<_$KeyboardPanImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Offset delta, Transform2D currentTransform) pan,
    required TResult Function(Offset direction, Transform2D currentTransform)
        keyboardPan,
    required TResult Function(Transform2D currentTransform) autoCenter,
    required TResult Function() reset,
  }) {
    return keyboardPan(direction, currentTransform);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Offset delta, Transform2D currentTransform)? pan,
    TResult? Function(Offset direction, Transform2D currentTransform)?
        keyboardPan,
    TResult? Function(Transform2D currentTransform)? autoCenter,
    TResult? Function()? reset,
  }) {
    return keyboardPan?.call(direction, currentTransform);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Offset delta, Transform2D currentTransform)? pan,
    TResult Function(Offset direction, Transform2D currentTransform)?
        keyboardPan,
    TResult Function(Transform2D currentTransform)? autoCenter,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (keyboardPan != null) {
      return keyboardPan(direction, currentTransform);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Pan value) pan,
    required TResult Function(_KeyboardPan value) keyboardPan,
    required TResult Function(_AutoCenter value) autoCenter,
    required TResult Function(_Reset value) reset,
  }) {
    return keyboardPan(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Pan value)? pan,
    TResult? Function(_KeyboardPan value)? keyboardPan,
    TResult? Function(_AutoCenter value)? autoCenter,
    TResult? Function(_Reset value)? reset,
  }) {
    return keyboardPan?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Pan value)? pan,
    TResult Function(_KeyboardPan value)? keyboardPan,
    TResult Function(_AutoCenter value)? autoCenter,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (keyboardPan != null) {
      return keyboardPan(this);
    }
    return orElse();
  }
}

abstract class _KeyboardPan implements PanEvent {
  const factory _KeyboardPan(
      {required final Offset direction,
      required final Transform2D currentTransform}) = _$KeyboardPanImpl;

  Offset get direction;
  Transform2D get currentTransform;

  /// Create a copy of PanEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$KeyboardPanImplCopyWith<_$KeyboardPanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AutoCenterImplCopyWith<$Res> {
  factory _$$AutoCenterImplCopyWith(
          _$AutoCenterImpl value, $Res Function(_$AutoCenterImpl) then) =
      __$$AutoCenterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Transform2D currentTransform});

  $Transform2DCopyWith<$Res> get currentTransform;
}

/// @nodoc
class __$$AutoCenterImplCopyWithImpl<$Res>
    extends _$PanEventCopyWithImpl<$Res, _$AutoCenterImpl>
    implements _$$AutoCenterImplCopyWith<$Res> {
  __$$AutoCenterImplCopyWithImpl(
      _$AutoCenterImpl _value, $Res Function(_$AutoCenterImpl) _then)
      : super(_value, _then);

  /// Create a copy of PanEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTransform = null,
  }) {
    return _then(_$AutoCenterImpl(
      currentTransform: null == currentTransform
          ? _value.currentTransform
          : currentTransform // ignore: cast_nullable_to_non_nullable
              as Transform2D,
    ));
  }

  /// Create a copy of PanEvent
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

class _$AutoCenterImpl implements _AutoCenter {
  const _$AutoCenterImpl({required this.currentTransform});

  @override
  final Transform2D currentTransform;

  @override
  String toString() {
    return 'PanEvent.autoCenter(currentTransform: $currentTransform)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AutoCenterImpl &&
            (identical(other.currentTransform, currentTransform) ||
                other.currentTransform == currentTransform));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentTransform);

  /// Create a copy of PanEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AutoCenterImplCopyWith<_$AutoCenterImpl> get copyWith =>
      __$$AutoCenterImplCopyWithImpl<_$AutoCenterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Offset delta, Transform2D currentTransform) pan,
    required TResult Function(Offset direction, Transform2D currentTransform)
        keyboardPan,
    required TResult Function(Transform2D currentTransform) autoCenter,
    required TResult Function() reset,
  }) {
    return autoCenter(currentTransform);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Offset delta, Transform2D currentTransform)? pan,
    TResult? Function(Offset direction, Transform2D currentTransform)?
        keyboardPan,
    TResult? Function(Transform2D currentTransform)? autoCenter,
    TResult? Function()? reset,
  }) {
    return autoCenter?.call(currentTransform);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Offset delta, Transform2D currentTransform)? pan,
    TResult Function(Offset direction, Transform2D currentTransform)?
        keyboardPan,
    TResult Function(Transform2D currentTransform)? autoCenter,
    TResult Function()? reset,
    required TResult orElse(),
  }) {
    if (autoCenter != null) {
      return autoCenter(currentTransform);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Pan value) pan,
    required TResult Function(_KeyboardPan value) keyboardPan,
    required TResult Function(_AutoCenter value) autoCenter,
    required TResult Function(_Reset value) reset,
  }) {
    return autoCenter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Pan value)? pan,
    TResult? Function(_KeyboardPan value)? keyboardPan,
    TResult? Function(_AutoCenter value)? autoCenter,
    TResult? Function(_Reset value)? reset,
  }) {
    return autoCenter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Pan value)? pan,
    TResult Function(_KeyboardPan value)? keyboardPan,
    TResult Function(_AutoCenter value)? autoCenter,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (autoCenter != null) {
      return autoCenter(this);
    }
    return orElse();
  }
}

abstract class _AutoCenter implements PanEvent {
  const factory _AutoCenter({required final Transform2D currentTransform}) =
      _$AutoCenterImpl;

  Transform2D get currentTransform;

  /// Create a copy of PanEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AutoCenterImplCopyWith<_$AutoCenterImpl> get copyWith =>
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
    extends _$PanEventCopyWithImpl<$Res, _$ResetImpl>
    implements _$$ResetImplCopyWith<$Res> {
  __$$ResetImplCopyWithImpl(
      _$ResetImpl _value, $Res Function(_$ResetImpl) _then)
      : super(_value, _then);

  /// Create a copy of PanEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetImpl implements _Reset {
  const _$ResetImpl();

  @override
  String toString() {
    return 'PanEvent.reset()';
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
    required TResult Function(Offset delta, Transform2D currentTransform) pan,
    required TResult Function(Offset direction, Transform2D currentTransform)
        keyboardPan,
    required TResult Function(Transform2D currentTransform) autoCenter,
    required TResult Function() reset,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Offset delta, Transform2D currentTransform)? pan,
    TResult? Function(Offset direction, Transform2D currentTransform)?
        keyboardPan,
    TResult? Function(Transform2D currentTransform)? autoCenter,
    TResult? Function()? reset,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Offset delta, Transform2D currentTransform)? pan,
    TResult Function(Offset direction, Transform2D currentTransform)?
        keyboardPan,
    TResult Function(Transform2D currentTransform)? autoCenter,
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
    required TResult Function(_Pan value) pan,
    required TResult Function(_KeyboardPan value) keyboardPan,
    required TResult Function(_AutoCenter value) autoCenter,
    required TResult Function(_Reset value) reset,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Pan value)? pan,
    TResult? Function(_KeyboardPan value)? keyboardPan,
    TResult? Function(_AutoCenter value)? autoCenter,
    TResult? Function(_Reset value)? reset,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Pan value)? pan,
    TResult Function(_KeyboardPan value)? keyboardPan,
    TResult Function(_AutoCenter value)? autoCenter,
    TResult Function(_Reset value)? reset,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class _Reset implements PanEvent {
  const factory _Reset() = _$ResetImpl;
}
