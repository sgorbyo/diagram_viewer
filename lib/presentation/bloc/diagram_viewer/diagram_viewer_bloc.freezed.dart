// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diagram_viewer_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DiagramViewerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<DiagramObjectEntity> content) contentChanged,
    required TResult Function(Size size) viewportChanged,
    required TResult Function() animationEnded,
    required TResult Function() panStarted,
    required TResult Function(Offset delta) panUpdated,
    required TResult Function() panEnded,
    required TResult Function() scaleStarted,
    required TResult Function(
            double scale, Offset focalPoint, Offset focalPointDelta)
        scaleUpdated,
    required TResult Function() scaleEnded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<DiagramObjectEntity> content)? contentChanged,
    TResult? Function(Size size)? viewportChanged,
    TResult? Function()? animationEnded,
    TResult? Function()? panStarted,
    TResult? Function(Offset delta)? panUpdated,
    TResult? Function()? panEnded,
    TResult? Function()? scaleStarted,
    TResult? Function(double scale, Offset focalPoint, Offset focalPointDelta)?
        scaleUpdated,
    TResult? Function()? scaleEnded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<DiagramObjectEntity> content)? contentChanged,
    TResult Function(Size size)? viewportChanged,
    TResult Function()? animationEnded,
    TResult Function()? panStarted,
    TResult Function(Offset delta)? panUpdated,
    TResult Function()? panEnded,
    TResult Function()? scaleStarted,
    TResult Function(double scale, Offset focalPoint, Offset focalPointDelta)?
        scaleUpdated,
    TResult Function()? scaleEnded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ContentChanged value) contentChanged,
    required TResult Function(_ViewportChanged value) viewportChanged,
    required TResult Function(_AnimationEnded value) animationEnded,
    required TResult Function(_PanStarted value) panStarted,
    required TResult Function(_PanUpdated value) panUpdated,
    required TResult Function(_PanEnded value) panEnded,
    required TResult Function(_ScaleStarted value) scaleStarted,
    required TResult Function(_ScaleUpdated value) scaleUpdated,
    required TResult Function(_ScaleEnded value) scaleEnded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ContentChanged value)? contentChanged,
    TResult? Function(_ViewportChanged value)? viewportChanged,
    TResult? Function(_AnimationEnded value)? animationEnded,
    TResult? Function(_PanStarted value)? panStarted,
    TResult? Function(_PanUpdated value)? panUpdated,
    TResult? Function(_PanEnded value)? panEnded,
    TResult? Function(_ScaleStarted value)? scaleStarted,
    TResult? Function(_ScaleUpdated value)? scaleUpdated,
    TResult? Function(_ScaleEnded value)? scaleEnded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_ViewportChanged value)? viewportChanged,
    TResult Function(_AnimationEnded value)? animationEnded,
    TResult Function(_PanStarted value)? panStarted,
    TResult Function(_PanUpdated value)? panUpdated,
    TResult Function(_PanEnded value)? panEnded,
    TResult Function(_ScaleStarted value)? scaleStarted,
    TResult Function(_ScaleUpdated value)? scaleUpdated,
    TResult Function(_ScaleEnded value)? scaleEnded,
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

  /// Create a copy of DiagramViewerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ContentChangedImplCopyWith<$Res> {
  factory _$$ContentChangedImplCopyWith(_$ContentChangedImpl value,
          $Res Function(_$ContentChangedImpl) then) =
      __$$ContentChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<DiagramObjectEntity> content});
}

/// @nodoc
class __$$ContentChangedImplCopyWithImpl<$Res>
    extends _$DiagramViewerEventCopyWithImpl<$Res, _$ContentChangedImpl>
    implements _$$ContentChangedImplCopyWith<$Res> {
  __$$ContentChangedImplCopyWithImpl(
      _$ContentChangedImpl _value, $Res Function(_$ContentChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramViewerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
  }) {
    return _then(_$ContentChangedImpl(
      null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
    ));
  }
}

/// @nodoc

class _$ContentChangedImpl implements _ContentChanged {
  const _$ContentChangedImpl(final List<DiagramObjectEntity> content)
      : _content = content;

  final List<DiagramObjectEntity> _content;
  @override
  List<DiagramObjectEntity> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  String toString() {
    return 'DiagramViewerEvent.contentChanged(content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentChangedImpl &&
            const DeepCollectionEquality().equals(other._content, _content));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_content));

  /// Create a copy of DiagramViewerEvent
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
    required TResult Function(List<DiagramObjectEntity> content) contentChanged,
    required TResult Function(Size size) viewportChanged,
    required TResult Function() animationEnded,
    required TResult Function() panStarted,
    required TResult Function(Offset delta) panUpdated,
    required TResult Function() panEnded,
    required TResult Function() scaleStarted,
    required TResult Function(
            double scale, Offset focalPoint, Offset focalPointDelta)
        scaleUpdated,
    required TResult Function() scaleEnded,
  }) {
    return contentChanged(content);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<DiagramObjectEntity> content)? contentChanged,
    TResult? Function(Size size)? viewportChanged,
    TResult? Function()? animationEnded,
    TResult? Function()? panStarted,
    TResult? Function(Offset delta)? panUpdated,
    TResult? Function()? panEnded,
    TResult? Function()? scaleStarted,
    TResult? Function(double scale, Offset focalPoint, Offset focalPointDelta)?
        scaleUpdated,
    TResult? Function()? scaleEnded,
  }) {
    return contentChanged?.call(content);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<DiagramObjectEntity> content)? contentChanged,
    TResult Function(Size size)? viewportChanged,
    TResult Function()? animationEnded,
    TResult Function()? panStarted,
    TResult Function(Offset delta)? panUpdated,
    TResult Function()? panEnded,
    TResult Function()? scaleStarted,
    TResult Function(double scale, Offset focalPoint, Offset focalPointDelta)?
        scaleUpdated,
    TResult Function()? scaleEnded,
    required TResult orElse(),
  }) {
    if (contentChanged != null) {
      return contentChanged(content);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ContentChanged value) contentChanged,
    required TResult Function(_ViewportChanged value) viewportChanged,
    required TResult Function(_AnimationEnded value) animationEnded,
    required TResult Function(_PanStarted value) panStarted,
    required TResult Function(_PanUpdated value) panUpdated,
    required TResult Function(_PanEnded value) panEnded,
    required TResult Function(_ScaleStarted value) scaleStarted,
    required TResult Function(_ScaleUpdated value) scaleUpdated,
    required TResult Function(_ScaleEnded value) scaleEnded,
  }) {
    return contentChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ContentChanged value)? contentChanged,
    TResult? Function(_ViewportChanged value)? viewportChanged,
    TResult? Function(_AnimationEnded value)? animationEnded,
    TResult? Function(_PanStarted value)? panStarted,
    TResult? Function(_PanUpdated value)? panUpdated,
    TResult? Function(_PanEnded value)? panEnded,
    TResult? Function(_ScaleStarted value)? scaleStarted,
    TResult? Function(_ScaleUpdated value)? scaleUpdated,
    TResult? Function(_ScaleEnded value)? scaleEnded,
  }) {
    return contentChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_ViewportChanged value)? viewportChanged,
    TResult Function(_AnimationEnded value)? animationEnded,
    TResult Function(_PanStarted value)? panStarted,
    TResult Function(_PanUpdated value)? panUpdated,
    TResult Function(_PanEnded value)? panEnded,
    TResult Function(_ScaleStarted value)? scaleStarted,
    TResult Function(_ScaleUpdated value)? scaleUpdated,
    TResult Function(_ScaleEnded value)? scaleEnded,
    required TResult orElse(),
  }) {
    if (contentChanged != null) {
      return contentChanged(this);
    }
    return orElse();
  }
}

abstract class _ContentChanged implements DiagramViewerEvent {
  const factory _ContentChanged(final List<DiagramObjectEntity> content) =
      _$ContentChangedImpl;

  List<DiagramObjectEntity> get content;

  /// Create a copy of DiagramViewerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentChangedImplCopyWith<_$ContentChangedImpl> get copyWith =>
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
    extends _$DiagramViewerEventCopyWithImpl<$Res, _$ViewportChangedImpl>
    implements _$$ViewportChangedImplCopyWith<$Res> {
  __$$ViewportChangedImplCopyWithImpl(
      _$ViewportChangedImpl _value, $Res Function(_$ViewportChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramViewerEvent
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
    return 'DiagramViewerEvent.viewportChanged(size: $size)';
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

  /// Create a copy of DiagramViewerEvent
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
    required TResult Function(List<DiagramObjectEntity> content) contentChanged,
    required TResult Function(Size size) viewportChanged,
    required TResult Function() animationEnded,
    required TResult Function() panStarted,
    required TResult Function(Offset delta) panUpdated,
    required TResult Function() panEnded,
    required TResult Function() scaleStarted,
    required TResult Function(
            double scale, Offset focalPoint, Offset focalPointDelta)
        scaleUpdated,
    required TResult Function() scaleEnded,
  }) {
    return viewportChanged(size);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<DiagramObjectEntity> content)? contentChanged,
    TResult? Function(Size size)? viewportChanged,
    TResult? Function()? animationEnded,
    TResult? Function()? panStarted,
    TResult? Function(Offset delta)? panUpdated,
    TResult? Function()? panEnded,
    TResult? Function()? scaleStarted,
    TResult? Function(double scale, Offset focalPoint, Offset focalPointDelta)?
        scaleUpdated,
    TResult? Function()? scaleEnded,
  }) {
    return viewportChanged?.call(size);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<DiagramObjectEntity> content)? contentChanged,
    TResult Function(Size size)? viewportChanged,
    TResult Function()? animationEnded,
    TResult Function()? panStarted,
    TResult Function(Offset delta)? panUpdated,
    TResult Function()? panEnded,
    TResult Function()? scaleStarted,
    TResult Function(double scale, Offset focalPoint, Offset focalPointDelta)?
        scaleUpdated,
    TResult Function()? scaleEnded,
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
    required TResult Function(_ContentChanged value) contentChanged,
    required TResult Function(_ViewportChanged value) viewportChanged,
    required TResult Function(_AnimationEnded value) animationEnded,
    required TResult Function(_PanStarted value) panStarted,
    required TResult Function(_PanUpdated value) panUpdated,
    required TResult Function(_PanEnded value) panEnded,
    required TResult Function(_ScaleStarted value) scaleStarted,
    required TResult Function(_ScaleUpdated value) scaleUpdated,
    required TResult Function(_ScaleEnded value) scaleEnded,
  }) {
    return viewportChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ContentChanged value)? contentChanged,
    TResult? Function(_ViewportChanged value)? viewportChanged,
    TResult? Function(_AnimationEnded value)? animationEnded,
    TResult? Function(_PanStarted value)? panStarted,
    TResult? Function(_PanUpdated value)? panUpdated,
    TResult? Function(_PanEnded value)? panEnded,
    TResult? Function(_ScaleStarted value)? scaleStarted,
    TResult? Function(_ScaleUpdated value)? scaleUpdated,
    TResult? Function(_ScaleEnded value)? scaleEnded,
  }) {
    return viewportChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_ViewportChanged value)? viewportChanged,
    TResult Function(_AnimationEnded value)? animationEnded,
    TResult Function(_PanStarted value)? panStarted,
    TResult Function(_PanUpdated value)? panUpdated,
    TResult Function(_PanEnded value)? panEnded,
    TResult Function(_ScaleStarted value)? scaleStarted,
    TResult Function(_ScaleUpdated value)? scaleUpdated,
    TResult Function(_ScaleEnded value)? scaleEnded,
    required TResult orElse(),
  }) {
    if (viewportChanged != null) {
      return viewportChanged(this);
    }
    return orElse();
  }
}

