// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diagram_command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DiagramCommand {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhysicalEvent origin) applyDefaultPanZoom,
    required TResult Function(Transform2D transform) setTransform,
    required TResult Function(
            List<DiagramObjectEntity> renderables, Rect logicalExtent)
        redraw,
    required TResult Function(Transform2D targetTransform, Duration duration)
        elasticBounceBack,
    required TResult Function(Offset velocity, Duration stepDuration)
        autoScrollStep,
    required TResult Function() stopAutoScroll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult? Function(Transform2D transform)? setTransform,
    TResult? Function(
            List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult? Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult? Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult? Function()? stopAutoScroll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult Function(Transform2D transform)? setTransform,
    TResult Function(List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult Function()? stopAutoScroll,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApplyDefaultPanZoomCommand value)
        applyDefaultPanZoom,
    required TResult Function(SetTransformCommand value) setTransform,
    required TResult Function(RedrawCommand value) redraw,
    required TResult Function(ElasticBounceBackCommand value) elasticBounceBack,
    required TResult Function(AutoScrollStepCommand value) autoScrollStep,
    required TResult Function(StopAutoScrollCommand value) stopAutoScroll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult? Function(SetTransformCommand value)? setTransform,
    TResult? Function(RedrawCommand value)? redraw,
    TResult? Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult? Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult? Function(StopAutoScrollCommand value)? stopAutoScroll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult Function(SetTransformCommand value)? setTransform,
    TResult Function(RedrawCommand value)? redraw,
    TResult Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult Function(StopAutoScrollCommand value)? stopAutoScroll,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiagramCommandCopyWith<$Res> {
  factory $DiagramCommandCopyWith(
          DiagramCommand value, $Res Function(DiagramCommand) then) =
      _$DiagramCommandCopyWithImpl<$Res, DiagramCommand>;
}

/// @nodoc
class _$DiagramCommandCopyWithImpl<$Res, $Val extends DiagramCommand>
    implements $DiagramCommandCopyWith<$Res> {
  _$DiagramCommandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ApplyDefaultPanZoomCommandImplCopyWith<$Res> {
  factory _$$ApplyDefaultPanZoomCommandImplCopyWith(
          _$ApplyDefaultPanZoomCommandImpl value,
          $Res Function(_$ApplyDefaultPanZoomCommandImpl) then) =
      __$$ApplyDefaultPanZoomCommandImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PhysicalEvent origin});

  $PhysicalEventCopyWith<$Res> get origin;
}

/// @nodoc
class __$$ApplyDefaultPanZoomCommandImplCopyWithImpl<$Res>
    extends _$DiagramCommandCopyWithImpl<$Res, _$ApplyDefaultPanZoomCommandImpl>
    implements _$$ApplyDefaultPanZoomCommandImplCopyWith<$Res> {
  __$$ApplyDefaultPanZoomCommandImplCopyWithImpl(
      _$ApplyDefaultPanZoomCommandImpl _value,
      $Res Function(_$ApplyDefaultPanZoomCommandImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? origin = null,
  }) {
    return _then(_$ApplyDefaultPanZoomCommandImpl(
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as PhysicalEvent,
    ));
  }

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PhysicalEventCopyWith<$Res> get origin {
    return $PhysicalEventCopyWith<$Res>(_value.origin, (value) {
      return _then(_value.copyWith(origin: value));
    });
  }
}

/// @nodoc

class _$ApplyDefaultPanZoomCommandImpl extends ApplyDefaultPanZoomCommand {
  const _$ApplyDefaultPanZoomCommandImpl({required this.origin}) : super._();

  @override
  final PhysicalEvent origin;

