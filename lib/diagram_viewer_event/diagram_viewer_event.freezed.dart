// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diagram_viewer_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DiagramViewerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Vector4 coordinates, Map<String, dynamic> piggyback)
        startDrag,
    required TResult Function(
            Vector4 coordinates, Vector4 delta, Map<String, dynamic>? piggyback)
        continueDrag,
    required TResult Function() endDrag,
    required TResult Function(
            Vector4 coordinates, Map<String, dynamic>? piggyback)
        doubleTap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Vector4 coordinates, Map<String, dynamic> piggyback)?
        startDrag,
    TResult? Function(Vector4 coordinates, Vector4 delta,
            Map<String, dynamic>? piggyback)?
        continueDrag,
    TResult? Function()? endDrag,
    TResult? Function(Vector4 coordinates, Map<String, dynamic>? piggyback)?
        doubleTap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Vector4 coordinates, Map<String, dynamic> piggyback)?
        startDrag,
    TResult Function(Vector4 coordinates, Vector4 delta,
            Map<String, dynamic>? piggyback)?
        continueDrag,
    TResult Function()? endDrag,
    TResult Function(Vector4 coordinates, Map<String, dynamic>? piggyback)?
        doubleTap,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartDrag value) startDrag,
    required TResult Function(_ContinueDrag value) continueDrag,
    required TResult Function(_EndDrag value) endDrag,
    required TResult Function(_DoubleTap value) doubleTap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartDrag value)? startDrag,
    TResult? Function(_ContinueDrag value)? continueDrag,
    TResult? Function(_EndDrag value)? endDrag,
    TResult? Function(_DoubleTap value)? doubleTap,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartDrag value)? startDrag,
    TResult Function(_ContinueDrag value)? continueDrag,
    TResult Function(_EndDrag value)? endDrag,
    TResult Function(_DoubleTap value)? doubleTap,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagramViewerEventCopyWith<$Res> {
  factory $DiagramViewerEventCopyWith(
          DiagramViewerEvent value, $Res Function(DiagramViewerEvent) then) =
      _$DiagramViewerEventCopyWithImpl<$Res, DiagramViewerEvent>;
}