abstract class _ViewportChanged implements DiagramViewerEvent {
  const factory _ViewportChanged({required final Size size}) =
      _$ViewportChangedImpl;

  Size get size;

  /// Create a copy of DiagramViewerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ViewportChangedImplCopyWith<_$ViewportChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AnimationEndedImplCopyWith<$Res> {
  factory _$$AnimationEndedImplCopyWith(_$AnimationEndedImpl value,
          $Res Function(_$AnimationEndedImpl) then) =
      __$$AnimationEndedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AnimationEndedImplCopyWithImpl<$Res>
    extends _$DiagramViewerEventCopyWithImpl<$Res, _$AnimationEndedImpl>
    implements _$$AnimationEndedImplCopyWith<$Res> {
  __$$AnimationEndedImplCopyWithImpl(
      _$AnimationEndedImpl _value, $Res Function(_$AnimationEndedImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramViewerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AnimationEndedImpl implements _AnimationEnded {
  const _$AnimationEndedImpl();

  @override
  String toString() {
    return 'DiagramViewerEvent.animationEnded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AnimationEndedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<DiagramObjectEntity> content) contentChanged,
    required TResult Function(Size size) viewportChanged,
    required TResult Function() animationEnded,
    required TResult Function() panStarted,
    required TResult Function(Offset delta) panUpdated,
    required TResult Function() panEnded,
    required TResult Function() scaleStarted,
    required TResult Function(
            double scale, Offset focalPoint, Offset focalPointDelta)
        scaleUpdated,
    required TResult Function() scaleEnded,
  }) {
    return animationEnded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<DiagramObjectEntity> content)? contentChanged,
    TResult? Function(Size size)? viewportChanged,
    TResult? Function()? animationEnded,
    TResult? Function()? panStarted,
    TResult? Function(Offset delta)? panUpdated,
    TResult? Function()? panEnded,
    TResult? Function()? scaleStarted,
    TResult? Function(double scale, Offset focalPoint, Offset focalPointDelta)?
        scaleUpdated,
    TResult? Function()? scaleEnded,
  }) {
    return animationEnded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<DiagramObjectEntity> content)? contentChanged,
    TResult Function(Size size)? viewportChanged,
    TResult Function()? animationEnded,
    TResult Function()? panStarted,
    TResult Function(Offset delta)? panUpdated,
    TResult Function()? panEnded,
    TResult Function()? scaleStarted,
    TResult Function(double scale, Offset focalPoint, Offset focalPointDelta)?
        scaleUpdated,
    TResult Function()? scaleEnded,
    required TResult orElse(),
  }) {
    if (animationEnded != null) {
      return animationEnded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ContentChanged value) contentChanged,
    required TResult Function(_ViewportChanged value) viewportChanged,
    required TResult Function(_AnimationEnded value) animationEnded,
    required TResult Function(_PanStarted value) panStarted,
    required TResult Function(_PanUpdated value) panUpdated,
    required TResult Function(_PanEnded value) panEnded,
    required TResult Function(_ScaleStarted value) scaleStarted,
    required TResult Function(_ScaleUpdated value) scaleUpdated,
    required TResult Function(_ScaleEnded value) scaleEnded,
  }) {
    return animationEnded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ContentChanged value)? contentChanged,
    TResult? Function(_ViewportChanged value)? viewportChanged,
    TResult? Function(_AnimationEnded value)? animationEnded,
    TResult? Function(_PanStarted value)? panStarted,
    TResult? Function(_PanUpdated value)? panUpdated,
    TResult? Function(_PanEnded value)? panEnded,
    TResult? Function(_ScaleStarted value)? scaleStarted,
    TResult? Function(_ScaleUpdated value)? scaleUpdated,
    TResult? Function(_ScaleEnded value)? scaleEnded,
  }) {
    return animationEnded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_ViewportChanged value)? viewportChanged,
    TResult Function(_AnimationEnded value)? animationEnded,
    TResult Function(_PanStarted value)? panStarted,
    TResult Function(_PanUpdated value)? panUpdated,
    TResult Function(_PanEnded value)? panEnded,
    TResult Function(_ScaleStarted value)? scaleStarted,
    TResult Function(_ScaleUpdated value)? scaleUpdated,
    TResult Function(_ScaleEnded value)? scaleEnded,
    required TResult orElse(),
  }) {
    if (animationEnded != null) {
      return animationEnded(this);
    }
    return orElse();
  }
}

abstract class _AnimationEnded implements DiagramViewerEvent {
  const factory _AnimationEnded() = _$AnimationEndedImpl;
}

/// @nodoc
abstract class _$$PanStartedImplCopyWith<$Res> {
  factory _$$PanStartedImplCopyWith(
          _$PanStartedImpl value, $Res Function(_$PanStartedImpl) then) =
      __$$PanStartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PanStartedImplCopyWithImpl<$Res>
    extends _$DiagramViewerEventCopyWithImpl<$Res, _$PanStartedImpl>
    implements _$$PanStartedImplCopyWith<$Res> {
  __$$PanStartedImplCopyWithImpl(
      _$PanStartedImpl _value, $Res Function(_$PanStartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramViewerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PanStartedImpl implements _PanStarted {
  const _$PanStartedImpl();

  @override
  String toString() {
    return 'DiagramViewerEvent.panStarted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PanStartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<DiagramObjectEntity> content) contentChanged,
    required TResult Function(Size size) viewportChanged,
    required TResult Function() animationEnded,
    required TResult Function() panStarted,
    required TResult Function(Offset delta) panUpdated,
    required TResult Function() panEnded,
    required TResult Function() scaleStarted,
    required TResult Function(
            double scale, Offset focalPoint, Offset focalPointDelta)
        scaleUpdated,
    required TResult Function() scaleEnded,
  }) {
    return panStarted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<DiagramObjectEntity> content)? contentChanged,
    TResult? Function(Size size)? viewportChanged,
    TResult? Function()? animationEnded,
    TResult? Function()? panStarted,
    TResult? Function(Offset delta)? panUpdated,
    TResult? Function()? panEnded,
    TResult? Function()? scaleStarted,
    TResult? Function(double scale, Offset focalPoint, Offset focalPointDelta)?
        scaleUpdated,
    TResult? Function()? scaleEnded,
  }) {
    return panStarted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<DiagramObjectEntity> content)? contentChanged,
    TResult Function(Size size)? viewportChanged,
    TResult Function()? animationEnded,
    TResult Function()? panStarted,
    TResult Function(Offset delta)? panUpdated,
    TResult Function()? panEnded,
    TResult Function()? scaleStarted,
    TResult Function(double scale, Offset focalPoint, Offset focalPointDelta)?
        scaleUpdated,
    TResult Function()? scaleEnded,
    required TResult orElse(),
  }) {
    if (panStarted != null) {
      return panStarted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ContentChanged value) contentChanged,
    required TResult Function(_ViewportChanged value) viewportChanged,
    required TResult Function(_AnimationEnded value) animationEnded,
    required TResult Function(_PanStarted value) panStarted,
    required TResult Function(_PanUpdated value) panUpdated,
    required TResult Function(_PanEnded value) panEnded,
    required TResult Function(_ScaleStarted value) scaleStarted,
    required TResult Function(_ScaleUpdated value) scaleUpdated,
    required TResult Function(_ScaleEnded value) scaleEnded,
  }) {
    return panStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ContentChanged value)? contentChanged,
    TResult? Function(_ViewportChanged value)? viewportChanged,
    TResult? Function(_AnimationEnded value)? animationEnded,
    TResult? Function(_PanStarted value)? panStarted,
    TResult? Function(_PanUpdated value)? panUpdated,
    TResult? Function(_PanEnded value)? panEnded,
    TResult? Function(_ScaleStarted value)? scaleStarted,
    TResult? Function(_ScaleUpdated value)? scaleUpdated,
    TResult? Function(_ScaleEnded value)? scaleEnded,
  }) {
    return panStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_ViewportChanged value)? viewportChanged,
    TResult Function(_AnimationEnded value)? animationEnded,
    TResult Function(_PanStarted value)? panStarted,
    TResult Function(_PanUpdated value)? panUpdated,
    TResult Function(_PanEnded value)? panEnded,
    TResult Function(_ScaleStarted value)? scaleStarted,
    TResult Function(_ScaleUpdated value)? scaleUpdated,
    TResult Function(_ScaleEnded value)? scaleEnded,
    required TResult orElse(),
  }) {
    if (panStarted != null) {
      return panStarted(this);
    }
    return orElse();
  }
}