  @override
  String toString() {
    return 'DiagramCommand.applyDefaultPanZoom(origin: $origin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplyDefaultPanZoomCommandImpl &&
            (identical(other.origin, origin) || other.origin == origin));
  }

  @override
  int get hashCode => Object.hash(runtimeType, origin);

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplyDefaultPanZoomCommandImplCopyWith<_$ApplyDefaultPanZoomCommandImpl>
      get copyWith => __$$ApplyDefaultPanZoomCommandImplCopyWithImpl<
          _$ApplyDefaultPanZoomCommandImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhysicalEvent origin) applyDefaultPanZoom,
    required TResult Function(Transform2D transform) setTransform,
    required TResult Function(
            List<DiagramObjectEntity> renderables, Rect logicalExtent)
        redraw,
    required TResult Function(Transform2D targetTransform, Duration duration)
        elasticBounceBack,
    required TResult Function(Offset velocity, Duration stepDuration)
        autoScrollStep,
    required TResult Function() stopAutoScroll,
  }) {
    return applyDefaultPanZoom(origin);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult? Function(Transform2D transform)? setTransform,
    TResult? Function(
            List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult? Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult? Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult? Function()? stopAutoScroll,
  }) {
    return applyDefaultPanZoom?.call(origin);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult Function(Transform2D transform)? setTransform,
    TResult Function(List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult Function()? stopAutoScroll,
    required TResult orElse(),
  }) {
    if (applyDefaultPanZoom != null) {
      return applyDefaultPanZoom(origin);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApplyDefaultPanZoomCommand value)
        applyDefaultPanZoom,
    required TResult Function(SetTransformCommand value) setTransform,
    required TResult Function(RedrawCommand value) redraw,
    required TResult Function(ElasticBounceBackCommand value) elasticBounceBack,
    required TResult Function(AutoScrollStepCommand value) autoScrollStep,
    required TResult Function(StopAutoScrollCommand value) stopAutoScroll,
  }) {
    return applyDefaultPanZoom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult? Function(SetTransformCommand value)? setTransform,
    TResult? Function(RedrawCommand value)? redraw,
    TResult? Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult? Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult? Function(StopAutoScrollCommand value)? stopAutoScroll,
  }) {
    return applyDefaultPanZoom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult Function(SetTransformCommand value)? setTransform,
    TResult Function(RedrawCommand value)? redraw,
    TResult Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult Function(StopAutoScrollCommand value)? stopAutoScroll,
    required TResult orElse(),
  }) {
    if (applyDefaultPanZoom != null) {
      return applyDefaultPanZoom(this);
    }
    return orElse();
  }
}

abstract class ApplyDefaultPanZoomCommand extends DiagramCommand {
  const factory ApplyDefaultPanZoomCommand(
      {required final PhysicalEvent origin}) = _$ApplyDefaultPanZoomCommandImpl;
  const ApplyDefaultPanZoomCommand._() : super._();

  PhysicalEvent get origin;

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApplyDefaultPanZoomCommandImplCopyWith<_$ApplyDefaultPanZoomCommandImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetTransformCommandImplCopyWith<$Res> {
  factory _$$SetTransformCommandImplCopyWith(_$SetTransformCommandImpl value,
          $Res Function(_$SetTransformCommandImpl) then) =
      __$$SetTransformCommandImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Transform2D transform});

  $Transform2DCopyWith<$Res> get transform;
}