/// @nodoc
class _$DiagramViewerEventCopyWithImpl<$Res, $Val extends DiagramViewerEvent>
    implements $DiagramViewerEventCopyWith<$Res> {
  _$DiagramViewerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_StartDragCopyWith<$Res> {
  factory _$$_StartDragCopyWith(
          _$_StartDrag value, $Res Function(_$_StartDrag) then) =
      __$$_StartDragCopyWithImpl<$Res>;
  @useResult
  $Res call({Vector4 coordinates, Map<String, dynamic> piggyback});
}

/// @nodoc
class __$$_StartDragCopyWithImpl<$Res>
    extends _$DiagramViewerEventCopyWithImpl<$Res, _$_StartDrag>
    implements _$$_StartDragCopyWith<$Res> {
  __$$_StartDragCopyWithImpl(
      _$_StartDrag _value, $Res Function(_$_StartDrag) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coordinates = null,
    Object? piggyback = null,
  }) {
    return _then(_$_StartDrag(
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as Vector4,
      piggyback: null == piggyback
          ? _value._piggyback
          : piggyback // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$_StartDrag implements _StartDrag {
  const _$_StartDrag(
      {required this.coordinates,
      required final Map<String, dynamic> piggyback})
      : _piggyback = piggyback;

  @override
  final Vector4 coordinates;
  final Map<String, dynamic> _piggyback;
  @override
  Map<String, dynamic> get piggyback {
    if (_piggyback is EqualUnmodifiableMapView) return _piggyback;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_piggyback);
  }

  @override
  String toString() {
    return 'DiagramViewerEvent.startDrag(coordinates: $coordinates, piggyback: $piggyback)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StartDrag &&
            (identical(other.coordinates, coordinates) ||
                other.coordinates == coordinates) &&
            const DeepCollectionEquality()
                .equals(other._piggyback, _piggyback));
  }

  @override
  int get hashCode => Object.hash(runtimeType, coordinates,
      const DeepCollectionEquality().hash(_piggyback));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StartDragCopyWith<_$_StartDrag> get copyWith =>
      __$$_StartDragCopyWithImpl<_$_StartDrag>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Vector4 coordinates, Map<String, dynamic> piggyback)
        startDrag,
    required TResult Function(
            Vector4 coordinates, Vector4 delta, Map<String, dynamic>? piggyback)
        continueDrag,
    required TResult Function() endDrag,
    required TResult Function(
            Vector4 coordinates, Map<String, dynamic>? piggyback)
        doubleTap,
  }) {
    return startDrag(coordinates, piggyback);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Vector4 coordinates, Map<String, dynamic> piggyback)?
        startDrag,
    TResult? Function(Vector4 coordinates, Vector4 delta,
            Map<String, dynamic>? piggyback)?
        continueDrag,
    TResult? Function()? endDrag,
    TResult? Function(Vector4 coordinates, Map<String, dynamic>? piggyback)?
        doubleTap,
  }) {
    return startDrag?.call(coordinates, piggyback);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Vector4 coordinates, Map<String, dynamic> piggyback)?
        startDrag,
    TResult Function(Vector4 coordinates, Vector4 delta,
            Map<String, dynamic>? piggyback)?
        continueDrag,
    TResult Function()? endDrag,
    TResult Function(Vector4 coordinates, Map<String, dynamic>? piggyback)?
        doubleTap,
    required TResult orElse(),
  }) {
    if (startDrag != null) {
      return startDrag(coordinates, piggyback);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartDrag value) startDrag,
    required TResult Function(_ContinueDrag value) continueDrag,
    required TResult Function(_EndDrag value) endDrag,
    required TResult Function(_DoubleTap value) doubleTap,
  }) {
    return startDrag(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartDrag value)? startDrag,
    TResult? Function(_ContinueDrag value)? continueDrag,
    TResult? Function(_EndDrag value)? endDrag,
    TResult? Function(_DoubleTap value)? doubleTap,
  }) {
    return startDrag?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartDrag value)? startDrag,
    TResult Function(_ContinueDrag value)? continueDrag,
    TResult Function(_EndDrag value)? endDrag,
    TResult Function(_DoubleTap value)? doubleTap,
    required TResult orElse(),
  }) {
    if (startDrag != null) {
      return startDrag(this);
    }
    return orElse();
  }
}

abstract class _StartDrag implements DiagramViewerEvent {
  const factory _StartDrag(
      {required final Vector4 coordinates,
      required final Map<String, dynamic> piggyback}) = _$_StartDrag;

  Vector4 get coordinates;
  Map<String, dynamic> get piggyback;
  @JsonKey(ignore: true)
  _$$_StartDragCopyWith<_$_StartDrag> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ContinueDragCopyWith<$Res> {
  factory _$$_ContinueDragCopyWith(
          _$_ContinueDrag value, $Res Function(_$_ContinueDrag) then) =
      __$$_ContinueDragCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Vector4 coordinates, Vector4 delta, Map<String, dynamic>? piggyback});
}

