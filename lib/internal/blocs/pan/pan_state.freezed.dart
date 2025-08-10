// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pan_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PanState {
  Offset get translation => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Offset translation) initial,
    required TResult Function(Offset translation, Offset delta) panning,
    required TResult Function(Offset translation, Offset targetTranslation)
        autoCentering,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Offset translation)? initial,
    TResult? Function(Offset translation, Offset delta)? panning,
    TResult? Function(Offset translation, Offset targetTranslation)?
        autoCentering,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Offset translation)? initial,
    TResult Function(Offset translation, Offset delta)? panning,
    TResult Function(Offset translation, Offset targetTranslation)?
        autoCentering,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Panning value) panning,
    required TResult Function(_AutoCentering value) autoCentering,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Panning value)? panning,
    TResult? Function(_AutoCentering value)? autoCentering,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Panning value)? panning,
    TResult Function(_AutoCentering value)? autoCentering,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of PanState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PanStateCopyWith<PanState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PanStateCopyWith<$Res> {
  factory $PanStateCopyWith(PanState value, $Res Function(PanState) then) =
      _$PanStateCopyWithImpl<$Res, PanState>;
  @useResult
  $Res call({Offset translation});
}

/// @nodoc
class _$PanStateCopyWithImpl<$Res, $Val extends PanState>
    implements $PanStateCopyWith<$Res> {
  _$PanStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PanState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? translation = null,
  }) {
    return _then(_value.copyWith(
      translation: null == translation
          ? _value.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as Offset,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> implements $PanStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Offset translation});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PanStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of PanState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? translation = null,
  }) {
    return _then(_$InitialImpl(
      translation: null == translation
          ? _value.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as Offset,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl({this.translation = Offset.zero});

  @override
  @JsonKey()
  final Offset translation;

  @override
  String toString() {
    return 'PanState.initial(translation: $translation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.translation, translation) ||
                other.translation == translation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, translation);

  /// Create a copy of PanState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Offset translation) initial,
    required TResult Function(Offset translation, Offset delta) panning,
    required TResult Function(Offset translation, Offset targetTranslation)
        autoCentering,
  }) {
    return initial(translation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Offset translation)? initial,
    TResult? Function(Offset translation, Offset delta)? panning,
    TResult? Function(Offset translation, Offset targetTranslation)?
        autoCentering,
  }) {
    return initial?.call(translation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Offset translation)? initial,
    TResult Function(Offset translation, Offset delta)? panning,
    TResult Function(Offset translation, Offset targetTranslation)?
        autoCentering,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(translation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Panning value) panning,
    required TResult Function(_AutoCentering value) autoCentering,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Panning value)? panning,
    TResult? Function(_AutoCentering value)? autoCentering,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Panning value)? panning,
    TResult Function(_AutoCentering value)? autoCentering,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PanState {
  const factory _Initial({final Offset translation}) = _$InitialImpl;

  @override
  Offset get translation;

  /// Create a copy of PanState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PanningImplCopyWith<$Res> implements $PanStateCopyWith<$Res> {
  factory _$$PanningImplCopyWith(
          _$PanningImpl value, $Res Function(_$PanningImpl) then) =
      __$$PanningImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Offset translation, Offset delta});
}

/// @nodoc
class __$$PanningImplCopyWithImpl<$Res>
    extends _$PanStateCopyWithImpl<$Res, _$PanningImpl>
    implements _$$PanningImplCopyWith<$Res> {
  __$$PanningImplCopyWithImpl(
      _$PanningImpl _value, $Res Function(_$PanningImpl) _then)
      : super(_value, _then);

  /// Create a copy of PanState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? translation = null,
    Object? delta = null,
  }) {
    return _then(_$PanningImpl(
      translation: null == translation
          ? _value.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as Offset,
      delta: null == delta
          ? _value.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as Offset,
    ));
  }
}

/// @nodoc

class _$PanningImpl implements _Panning {
  const _$PanningImpl({required this.translation, required this.delta});

  @override
  final Offset translation;
  @override
  final Offset delta;

