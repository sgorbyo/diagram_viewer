// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) startMoving,
    required TResult Function(Vector4 delta) continueMoving,
    required TResult Function() endMoving,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? startMoving,
    TResult? Function(Vector4 delta)? continueMoving,
    TResult? Function()? endMoving,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? startMoving,
    TResult Function(Vector4 delta)? continueMoving,
    TResult Function()? endMoving,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainEventStartMoving value) startMoving,
    required TResult Function(_MainEventContinueMoving value) continueMoving,
    required TResult Function(_MainEventEndMoving value) endMoving,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MainEventStartMoving value)? startMoving,
    TResult? Function(_MainEventContinueMoving value)? continueMoving,
    TResult? Function(_MainEventEndMoving value)? endMoving,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainEventStartMoving value)? startMoving,
    TResult Function(_MainEventContinueMoving value)? continueMoving,
    TResult Function(_MainEventEndMoving value)? endMoving,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainEventCopyWith<$Res> {
  factory $MainEventCopyWith(MainEvent value, $Res Function(MainEvent) then) =
      _$MainEventCopyWithImpl<$Res, MainEvent>;
}

/// @nodoc
class _$MainEventCopyWithImpl<$Res, $Val extends MainEvent>
    implements $MainEventCopyWith<$Res> {
  _$MainEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_MainEventStartMovingCopyWith<$Res> {
  factory _$$_MainEventStartMovingCopyWith(_$_MainEventStartMoving value,
          $Res Function(_$_MainEventStartMoving) then) =
      __$$_MainEventStartMovingCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$_MainEventStartMovingCopyWithImpl<$Res>
    extends _$MainEventCopyWithImpl<$Res, _$_MainEventStartMoving>
    implements _$$_MainEventStartMovingCopyWith<$Res> {
  __$$_MainEventStartMovingCopyWithImpl(_$_MainEventStartMoving _value,
      $Res Function(_$_MainEventStartMoving) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_MainEventStartMoving(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MainEventStartMoving implements _MainEventStartMoving {
  const _$_MainEventStartMoving({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'MainEvent.startMoving(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MainEventStartMoving &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MainEventStartMovingCopyWith<_$_MainEventStartMoving> get copyWith =>
      __$$_MainEventStartMovingCopyWithImpl<_$_MainEventStartMoving>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) startMoving,
    required TResult Function(Vector4 delta) continueMoving,
    required TResult Function() endMoving,
  }) {
    return startMoving(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? startMoving,
    TResult? Function(Vector4 delta)? continueMoving,
    TResult? Function()? endMoving,
  }) {
    return startMoving?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? startMoving,
    TResult Function(Vector4 delta)? continueMoving,
    TResult Function()? endMoving,
    required TResult orElse(),
  }) {
    if (startMoving != null) {
      return startMoving(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainEventStartMoving value) startMoving,
    required TResult Function(_MainEventContinueMoving value) continueMoving,
    required TResult Function(_MainEventEndMoving value) endMoving,
  }) {
    return startMoving(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MainEventStartMoving value)? startMoving,
    TResult? Function(_MainEventContinueMoving value)? continueMoving,
    TResult? Function(_MainEventEndMoving value)? endMoving,
  }) {
    return startMoving?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainEventStartMoving value)? startMoving,
    TResult Function(_MainEventContinueMoving value)? continueMoving,
    TResult Function(_MainEventEndMoving value)? endMoving,
    required TResult orElse(),
  }) {
    if (startMoving != null) {
      return startMoving(this);
    }
    return orElse();
  }
}

abstract class _MainEventStartMoving implements MainEvent {
  const factory _MainEventStartMoving({required final String id}) =
      _$_MainEventStartMoving;