/// @nodoc
class __$$_ContinueDragCopyWithImpl<$Res>
    extends _$DiagramViewerEventCopyWithImpl<$Res, _$_ContinueDrag>
    implements _$$_ContinueDragCopyWith<$Res> {
  __$$_ContinueDragCopyWithImpl(
      _$_ContinueDrag _value, $Res Function(_$_ContinueDrag) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coordinates = null,
    Object? delta = null,
    Object? piggyback = freezed,
  }) {
    return _then(_$_ContinueDrag(
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as Vector4,
      delta: null == delta
          ? _value.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as Vector4,
      piggyback: freezed == piggyback
          ? _value._piggyback
          : piggyback // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

class _$_ContinueDrag implements _ContinueDrag {
  const _$_ContinueDrag(
      {required this.coordinates,
      required this.delta,
      required final Map<String, dynamic>? piggyback})
      : _piggyback = piggyback;

  @override
  final Vector4 coordinates;
  @override
  final Vector4 delta;
  final Map<String, dynamic>? _piggyback;
  @override
  Map<String, dynamic>? get piggyback {
    final value = _piggyback;
    if (value == null) return null;
    if (_piggyback is EqualUnmodifiableMapView) return _piggyback;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'DiagramViewerEvent.continueDrag(coordinates: $coordinates, delta: $delta, piggyback: $piggyback)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContinueDrag &&
            (identical(other.coordinates, coordinates) ||
                other.coordinates == coordinates) &&
            (identical(other.delta, delta) || other.delta == delta) &&
            const DeepCollectionEquality()
                .equals(other._piggyback, _piggyback));
  }

  @override
  int get hashCode => Object.hash(runtimeType, coordinates, delta,
      const DeepCollectionEquality().hash(_piggyback));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContinueDragCopyWith<_$_ContinueDrag> get copyWith =>
      __$$_ContinueDragCopyWithImpl<_$_ContinueDrag>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Vector4 coordinates, Map<String, dynamic> piggyback)
        startDrag,
    required TResult Function(
            Vector4 coordinates, Vector4 delta, Map<String, dynamic>? piggyback)
        continueDrag,
    required TResult Function() endDrag,
    required TResult Function(
            Vector4 coordinates, Map<String, dynamic>? piggyback)
        doubleTap,
  }) {
    return continueDrag(coordinates, delta, piggyback);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Vector4 coordinates, Map<String, dynamic> piggyback)?
        startDrag,
    TResult? Function(Vector4 coordinates, Vector4 delta,
            Map<String, dynamic>? piggyback)?
        continueDrag,
    TResult? Function()? endDrag,
    TResult? Function(Vector4 coordinates, Map<String, dynamic>? piggyback)?
        doubleTap,
  }) {
    return continueDrag?.call(coordinates, delta, piggyback);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Vector4 coordinates, Map<String, dynamic> piggyback)?
        startDrag,
    TResult Function(Vector4 coordinates, Vector4 delta,
            Map<String, dynamic>? piggyback)?
        continueDrag,
    TResult Function()? endDrag,
    TResult Function(Vector4 coordinates, Map<String, dynamic>? piggyback)?
        doubleTap,
    required TResult orElse(),
  }) {
    if (continueDrag != null) {
      return continueDrag(coordinates, delta, piggyback);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartDrag value) startDrag,
    required TResult Function(_ContinueDrag value) continueDrag,
    required TResult Function(_EndDrag value) endDrag,
    required TResult Function(_DoubleTap value) doubleTap,
  }) {
    return continueDrag(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartDrag value)? startDrag,
    TResult? Function(_ContinueDrag value)? continueDrag,
    TResult? Function(_EndDrag value)? endDrag,
    TResult? Function(_DoubleTap value)? doubleTap,
  }) {
    return continueDrag?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartDrag value)? startDrag,
    TResult Function(_ContinueDrag value)? continueDrag,
    TResult Function(_EndDrag value)? endDrag,
    TResult Function(_DoubleTap value)? doubleTap,
    required TResult orElse(),
  }) {
    if (continueDrag != null) {
      return continueDrag(this);
    }
    return orElse();
  }
}

abstract class _ContinueDrag implements DiagramViewerEvent {
  const factory _ContinueDrag(
      {required final Vector4 coordinates,
      required final Vector4 delta,
      required final Map<String, dynamic>? piggyback}) = _$_ContinueDrag;