  @override
  String toString() {
    return 'PanState.panning(translation: $translation, delta: $delta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PanningImpl &&
            (identical(other.translation, translation) ||
                other.translation == translation) &&
            (identical(other.delta, delta) || other.delta == delta));
  }

  @override
  int get hashCode => Object.hash(runtimeType, translation, delta);

  /// Create a copy of PanState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PanningImplCopyWith<_$PanningImpl> get copyWith =>
      __$$PanningImplCopyWithImpl<_$PanningImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Offset translation) initial,
    required TResult Function(Offset translation, Offset delta) panning,
    required TResult Function(Offset translation, Offset targetTranslation)
        autoCentering,
  }) {
    return panning(translation, delta);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Offset translation)? initial,
    TResult? Function(Offset translation, Offset delta)? panning,
    TResult? Function(Offset translation, Offset targetTranslation)?
        autoCentering,
  }) {
    return panning?.call(translation, delta);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Offset translation)? initial,
    TResult Function(Offset translation, Offset delta)? panning,
    TResult Function(Offset translation, Offset targetTranslation)?
        autoCentering,
    required TResult orElse(),
  }) {
    if (panning != null) {
      return panning(translation, delta);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Panning value) panning,
    required TResult Function(_AutoCentering value) autoCentering,
  }) {
    return panning(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Panning value)? panning,
    TResult? Function(_AutoCentering value)? autoCentering,
  }) {
    return panning?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Panning value)? panning,
    TResult Function(_AutoCentering value)? autoCentering,
    required TResult orElse(),
  }) {
    if (panning != null) {
      return panning(this);
    }
    return orElse();
  }
}

abstract class _Panning implements PanState {
  const factory _Panning(
      {required final Offset translation,
      required final Offset delta}) = _$PanningImpl;

  @override
  Offset get translation;
  Offset get delta;

  /// Create a copy of PanState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PanningImplCopyWith<_$PanningImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AutoCenteringImplCopyWith<$Res>
    implements $PanStateCopyWith<$Res> {
  factory _$$AutoCenteringImplCopyWith(
          _$AutoCenteringImpl value, $Res Function(_$AutoCenteringImpl) then) =
      __$$AutoCenteringImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Offset translation, Offset targetTranslation});
}

/// @nodoc
class __$$AutoCenteringImplCopyWithImpl<$Res>
    extends _$PanStateCopyWithImpl<$Res, _$AutoCenteringImpl>
    implements _$$AutoCenteringImplCopyWith<$Res> {
  __$$AutoCenteringImplCopyWithImpl(
      _$AutoCenteringImpl _value, $Res Function(_$AutoCenteringImpl) _then)
      : super(_value, _then);

  /// Create a copy of PanState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? translation = null,
    Object? targetTranslation = null,
  }) {
    return _then(_$AutoCenteringImpl(
      translation: null == translation
          ? _value.translation
          : translation // ignore: cast_nullable_to_non_nullable
              as Offset,
      targetTranslation: null == targetTranslation
          ? _value.targetTranslation
          : targetTranslation // ignore: cast_nullable_to_non_nullable
              as Offset,
    ));
  }
}

/// @nodoc

class _$AutoCenteringImpl implements _AutoCentering {
  const _$AutoCenteringImpl(
      {required this.translation, required this.targetTranslation});

  @override
  final Offset translation;
  @override
  final Offset targetTranslation;

  @override
  String toString() {
    return 'PanState.autoCentering(translation: $translation, targetTranslation: $targetTranslation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AutoCenteringImpl &&
            (identical(other.translation, translation) ||
                other.translation == translation) &&
            (identical(other.targetTranslation, targetTranslation) ||
                other.targetTranslation == targetTranslation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, translation, targetTranslation);

  /// Create a copy of PanState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AutoCenteringImplCopyWith<_$AutoCenteringImpl> get copyWith =>
      __$$AutoCenteringImplCopyWithImpl<_$AutoCenteringImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Offset translation) initial,
    required TResult Function(Offset translation, Offset delta) panning,
    required TResult Function(Offset translation, Offset targetTranslation)
        autoCentering,
  }) {
    return autoCentering(translation, targetTranslation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Offset translation)? initial,
    TResult? Function(Offset translation, Offset delta)? panning,
    TResult? Function(Offset translation, Offset targetTranslation)?
        autoCentering,
  }) {
    return autoCentering?.call(translation, targetTranslation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Offset translation)? initial,
    TResult Function(Offset translation, Offset delta)? panning,
    TResult Function(Offset translation, Offset targetTranslation)?
        autoCentering,
    required TResult orElse(),
  }) {
    if (autoCentering != null) {
      return autoCentering(translation, targetTranslation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Panning value) panning,
    required TResult Function(_AutoCentering value) autoCentering,
  }) {
    return autoCentering(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Panning value)? panning,
    TResult? Function(_AutoCentering value)? autoCentering,
  }) {
    return autoCentering?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Panning value)? panning,
    TResult Function(_AutoCentering value)? autoCentering,
    required TResult orElse(),
  }) {
    if (autoCentering != null) {
      return autoCentering(this);
    }
    return orElse();
  }
}

abstract class _AutoCentering implements PanState {
  const factory _AutoCentering(
      {required final Offset translation,
      required final Offset targetTranslation}) = _$AutoCenteringImpl;

  @override
  Offset get translation;
  Offset get targetTranslation;

  /// Create a copy of PanState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AutoCenteringImplCopyWith<_$AutoCenteringImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