  String get id;
  @JsonKey(ignore: true)
  _$$_MainEventStartMovingCopyWith<_$_MainEventStartMoving> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_MainEventContinueMovingCopyWith<$Res> {
  factory _$$_MainEventContinueMovingCopyWith(_$_MainEventContinueMoving value,
          $Res Function(_$_MainEventContinueMoving) then) =
      __$$_MainEventContinueMovingCopyWithImpl<$Res>;
  @useResult
  $Res call({Vector4 delta});
}

/// @nodoc
class __$$_MainEventContinueMovingCopyWithImpl<$Res>
    extends _$MainEventCopyWithImpl<$Res, _$_MainEventContinueMoving>
    implements _$$_MainEventContinueMovingCopyWith<$Res> {
  __$$_MainEventContinueMovingCopyWithImpl(_$_MainEventContinueMoving _value,
      $Res Function(_$_MainEventContinueMoving) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? delta = null,
  }) {
    return _then(_$_MainEventContinueMoving(
      delta: null == delta
          ? _value.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as Vector4,
    ));
  }
}

/// @nodoc

class _$_MainEventContinueMoving implements _MainEventContinueMoving {
  const _$_MainEventContinueMoving({required this.delta});

  @override
  final Vector4 delta;

  @override
  String toString() {
    return 'MainEvent.continueMoving(delta: $delta)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MainEventContinueMoving &&
            (identical(other.delta, delta) || other.delta == delta));
  }

  @override
  int get hashCode => Object.hash(runtimeType, delta);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MainEventContinueMovingCopyWith<_$_MainEventContinueMoving>
      get copyWith =>
          __$$_MainEventContinueMovingCopyWithImpl<_$_MainEventContinueMoving>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) startMoving,
    required TResult Function(Vector4 delta) continueMoving,
    required TResult Function() endMoving,
  }) {
    return continueMoving(delta);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? startMoving,
    TResult? Function(Vector4 delta)? continueMoving,
    TResult? Function()? endMoving,
  }) {
    return continueMoving?.call(delta);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? startMoving,
    TResult Function(Vector4 delta)? continueMoving,
    TResult Function()? endMoving,
    required TResult orElse(),
  }) {
    if (continueMoving != null) {
      return continueMoving(delta);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainEventStartMoving value) startMoving,
    required TResult Function(_MainEventContinueMoving value) continueMoving,
    required TResult Function(_MainEventEndMoving value) endMoving,
  }) {
    return continueMoving(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MainEventStartMoving value)? startMoving,
    TResult? Function(_MainEventContinueMoving value)? continueMoving,
    TResult? Function(_MainEventEndMoving value)? endMoving,
  }) {
    return continueMoving?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainEventStartMoving value)? startMoving,
    TResult Function(_MainEventContinueMoving value)? continueMoving,
    TResult Function(_MainEventEndMoving value)? endMoving,
    required TResult orElse(),
  }) {
    if (continueMoving != null) {
      return continueMoving(this);
    }
    return orElse();
  }
}

abstract class _MainEventContinueMoving implements MainEvent {
  const factory _MainEventContinueMoving({required final Vector4 delta}) =
      _$_MainEventContinueMoving;

  Vector4 get delta;
  @JsonKey(ignore: true)
  _$$_MainEventContinueMovingCopyWith<_$_MainEventContinueMoving>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_MainEventEndMovingCopyWith<$Res> {
  factory _$$_MainEventEndMovingCopyWith(_$_MainEventEndMoving value,
          $Res Function(_$_MainEventEndMoving) then) =
      __$$_MainEventEndMovingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_MainEventEndMovingCopyWithImpl<$Res>
    extends _$MainEventCopyWithImpl<$Res, _$_MainEventEndMoving>
    implements _$$_MainEventEndMovingCopyWith<$Res> {
  __$$_MainEventEndMovingCopyWithImpl(
      _$_MainEventEndMoving _value, $Res Function(_$_MainEventEndMoving) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_MainEventEndMoving implements _MainEventEndMoving {
  const _$_MainEventEndMoving();

  @override
  String toString() {
    return 'MainEvent.endMoving()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_MainEventEndMoving);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) startMoving,
    required TResult Function(Vector4 delta) continueMoving,
    required TResult Function() endMoving,
  }) {
    return endMoving();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? startMoving,
    TResult? Function(Vector4 delta)? continueMoving,
    TResult? Function()? endMoving,
  }) {
    return endMoving?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? startMoving,
    TResult Function(Vector4 delta)? continueMoving,
    TResult Function()? endMoving,
    required TResult orElse(),
  }) {
    if (endMoving != null) {
      return endMoving();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainEventStartMoving value) startMoving,
    required TResult Function(_MainEventContinueMoving value) continueMoving,
    required TResult Function(_MainEventEndMoving value) endMoving,
  }) {
    return endMoving(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MainEventStartMoving value)? startMoving,
    TResult? Function(_MainEventContinueMoving value)? continueMoving,
    TResult? Function(_MainEventEndMoving value)? endMoving,
  }) {
    return endMoving?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainEventStartMoving value)? startMoving,
    TResult Function(_MainEventContinueMoving value)? continueMoving,
    TResult Function(_MainEventEndMoving value)? endMoving,
    required TResult orElse(),
  }) {
    if (endMoving != null) {
      return endMoving(this);
    }
    return orElse();
  }
}