abstract class _PanStarted implements DiagramViewerEvent {
  const factory _PanStarted() = _$PanStartedImpl;
}

/// @nodoc
abstract class _$$PanUpdatedImplCopyWith<$Res> {
  factory _$$PanUpdatedImplCopyWith(
          _$PanUpdatedImpl value, $Res Function(_$PanUpdatedImpl) then) =
      __$$PanUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Offset delta});
}

/// @nodoc
class __$$PanUpdatedImplCopyWithImpl<$Res>
    extends _$DiagramViewerEventCopyWithImpl<$Res, _$PanUpdatedImpl>
    implements _$$PanUpdatedImplCopyWith<$Res> {
  __$$PanUpdatedImplCopyWithImpl(
      _$PanUpdatedImpl _value, $Res Function(_$PanUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramViewerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? delta = null,
  }) {
    return _then(_$PanUpdatedImpl(
      null == delta
          ? _value.delta
          : delta // ignore: cast_nullable_to_non_nullable
              as Offset,
    ));
  }
}

/// @nodoc

class _$PanUpdatedImpl implements _PanUpdated {
  const _$PanUpdatedImpl(this.delta);

  @override
  final Offset delta;

  @override
  String toString() {
    return 'DiagramViewerEvent.panUpdated(delta: $delta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PanUpdatedImpl &&
            (identical(other.delta, delta) || other.delta == delta));
  }

  @override
  int get hashCode => Object.hash(runtimeType, delta);

  /// Create a copy of DiagramViewerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PanUpdatedImplCopyWith<_$PanUpdatedImpl> get copyWith =>
      __$$PanUpdatedImplCopyWithImpl<_$PanUpdatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<DiagramObjectEntity> content) contentChanged,
    required TResult Function(Size size) viewportChanged,
    required TResult Function() animationEnded,
    required TResult Function() panStarted,
    required TResult Function(Offset delta) panUpdated,
    required TResult Function() panEnded,
    required TResult Function() scaleStarted,
    required TResult Function(
            double scale, Offset focalPoint, Offset focalPointDelta)
        scaleUpdated,
    required TResult Function() scaleEnded,
  }) {
    return panUpdated(delta);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<DiagramObjectEntity> content)? contentChanged,
    TResult? Function(Size size)? viewportChanged,
    TResult? Function()? animationEnded,
    TResult? Function()? panStarted,
    TResult? Function(Offset delta)? panUpdated,
    TResult? Function()? panEnded,
    TResult? Function()? scaleStarted,
    TResult? Function(double scale, Offset focalPoint, Offset focalPointDelta)?
        scaleUpdated,
    TResult? Function()? scaleEnded,
  }) {
    return panUpdated?.call(delta);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<DiagramObjectEntity> content)? contentChanged,
    TResult Function(Size size)? viewportChanged,
    TResult Function()? animationEnded,
    TResult Function()? panStarted,
    TResult Function(Offset delta)? panUpdated,
    TResult Function()? panEnded,
    TResult Function()? scaleStarted,
    TResult Function(double scale, Offset focalPoint, Offset focalPointDelta)?
        scaleUpdated,
    TResult Function()? scaleEnded,
    required TResult orElse(),
  }) {
    if (panUpdated != null) {
      return panUpdated(delta);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ContentChanged value) contentChanged,
    required TResult Function(_ViewportChanged value) viewportChanged,
    required TResult Function(_AnimationEnded value) animationEnded,
    required TResult Function(_PanStarted value) panStarted,
    required TResult Function(_PanUpdated value) panUpdated,
    required TResult Function(_PanEnded value) panEnded,
    required TResult Function(_ScaleStarted value) scaleStarted,
    required TResult Function(_ScaleUpdated value) scaleUpdated,
    required TResult Function(_ScaleEnded value) scaleEnded,
  }) {
    return panUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ContentChanged value)? contentChanged,
    TResult? Function(_ViewportChanged value)? viewportChanged,
    TResult? Function(_AnimationEnded value)? animationEnded,
    TResult? Function(_PanStarted value)? panStarted,
    TResult? Function(_PanUpdated value)? panUpdated,
    TResult? Function(_PanEnded value)? panEnded,
    TResult? Function(_ScaleStarted value)? scaleStarted,
    TResult? Function(_ScaleUpdated value)? scaleUpdated,
    TResult? Function(_ScaleEnded value)? scaleEnded,
  }) {
    return panUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_ViewportChanged value)? viewportChanged,
    TResult Function(_AnimationEnded value)? animationEnded,
    TResult Function(_PanStarted value)? panStarted,
    TResult Function(_PanUpdated value)? panUpdated,
    TResult Function(_PanEnded value)? panEnded,
    TResult Function(_ScaleStarted value)? scaleStarted,
    TResult Function(_ScaleUpdated value)? scaleUpdated,
    TResult Function(_ScaleEnded value)? scaleEnded,
    required TResult orElse(),
  }) {
    if (panUpdated != null) {
      return panUpdated(this);
    }
    return orElse();
  }
}

abstract class _PanUpdated implements DiagramViewerEvent {
  const factory _PanUpdated(final Offset delta) = _$PanUpdatedImpl;

  Offset get delta;

  /// Create a copy of DiagramViewerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PanUpdatedImplCopyWith<_$PanUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PanEndedImplCopyWith<$Res> {
  factory _$$PanEndedImplCopyWith(
          _$PanEndedImpl value, $Res Function(_$PanEndedImpl) then) =
      __$$PanEndedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PanEndedImplCopyWithImpl<$Res>
    extends _$DiagramViewerEventCopyWithImpl<$Res, _$PanEndedImpl>
    implements _$$PanEndedImplCopyWith<$Res> {
  __$$PanEndedImplCopyWithImpl(
      _$PanEndedImpl _value, $Res Function(_$PanEndedImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramViewerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PanEndedImpl implements _PanEnded {
  const _$PanEndedImpl();

  @override
  String toString() {
    return 'DiagramViewerEvent.panEnded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PanEndedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<DiagramObjectEntity> content) contentChanged,
    required TResult Function(Size size) viewportChanged,
    required TResult Function() animationEnded,
    required TResult Function() panStarted,
    required TResult Function(Offset delta) panUpdated,
    required TResult Function() panEnded,
    required TResult Function() scaleStarted,
    required TResult Function(
            double scale, Offset focalPoint, Offset focalPointDelta)
        scaleUpdated,
    required TResult Function() scaleEnded,
  }) {
    return panEnded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<DiagramObjectEntity> content)? contentChanged,
    TResult? Function(Size size)? viewportChanged,
    TResult? Function()? animationEnded,
    TResult? Function()? panStarted,
    TResult? Function(Offset delta)? panUpdated,
    TResult? Function()? panEnded,
    TResult? Function()? scaleStarted,
    TResult? Function(double scale, Offset focalPoint, Offset focalPointDelta)?
        scaleUpdated,
    TResult? Function()? scaleEnded,
  }) {
    return panEnded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<DiagramObjectEntity> content)? contentChanged,
    TResult Function(Size size)? viewportChanged,
    TResult Function()? animationEnded,
    TResult Function()? panStarted,
    TResult Function(Offset delta)? panUpdated,
    TResult Function()? panEnded,
    TResult Function()? scaleStarted,
    TResult Function(double scale, Offset focalPoint, Offset focalPointDelta)?
        scaleUpdated,
    TResult Function()? scaleEnded,
    required TResult orElse(),
  }) {
    if (panEnded != null) {
      return panEnded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ContentChanged value) contentChanged,
    required TResult Function(_ViewportChanged value) viewportChanged,
    required TResult Function(_AnimationEnded value) animationEnded,
    required TResult Function(_PanStarted value) panStarted,
    required TResult Function(_PanUpdated value) panUpdated,
    required TResult Function(_PanEnded value) panEnded,
    required TResult Function(_ScaleStarted value) scaleStarted,
    required TResult Function(_ScaleUpdated value) scaleUpdated,
    required TResult Function(_ScaleEnded value) scaleEnded,
  }) {
    return panEnded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ContentChanged value)? contentChanged,
    TResult? Function(_ViewportChanged value)? viewportChanged,
    TResult? Function(_AnimationEnded value)? animationEnded,
    TResult? Function(_PanStarted value)? panStarted,
    TResult? Function(_PanUpdated value)? panUpdated,
    TResult? Function(_PanEnded value)? panEnded,
    TResult? Function(_ScaleStarted value)? scaleStarted,
    TResult? Function(_ScaleUpdated value)? scaleUpdated,
    TResult? Function(_ScaleEnded value)? scaleEnded,
  }) {
    return panEnded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_ViewportChanged value)? viewportChanged,
    TResult Function(_AnimationEnded value)? animationEnded,
    TResult Function(_PanStarted value)? panStarted,
    TResult Function(_PanUpdated value)? panUpdated,
    TResult Function(_PanEnded value)? panEnded,
    TResult Function(_ScaleStarted value)? scaleStarted,
    TResult Function(_ScaleUpdated value)? scaleUpdated,
    TResult Function(_ScaleEnded value)? scaleEnded,
    required TResult orElse(),
  }) {
    if (panEnded != null) {
      return panEnded(this);
    }
    return orElse();
  }
}

abstract class _PanEnded implements DiagramViewerEvent {
  const factory _PanEnded() = _$PanEndedImpl;
}