/// @nodoc
class __$$SetTransformCommandImplCopyWithImpl<$Res>
    extends _$DiagramCommandCopyWithImpl<$Res, _$SetTransformCommandImpl>
    implements _$$SetTransformCommandImplCopyWith<$Res> {
  __$$SetTransformCommandImplCopyWithImpl(_$SetTransformCommandImpl _value,
      $Res Function(_$SetTransformCommandImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transform = null,
  }) {
    return _then(_$SetTransformCommandImpl(
      transform: null == transform
          ? _value.transform
          : transform // ignore: cast_nullable_to_non_nullable
              as Transform2D,
    ));
  }

  /// Create a copy of DiagramCommand
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

class _$SetTransformCommandImpl extends SetTransformCommand {
  const _$SetTransformCommandImpl({required this.transform}) : super._();

  @override
  final Transform2D transform;

  @override
  String toString() {
    return 'DiagramCommand.setTransform(transform: $transform)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetTransformCommandImpl &&
            (identical(other.transform, transform) ||
                other.transform == transform));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transform);

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetTransformCommandImplCopyWith<_$SetTransformCommandImpl> get copyWith =>
      __$$SetTransformCommandImplCopyWithImpl<_$SetTransformCommandImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhysicalEvent origin) applyDefaultPanZoom,
    required TResult Function(Transform2D transform) setTransform,
    required TResult Function(
            List<DiagramObjectEntity> renderables, Rect logicalExtent)
        redraw,
    required TResult Function(Transform2D targetTransform, Duration duration)
        elasticBounceBack,
    required TResult Function(Offset velocity, Duration stepDuration)
        autoScrollStep,
    required TResult Function() stopAutoScroll,
  }) {
    return setTransform(transform);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult? Function(Transform2D transform)? setTransform,
    TResult? Function(
            List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult? Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult? Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult? Function()? stopAutoScroll,
  }) {
    return setTransform?.call(transform);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult Function(Transform2D transform)? setTransform,
    TResult Function(List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult Function()? stopAutoScroll,
    required TResult orElse(),
  }) {
    if (setTransform != null) {
      return setTransform(transform);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApplyDefaultPanZoomCommand value)
        applyDefaultPanZoom,
    required TResult Function(SetTransformCommand value) setTransform,
    required TResult Function(RedrawCommand value) redraw,
    required TResult Function(ElasticBounceBackCommand value) elasticBounceBack,
    required TResult Function(AutoScrollStepCommand value) autoScrollStep,
    required TResult Function(StopAutoScrollCommand value) stopAutoScroll,
  }) {
    return setTransform(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult? Function(SetTransformCommand value)? setTransform,
    TResult? Function(RedrawCommand value)? redraw,
    TResult? Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult? Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult? Function(StopAutoScrollCommand value)? stopAutoScroll,
  }) {
    return setTransform?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult Function(SetTransformCommand value)? setTransform,
    TResult Function(RedrawCommand value)? redraw,
    TResult Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult Function(StopAutoScrollCommand value)? stopAutoScroll,
    required TResult orElse(),
  }) {
    if (setTransform != null) {
      return setTransform(this);
    }
    return orElse();
  }
}

abstract class SetTransformCommand extends DiagramCommand {
  const factory SetTransformCommand({required final Transform2D transform}) =
      _$SetTransformCommandImpl;
  const SetTransformCommand._() : super._();

  Transform2D get transform;

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetTransformCommandImplCopyWith<_$SetTransformCommandImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RedrawCommandImplCopyWith<$Res> {
  factory _$$RedrawCommandImplCopyWith(
          _$RedrawCommandImpl value, $Res Function(_$RedrawCommandImpl) then) =
      __$$RedrawCommandImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<DiagramObjectEntity> renderables, Rect logicalExtent});
}

/// @nodoc
class __$$RedrawCommandImplCopyWithImpl<$Res>
    extends _$DiagramCommandCopyWithImpl<$Res, _$RedrawCommandImpl>
    implements _$$RedrawCommandImplCopyWith<$Res> {
  __$$RedrawCommandImplCopyWithImpl(
      _$RedrawCommandImpl _value, $Res Function(_$RedrawCommandImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? renderables = null,
    Object? logicalExtent = null,
  }) {
    return _then(_$RedrawCommandImpl(
      renderables: null == renderables
          ? _value._renderables
          : renderables // ignore: cast_nullable_to_non_nullable
              as List<DiagramObjectEntity>,
      logicalExtent: null == logicalExtent
          ? _value.logicalExtent
          : logicalExtent // ignore: cast_nullable_to_non_nullable
              as Rect,
    ));
  }
}

/// @nodoc