  Vector4 get coordinates;
  Vector4 get delta;
  Map<String, dynamic>? get piggyback;
  @JsonKey(ignore: true)
  _$$_ContinueDragCopyWith<_$_ContinueDrag> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_EndDragCopyWith<$Res> {
  factory _$$_EndDragCopyWith(
          _$_EndDrag value, $Res Function(_$_EndDrag) then) =
      __$$_EndDragCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_EndDragCopyWithImpl<$Res>
    extends _$DiagramViewerEventCopyWithImpl<$Res, _$_EndDrag>
    implements _$$_EndDragCopyWith<$Res> {
  __$$_EndDragCopyWithImpl(_$_EndDrag _value, $Res Function(_$_EndDrag) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_EndDrag implements _EndDrag {
  const _$_EndDrag();

  @override
  String toString() {
    return 'DiagramViewerEvent.endDrag()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_EndDrag);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Vector4 coordinates, Map<String, dynamic> piggyback)
        startDrag,
    required TResult Function(
            Vector4 coordinates, Vector4 delta, Map<String, dynamic>? piggyback)
        continueDrag,
    required TResult Function() endDrag,
    required TResult Function(
            Vector4 coordinates, Map<String, dynamic>? piggyback)
        doubleTap,
  }) {
    return endDrag();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Vector4 coordinates, Map<String, dynamic> piggyback)?
        startDrag,
    TResult? Function(Vector4 coordinates, Vector4 delta,
            Map<String, dynamic>? piggyback)?
        continueDrag,
    TResult? Function()? endDrag,
    TResult? Function(Vector4 coordinates, Map<String, dynamic>? piggyback)?
        doubleTap,
  }) {
    return endDrag?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Vector4 coordinates, Map<String, dynamic> piggyback)?
        startDrag,
    TResult Function(Vector4 coordinates, Vector4 delta,
            Map<String, dynamic>? piggyback)?
        continueDrag,
    TResult Function()? endDrag,
    TResult Function(Vector4 coordinates, Map<String, dynamic>? piggyback)?
        doubleTap,
    required TResult orElse(),
  }) {
    if (endDrag != null) {
      return endDrag();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartDrag value) startDrag,
    required TResult Function(_ContinueDrag value) continueDrag,
    required TResult Function(_EndDrag value) endDrag,
    required TResult Function(_DoubleTap value) doubleTap,
  }) {
    return endDrag(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartDrag value)? startDrag,
    TResult? Function(_ContinueDrag value)? continueDrag,
    TResult? Function(_EndDrag value)? endDrag,
    TResult? Function(_DoubleTap value)? doubleTap,
  }) {
    return endDrag?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartDrag value)? startDrag,
    TResult Function(_ContinueDrag value)? continueDrag,
    TResult Function(_EndDrag value)? endDrag,
    TResult Function(_DoubleTap value)? doubleTap,
    required TResult orElse(),
  }) {
    if (endDrag != null) {
      return endDrag(this);
    }
    return orElse();
  }
}

abstract class _EndDrag implements DiagramViewerEvent {
  const factory _EndDrag() = _$_EndDrag;
}

/// @nodoc
abstract class _$$_DoubleTapCopyWith<$Res> {
  factory _$$_DoubleTapCopyWith(
          _$_DoubleTap value, $Res Function(_$_DoubleTap) then) =
      __$$_DoubleTapCopyWithImpl<$Res>;
  @useResult
  $Res call({Vector4 coordinates, Map<String, dynamic>? piggyback});
}