/// @nodoc
abstract class _$$ScaleStartedImplCopyWith<$Res> {
  factory _$$ScaleStartedImplCopyWith(
          _$ScaleStartedImpl value, $Res Function(_$ScaleStartedImpl) then) =
      __$$ScaleStartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ScaleStartedImplCopyWithImpl<$Res>
    extends _$DiagramViewerEventCopyWithImpl<$Res, _$ScaleStartedImpl>
    implements _$$ScaleStartedImplCopyWith<$Res> {
  __$$ScaleStartedImplCopyWithImpl(
      _$ScaleStartedImpl _value, $Res Function(_$ScaleStartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramViewerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ScaleStartedImpl implements _ScaleStarted {
  const _$ScaleStartedImpl();

  @override
  String toString() {
    return 'DiagramViewerEvent.scaleStarted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ScaleStartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<DiagramObjectEntity> content) contentChanged,
    required TResult Function(Size size) viewportChanged,
    required TResult Function() animationEnded,
    required TResult Function() panStarted,
    required TResult Function(Offset delta) panUpdated,
    required TResult Function() panEnded,
    required TResult Function() scaleStarted,
    required TResult Function(
            double scale, Offset focalPoint, Offset focalPointDelta)
        scaleUpdated,
    required TResult Function() scaleEnded,
  }) {
    return scaleStarted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<DiagramObjectEntity> content)? contentChanged,
    TResult? Function(Size size)? viewportChanged,
    TResult? Function()? animationEnded,
    TResult? Function()? panStarted,
    TResult? Function(Offset delta)? panUpdated,
    TResult? Function()? panEnded,
    TResult? Function()? scaleStarted,
    TResult? Function(double scale, Offset focalPoint, Offset focalPointDelta)?
        scaleUpdated,
    TResult? Function()? scaleEnded,
  }) {
    return scaleStarted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<DiagramObjectEntity> content)? contentChanged,
    TResult Function(Size size)? viewportChanged,
    TResult Function()? animationEnded,
    TResult Function()? panStarted,
    TResult Function(Offset delta)? panUpdated,
    TResult Function()? panEnded,
    TResult Function()? scaleStarted,
    TResult Function(double scale, Offset focalPoint, Offset focalPointDelta)?
        scaleUpdated,
    TResult Function()? scaleEnded,
    required TResult orElse(),
  }) {
    if (scaleStarted != null) {
      return scaleStarted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ContentChanged value) contentChanged,
    required TResult Function(_ViewportChanged value) viewportChanged,
    required TResult Function(_AnimationEnded value) animationEnded,
    required TResult Function(_PanStarted value) panStarted,
    required TResult Function(_PanUpdated value) panUpdated,
    required TResult Function(_PanEnded value) panEnded,
    required TResult Function(_ScaleStarted value) scaleStarted,
    required TResult Function(_ScaleUpdated value) scaleUpdated,
    required TResult Function(_ScaleEnded value) scaleEnded,
  }) {
    return scaleStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ContentChanged value)? contentChanged,
    TResult? Function(_ViewportChanged value)? viewportChanged,
    TResult? Function(_AnimationEnded value)? animationEnded,
    TResult? Function(_PanStarted value)? panStarted,
    TResult? Function(_PanUpdated value)? panUpdated,
    TResult? Function(_PanEnded value)? panEnded,
    TResult? Function(_ScaleStarted value)? scaleStarted,
    TResult? Function(_ScaleUpdated value)? scaleUpdated,
    TResult? Function(_ScaleEnded value)? scaleEnded,
  }) {
    return scaleStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_ViewportChanged value)? viewportChanged,
    TResult Function(_AnimationEnded value)? animationEnded,
    TResult Function(_PanStarted value)? panStarted,
    TResult Function(_PanUpdated value)? panUpdated,
    TResult Function(_PanEnded value)? panEnded,
    TResult Function(_ScaleStarted value)? scaleStarted,
    TResult Function(_ScaleUpdated value)? scaleUpdated,
    TResult Function(_ScaleEnded value)? scaleEnded,
    required TResult orElse(),
  }) {
    if (scaleStarted != null) {
      return scaleStarted(this);
    }
    return orElse();
  }
}

abstract class _ScaleStarted implements DiagramViewerEvent {
  const factory _ScaleStarted() = _$ScaleStartedImpl;
}

/// @nodoc
abstract class _$$ScaleUpdatedImplCopyWith<$Res> {
  factory _$$ScaleUpdatedImplCopyWith(
          _$ScaleUpdatedImpl value, $Res Function(_$ScaleUpdatedImpl) then) =
      __$$ScaleUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double scale, Offset focalPoint, Offset focalPointDelta});
}

/// @nodoc
class __$$ScaleUpdatedImplCopyWithImpl<$Res>
    extends _$DiagramViewerEventCopyWithImpl<$Res, _$ScaleUpdatedImpl>
    implements _$$ScaleUpdatedImplCopyWith<$Res> {
  __$$ScaleUpdatedImplCopyWithImpl(
      _$ScaleUpdatedImpl _value, $Res Function(_$ScaleUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramViewerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scale = null,
    Object? focalPoint = null,
    Object? focalPointDelta = null,
  }) {
    return _then(_$ScaleUpdatedImpl(
      null == scale
          ? _value.scale
          : scale // ignore: cast_nullable_to_non_nullable
              as double,
      null == focalPoint
          ? _value.focalPoint
          : focalPoint // ignore: cast_nullable_to_non_nullable
              as Offset,
      null == focalPointDelta
          ? _value.focalPointDelta
          : focalPointDelta // ignore: cast_nullable_to_non_nullable
              as Offset,
    ));
  }
}

/// @nodoc

class _$ScaleUpdatedImpl implements _ScaleUpdated {
  const _$ScaleUpdatedImpl(this.scale, this.focalPoint, this.focalPointDelta);

  @override
  final double scale;
  @override
  final Offset focalPoint;
  @override
  final Offset focalPointDelta;

  @override
  String toString() {
    return 'DiagramViewerEvent.scaleUpdated(scale: $scale, focalPoint: $focalPoint, focalPointDelta: $focalPointDelta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScaleUpdatedImpl &&
            (identical(other.scale, scale) || other.scale == scale) &&
            (identical(other.focalPoint, focalPoint) ||
                other.focalPoint == focalPoint) &&
            (identical(other.focalPointDelta, focalPointDelta) ||
                other.focalPointDelta == focalPointDelta));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, scale, focalPoint, focalPointDelta);

  /// Create a copy of DiagramViewerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScaleUpdatedImplCopyWith<_$ScaleUpdatedImpl> get copyWith =>
      __$$ScaleUpdatedImplCopyWithImpl<_$ScaleUpdatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<DiagramObjectEntity> content) contentChanged,
    required TResult Function(Size size) viewportChanged,
    required TResult Function() animationEnded,
    required TResult Function() panStarted,
    required TResult Function(Offset delta) panUpdated,
    required TResult Function() panEnded,
    required TResult Function() scaleStarted,
    required TResult Function(
            double scale, Offset focalPoint, Offset focalPointDelta)
        scaleUpdated,
    required TResult Function() scaleEnded,
  }) {
    return scaleUpdated(scale, focalPoint, focalPointDelta);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<DiagramObjectEntity> content)? contentChanged,
    TResult? Function(Size size)? viewportChanged,
    TResult? Function()? animationEnded,
    TResult? Function()? panStarted,
    TResult? Function(Offset delta)? panUpdated,
    TResult? Function()? panEnded,
    TResult? Function()? scaleStarted,
    TResult? Function(double scale, Offset focalPoint, Offset focalPointDelta)?
        scaleUpdated,
    TResult? Function()? scaleEnded,
  }) {
    return scaleUpdated?.call(scale, focalPoint, focalPointDelta);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<DiagramObjectEntity> content)? contentChanged,
    TResult Function(Size size)? viewportChanged,
    TResult Function()? animationEnded,
    TResult Function()? panStarted,
    TResult Function(Offset delta)? panUpdated,
    TResult Function()? panEnded,
    TResult Function()? scaleStarted,
    TResult Function(double scale, Offset focalPoint, Offset focalPointDelta)?
        scaleUpdated,
    TResult Function()? scaleEnded,
    required TResult orElse(),
  }) {
    if (scaleUpdated != null) {
      return scaleUpdated(scale, focalPoint, focalPointDelta);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ContentChanged value) contentChanged,
    required TResult Function(_ViewportChanged value) viewportChanged,
    required TResult Function(_AnimationEnded value) animationEnded,
    required TResult Function(_PanStarted value) panStarted,
    required TResult Function(_PanUpdated value) panUpdated,
    required TResult Function(_PanEnded value) panEnded,
    required TResult Function(_ScaleStarted value) scaleStarted,
    required TResult Function(_ScaleUpdated value) scaleUpdated,
    required TResult Function(_ScaleEnded value) scaleEnded,
  }) {
    return scaleUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ContentChanged value)? contentChanged,
    TResult? Function(_ViewportChanged value)? viewportChanged,
    TResult? Function(_AnimationEnded value)? animationEnded,
    TResult? Function(_PanStarted value)? panStarted,
    TResult? Function(_PanUpdated value)? panUpdated,
    TResult? Function(_PanEnded value)? panEnded,
    TResult? Function(_ScaleStarted value)? scaleStarted,
    TResult? Function(_ScaleUpdated value)? scaleUpdated,
    TResult? Function(_ScaleEnded value)? scaleEnded,
  }) {
    return scaleUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_ViewportChanged value)? viewportChanged,
    TResult Function(_AnimationEnded value)? animationEnded,
    TResult Function(_PanStarted value)? panStarted,
    TResult Function(_PanUpdated value)? panUpdated,
    TResult Function(_PanEnded value)? panEnded,
    TResult Function(_ScaleStarted value)? scaleStarted,
    TResult Function(_ScaleUpdated value)? scaleUpdated,
    TResult Function(_ScaleEnded value)? scaleEnded,
    required TResult orElse(),
  }) {
    if (scaleUpdated != null) {
      return scaleUpdated(this);
    }
    return orElse();
  }
}