class _$RedrawCommandImpl extends RedrawCommand {
  const _$RedrawCommandImpl(
      {required final List<DiagramObjectEntity> renderables,
      required this.logicalExtent})
      : _renderables = renderables,
        super._();

  final List<DiagramObjectEntity> _renderables;
  @override
  List<DiagramObjectEntity> get renderables {
    if (_renderables is EqualUnmodifiableListView) return _renderables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_renderables);
  }

  @override
  final Rect logicalExtent;

  @override
  String toString() {
    return 'DiagramCommand.redraw(renderables: $renderables, logicalExtent: $logicalExtent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RedrawCommandImpl &&
            const DeepCollectionEquality()
                .equals(other._renderables, _renderables) &&
            (identical(other.logicalExtent, logicalExtent) ||
                other.logicalExtent == logicalExtent));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_renderables), logicalExtent);

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RedrawCommandImplCopyWith<_$RedrawCommandImpl> get copyWith =>
      __$$RedrawCommandImplCopyWithImpl<_$RedrawCommandImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhysicalEvent origin) applyDefaultPanZoom,
    required TResult Function(Transform2D transform) setTransform,
    required TResult Function(
            List<DiagramObjectEntity> renderables, Rect logicalExtent)
        redraw,
    required TResult Function(Transform2D targetTransform, Duration duration)
        elasticBounceBack,
    required TResult Function(Offset velocity, Duration stepDuration)
        autoScrollStep,
    required TResult Function() stopAutoScroll,
  }) {
    return redraw(renderables, logicalExtent);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult? Function(Transform2D transform)? setTransform,
    TResult? Function(
            List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult? Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult? Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult? Function()? stopAutoScroll,
  }) {
    return redraw?.call(renderables, logicalExtent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult Function(Transform2D transform)? setTransform,
    TResult Function(List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult Function()? stopAutoScroll,
    required TResult orElse(),
  }) {
    if (redraw != null) {
      return redraw(renderables, logicalExtent);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApplyDefaultPanZoomCommand value)
        applyDefaultPanZoom,
    required TResult Function(SetTransformCommand value) setTransform,
    required TResult Function(RedrawCommand value) redraw,
    required TResult Function(ElasticBounceBackCommand value) elasticBounceBack,
    required TResult Function(AutoScrollStepCommand value) autoScrollStep,
    required TResult Function(StopAutoScrollCommand value) stopAutoScroll,
  }) {
    return redraw(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult? Function(SetTransformCommand value)? setTransform,
    TResult? Function(RedrawCommand value)? redraw,
    TResult? Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult? Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult? Function(StopAutoScrollCommand value)? stopAutoScroll,
  }) {
    return redraw?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult Function(SetTransformCommand value)? setTransform,
    TResult Function(RedrawCommand value)? redraw,
    TResult Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult Function(StopAutoScrollCommand value)? stopAutoScroll,
    required TResult orElse(),
  }) {
    if (redraw != null) {
      return redraw(this);
    }
    return orElse();
  }
}

abstract class RedrawCommand extends DiagramCommand {
  const factory RedrawCommand(
      {required final List<DiagramObjectEntity> renderables,
      required final Rect logicalExtent}) = _$RedrawCommandImpl;
  const RedrawCommand._() : super._();

  List<DiagramObjectEntity> get renderables;
  Rect get logicalExtent;

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RedrawCommandImplCopyWith<_$RedrawCommandImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ElasticBounceBackCommandImplCopyWith<$Res> {
  factory _$$ElasticBounceBackCommandImplCopyWith(
          _$ElasticBounceBackCommandImpl value,
          $Res Function(_$ElasticBounceBackCommandImpl) then) =
      __$$ElasticBounceBackCommandImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Transform2D targetTransform, Duration duration});

  $Transform2DCopyWith<$Res> get targetTransform;
}