/// @nodoc
class __$$_DoubleTapCopyWithImpl<$Res>
    extends _$DiagramViewerEventCopyWithImpl<$Res, _$_DoubleTap>
    implements _$$_DoubleTapCopyWith<$Res> {
  __$$_DoubleTapCopyWithImpl(
      _$_DoubleTap _value, $Res Function(_$_DoubleTap) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coordinates = null,
    Object? piggyback = freezed,
  }) {
    return _then(_$_DoubleTap(
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as Vector4,
      piggyback: freezed == piggyback
          ? _value._piggyback
          : piggyback // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

class _$_DoubleTap implements _DoubleTap {
  const _$_DoubleTap(
      {required this.coordinates,
      required final Map<String, dynamic>? piggyback})
      : _piggyback = piggyback;

  @override
  final Vector4 coordinates;
  final Map<String, dynamic>? _piggyback;
  @override
  Map<String, dynamic>? get piggyback {
    final value = _piggyback;
    if (value == null) return null;
    if (_piggyback is EqualUnmodifiableMapView) return _piggyback;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'DiagramViewerEvent.doubleTap(coordinates: $coordinates, piggyback: $piggyback)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DoubleTap &&
            (identical(other.coordinates, coordinates) ||
                other.coordinates == coordinates) &&
            const DeepCollectionEquality()
                .equals(other._piggyback, _piggyback));
  }

  @override
  int get hashCode => Object.hash(runtimeType, coordinates,
      const DeepCollectionEquality().hash(_piggyback));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DoubleTapCopyWith<_$_DoubleTap> get copyWith =>
      __$$_DoubleTapCopyWithImpl<_$_DoubleTap>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Vector4 coordinates, Map<String, dynamic> piggyback)
        startDrag,
    required TResult Function(
            Vector4 coordinates, Vector4 delta, Map<String, dynamic>? piggyback)
        continueDrag,
    required TResult Function() endDrag,
    required TResult Function(
            Vector4 coordinates, Map<String, dynamic>? piggyback)
        doubleTap,
  }) {
    return doubleTap(coordinates, piggyback);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Vector4 coordinates, Map<String, dynamic> piggyback)?
        startDrag,
    TResult? Function(Vector4 coordinates, Vector4 delta,
            Map<String, dynamic>? piggyback)?
        continueDrag,
    TResult? Function()? endDrag,
    TResult? Function(Vector4 coordinates, Map<String, dynamic>? piggyback)?
        doubleTap,
  }) {
    return doubleTap?.call(coordinates, piggyback);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Vector4 coordinates, Map<String, dynamic> piggyback)?
        startDrag,
    TResult Function(Vector4 coordinates, Vector4 delta,
            Map<String, dynamic>? piggyback)?
        continueDrag,
    TResult Function()? endDrag,
    TResult Function(Vector4 coordinates, Map<String, dynamic>? piggyback)?
        doubleTap,
    required TResult orElse(),
  }) {
    if (doubleTap != null) {
      return doubleTap(coordinates, piggyback);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StartDrag value) startDrag,
    required TResult Function(_ContinueDrag value) continueDrag,
    required TResult Function(_EndDrag value) endDrag,
    required TResult Function(_DoubleTap value) doubleTap,
  }) {
    return doubleTap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StartDrag value)? startDrag,
    TResult? Function(_ContinueDrag value)? continueDrag,
    TResult? Function(_EndDrag value)? endDrag,
    TResult? Function(_DoubleTap value)? doubleTap,
  }) {
    return doubleTap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StartDrag value)? startDrag,
    TResult Function(_ContinueDrag value)? continueDrag,
    TResult Function(_EndDrag value)? endDrag,
    TResult Function(_DoubleTap value)? doubleTap,
    required TResult orElse(),
  }) {
    if (doubleTap != null) {
      return doubleTap(this);
    }
    return orElse();
  }
}

abstract class _DoubleTap implements DiagramViewerEvent {
  const factory _DoubleTap(
      {required final Vector4 coordinates,
      required final Map<String, dynamic>? piggyback}) = _$_DoubleTap;

  Vector4 get coordinates;
  Map<String, dynamic>? get piggyback;
  @JsonKey(ignore: true)
  _$$_DoubleTapCopyWith<_$_DoubleTap> get copyWith =>
      throw _privateConstructorUsedError;
}