abstract class _ScaleUpdated implements DiagramViewerEvent {
  const factory _ScaleUpdated(final double scale, final Offset focalPoint,
      final Offset focalPointDelta) = _$ScaleUpdatedImpl;

  double get scale;
  Offset get focalPoint;
  Offset get focalPointDelta;

  /// Create a copy of DiagramViewerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScaleUpdatedImplCopyWith<_$ScaleUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ScaleEndedImplCopyWith<$Res> {
  factory _$$ScaleEndedImplCopyWith(
          _$ScaleEndedImpl value, $Res Function(_$ScaleEndedImpl) then) =
      __$$ScaleEndedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ScaleEndedImplCopyWithImpl<$Res>
    extends _$DiagramViewerEventCopyWithImpl<$Res, _$ScaleEndedImpl>
    implements _$$ScaleEndedImplCopyWith<$Res> {
  __$$ScaleEndedImplCopyWithImpl(
      _$ScaleEndedImpl _value, $Res Function(_$ScaleEndedImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramViewerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ScaleEndedImpl implements _ScaleEnded {
  const _$ScaleEndedImpl();

  @override
  String toString() {
    return 'DiagramViewerEvent.scaleEnded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ScaleEndedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<DiagramObjectEntity> content) contentChanged,
    required TResult Function(Size size) viewportChanged,
    required TResult Function() animationEnded,
    required TResult Function() panStarted,
    required TResult Function(Offset delta) panUpdated,
    required TResult Function() panEnded,
    required TResult Function() scaleStarted,
    required TResult Function(
            double scale, Offset focalPoint, Offset focalPointDelta)
        scaleUpdated,
    required TResult Function() scaleEnded,
  }) {
    return scaleEnded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<DiagramObjectEntity> content)? contentChanged,
    TResult? Function(Size size)? viewportChanged,
    TResult? Function()? animationEnded,
    TResult? Function()? panStarted,
    TResult? Function(Offset delta)? panUpdated,
    TResult? Function()? panEnded,
    TResult? Function()? scaleStarted,
    TResult? Function(double scale, Offset focalPoint, Offset focalPointDelta)?
        scaleUpdated,
    TResult? Function()? scaleEnded,
  }) {
    return scaleEnded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<DiagramObjectEntity> content)? contentChanged,
    TResult Function(Size size)? viewportChanged,
    TResult Function()? animationEnded,
    TResult Function()? panStarted,
    TResult Function(Offset delta)? panUpdated,
    TResult Function()? panEnded,
    TResult Function()? scaleStarted,
    TResult Function(double scale, Offset focalPoint, Offset focalPointDelta)?
        scaleUpdated,
    TResult Function()? scaleEnded,
    required TResult orElse(),
  }) {
    if (scaleEnded != null) {
      return scaleEnded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ContentChanged value) contentChanged,
    required TResult Function(_ViewportChanged value) viewportChanged,
    required TResult Function(_AnimationEnded value) animationEnded,
    required TResult Function(_PanStarted value) panStarted,
    required TResult Function(_PanUpdated value) panUpdated,
    required TResult Function(_PanEnded value) panEnded,
    required TResult Function(_ScaleStarted value) scaleStarted,
    required TResult Function(_ScaleUpdated value) scaleUpdated,
    required TResult Function(_ScaleEnded value) scaleEnded,
  }) {
    return scaleEnded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ContentChanged value)? contentChanged,
    TResult? Function(_ViewportChanged value)? viewportChanged,
    TResult? Function(_AnimationEnded value)? animationEnded,
    TResult? Function(_PanStarted value)? panStarted,
    TResult? Function(_PanUpdated value)? panUpdated,
    TResult? Function(_PanEnded value)? panEnded,
    TResult? Function(_ScaleStarted value)? scaleStarted,
    TResult? Function(_ScaleUpdated value)? scaleUpdated,
    TResult? Function(_ScaleEnded value)? scaleEnded,
  }) {
    return scaleEnded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ContentChanged value)? contentChanged,
    TResult Function(_ViewportChanged value)? viewportChanged,
    TResult Function(_AnimationEnded value)? animationEnded,
    TResult Function(_PanStarted value)? panStarted,
    TResult Function(_PanUpdated value)? panUpdated,
    TResult Function(_PanEnded value)? panEnded,
    TResult Function(_ScaleStarted value)? scaleStarted,
    TResult Function(_ScaleUpdated value)? scaleUpdated,
    TResult Function(_ScaleEnded value)? scaleEnded,
    required TResult orElse(),
  }) {
    if (scaleEnded != null) {
      return scaleEnded(this);
    }
    return orElse();
  }
}

abstract class _ScaleEnded implements DiagramViewerEvent {
  const factory _ScaleEnded() = _$ScaleEndedImpl;
}

/// @nodoc
mixin _$DiagramViewerState {
  Matrix4 get matrix => throw _privateConstructorUsedError;
  Size get viewportSize => throw _privateConstructorUsedError;
  Rect get diagramRect => throw _privateConstructorUsedError;
  List<DiagramObjectEntity> get content => throw _privateConstructorUsedError;
  List<DiagramObjectEntity> get selectedObjects =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        initial,
    required TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        loading,
    required TResult Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        animatingToIdle,
    required TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        idle,
    required TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        panning,
    required TResult Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        scaling,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        initial,
    TResult? Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        loading,
    TResult? Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        animatingToIdle,
    TResult? Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        idle,
    TResult? Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        panning,
    TResult? Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        scaling,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        initial,
    TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        loading,
    TResult Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        animatingToIdle,
    TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        idle,
    TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        panning,
    TResult Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        scaling,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AnimatingToIdle value) animatingToIdle,
    required TResult Function(_Idle value) idle,
    required TResult Function(_Panning value) panning,
    required TResult Function(_Scaling value) scaling,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AnimatingToIdle value)? animatingToIdle,
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Panning value)? panning,
    TResult? Function(_Scaling value)? scaling,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AnimatingToIdle value)? animatingToIdle,
    TResult Function(_Idle value)? idle,
    TResult Function(_Panning value)? panning,
    TResult Function(_Scaling value)? scaling,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of DiagramViewerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiagramViewerStateCopyWith<DiagramViewerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagramViewerStateCopyWith<$Res> {
  factory $DiagramViewerStateCopyWith(
          DiagramViewerState value, $Res Function(DiagramViewerState) then) =
      _$DiagramViewerStateCopyWithImpl<$Res, DiagramViewerState>;
  @useResult
  $Res call(
      {Matrix4 matrix,
      Size viewportSize,
      Rect diagramRect,
      List<DiagramObjectEntity> content,
      List<DiagramObjectEntity> selectedObjects});
}