/// @nodoc
class __$$ElasticBounceBackCommandImplCopyWithImpl<$Res>
    extends _$DiagramCommandCopyWithImpl<$Res, _$ElasticBounceBackCommandImpl>
    implements _$$ElasticBounceBackCommandImplCopyWith<$Res> {
  __$$ElasticBounceBackCommandImplCopyWithImpl(
      _$ElasticBounceBackCommandImpl _value,
      $Res Function(_$ElasticBounceBackCommandImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? targetTransform = null,
    Object? duration = null,
  }) {
    return _then(_$ElasticBounceBackCommandImpl(
      targetTransform: null == targetTransform
          ? _value.targetTransform
          : targetTransform // ignore: cast_nullable_to_non_nullable
              as Transform2D,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Transform2DCopyWith<$Res> get targetTransform {
    return $Transform2DCopyWith<$Res>(_value.targetTransform, (value) {
      return _then(_value.copyWith(targetTransform: value));
    });
  }
}

/// @nodoc

class _$ElasticBounceBackCommandImpl extends ElasticBounceBackCommand {
  const _$ElasticBounceBackCommandImpl(
      {required this.targetTransform,
      this.duration = const Duration(milliseconds: 300)})
      : super._();

  @override
  final Transform2D targetTransform;
  @override
  @JsonKey()
  final Duration duration;

  @override
  String toString() {
    return 'DiagramCommand.elasticBounceBack(targetTransform: $targetTransform, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ElasticBounceBackCommandImpl &&
            (identical(other.targetTransform, targetTransform) ||
                other.targetTransform == targetTransform) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, targetTransform, duration);

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ElasticBounceBackCommandImplCopyWith<_$ElasticBounceBackCommandImpl>
      get copyWith => __$$ElasticBounceBackCommandImplCopyWithImpl<
          _$ElasticBounceBackCommandImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhysicalEvent origin) applyDefaultPanZoom,
    required TResult Function(Transform2D transform) setTransform,
    required TResult Function(
            List<DiagramObjectEntity> renderables, Rect logicalExtent)
        redraw,
    required TResult Function(Transform2D targetTransform, Duration duration)
        elasticBounceBack,
    required TResult Function(Offset velocity, Duration stepDuration)
        autoScrollStep,
    required TResult Function() stopAutoScroll,
  }) {
    return elasticBounceBack(targetTransform, duration);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult? Function(Transform2D transform)? setTransform,
    TResult? Function(
            List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult? Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult? Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult? Function()? stopAutoScroll,
  }) {
    return elasticBounceBack?.call(targetTransform, duration);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult Function(Transform2D transform)? setTransform,
    TResult Function(List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult Function()? stopAutoScroll,
    required TResult orElse(),
  }) {
    if (elasticBounceBack != null) {
      return elasticBounceBack(targetTransform, duration);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApplyDefaultPanZoomCommand value)
        applyDefaultPanZoom,
    required TResult Function(SetTransformCommand value) setTransform,
    required TResult Function(RedrawCommand value) redraw,
    required TResult Function(ElasticBounceBackCommand value) elasticBounceBack,
    required TResult Function(AutoScrollStepCommand value) autoScrollStep,
    required TResult Function(StopAutoScrollCommand value) stopAutoScroll,
  }) {
    return elasticBounceBack(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult? Function(SetTransformCommand value)? setTransform,
    TResult? Function(RedrawCommand value)? redraw,
    TResult? Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult? Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult? Function(StopAutoScrollCommand value)? stopAutoScroll,
  }) {
    return elasticBounceBack?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult Function(SetTransformCommand value)? setTransform,
    TResult Function(RedrawCommand value)? redraw,
    TResult Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult Function(StopAutoScrollCommand value)? stopAutoScroll,
    required TResult orElse(),
  }) {
    if (elasticBounceBack != null) {
      return elasticBounceBack(this);
    }
    return orElse();
  }
}

abstract class ElasticBounceBackCommand extends DiagramCommand {
  const factory ElasticBounceBackCommand(
      {required final Transform2D targetTransform,
      final Duration duration}) = _$ElasticBounceBackCommandImpl;
  const ElasticBounceBackCommand._() : super._();