abstract class _MainEventEndMoving implements MainEvent {
  const factory _MainEventEndMoving() = _$_MainEventEndMoving;
}

/// @nodoc
mixin _$MainState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String id) moving,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(String id)? moving,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String id)? moving,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainIdle value) idle,
    required TResult Function(_MainMoving value) moving,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MainIdle value)? idle,
    TResult? Function(_MainMoving value)? moving,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainIdle value)? idle,
    TResult Function(_MainMoving value)? moving,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainStateCopyWith<$Res> {
  factory $MainStateCopyWith(MainState value, $Res Function(MainState) then) =
      _$MainStateCopyWithImpl<$Res, MainState>;
}

/// @nodoc
class _$MainStateCopyWithImpl<$Res, $Val extends MainState>
    implements $MainStateCopyWith<$Res> {
  _$MainStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_MainIdleCopyWith<$Res> {
  factory _$$_MainIdleCopyWith(
          _$_MainIdle value, $Res Function(_$_MainIdle) then) =
      __$$_MainIdleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_MainIdleCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$_MainIdle>
    implements _$$_MainIdleCopyWith<$Res> {
  __$$_MainIdleCopyWithImpl(
      _$_MainIdle _value, $Res Function(_$_MainIdle) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_MainIdle implements _MainIdle {
  const _$_MainIdle();

  @override
  String toString() {
    return 'MainState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_MainIdle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String id) moving,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(String id)? moving,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String id)? moving,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainIdle value) idle,
    required TResult Function(_MainMoving value) moving,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MainIdle value)? idle,
    TResult? Function(_MainMoving value)? moving,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainIdle value)? idle,
    TResult Function(_MainMoving value)? moving,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _MainIdle implements MainState {
  const factory _MainIdle() = _$_MainIdle;
}

/// @nodoc
abstract class _$$_MainMovingCopyWith<$Res> {
  factory _$$_MainMovingCopyWith(
          _$_MainMoving value, $Res Function(_$_MainMoving) then) =
      __$$_MainMovingCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$_MainMovingCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$_MainMoving>
    implements _$$_MainMovingCopyWith<$Res> {
  __$$_MainMovingCopyWithImpl(
      _$_MainMoving _value, $Res Function(_$_MainMoving) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_MainMoving(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MainMoving implements _MainMoving {
  const _$_MainMoving({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'MainState.moving(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MainMoving &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MainMovingCopyWith<_$_MainMoving> get copyWith =>
      __$$_MainMovingCopyWithImpl<_$_MainMoving>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(String id) moving,
  }) {
    return moving(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(String id)? moving,
  }) {
    return moving?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(String id)? moving,
    required TResult orElse(),
  }) {
    if (moving != null) {
      return moving(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MainIdle value) idle,
    required TResult Function(_MainMoving value) moving,
  }) {
    return moving(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MainIdle value)? idle,
    TResult? Function(_MainMoving value)? moving,
  }) {
    return moving?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MainIdle value)? idle,
    TResult Function(_MainMoving value)? moving,
    required TResult orElse(),
  }) {
    if (moving != null) {
      return moving(this);
    }
    return orElse();
  }
}

abstract class _MainMoving implements MainState {
  const factory _MainMoving({required final String id}) = _$_MainMoving;

  String get id;
  @JsonKey(ignore: true)
  _$$_MainMovingCopyWith<_$_MainMoving> get copyWith =>
      throw _privateConstructorUsedError;
}