/// @nodoc
class _$DiagramViewerStateCopyWithImpl<$Res, $Val extends DiagramViewerState>
    implements $DiagramViewerStateCopyWith<$Res> {
  _$DiagramViewerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiagramViewerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matrix = null,
    Object? viewportSize = null,
    Object? diagramRect = null,
    Object? content = null,
    Object? selectedObjects = null,
  }) {
    return _then(_value.copyWith(
      matrix: null == matrix
          ? _value.matrix
          : matrix // ignore: cast_nullable_to_non_nullable
              as Matrix4,
      viewportSize: null == viewportSize
          ? _value.viewportSize
          : viewportSize // ignore: cast_nullable_to_non_nullable
              as Size,
      diagramRect: null == diagramRect
          ? _value.diagramRect
          : diagramRect // ignore: cast_nullable_to_non_nullable
              as Rect,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
      selectedObjects: null == selectedObjects
          ? _value.selectedObjects
          : selectedObjects // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $DiagramViewerStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Matrix4 matrix,
      Size viewportSize,
      Rect diagramRect,
      List<DiagramObjectEntity> content,
      List<DiagramObjectEntity> selectedObjects});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$DiagramViewerStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramViewerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matrix = null,
    Object? viewportSize = null,
    Object? diagramRect = null,
    Object? content = null,
    Object? selectedObjects = null,
  }) {
    return _then(_$InitialImpl(
      matrix: null == matrix
          ? _value.matrix
          : matrix // ignore: cast_nullable_to_non_nullable
              as Matrix4,
      viewportSize: null == viewportSize
          ? _value.viewportSize
          : viewportSize // ignore: cast_nullable_to_non_nullable
              as Size,
      diagramRect: null == diagramRect
          ? _value.diagramRect
          : diagramRect // ignore: cast_nullable_to_non_nullable
              as Rect,
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
      selectedObjects: null == selectedObjects
          ? _value._selectedObjects
          : selectedObjects // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  _$InitialImpl(
      {required this.matrix,
      this.viewportSize = Size.zero,
      this.diagramRect = Rect.zero,
      final List<DiagramObjectEntity> content = const [],
      final List<DiagramObjectEntity> selectedObjects = const []})
      : _content = content,
        _selectedObjects = selectedObjects;

  @override
  final Matrix4 matrix;
  @override
  @JsonKey()
  final Size viewportSize;
  @override
  @JsonKey()
  final Rect diagramRect;
  final List<DiagramObjectEntity> _content;
  @override
  @JsonKey()
  List<DiagramObjectEntity> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  final List<DiagramObjectEntity> _selectedObjects;
  @override
  @JsonKey()
  List<DiagramObjectEntity> get selectedObjects {
    if (_selectedObjects is EqualUnmodifiableListView) return _selectedObjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedObjects);
  }

  @override
  String toString() {
    return 'DiagramViewerState.initial(matrix: $matrix, viewportSize: $viewportSize, diagramRect: $diagramRect, content: $content, selectedObjects: $selectedObjects)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.matrix, matrix) || other.matrix == matrix) &&
            (identical(other.viewportSize, viewportSize) ||
                other.viewportSize == viewportSize) &&
            (identical(other.diagramRect, diagramRect) ||
                other.diagramRect == diagramRect) &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            const DeepCollectionEquality()
                .equals(other._selectedObjects, _selectedObjects));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      matrix,
      viewportSize,
      diagramRect,
      const DeepCollectionEquality().hash(_content),
      const DeepCollectionEquality().hash(_selectedObjects));

  /// Create a copy of DiagramViewerState
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
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        initial,
    required TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        loading,
    required TResult Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        animatingToIdle,
    required TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        idle,
    required TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        panning,
    required TResult Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        scaling,
  }) {
    return initial(matrix, viewportSize, diagramRect, content, selectedObjects);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        initial,
    TResult? Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        loading,
    TResult? Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        animatingToIdle,
    TResult? Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        idle,
    TResult? Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        panning,
    TResult? Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        scaling,
  }) {
    return initial?.call(
        matrix, viewportSize, diagramRect, content, selectedObjects);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        initial,
    TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        loading,
    TResult Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        animatingToIdle,
    TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        idle,
    TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        panning,
    TResult Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        scaling,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
          matrix, viewportSize, diagramRect, content, selectedObjects);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AnimatingToIdle value) animatingToIdle,
    required TResult Function(_Idle value) idle,
    required TResult Function(_Panning value) panning,
    required TResult Function(_Scaling value) scaling,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AnimatingToIdle value)? animatingToIdle,
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Panning value)? panning,
    TResult? Function(_Scaling value)? scaling,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AnimatingToIdle value)? animatingToIdle,
    TResult Function(_Idle value)? idle,
    TResult Function(_Panning value)? panning,
    TResult Function(_Scaling value)? scaling,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements DiagramViewerState {
  factory _Initial(
      {required final Matrix4 matrix,
      final Size viewportSize,
      final Rect diagramRect,
      final List<DiagramObjectEntity> content,
      final List<DiagramObjectEntity> selectedObjects}) = _$InitialImpl;

  @override
  Matrix4 get matrix;
  @override
  Size get viewportSize;
  @override
  Rect get diagramRect;
  @override
  List<DiagramObjectEntity> get content;
  @override
  List<DiagramObjectEntity> get selectedObjects;

  /// Create a copy of DiagramViewerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res>
    implements $DiagramViewerStateCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Matrix4 matrix,
      Size viewportSize,
      Rect diagramRect,
      List<DiagramObjectEntity> content,
      List<DiagramObjectEntity> selectedObjects});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$DiagramViewerStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramViewerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matrix = null,
    Object? viewportSize = null,
    Object? diagramRect = null,
    Object? content = null,
    Object? selectedObjects = null,
  }) {
    return _then(_$LoadingImpl(
      matrix: null == matrix
          ? _value.matrix
          : matrix // ignore: cast_nullable_to_non_nullable
              as Matrix4,
      viewportSize: null == viewportSize
          ? _value.viewportSize
          : viewportSize // ignore: cast_nullable_to_non_nullable
              as Size,
      diagramRect: null == diagramRect
          ? _value.diagramRect
          : diagramRect // ignore: cast_nullable_to_non_nullable
              as Rect,
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
      selectedObjects: null == selectedObjects
          ? _value._selectedObjects
          : selectedObjects // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl(
      {required this.matrix,
      required this.viewportSize,
      required this.diagramRect,
      required final List<DiagramObjectEntity> content,
      required final List<DiagramObjectEntity> selectedObjects})
      : _content = content,
        _selectedObjects = selectedObjects;

  @override
  final Matrix4 matrix;
  @override
  final Size viewportSize;
  @override
  final Rect diagramRect;
  final List<DiagramObjectEntity> _content;
  @override
  List<DiagramObjectEntity> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  final List<DiagramObjectEntity> _selectedObjects;
  @override
  List<DiagramObjectEntity> get selectedObjects {
    if (_selectedObjects is EqualUnmodifiableListView) return _selectedObjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedObjects);
  }

  @override
  String toString() {
    return 'DiagramViewerState.loading(matrix: $matrix, viewportSize: $viewportSize, diagramRect: $diagramRect, content: $content, selectedObjects: $selectedObjects)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            (identical(other.matrix, matrix) || other.matrix == matrix) &&
            (identical(other.viewportSize, viewportSize) ||
                other.viewportSize == viewportSize) &&
            (identical(other.diagramRect, diagramRect) ||
                other.diagramRect == diagramRect) &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            const DeepCollectionEquality()
                .equals(other._selectedObjects, _selectedObjects));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      matrix,
      viewportSize,
      diagramRect,
      const DeepCollectionEquality().hash(_content),
      const DeepCollectionEquality().hash(_selectedObjects));

  /// Create a copy of DiagramViewerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        initial,
    required TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        loading,
    required TResult Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        animatingToIdle,
    required TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        idle,
    required TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        panning,
    required TResult Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        scaling,
  }) {
    return loading(matrix, viewportSize, diagramRect, content, selectedObjects);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        initial,
    TResult? Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        loading,
    TResult? Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        animatingToIdle,
    TResult? Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        idle,
    TResult? Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        panning,
    TResult? Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        scaling,
  }) {
    return loading?.call(
        matrix, viewportSize, diagramRect, content, selectedObjects);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        initial,
    TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        loading,
    TResult Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        animatingToIdle,
    TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        idle,
    TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        panning,
    TResult Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        scaling,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(
          matrix, viewportSize, diagramRect, content, selectedObjects);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AnimatingToIdle value) animatingToIdle,
    required TResult Function(_Idle value) idle,
    required TResult Function(_Panning value) panning,
    required TResult Function(_Scaling value) scaling,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AnimatingToIdle value)? animatingToIdle,
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Panning value)? panning,
    TResult? Function(_Scaling value)? scaling,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AnimatingToIdle value)? animatingToIdle,
    TResult Function(_Idle value)? idle,
    TResult Function(_Panning value)? panning,
    TResult Function(_Scaling value)? scaling,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements DiagramViewerState {
  const factory _Loading(
          {required final Matrix4 matrix,
          required final Size viewportSize,
          required final Rect diagramRect,
          required final List<DiagramObjectEntity> content,
          required final List<DiagramObjectEntity> selectedObjects}) =
      _$LoadingImpl;

  @override
  Matrix4 get matrix;
  @override
  Size get viewportSize;
  @override
  Rect get diagramRect;
  @override
  List<DiagramObjectEntity> get content;
  @override
  List<DiagramObjectEntity> get selectedObjects;

  /// Create a copy of DiagramViewerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AnimatingToIdleImplCopyWith<$Res>
    implements $DiagramViewerStateCopyWith<$Res> {
  factory _$$AnimatingToIdleImplCopyWith(_$AnimatingToIdleImpl value,
          $Res Function(_$AnimatingToIdleImpl) then) =
      __$$AnimatingToIdleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Matrix4 matrix,
      Matrix4 oldMatrix,
      Size viewportSize,
      Rect diagramRect,
      List<DiagramObjectEntity> content,
      List<DiagramObjectEntity> selectedObjects});
}

/// @nodoc
class __$$AnimatingToIdleImplCopyWithImpl<$Res>
    extends _$DiagramViewerStateCopyWithImpl<$Res, _$AnimatingToIdleImpl>
    implements _$$AnimatingToIdleImplCopyWith<$Res> {
  __$$AnimatingToIdleImplCopyWithImpl(
      _$AnimatingToIdleImpl _value, $Res Function(_$AnimatingToIdleImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramViewerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matrix = null,
    Object? oldMatrix = null,
    Object? viewportSize = null,
    Object? diagramRect = null,
    Object? content = null,
    Object? selectedObjects = null,
  }) {
    return _then(_$AnimatingToIdleImpl(
      matrix: null == matrix
          ? _value.matrix
          : matrix // ignore: cast_nullable_to_non_nullable
              as Matrix4,
      oldMatrix: null == oldMatrix
          ? _value.oldMatrix
          : oldMatrix // ignore: cast_nullable_to_non_nullable
              as Matrix4,
      viewportSize: null == viewportSize
          ? _value.viewportSize
          : viewportSize // ignore: cast_nullable_to_non_nullable
              as Size,
      diagramRect: null == diagramRect
          ? _value.diagramRect
          : diagramRect // ignore: cast_nullable_to_non_nullable
              as Rect,
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
      selectedObjects: null == selectedObjects
          ? _value._selectedObjects
          : selectedObjects // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
    ));
  }
}

/// @nodoc

class _$AnimatingToIdleImpl implements _AnimatingToIdle {
  const _$AnimatingToIdleImpl(
      {required this.matrix,
      required this.oldMatrix,
      required this.viewportSize,
      required this.diagramRect,
      required final List<DiagramObjectEntity> content,
      required final List<DiagramObjectEntity> selectedObjects})
      : _content = content,
        _selectedObjects = selectedObjects;