  Transform2D get targetTransform;
  Duration get duration;

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ElasticBounceBackCommandImplCopyWith<_$ElasticBounceBackCommandImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AutoScrollStepCommandImplCopyWith<$Res> {
  factory _$$AutoScrollStepCommandImplCopyWith(
          _$AutoScrollStepCommandImpl value,
          $Res Function(_$AutoScrollStepCommandImpl) then) =
      __$$AutoScrollStepCommandImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Offset velocity, Duration stepDuration});
}

/// @nodoc
class __$$AutoScrollStepCommandImplCopyWithImpl<$Res>
    extends _$DiagramCommandCopyWithImpl<$Res, _$AutoScrollStepCommandImpl>
    implements _$$AutoScrollStepCommandImplCopyWith<$Res> {
  __$$AutoScrollStepCommandImplCopyWithImpl(_$AutoScrollStepCommandImpl _value,
      $Res Function(_$AutoScrollStepCommandImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? velocity = null,
    Object? stepDuration = null,
  }) {
    return _then(_$AutoScrollStepCommandImpl(
      velocity: null == velocity
          ? _value.velocity
          : velocity // ignore: cast_nullable_to_non_nullable
              as Offset,
      stepDuration: null == stepDuration
          ? _value.stepDuration
          : stepDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$AutoScrollStepCommandImpl extends AutoScrollStepCommand {
  const _$AutoScrollStepCommandImpl(
      {required this.velocity,
      this.stepDuration = const Duration(milliseconds: 16)})
      : super._();

  @override
  final Offset velocity;
  @override
  @JsonKey()
  final Duration stepDuration;

  @override
  String toString() {
    return 'DiagramCommand.autoScrollStep(velocity: $velocity, stepDuration: $stepDuration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AutoScrollStepCommandImpl &&
            (identical(other.velocity, velocity) ||
                other.velocity == velocity) &&
            (identical(other.stepDuration, stepDuration) ||
                other.stepDuration == stepDuration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, velocity, stepDuration);

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AutoScrollStepCommandImplCopyWith<_$AutoScrollStepCommandImpl>
      get copyWith => __$$AutoScrollStepCommandImplCopyWithImpl<
          _$AutoScrollStepCommandImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhysicalEvent origin) applyDefaultPanZoom,
    required TResult Function(Transform2D transform) setTransform,
    required TResult Function(
            List<DiagramObjectEntity> renderables, Rect logicalExtent)
        redraw,
    required TResult Function(Transform2D targetTransform, Duration duration)
        elasticBounceBack,
    required TResult Function(Offset velocity, Duration stepDuration)
        autoScrollStep,
    required TResult Function() stopAutoScroll,
  }) {
    return autoScrollStep(velocity, stepDuration);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult? Function(Transform2D transform)? setTransform,
    TResult? Function(
            List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult? Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult? Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult? Function()? stopAutoScroll,
  }) {
    return autoScrollStep?.call(velocity, stepDuration);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult Function(Transform2D transform)? setTransform,
    TResult Function(List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult Function()? stopAutoScroll,
    required TResult orElse(),
  }) {
    if (autoScrollStep != null) {
      return autoScrollStep(velocity, stepDuration);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApplyDefaultPanZoomCommand value)
        applyDefaultPanZoom,
    required TResult Function(SetTransformCommand value) setTransform,
    required TResult Function(RedrawCommand value) redraw,
    required TResult Function(ElasticBounceBackCommand value) elasticBounceBack,
    required TResult Function(AutoScrollStepCommand value) autoScrollStep,
    required TResult Function(StopAutoScrollCommand value) stopAutoScroll,
  }) {
    return autoScrollStep(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult? Function(SetTransformCommand value)? setTransform,
    TResult? Function(RedrawCommand value)? redraw,
    TResult? Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult? Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult? Function(StopAutoScrollCommand value)? stopAutoScroll,
  }) {
    return autoScrollStep?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult Function(SetTransformCommand value)? setTransform,
    TResult Function(RedrawCommand value)? redraw,
    TResult Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult Function(StopAutoScrollCommand value)? stopAutoScroll,
    required TResult orElse(),
  }) {
    if (autoScrollStep != null) {
      return autoScrollStep(this);
    }
    return orElse();
  }
}