  @override
  final Matrix4 matrix;
  @override
  final Matrix4 oldMatrix;
  @override
  final Size viewportSize;
  @override
  final Rect diagramRect;
  final List<DiagramObjectEntity> _content;
  @override
  List<DiagramObjectEntity> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  final List<DiagramObjectEntity> _selectedObjects;
  @override
  List<DiagramObjectEntity> get selectedObjects {
    if (_selectedObjects is EqualUnmodifiableListView) return _selectedObjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedObjects);
  }

  @override
  String toString() {
    return 'DiagramViewerState.animatingToIdle(matrix: $matrix, oldMatrix: $oldMatrix, viewportSize: $viewportSize, diagramRect: $diagramRect, content: $content, selectedObjects: $selectedObjects)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimatingToIdleImpl &&
            (identical(other.matrix, matrix) || other.matrix == matrix) &&
            (identical(other.oldMatrix, oldMatrix) ||
                other.oldMatrix == oldMatrix) &&
            (identical(other.viewportSize, viewportSize) ||
                other.viewportSize == viewportSize) &&
            (identical(other.diagramRect, diagramRect) ||
                other.diagramRect == diagramRect) &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            const DeepCollectionEquality()
                .equals(other._selectedObjects, _selectedObjects));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      matrix,
      oldMatrix,
      viewportSize,
      diagramRect,
      const DeepCollectionEquality().hash(_content),
      const DeepCollectionEquality().hash(_selectedObjects));

  /// Create a copy of DiagramViewerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimatingToIdleImplCopyWith<_$AnimatingToIdleImpl> get copyWith =>
      __$$AnimatingToIdleImplCopyWithImpl<_$AnimatingToIdleImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        initial,
    required TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        loading,
    required TResult Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        animatingToIdle,
    required TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        idle,
    required TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        panning,
    required TResult Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        scaling,
  }) {
    return animatingToIdle(
        matrix, oldMatrix, viewportSize, diagramRect, content, selectedObjects);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        initial,
    TResult? Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        loading,
    TResult? Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        animatingToIdle,
    TResult? Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        idle,
    TResult? Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        panning,
    TResult? Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        scaling,
  }) {
    return animatingToIdle?.call(
        matrix, oldMatrix, viewportSize, diagramRect, content, selectedObjects);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        initial,
    TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        loading,
    TResult Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        animatingToIdle,
    TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        idle,
    TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        panning,
    TResult Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        scaling,
    required TResult orElse(),
  }) {
    if (animatingToIdle != null) {
      return animatingToIdle(matrix, oldMatrix, viewportSize, diagramRect,
          content, selectedObjects);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AnimatingToIdle value) animatingToIdle,
    required TResult Function(_Idle value) idle,
    required TResult Function(_Panning value) panning,
    required TResult Function(_Scaling value) scaling,
  }) {
    return animatingToIdle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AnimatingToIdle value)? animatingToIdle,
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Panning value)? panning,
    TResult? Function(_Scaling value)? scaling,
  }) {
    return animatingToIdle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AnimatingToIdle value)? animatingToIdle,
    TResult Function(_Idle value)? idle,
    TResult Function(_Panning value)? panning,
    TResult Function(_Scaling value)? scaling,
    required TResult orElse(),
  }) {
    if (animatingToIdle != null) {
      return animatingToIdle(this);
    }
    return orElse();
  }
}

abstract class _AnimatingToIdle implements DiagramViewerState {
  const factory _AnimatingToIdle(
          {required final Matrix4 matrix,
          required final Matrix4 oldMatrix,
          required final Size viewportSize,
          required final Rect diagramRect,
          required final List<DiagramObjectEntity> content,
          required final List<DiagramObjectEntity> selectedObjects}) =
      _$AnimatingToIdleImpl;

  @override
  Matrix4 get matrix;
  Matrix4 get oldMatrix;
  @override
  Size get viewportSize;
  @override
  Rect get diagramRect;
  @override
  List<DiagramObjectEntity> get content;
  @override
  List<DiagramObjectEntity> get selectedObjects;

  /// Create a copy of DiagramViewerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnimatingToIdleImplCopyWith<_$AnimatingToIdleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IdleImplCopyWith<$Res>
    implements $DiagramViewerStateCopyWith<$Res> {
  factory _$$IdleImplCopyWith(
          _$IdleImpl value, $Res Function(_$IdleImpl) then) =
      __$$IdleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Matrix4 matrix,
      Size viewportSize,
      Rect diagramRect,
      List<DiagramObjectEntity> content,
      List<DiagramObjectEntity> selectedObjects});
}

/// @nodoc
class __$$IdleImplCopyWithImpl<$Res>
    extends _$DiagramViewerStateCopyWithImpl<$Res, _$IdleImpl>
    implements _$$IdleImplCopyWith<$Res> {
  __$$IdleImplCopyWithImpl(_$IdleImpl _value, $Res Function(_$IdleImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramViewerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matrix = null,
    Object? viewportSize = null,
    Object? diagramRect = null,
    Object? content = null,
    Object? selectedObjects = null,
  }) {
    return _then(_$IdleImpl(
      matrix: null == matrix
          ? _value.matrix
          : matrix // ignore: cast_nullable_to_non_nullable
              as Matrix4,
      viewportSize: null == viewportSize
          ? _value.viewportSize
          : viewportSize // ignore: cast_nullable_to_non_nullable
              as Size,
      diagramRect: null == diagramRect
          ? _value.diagramRect
          : diagramRect // ignore: cast_nullable_to_non_nullable
              as Rect,
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
      selectedObjects: null == selectedObjects
          ? _value._selectedObjects
          : selectedObjects // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
    ));
  }
}

/// @nodoc

class _$IdleImpl implements _Idle {
  const _$IdleImpl(
      {required this.matrix,
      required this.viewportSize,
      required this.diagramRect,
      required final List<DiagramObjectEntity> content,
      required final List<DiagramObjectEntity> selectedObjects})
      : _content = content,
        _selectedObjects = selectedObjects;

  @override
  final Matrix4 matrix;
  @override
  final Size viewportSize;
  @override
  final Rect diagramRect;
  final List<DiagramObjectEntity> _content;
  @override
  List<DiagramObjectEntity> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  final List<DiagramObjectEntity> _selectedObjects;
  @override
  List<DiagramObjectEntity> get selectedObjects {
    if (_selectedObjects is EqualUnmodifiableListView) return _selectedObjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedObjects);
  }

  @override
  String toString() {
    return 'DiagramViewerState.idle(matrix: $matrix, viewportSize: $viewportSize, diagramRect: $diagramRect, content: $content, selectedObjects: $selectedObjects)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IdleImpl &&
            (identical(other.matrix, matrix) || other.matrix == matrix) &&
            (identical(other.viewportSize, viewportSize) ||
                other.viewportSize == viewportSize) &&
            (identical(other.diagramRect, diagramRect) ||
                other.diagramRect == diagramRect) &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            const DeepCollectionEquality()
                .equals(other._selectedObjects, _selectedObjects));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      matrix,
      viewportSize,
      diagramRect,
      const DeepCollectionEquality().hash(_content),
      const DeepCollectionEquality().hash(_selectedObjects));

  /// Create a copy of DiagramViewerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IdleImplCopyWith<_$IdleImpl> get copyWith =>
      __$$IdleImplCopyWithImpl<_$IdleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        initial,
    required TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        loading,
    required TResult Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        animatingToIdle,
    required TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        idle,
    required TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        panning,
    required TResult Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        scaling,
  }) {
    return idle(matrix, viewportSize, diagramRect, content, selectedObjects);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        initial,
    TResult? Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        loading,
    TResult? Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        animatingToIdle,
    TResult? Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        idle,
    TResult? Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        panning,
    TResult? Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        scaling,
  }) {
    return idle?.call(
        matrix, viewportSize, diagramRect, content, selectedObjects);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        initial,
    TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        loading,
    TResult Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        animatingToIdle,
    TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        idle,
    TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        panning,
    TResult Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        scaling,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(matrix, viewportSize, diagramRect, content, selectedObjects);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AnimatingToIdle value) animatingToIdle,
    required TResult Function(_Idle value) idle,
    required TResult Function(_Panning value) panning,
    required TResult Function(_Scaling value) scaling,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AnimatingToIdle value)? animatingToIdle,
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Panning value)? panning,
    TResult? Function(_Scaling value)? scaling,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AnimatingToIdle value)? animatingToIdle,
    TResult Function(_Idle value)? idle,
    TResult Function(_Panning value)? panning,
    TResult Function(_Scaling value)? scaling,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _Idle implements DiagramViewerState {
  const factory _Idle(
      {required final Matrix4 matrix,
      required final Size viewportSize,
      required final Rect diagramRect,
      required final List<DiagramObjectEntity> content,
      required final List<DiagramObjectEntity> selectedObjects}) = _$IdleImpl;

  @override
  Matrix4 get matrix;
  @override
  Size get viewportSize;
  @override
  Rect get diagramRect;
  @override
  List<DiagramObjectEntity> get content;
  @override
  List<DiagramObjectEntity> get selectedObjects;

  /// Create a copy of DiagramViewerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IdleImplCopyWith<_$IdleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PanningImplCopyWith<$Res>
    implements $DiagramViewerStateCopyWith<$Res> {
  factory _$$PanningImplCopyWith(
          _$PanningImpl value, $Res Function(_$PanningImpl) then) =
      __$$PanningImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Matrix4 matrix,
      Size viewportSize,
      Rect diagramRect,
      List<DiagramObjectEntity> content,
      List<DiagramObjectEntity> selectedObjects});
}

/// @nodoc
class __$$PanningImplCopyWithImpl<$Res>
    extends _$DiagramViewerStateCopyWithImpl<$Res, _$PanningImpl>
    implements _$$PanningImplCopyWith<$Res> {
  __$$PanningImplCopyWithImpl(
      _$PanningImpl _value, $Res Function(_$PanningImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramViewerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matrix = null,
    Object? viewportSize = null,
    Object? diagramRect = null,
    Object? content = null,
    Object? selectedObjects = null,
  }) {
    return _then(_$PanningImpl(
      matrix: null == matrix
          ? _value.matrix
          : matrix // ignore: cast_nullable_to_non_nullable
              as Matrix4,
      viewportSize: null == viewportSize
          ? _value.viewportSize
          : viewportSize // ignore: cast_nullable_to_non_nullable
              as Size,
      diagramRect: null == diagramRect
          ? _value.diagramRect
          : diagramRect // ignore: cast_nullable_to_non_nullable
              as Rect,
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
      selectedObjects: null == selectedObjects
          ? _value._selectedObjects
          : selectedObjects // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
    ));
  }
}

/// @nodoc

class _$PanningImpl implements _Panning {
  const _$PanningImpl(
      {required this.matrix,
      required this.viewportSize,
      required this.diagramRect,
      required final List<DiagramObjectEntity> content,
      required final List<DiagramObjectEntity> selectedObjects})
      : _content = content,
        _selectedObjects = selectedObjects;

  @override
  final Matrix4 matrix;
  @override
  final Size viewportSize;
  @override
  final Rect diagramRect;
  final List<DiagramObjectEntity> _content;
  @override
  List<DiagramObjectEntity> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  final List<DiagramObjectEntity> _selectedObjects;
  @override
  List<DiagramObjectEntity> get selectedObjects {
    if (_selectedObjects is EqualUnmodifiableListView) return _selectedObjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedObjects);
  }

  @override
  String toString() {
    return 'DiagramViewerState.panning(matrix: $matrix, viewportSize: $viewportSize, diagramRect: $diagramRect, content: $content, selectedObjects: $selectedObjects)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PanningImpl &&
            (identical(other.matrix, matrix) || other.matrix == matrix) &&
            (identical(other.viewportSize, viewportSize) ||
                other.viewportSize == viewportSize) &&
            (identical(other.diagramRect, diagramRect) ||
                other.diagramRect == diagramRect) &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            const DeepCollectionEquality()
                .equals(other._selectedObjects, _selectedObjects));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      matrix,
      viewportSize,
      diagramRect,
      const DeepCollectionEquality().hash(_content),
      const DeepCollectionEquality().hash(_selectedObjects));

  /// Create a copy of DiagramViewerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PanningImplCopyWith<_$PanningImpl> get copyWith =>
      __$$PanningImplCopyWithImpl<_$PanningImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        initial,
    required TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        loading,
    required TResult Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        animatingToIdle,
    required TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        idle,
    required TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        panning,
    required TResult Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        scaling,
  }) {
    return panning(matrix, viewportSize, diagramRect, content, selectedObjects);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        initial,
    TResult? Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        loading,
    TResult? Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        animatingToIdle,
    TResult? Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        idle,
    TResult? Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        panning,
    TResult? Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        scaling,
  }) {
    return panning?.call(
        matrix, viewportSize, diagramRect, content, selectedObjects);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        initial,
    TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        loading,
    TResult Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        animatingToIdle,
    TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        idle,
    TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        panning,
    TResult Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        scaling,
    required TResult orElse(),
  }) {
    if (panning != null) {
      return panning(
          matrix, viewportSize, diagramRect, content, selectedObjects);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AnimatingToIdle value) animatingToIdle,
    required TResult Function(_Idle value) idle,
    required TResult Function(_Panning value) panning,
    required TResult Function(_Scaling value) scaling,
  }) {
    return panning(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AnimatingToIdle value)? animatingToIdle,
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Panning value)? panning,
    TResult? Function(_Scaling value)? scaling,
  }) {
    return panning?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AnimatingToIdle value)? animatingToIdle,
    TResult Function(_Idle value)? idle,
    TResult Function(_Panning value)? panning,
    TResult Function(_Scaling value)? scaling,
    required TResult orElse(),
  }) {
    if (panning != null) {
      return panning(this);
    }
    return orElse();
  }
}

abstract class _Panning implements DiagramViewerState {
  const factory _Panning(
          {required final Matrix4 matrix,
          required final Size viewportSize,
          required final Rect diagramRect,
          required final List<DiagramObjectEntity> content,
          required final List<DiagramObjectEntity> selectedObjects}) =
      _$PanningImpl;

  @override
  Matrix4 get matrix;
  @override
  Size get viewportSize;
  @override
  Rect get diagramRect;
  @override
  List<DiagramObjectEntity> get content;
  @override
  List<DiagramObjectEntity> get selectedObjects;

  /// Create a copy of DiagramViewerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PanningImplCopyWith<_$PanningImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ScalingImplCopyWith<$Res>
    implements $DiagramViewerStateCopyWith<$Res> {
  factory _$$ScalingImplCopyWith(
          _$ScalingImpl value, $Res Function(_$ScalingImpl) then) =
      __$$ScalingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Matrix4 matrix,
      Matrix4 oldMatrix,
      Size viewportSize,
      Rect diagramRect,
      List<DiagramObjectEntity> content,
      List<DiagramObjectEntity> selectedObjects});
}

/// @nodoc
class __$$ScalingImplCopyWithImpl<$Res>
    extends _$DiagramViewerStateCopyWithImpl<$Res, _$ScalingImpl>
    implements _$$ScalingImplCopyWith<$Res> {
  __$$ScalingImplCopyWithImpl(
      _$ScalingImpl _value, $Res Function(_$ScalingImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramViewerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? matrix = null,
    Object? oldMatrix = null,
    Object? viewportSize = null,
    Object? diagramRect = null,
    Object? content = null,
    Object? selectedObjects = null,
  }) {
    return _then(_$ScalingImpl(
      matrix: null == matrix
          ? _value.matrix
          : matrix // ignore: cast_nullable_to_non_nullable
              as Matrix4,
      oldMatrix: null == oldMatrix
          ? _value.oldMatrix
          : oldMatrix // ignore: cast_nullable_to_non_nullable
              as Matrix4,
      viewportSize: null == viewportSize
          ? _value.viewportSize
          : viewportSize // ignore: cast_nullable_to_non_nullable
              as Size,
      diagramRect: null == diagramRect
          ? _value.diagramRect
          : diagramRect // ignore: cast_nullable_to_non_nullable
              as Rect,
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
      selectedObjects: null == selectedObjects
          ? _value._selectedObjects
          : selectedObjects // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
    ));
  }
}

/// @nodoc

class _$ScalingImpl implements _Scaling {
  const _$ScalingImpl(
      {required this.matrix,
      required this.oldMatrix,
      required this.viewportSize,
      required this.diagramRect,
      required final List<DiagramObjectEntity> content,
      required final List<DiagramObjectEntity> selectedObjects})
      : _content = content,
        _selectedObjects = selectedObjects;

  @override
  final Matrix4 matrix;
  @override
  final Matrix4 oldMatrix;
  @override
  final Size viewportSize;
  @override
  final Rect diagramRect;
  final List<DiagramObjectEntity> _content;
  @override
  List<DiagramObjectEntity> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  final List<DiagramObjectEntity> _selectedObjects;
  @override
  List<DiagramObjectEntity> get selectedObjects {
    if (_selectedObjects is EqualUnmodifiableListView) return _selectedObjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedObjects);
  }

  @override
  String toString() {
    return 'DiagramViewerState.scaling(matrix: $matrix, oldMatrix: $oldMatrix, viewportSize: $viewportSize, diagramRect: $diagramRect, content: $content, selectedObjects: $selectedObjects)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScalingImpl &&
            (identical(other.matrix, matrix) || other.matrix == matrix) &&
            (identical(other.oldMatrix, oldMatrix) ||
                other.oldMatrix == oldMatrix) &&
            (identical(other.viewportSize, viewportSize) ||
                other.viewportSize == viewportSize) &&
            (identical(other.diagramRect, diagramRect) ||
                other.diagramRect == diagramRect) &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            const DeepCollectionEquality()
                .equals(other._selectedObjects, _selectedObjects));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      matrix,
      oldMatrix,
      viewportSize,
      diagramRect,
      const DeepCollectionEquality().hash(_content),
      const DeepCollectionEquality().hash(_selectedObjects));

  /// Create a copy of DiagramViewerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScalingImplCopyWith<_$ScalingImpl> get copyWith =>
      __$$ScalingImplCopyWithImpl<_$ScalingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        initial,
    required TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        loading,
    required TResult Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        animatingToIdle,
    required TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        idle,
    required TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        panning,
    required TResult Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)
        scaling,
  }) {
    return scaling(
        matrix, oldMatrix, viewportSize, diagramRect, content, selectedObjects);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        initial,
    TResult? Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        loading,
    TResult? Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        animatingToIdle,
    TResult? Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        idle,
    TResult? Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        panning,
    TResult? Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        scaling,
  }) {
    return scaling?.call(
        matrix, oldMatrix, viewportSize, diagramRect, content, selectedObjects);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        initial,
    TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        loading,
    TResult Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        animatingToIdle,
    TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        idle,
    TResult Function(
            Matrix4 matrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        panning,
    TResult Function(
            Matrix4 matrix,
            Matrix4 oldMatrix,
            Size viewportSize,
            Rect diagramRect,
            List<DiagramObjectEntity> content,
            List<DiagramObjectEntity> selectedObjects)?
        scaling,
    required TResult orElse(),
  }) {
    if (scaling != null) {
      return scaling(matrix, oldMatrix, viewportSize, diagramRect, content,
          selectedObjects);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AnimatingToIdle value) animatingToIdle,
    required TResult Function(_Idle value) idle,
    required TResult Function(_Panning value) panning,
    required TResult Function(_Scaling value) scaling,
  }) {
    return scaling(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AnimatingToIdle value)? animatingToIdle,
    TResult? Function(_Idle value)? idle,
    TResult? Function(_Panning value)? panning,
    TResult? Function(_Scaling value)? scaling,
  }) {
    return scaling?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AnimatingToIdle value)? animatingToIdle,
    TResult Function(_Idle value)? idle,
    TResult Function(_Panning value)? panning,
    TResult Function(_Scaling value)? scaling,
    required TResult orElse(),
  }) {
    if (scaling != null) {
      return scaling(this);
    }
    return orElse();
  }
}

abstract class _Scaling implements DiagramViewerState {
  const factory _Scaling(
          {required final Matrix4 matrix,
          required final Matrix4 oldMatrix,
          required final Size viewportSize,
          required final Rect diagramRect,
          required final List<DiagramObjectEntity> content,
          required final List<DiagramObjectEntity> selectedObjects}) =
      _$ScalingImpl;

  @override
  Matrix4 get matrix;
  Matrix4 get oldMatrix;
  @override
  Size get viewportSize;
  @override
  Rect get diagramRect;
  @override
  List<DiagramObjectEntity> get content;
  @override
  List<DiagramObjectEntity> get selectedObjects;

  /// Create a copy of DiagramViewerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScalingImplCopyWith<_$ScalingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