abstract class AutoScrollStepCommand extends DiagramCommand {
  const factory AutoScrollStepCommand(
      {required final Offset velocity,
      final Duration stepDuration}) = _$AutoScrollStepCommandImpl;
  const AutoScrollStepCommand._() : super._();

  Offset get velocity;
  Duration get stepDuration;

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AutoScrollStepCommandImplCopyWith<_$AutoScrollStepCommandImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StopAutoScrollCommandImplCopyWith<$Res> {
  factory _$$StopAutoScrollCommandImplCopyWith(
          _$StopAutoScrollCommandImpl value,
          $Res Function(_$StopAutoScrollCommandImpl) then) =
      __$$StopAutoScrollCommandImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StopAutoScrollCommandImplCopyWithImpl<$Res>
    extends _$DiagramCommandCopyWithImpl<$Res, _$StopAutoScrollCommandImpl>
    implements _$$StopAutoScrollCommandImplCopyWith<$Res> {
  __$$StopAutoScrollCommandImplCopyWithImpl(_$StopAutoScrollCommandImpl _value,
      $Res Function(_$StopAutoScrollCommandImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StopAutoScrollCommandImpl extends StopAutoScrollCommand {
  const _$StopAutoScrollCommandImpl() : super._();

  @override
  String toString() {
    return 'DiagramCommand.stopAutoScroll()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StopAutoScrollCommandImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhysicalEvent origin) applyDefaultPanZoom,
    required TResult Function(Transform2D transform) setTransform,
    required TResult Function(
            List<DiagramObjectEntity> renderables, Rect logicalExtent)
        redraw,
    required TResult Function(Transform2D targetTransform, Duration duration)
        elasticBounceBack,
    required TResult Function(Offset velocity, Duration stepDuration)
        autoScrollStep,
    required TResult Function() stopAutoScroll,
  }) {
    return stopAutoScroll();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult? Function(Transform2D transform)? setTransform,
    TResult? Function(
            List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult? Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult? Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult? Function()? stopAutoScroll,
  }) {
    return stopAutoScroll?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult Function(Transform2D transform)? setTransform,
    TResult Function(List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult Function()? stopAutoScroll,
    required TResult orElse(),
  }) {
    if (stopAutoScroll != null) {
      return stopAutoScroll();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApplyDefaultPanZoomCommand value)
        applyDefaultPanZoom,
    required TResult Function(SetTransformCommand value) setTransform,
    required TResult Function(RedrawCommand value) redraw,
    required TResult Function(ElasticBounceBackCommand value) elasticBounceBack,
    required TResult Function(AutoScrollStepCommand value) autoScrollStep,
    required TResult Function(StopAutoScrollCommand value) stopAutoScroll,
  }) {
    return stopAutoScroll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult? Function(SetTransformCommand value)? setTransform,
    TResult? Function(RedrawCommand value)? redraw,
    TResult? Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult? Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult? Function(StopAutoScrollCommand value)? stopAutoScroll,
  }) {
    return stopAutoScroll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult Function(SetTransformCommand value)? setTransform,
    TResult Function(RedrawCommand value)? redraw,
    TResult Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult Function(StopAutoScrollCommand value)? stopAutoScroll,
    required TResult orElse(),
  }) {
    if (stopAutoScroll != null) {
      return stopAutoScroll(this);
    }
    return orElse();
  }
}

abstract class StopAutoScrollCommand extends DiagramCommand {
  const factory StopAutoScrollCommand() = _$StopAutoScrollCommandImpl;
  const StopAutoScrollCommand._() : super._();
}
