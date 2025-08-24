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
    required TResult Function() enableAutoscroll,
    required TResult Function() disableAutoscroll,
    required TResult Function() returnToBounds,
    required TResult Function(Transform2D targetTransform, Duration duration)
        elasticBounceBack,
    required TResult Function(Offset velocity, Duration stepDuration)
        autoScrollStep,
    required TResult Function() stopAutoScroll,
    required TResult Function(Object? ghostSpec, Offset position)
        showDragOverlay,
    required TResult Function(Offset position) updateDragOverlay,
    required TResult Function() hideDragOverlay,
    required TResult Function(Offset startPosition) showSelectionOverlay,
    required TResult Function(Offset currentPosition) updateSelectionRect,
    required TResult Function() hideSelectionOverlay,
    required TResult Function(DiagramEventUnion originalEvent) handleAsUsual,
    required TResult Function(CursorEffect effect) setCursor,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult? Function(Transform2D transform)? setTransform,
    TResult? Function(
            List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult? Function()? enableAutoscroll,
    TResult? Function()? disableAutoscroll,
    TResult? Function()? returnToBounds,
    TResult? Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult? Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult? Function()? stopAutoScroll,
    TResult? Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult? Function(Offset position)? updateDragOverlay,
    TResult? Function()? hideDragOverlay,
    TResult? Function(Offset startPosition)? showSelectionOverlay,
    TResult? Function(Offset currentPosition)? updateSelectionRect,
    TResult? Function()? hideSelectionOverlay,
    TResult? Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult? Function(CursorEffect effect)? setCursor,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult Function(Transform2D transform)? setTransform,
    TResult Function(List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult Function()? enableAutoscroll,
    TResult Function()? disableAutoscroll,
    TResult Function()? returnToBounds,
    TResult Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult Function()? stopAutoScroll,
    TResult Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult Function(Offset position)? updateDragOverlay,
    TResult Function()? hideDragOverlay,
    TResult Function(Offset startPosition)? showSelectionOverlay,
    TResult Function(Offset currentPosition)? updateSelectionRect,
    TResult Function()? hideSelectionOverlay,
    TResult Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult Function(CursorEffect effect)? setCursor,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ApplyDefaultPanZoomCommand value)
        applyDefaultPanZoom,
    required TResult Function(SetTransformCommand value) setTransform,
    required TResult Function(RedrawCommand value) redraw,
    required TResult Function(EnableAutoscrollCommand value) enableAutoscroll,
    required TResult Function(DisableAutoscrollCommand value) disableAutoscroll,
    required TResult Function(ReturnToBoundsCommand value) returnToBounds,
    required TResult Function(ElasticBounceBackCommand value) elasticBounceBack,
    required TResult Function(AutoScrollStepCommand value) autoScrollStep,
    required TResult Function(StopAutoScrollCommand value) stopAutoScroll,
    required TResult Function(ShowDragOverlayCommand value) showDragOverlay,
    required TResult Function(UpdateDragOverlayCommand value) updateDragOverlay,
    required TResult Function(HideDragOverlayCommand value) hideDragOverlay,
    required TResult Function(ShowSelectionOverlayCommand value)
        showSelectionOverlay,
    required TResult Function(UpdateSelectionRectCommand value)
        updateSelectionRect,
    required TResult Function(HideSelectionOverlayCommand value)
        hideSelectionOverlay,
    required TResult Function(_HandleAsUsualCommand value) handleAsUsual,
    required TResult Function(_SetCursorCommand value) setCursor,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult? Function(SetTransformCommand value)? setTransform,
    TResult? Function(RedrawCommand value)? redraw,
    TResult? Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult? Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult? Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult? Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult? Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult? Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult? Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult? Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult? Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult? Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult? Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult? Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult? Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult? Function(_SetCursorCommand value)? setCursor,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult Function(SetTransformCommand value)? setTransform,
    TResult Function(RedrawCommand value)? redraw,
    TResult Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult Function(_SetCursorCommand value)? setCursor,
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
    required TResult Function() enableAutoscroll,
    required TResult Function() disableAutoscroll,
    required TResult Function() returnToBounds,
    required TResult Function(Transform2D targetTransform, Duration duration)
        elasticBounceBack,
    required TResult Function(Offset velocity, Duration stepDuration)
        autoScrollStep,
    required TResult Function() stopAutoScroll,
    required TResult Function(Object? ghostSpec, Offset position)
        showDragOverlay,
    required TResult Function(Offset position) updateDragOverlay,
    required TResult Function() hideDragOverlay,
    required TResult Function(Offset startPosition) showSelectionOverlay,
    required TResult Function(Offset currentPosition) updateSelectionRect,
    required TResult Function() hideSelectionOverlay,
    required TResult Function(DiagramEventUnion originalEvent) handleAsUsual,
    required TResult Function(CursorEffect effect) setCursor,
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
    TResult? Function()? enableAutoscroll,
    TResult? Function()? disableAutoscroll,
    TResult? Function()? returnToBounds,
    TResult? Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult? Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult? Function()? stopAutoScroll,
    TResult? Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult? Function(Offset position)? updateDragOverlay,
    TResult? Function()? hideDragOverlay,
    TResult? Function(Offset startPosition)? showSelectionOverlay,
    TResult? Function(Offset currentPosition)? updateSelectionRect,
    TResult? Function()? hideSelectionOverlay,
    TResult? Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult? Function(CursorEffect effect)? setCursor,
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
    TResult Function()? enableAutoscroll,
    TResult Function()? disableAutoscroll,
    TResult Function()? returnToBounds,
    TResult Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult Function()? stopAutoScroll,
    TResult Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult Function(Offset position)? updateDragOverlay,
    TResult Function()? hideDragOverlay,
    TResult Function(Offset startPosition)? showSelectionOverlay,
    TResult Function(Offset currentPosition)? updateSelectionRect,
    TResult Function()? hideSelectionOverlay,
    TResult Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult Function(CursorEffect effect)? setCursor,
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
    required TResult Function(EnableAutoscrollCommand value) enableAutoscroll,
    required TResult Function(DisableAutoscrollCommand value) disableAutoscroll,
    required TResult Function(ReturnToBoundsCommand value) returnToBounds,
    required TResult Function(ElasticBounceBackCommand value) elasticBounceBack,
    required TResult Function(AutoScrollStepCommand value) autoScrollStep,
    required TResult Function(StopAutoScrollCommand value) stopAutoScroll,
    required TResult Function(ShowDragOverlayCommand value) showDragOverlay,
    required TResult Function(UpdateDragOverlayCommand value) updateDragOverlay,
    required TResult Function(HideDragOverlayCommand value) hideDragOverlay,
    required TResult Function(ShowSelectionOverlayCommand value)
        showSelectionOverlay,
    required TResult Function(UpdateSelectionRectCommand value)
        updateSelectionRect,
    required TResult Function(HideSelectionOverlayCommand value)
        hideSelectionOverlay,
    required TResult Function(_HandleAsUsualCommand value) handleAsUsual,
    required TResult Function(_SetCursorCommand value) setCursor,
  }) {
    return applyDefaultPanZoom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult? Function(SetTransformCommand value)? setTransform,
    TResult? Function(RedrawCommand value)? redraw,
    TResult? Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult? Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult? Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult? Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult? Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult? Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult? Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult? Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult? Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult? Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult? Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult? Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult? Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult? Function(_SetCursorCommand value)? setCursor,
  }) {
    return applyDefaultPanZoom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult Function(SetTransformCommand value)? setTransform,
    TResult Function(RedrawCommand value)? redraw,
    TResult Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult Function(_SetCursorCommand value)? setCursor,
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
    required TResult Function() enableAutoscroll,
    required TResult Function() disableAutoscroll,
    required TResult Function() returnToBounds,
    required TResult Function(Transform2D targetTransform, Duration duration)
        elasticBounceBack,
    required TResult Function(Offset velocity, Duration stepDuration)
        autoScrollStep,
    required TResult Function() stopAutoScroll,
    required TResult Function(Object? ghostSpec, Offset position)
        showDragOverlay,
    required TResult Function(Offset position) updateDragOverlay,
    required TResult Function() hideDragOverlay,
    required TResult Function(Offset startPosition) showSelectionOverlay,
    required TResult Function(Offset currentPosition) updateSelectionRect,
    required TResult Function() hideSelectionOverlay,
    required TResult Function(DiagramEventUnion originalEvent) handleAsUsual,
    required TResult Function(CursorEffect effect) setCursor,
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
    TResult? Function()? enableAutoscroll,
    TResult? Function()? disableAutoscroll,
    TResult? Function()? returnToBounds,
    TResult? Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult? Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult? Function()? stopAutoScroll,
    TResult? Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult? Function(Offset position)? updateDragOverlay,
    TResult? Function()? hideDragOverlay,
    TResult? Function(Offset startPosition)? showSelectionOverlay,
    TResult? Function(Offset currentPosition)? updateSelectionRect,
    TResult? Function()? hideSelectionOverlay,
    TResult? Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult? Function(CursorEffect effect)? setCursor,
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
    TResult Function()? enableAutoscroll,
    TResult Function()? disableAutoscroll,
    TResult Function()? returnToBounds,
    TResult Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult Function()? stopAutoScroll,
    TResult Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult Function(Offset position)? updateDragOverlay,
    TResult Function()? hideDragOverlay,
    TResult Function(Offset startPosition)? showSelectionOverlay,
    TResult Function(Offset currentPosition)? updateSelectionRect,
    TResult Function()? hideSelectionOverlay,
    TResult Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult Function(CursorEffect effect)? setCursor,
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
    required TResult Function(EnableAutoscrollCommand value) enableAutoscroll,
    required TResult Function(DisableAutoscrollCommand value) disableAutoscroll,
    required TResult Function(ReturnToBoundsCommand value) returnToBounds,
    required TResult Function(ElasticBounceBackCommand value) elasticBounceBack,
    required TResult Function(AutoScrollStepCommand value) autoScrollStep,
    required TResult Function(StopAutoScrollCommand value) stopAutoScroll,
    required TResult Function(ShowDragOverlayCommand value) showDragOverlay,
    required TResult Function(UpdateDragOverlayCommand value) updateDragOverlay,
    required TResult Function(HideDragOverlayCommand value) hideDragOverlay,
    required TResult Function(ShowSelectionOverlayCommand value)
        showSelectionOverlay,
    required TResult Function(UpdateSelectionRectCommand value)
        updateSelectionRect,
    required TResult Function(HideSelectionOverlayCommand value)
        hideSelectionOverlay,
    required TResult Function(_HandleAsUsualCommand value) handleAsUsual,
    required TResult Function(_SetCursorCommand value) setCursor,
  }) {
    return setTransform(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult? Function(SetTransformCommand value)? setTransform,
    TResult? Function(RedrawCommand value)? redraw,
    TResult? Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult? Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult? Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult? Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult? Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult? Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult? Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult? Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult? Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult? Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult? Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult? Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult? Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult? Function(_SetCursorCommand value)? setCursor,
  }) {
    return setTransform?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult Function(SetTransformCommand value)? setTransform,
    TResult Function(RedrawCommand value)? redraw,
    TResult Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult Function(_SetCursorCommand value)? setCursor,
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
    required TResult Function() enableAutoscroll,
    required TResult Function() disableAutoscroll,
    required TResult Function() returnToBounds,
    required TResult Function(Transform2D targetTransform, Duration duration)
        elasticBounceBack,
    required TResult Function(Offset velocity, Duration stepDuration)
        autoScrollStep,
    required TResult Function() stopAutoScroll,
    required TResult Function(Object? ghostSpec, Offset position)
        showDragOverlay,
    required TResult Function(Offset position) updateDragOverlay,
    required TResult Function() hideDragOverlay,
    required TResult Function(Offset startPosition) showSelectionOverlay,
    required TResult Function(Offset currentPosition) updateSelectionRect,
    required TResult Function() hideSelectionOverlay,
    required TResult Function(DiagramEventUnion originalEvent) handleAsUsual,
    required TResult Function(CursorEffect effect) setCursor,
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
    TResult? Function()? enableAutoscroll,
    TResult? Function()? disableAutoscroll,
    TResult? Function()? returnToBounds,
    TResult? Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult? Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult? Function()? stopAutoScroll,
    TResult? Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult? Function(Offset position)? updateDragOverlay,
    TResult? Function()? hideDragOverlay,
    TResult? Function(Offset startPosition)? showSelectionOverlay,
    TResult? Function(Offset currentPosition)? updateSelectionRect,
    TResult? Function()? hideSelectionOverlay,
    TResult? Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult? Function(CursorEffect effect)? setCursor,
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
    TResult Function()? enableAutoscroll,
    TResult Function()? disableAutoscroll,
    TResult Function()? returnToBounds,
    TResult Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult Function()? stopAutoScroll,
    TResult Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult Function(Offset position)? updateDragOverlay,
    TResult Function()? hideDragOverlay,
    TResult Function(Offset startPosition)? showSelectionOverlay,
    TResult Function(Offset currentPosition)? updateSelectionRect,
    TResult Function()? hideSelectionOverlay,
    TResult Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult Function(CursorEffect effect)? setCursor,
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
    required TResult Function(EnableAutoscrollCommand value) enableAutoscroll,
    required TResult Function(DisableAutoscrollCommand value) disableAutoscroll,
    required TResult Function(ReturnToBoundsCommand value) returnToBounds,
    required TResult Function(ElasticBounceBackCommand value) elasticBounceBack,
    required TResult Function(AutoScrollStepCommand value) autoScrollStep,
    required TResult Function(StopAutoScrollCommand value) stopAutoScroll,
    required TResult Function(ShowDragOverlayCommand value) showDragOverlay,
    required TResult Function(UpdateDragOverlayCommand value) updateDragOverlay,
    required TResult Function(HideDragOverlayCommand value) hideDragOverlay,
    required TResult Function(ShowSelectionOverlayCommand value)
        showSelectionOverlay,
    required TResult Function(UpdateSelectionRectCommand value)
        updateSelectionRect,
    required TResult Function(HideSelectionOverlayCommand value)
        hideSelectionOverlay,
    required TResult Function(_HandleAsUsualCommand value) handleAsUsual,
    required TResult Function(_SetCursorCommand value) setCursor,
  }) {
    return redraw(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult? Function(SetTransformCommand value)? setTransform,
    TResult? Function(RedrawCommand value)? redraw,
    TResult? Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult? Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult? Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult? Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult? Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult? Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult? Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult? Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult? Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult? Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult? Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult? Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult? Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult? Function(_SetCursorCommand value)? setCursor,
  }) {
    return redraw?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult Function(SetTransformCommand value)? setTransform,
    TResult Function(RedrawCommand value)? redraw,
    TResult Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult Function(_SetCursorCommand value)? setCursor,
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
abstract class _$$EnableAutoscrollCommandImplCopyWith<$Res> {
  factory _$$EnableAutoscrollCommandImplCopyWith(
          _$EnableAutoscrollCommandImpl value,
          $Res Function(_$EnableAutoscrollCommandImpl) then) =
      __$$EnableAutoscrollCommandImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EnableAutoscrollCommandImplCopyWithImpl<$Res>
    extends _$DiagramCommandCopyWithImpl<$Res, _$EnableAutoscrollCommandImpl>
    implements _$$EnableAutoscrollCommandImplCopyWith<$Res> {
  __$$EnableAutoscrollCommandImplCopyWithImpl(
      _$EnableAutoscrollCommandImpl _value,
      $Res Function(_$EnableAutoscrollCommandImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EnableAutoscrollCommandImpl extends EnableAutoscrollCommand {
  const _$EnableAutoscrollCommandImpl() : super._();

  @override
  String toString() {
    return 'DiagramCommand.enableAutoscroll()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnableAutoscrollCommandImpl);
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
    required TResult Function() enableAutoscroll,
    required TResult Function() disableAutoscroll,
    required TResult Function() returnToBounds,
    required TResult Function(Transform2D targetTransform, Duration duration)
        elasticBounceBack,
    required TResult Function(Offset velocity, Duration stepDuration)
        autoScrollStep,
    required TResult Function() stopAutoScroll,
    required TResult Function(Object? ghostSpec, Offset position)
        showDragOverlay,
    required TResult Function(Offset position) updateDragOverlay,
    required TResult Function() hideDragOverlay,
    required TResult Function(Offset startPosition) showSelectionOverlay,
    required TResult Function(Offset currentPosition) updateSelectionRect,
    required TResult Function() hideSelectionOverlay,
    required TResult Function(DiagramEventUnion originalEvent) handleAsUsual,
    required TResult Function(CursorEffect effect) setCursor,
  }) {
    return enableAutoscroll();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult? Function(Transform2D transform)? setTransform,
    TResult? Function(
            List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult? Function()? enableAutoscroll,
    TResult? Function()? disableAutoscroll,
    TResult? Function()? returnToBounds,
    TResult? Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult? Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult? Function()? stopAutoScroll,
    TResult? Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult? Function(Offset position)? updateDragOverlay,
    TResult? Function()? hideDragOverlay,
    TResult? Function(Offset startPosition)? showSelectionOverlay,
    TResult? Function(Offset currentPosition)? updateSelectionRect,
    TResult? Function()? hideSelectionOverlay,
    TResult? Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult? Function(CursorEffect effect)? setCursor,
  }) {
    return enableAutoscroll?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult Function(Transform2D transform)? setTransform,
    TResult Function(List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult Function()? enableAutoscroll,
    TResult Function()? disableAutoscroll,
    TResult Function()? returnToBounds,
    TResult Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult Function()? stopAutoScroll,
    TResult Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult Function(Offset position)? updateDragOverlay,
    TResult Function()? hideDragOverlay,
    TResult Function(Offset startPosition)? showSelectionOverlay,
    TResult Function(Offset currentPosition)? updateSelectionRect,
    TResult Function()? hideSelectionOverlay,
    TResult Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult Function(CursorEffect effect)? setCursor,
    required TResult orElse(),
  }) {
    if (enableAutoscroll != null) {
      return enableAutoscroll();
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
    required TResult Function(EnableAutoscrollCommand value) enableAutoscroll,
    required TResult Function(DisableAutoscrollCommand value) disableAutoscroll,
    required TResult Function(ReturnToBoundsCommand value) returnToBounds,
    required TResult Function(ElasticBounceBackCommand value) elasticBounceBack,
    required TResult Function(AutoScrollStepCommand value) autoScrollStep,
    required TResult Function(StopAutoScrollCommand value) stopAutoScroll,
    required TResult Function(ShowDragOverlayCommand value) showDragOverlay,
    required TResult Function(UpdateDragOverlayCommand value) updateDragOverlay,
    required TResult Function(HideDragOverlayCommand value) hideDragOverlay,
    required TResult Function(ShowSelectionOverlayCommand value)
        showSelectionOverlay,
    required TResult Function(UpdateSelectionRectCommand value)
        updateSelectionRect,
    required TResult Function(HideSelectionOverlayCommand value)
        hideSelectionOverlay,
    required TResult Function(_HandleAsUsualCommand value) handleAsUsual,
    required TResult Function(_SetCursorCommand value) setCursor,
  }) {
    return enableAutoscroll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult? Function(SetTransformCommand value)? setTransform,
    TResult? Function(RedrawCommand value)? redraw,
    TResult? Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult? Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult? Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult? Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult? Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult? Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult? Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult? Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult? Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult? Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult? Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult? Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult? Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult? Function(_SetCursorCommand value)? setCursor,
  }) {
    return enableAutoscroll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult Function(SetTransformCommand value)? setTransform,
    TResult Function(RedrawCommand value)? redraw,
    TResult Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult Function(_SetCursorCommand value)? setCursor,
    required TResult orElse(),
  }) {
    if (enableAutoscroll != null) {
      return enableAutoscroll(this);
    }
    return orElse();
  }
}

abstract class EnableAutoscrollCommand extends DiagramCommand {
  const factory EnableAutoscrollCommand() = _$EnableAutoscrollCommandImpl;
  const EnableAutoscrollCommand._() : super._();
}

/// @nodoc
abstract class _$$DisableAutoscrollCommandImplCopyWith<$Res> {
  factory _$$DisableAutoscrollCommandImplCopyWith(
          _$DisableAutoscrollCommandImpl value,
          $Res Function(_$DisableAutoscrollCommandImpl) then) =
      __$$DisableAutoscrollCommandImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DisableAutoscrollCommandImplCopyWithImpl<$Res>
    extends _$DiagramCommandCopyWithImpl<$Res, _$DisableAutoscrollCommandImpl>
    implements _$$DisableAutoscrollCommandImplCopyWith<$Res> {
  __$$DisableAutoscrollCommandImplCopyWithImpl(
      _$DisableAutoscrollCommandImpl _value,
      $Res Function(_$DisableAutoscrollCommandImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DisableAutoscrollCommandImpl extends DisableAutoscrollCommand {
  const _$DisableAutoscrollCommandImpl() : super._();

  @override
  String toString() {
    return 'DiagramCommand.disableAutoscroll()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisableAutoscrollCommandImpl);
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
    required TResult Function() enableAutoscroll,
    required TResult Function() disableAutoscroll,
    required TResult Function() returnToBounds,
    required TResult Function(Transform2D targetTransform, Duration duration)
        elasticBounceBack,
    required TResult Function(Offset velocity, Duration stepDuration)
        autoScrollStep,
    required TResult Function() stopAutoScroll,
    required TResult Function(Object? ghostSpec, Offset position)
        showDragOverlay,
    required TResult Function(Offset position) updateDragOverlay,
    required TResult Function() hideDragOverlay,
    required TResult Function(Offset startPosition) showSelectionOverlay,
    required TResult Function(Offset currentPosition) updateSelectionRect,
    required TResult Function() hideSelectionOverlay,
    required TResult Function(DiagramEventUnion originalEvent) handleAsUsual,
    required TResult Function(CursorEffect effect) setCursor,
  }) {
    return disableAutoscroll();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult? Function(Transform2D transform)? setTransform,
    TResult? Function(
            List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult? Function()? enableAutoscroll,
    TResult? Function()? disableAutoscroll,
    TResult? Function()? returnToBounds,
    TResult? Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult? Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult? Function()? stopAutoScroll,
    TResult? Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult? Function(Offset position)? updateDragOverlay,
    TResult? Function()? hideDragOverlay,
    TResult? Function(Offset startPosition)? showSelectionOverlay,
    TResult? Function(Offset currentPosition)? updateSelectionRect,
    TResult? Function()? hideSelectionOverlay,
    TResult? Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult? Function(CursorEffect effect)? setCursor,
  }) {
    return disableAutoscroll?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult Function(Transform2D transform)? setTransform,
    TResult Function(List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult Function()? enableAutoscroll,
    TResult Function()? disableAutoscroll,
    TResult Function()? returnToBounds,
    TResult Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult Function()? stopAutoScroll,
    TResult Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult Function(Offset position)? updateDragOverlay,
    TResult Function()? hideDragOverlay,
    TResult Function(Offset startPosition)? showSelectionOverlay,
    TResult Function(Offset currentPosition)? updateSelectionRect,
    TResult Function()? hideSelectionOverlay,
    TResult Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult Function(CursorEffect effect)? setCursor,
    required TResult orElse(),
  }) {
    if (disableAutoscroll != null) {
      return disableAutoscroll();
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
    required TResult Function(EnableAutoscrollCommand value) enableAutoscroll,
    required TResult Function(DisableAutoscrollCommand value) disableAutoscroll,
    required TResult Function(ReturnToBoundsCommand value) returnToBounds,
    required TResult Function(ElasticBounceBackCommand value) elasticBounceBack,
    required TResult Function(AutoScrollStepCommand value) autoScrollStep,
    required TResult Function(StopAutoScrollCommand value) stopAutoScroll,
    required TResult Function(ShowDragOverlayCommand value) showDragOverlay,
    required TResult Function(UpdateDragOverlayCommand value) updateDragOverlay,
    required TResult Function(HideDragOverlayCommand value) hideDragOverlay,
    required TResult Function(ShowSelectionOverlayCommand value)
        showSelectionOverlay,
    required TResult Function(UpdateSelectionRectCommand value)
        updateSelectionRect,
    required TResult Function(HideSelectionOverlayCommand value)
        hideSelectionOverlay,
    required TResult Function(_HandleAsUsualCommand value) handleAsUsual,
    required TResult Function(_SetCursorCommand value) setCursor,
  }) {
    return disableAutoscroll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult? Function(SetTransformCommand value)? setTransform,
    TResult? Function(RedrawCommand value)? redraw,
    TResult? Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult? Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult? Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult? Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult? Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult? Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult? Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult? Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult? Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult? Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult? Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult? Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult? Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult? Function(_SetCursorCommand value)? setCursor,
  }) {
    return disableAutoscroll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult Function(SetTransformCommand value)? setTransform,
    TResult Function(RedrawCommand value)? redraw,
    TResult Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult Function(_SetCursorCommand value)? setCursor,
    required TResult orElse(),
  }) {
    if (disableAutoscroll != null) {
      return disableAutoscroll(this);
    }
    return orElse();
  }
}

abstract class DisableAutoscrollCommand extends DiagramCommand {
  const factory DisableAutoscrollCommand() = _$DisableAutoscrollCommandImpl;
  const DisableAutoscrollCommand._() : super._();
}

/// @nodoc
abstract class _$$ReturnToBoundsCommandImplCopyWith<$Res> {
  factory _$$ReturnToBoundsCommandImplCopyWith(
          _$ReturnToBoundsCommandImpl value,
          $Res Function(_$ReturnToBoundsCommandImpl) then) =
      __$$ReturnToBoundsCommandImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReturnToBoundsCommandImplCopyWithImpl<$Res>
    extends _$DiagramCommandCopyWithImpl<$Res, _$ReturnToBoundsCommandImpl>
    implements _$$ReturnToBoundsCommandImplCopyWith<$Res> {
  __$$ReturnToBoundsCommandImplCopyWithImpl(_$ReturnToBoundsCommandImpl _value,
      $Res Function(_$ReturnToBoundsCommandImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ReturnToBoundsCommandImpl extends ReturnToBoundsCommand {
  const _$ReturnToBoundsCommandImpl() : super._();

  @override
  String toString() {
    return 'DiagramCommand.returnToBounds()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReturnToBoundsCommandImpl);
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
    required TResult Function() enableAutoscroll,
    required TResult Function() disableAutoscroll,
    required TResult Function() returnToBounds,
    required TResult Function(Transform2D targetTransform, Duration duration)
        elasticBounceBack,
    required TResult Function(Offset velocity, Duration stepDuration)
        autoScrollStep,
    required TResult Function() stopAutoScroll,
    required TResult Function(Object? ghostSpec, Offset position)
        showDragOverlay,
    required TResult Function(Offset position) updateDragOverlay,
    required TResult Function() hideDragOverlay,
    required TResult Function(Offset startPosition) showSelectionOverlay,
    required TResult Function(Offset currentPosition) updateSelectionRect,
    required TResult Function() hideSelectionOverlay,
    required TResult Function(DiagramEventUnion originalEvent) handleAsUsual,
    required TResult Function(CursorEffect effect) setCursor,
  }) {
    return returnToBounds();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult? Function(Transform2D transform)? setTransform,
    TResult? Function(
            List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult? Function()? enableAutoscroll,
    TResult? Function()? disableAutoscroll,
    TResult? Function()? returnToBounds,
    TResult? Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult? Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult? Function()? stopAutoScroll,
    TResult? Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult? Function(Offset position)? updateDragOverlay,
    TResult? Function()? hideDragOverlay,
    TResult? Function(Offset startPosition)? showSelectionOverlay,
    TResult? Function(Offset currentPosition)? updateSelectionRect,
    TResult? Function()? hideSelectionOverlay,
    TResult? Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult? Function(CursorEffect effect)? setCursor,
  }) {
    return returnToBounds?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult Function(Transform2D transform)? setTransform,
    TResult Function(List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult Function()? enableAutoscroll,
    TResult Function()? disableAutoscroll,
    TResult Function()? returnToBounds,
    TResult Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult Function()? stopAutoScroll,
    TResult Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult Function(Offset position)? updateDragOverlay,
    TResult Function()? hideDragOverlay,
    TResult Function(Offset startPosition)? showSelectionOverlay,
    TResult Function(Offset currentPosition)? updateSelectionRect,
    TResult Function()? hideSelectionOverlay,
    TResult Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult Function(CursorEffect effect)? setCursor,
    required TResult orElse(),
  }) {
    if (returnToBounds != null) {
      return returnToBounds();
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
    required TResult Function(EnableAutoscrollCommand value) enableAutoscroll,
    required TResult Function(DisableAutoscrollCommand value) disableAutoscroll,
    required TResult Function(ReturnToBoundsCommand value) returnToBounds,
    required TResult Function(ElasticBounceBackCommand value) elasticBounceBack,
    required TResult Function(AutoScrollStepCommand value) autoScrollStep,
    required TResult Function(StopAutoScrollCommand value) stopAutoScroll,
    required TResult Function(ShowDragOverlayCommand value) showDragOverlay,
    required TResult Function(UpdateDragOverlayCommand value) updateDragOverlay,
    required TResult Function(HideDragOverlayCommand value) hideDragOverlay,
    required TResult Function(ShowSelectionOverlayCommand value)
        showSelectionOverlay,
    required TResult Function(UpdateSelectionRectCommand value)
        updateSelectionRect,
    required TResult Function(HideSelectionOverlayCommand value)
        hideSelectionOverlay,
    required TResult Function(_HandleAsUsualCommand value) handleAsUsual,
    required TResult Function(_SetCursorCommand value) setCursor,
  }) {
    return returnToBounds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult? Function(SetTransformCommand value)? setTransform,
    TResult? Function(RedrawCommand value)? redraw,
    TResult? Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult? Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult? Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult? Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult? Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult? Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult? Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult? Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult? Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult? Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult? Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult? Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult? Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult? Function(_SetCursorCommand value)? setCursor,
  }) {
    return returnToBounds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult Function(SetTransformCommand value)? setTransform,
    TResult Function(RedrawCommand value)? redraw,
    TResult Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult Function(_SetCursorCommand value)? setCursor,
    required TResult orElse(),
  }) {
    if (returnToBounds != null) {
      return returnToBounds(this);
    }
    return orElse();
  }
}

abstract class ReturnToBoundsCommand extends DiagramCommand {
  const factory ReturnToBoundsCommand() = _$ReturnToBoundsCommandImpl;
  const ReturnToBoundsCommand._() : super._();
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
    required TResult Function() enableAutoscroll,
    required TResult Function() disableAutoscroll,
    required TResult Function() returnToBounds,
    required TResult Function(Transform2D targetTransform, Duration duration)
        elasticBounceBack,
    required TResult Function(Offset velocity, Duration stepDuration)
        autoScrollStep,
    required TResult Function() stopAutoScroll,
    required TResult Function(Object? ghostSpec, Offset position)
        showDragOverlay,
    required TResult Function(Offset position) updateDragOverlay,
    required TResult Function() hideDragOverlay,
    required TResult Function(Offset startPosition) showSelectionOverlay,
    required TResult Function(Offset currentPosition) updateSelectionRect,
    required TResult Function() hideSelectionOverlay,
    required TResult Function(DiagramEventUnion originalEvent) handleAsUsual,
    required TResult Function(CursorEffect effect) setCursor,
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
    TResult? Function()? enableAutoscroll,
    TResult? Function()? disableAutoscroll,
    TResult? Function()? returnToBounds,
    TResult? Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult? Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult? Function()? stopAutoScroll,
    TResult? Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult? Function(Offset position)? updateDragOverlay,
    TResult? Function()? hideDragOverlay,
    TResult? Function(Offset startPosition)? showSelectionOverlay,
    TResult? Function(Offset currentPosition)? updateSelectionRect,
    TResult? Function()? hideSelectionOverlay,
    TResult? Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult? Function(CursorEffect effect)? setCursor,
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
    TResult Function()? enableAutoscroll,
    TResult Function()? disableAutoscroll,
    TResult Function()? returnToBounds,
    TResult Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult Function()? stopAutoScroll,
    TResult Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult Function(Offset position)? updateDragOverlay,
    TResult Function()? hideDragOverlay,
    TResult Function(Offset startPosition)? showSelectionOverlay,
    TResult Function(Offset currentPosition)? updateSelectionRect,
    TResult Function()? hideSelectionOverlay,
    TResult Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult Function(CursorEffect effect)? setCursor,
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
    required TResult Function(EnableAutoscrollCommand value) enableAutoscroll,
    required TResult Function(DisableAutoscrollCommand value) disableAutoscroll,
    required TResult Function(ReturnToBoundsCommand value) returnToBounds,
    required TResult Function(ElasticBounceBackCommand value) elasticBounceBack,
    required TResult Function(AutoScrollStepCommand value) autoScrollStep,
    required TResult Function(StopAutoScrollCommand value) stopAutoScroll,
    required TResult Function(ShowDragOverlayCommand value) showDragOverlay,
    required TResult Function(UpdateDragOverlayCommand value) updateDragOverlay,
    required TResult Function(HideDragOverlayCommand value) hideDragOverlay,
    required TResult Function(ShowSelectionOverlayCommand value)
        showSelectionOverlay,
    required TResult Function(UpdateSelectionRectCommand value)
        updateSelectionRect,
    required TResult Function(HideSelectionOverlayCommand value)
        hideSelectionOverlay,
    required TResult Function(_HandleAsUsualCommand value) handleAsUsual,
    required TResult Function(_SetCursorCommand value) setCursor,
  }) {
    return elasticBounceBack(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult? Function(SetTransformCommand value)? setTransform,
    TResult? Function(RedrawCommand value)? redraw,
    TResult? Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult? Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult? Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult? Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult? Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult? Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult? Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult? Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult? Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult? Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult? Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult? Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult? Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult? Function(_SetCursorCommand value)? setCursor,
  }) {
    return elasticBounceBack?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult Function(SetTransformCommand value)? setTransform,
    TResult Function(RedrawCommand value)? redraw,
    TResult Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult Function(_SetCursorCommand value)? setCursor,
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
    required TResult Function() enableAutoscroll,
    required TResult Function() disableAutoscroll,
    required TResult Function() returnToBounds,
    required TResult Function(Transform2D targetTransform, Duration duration)
        elasticBounceBack,
    required TResult Function(Offset velocity, Duration stepDuration)
        autoScrollStep,
    required TResult Function() stopAutoScroll,
    required TResult Function(Object? ghostSpec, Offset position)
        showDragOverlay,
    required TResult Function(Offset position) updateDragOverlay,
    required TResult Function() hideDragOverlay,
    required TResult Function(Offset startPosition) showSelectionOverlay,
    required TResult Function(Offset currentPosition) updateSelectionRect,
    required TResult Function() hideSelectionOverlay,
    required TResult Function(DiagramEventUnion originalEvent) handleAsUsual,
    required TResult Function(CursorEffect effect) setCursor,
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
    TResult? Function()? enableAutoscroll,
    TResult? Function()? disableAutoscroll,
    TResult? Function()? returnToBounds,
    TResult? Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult? Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult? Function()? stopAutoScroll,
    TResult? Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult? Function(Offset position)? updateDragOverlay,
    TResult? Function()? hideDragOverlay,
    TResult? Function(Offset startPosition)? showSelectionOverlay,
    TResult? Function(Offset currentPosition)? updateSelectionRect,
    TResult? Function()? hideSelectionOverlay,
    TResult? Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult? Function(CursorEffect effect)? setCursor,
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
    TResult Function()? enableAutoscroll,
    TResult Function()? disableAutoscroll,
    TResult Function()? returnToBounds,
    TResult Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult Function()? stopAutoScroll,
    TResult Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult Function(Offset position)? updateDragOverlay,
    TResult Function()? hideDragOverlay,
    TResult Function(Offset startPosition)? showSelectionOverlay,
    TResult Function(Offset currentPosition)? updateSelectionRect,
    TResult Function()? hideSelectionOverlay,
    TResult Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult Function(CursorEffect effect)? setCursor,
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
    required TResult Function(EnableAutoscrollCommand value) enableAutoscroll,
    required TResult Function(DisableAutoscrollCommand value) disableAutoscroll,
    required TResult Function(ReturnToBoundsCommand value) returnToBounds,
    required TResult Function(ElasticBounceBackCommand value) elasticBounceBack,
    required TResult Function(AutoScrollStepCommand value) autoScrollStep,
    required TResult Function(StopAutoScrollCommand value) stopAutoScroll,
    required TResult Function(ShowDragOverlayCommand value) showDragOverlay,
    required TResult Function(UpdateDragOverlayCommand value) updateDragOverlay,
    required TResult Function(HideDragOverlayCommand value) hideDragOverlay,
    required TResult Function(ShowSelectionOverlayCommand value)
        showSelectionOverlay,
    required TResult Function(UpdateSelectionRectCommand value)
        updateSelectionRect,
    required TResult Function(HideSelectionOverlayCommand value)
        hideSelectionOverlay,
    required TResult Function(_HandleAsUsualCommand value) handleAsUsual,
    required TResult Function(_SetCursorCommand value) setCursor,
  }) {
    return autoScrollStep(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult? Function(SetTransformCommand value)? setTransform,
    TResult? Function(RedrawCommand value)? redraw,
    TResult? Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult? Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult? Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult? Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult? Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult? Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult? Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult? Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult? Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult? Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult? Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult? Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult? Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult? Function(_SetCursorCommand value)? setCursor,
  }) {
    return autoScrollStep?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult Function(SetTransformCommand value)? setTransform,
    TResult Function(RedrawCommand value)? redraw,
    TResult Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult Function(_SetCursorCommand value)? setCursor,
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
    required TResult Function() enableAutoscroll,
    required TResult Function() disableAutoscroll,
    required TResult Function() returnToBounds,
    required TResult Function(Transform2D targetTransform, Duration duration)
        elasticBounceBack,
    required TResult Function(Offset velocity, Duration stepDuration)
        autoScrollStep,
    required TResult Function() stopAutoScroll,
    required TResult Function(Object? ghostSpec, Offset position)
        showDragOverlay,
    required TResult Function(Offset position) updateDragOverlay,
    required TResult Function() hideDragOverlay,
    required TResult Function(Offset startPosition) showSelectionOverlay,
    required TResult Function(Offset currentPosition) updateSelectionRect,
    required TResult Function() hideSelectionOverlay,
    required TResult Function(DiagramEventUnion originalEvent) handleAsUsual,
    required TResult Function(CursorEffect effect) setCursor,
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
    TResult? Function()? enableAutoscroll,
    TResult? Function()? disableAutoscroll,
    TResult? Function()? returnToBounds,
    TResult? Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult? Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult? Function()? stopAutoScroll,
    TResult? Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult? Function(Offset position)? updateDragOverlay,
    TResult? Function()? hideDragOverlay,
    TResult? Function(Offset startPosition)? showSelectionOverlay,
    TResult? Function(Offset currentPosition)? updateSelectionRect,
    TResult? Function()? hideSelectionOverlay,
    TResult? Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult? Function(CursorEffect effect)? setCursor,
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
    TResult Function()? enableAutoscroll,
    TResult Function()? disableAutoscroll,
    TResult Function()? returnToBounds,
    TResult Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult Function()? stopAutoScroll,
    TResult Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult Function(Offset position)? updateDragOverlay,
    TResult Function()? hideDragOverlay,
    TResult Function(Offset startPosition)? showSelectionOverlay,
    TResult Function(Offset currentPosition)? updateSelectionRect,
    TResult Function()? hideSelectionOverlay,
    TResult Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult Function(CursorEffect effect)? setCursor,
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
    required TResult Function(EnableAutoscrollCommand value) enableAutoscroll,
    required TResult Function(DisableAutoscrollCommand value) disableAutoscroll,
    required TResult Function(ReturnToBoundsCommand value) returnToBounds,
    required TResult Function(ElasticBounceBackCommand value) elasticBounceBack,
    required TResult Function(AutoScrollStepCommand value) autoScrollStep,
    required TResult Function(StopAutoScrollCommand value) stopAutoScroll,
    required TResult Function(ShowDragOverlayCommand value) showDragOverlay,
    required TResult Function(UpdateDragOverlayCommand value) updateDragOverlay,
    required TResult Function(HideDragOverlayCommand value) hideDragOverlay,
    required TResult Function(ShowSelectionOverlayCommand value)
        showSelectionOverlay,
    required TResult Function(UpdateSelectionRectCommand value)
        updateSelectionRect,
    required TResult Function(HideSelectionOverlayCommand value)
        hideSelectionOverlay,
    required TResult Function(_HandleAsUsualCommand value) handleAsUsual,
    required TResult Function(_SetCursorCommand value) setCursor,
  }) {
    return stopAutoScroll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult? Function(SetTransformCommand value)? setTransform,
    TResult? Function(RedrawCommand value)? redraw,
    TResult? Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult? Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult? Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult? Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult? Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult? Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult? Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult? Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult? Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult? Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult? Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult? Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult? Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult? Function(_SetCursorCommand value)? setCursor,
  }) {
    return stopAutoScroll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult Function(SetTransformCommand value)? setTransform,
    TResult Function(RedrawCommand value)? redraw,
    TResult Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult Function(_SetCursorCommand value)? setCursor,
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

/// @nodoc
abstract class _$$ShowDragOverlayCommandImplCopyWith<$Res> {
  factory _$$ShowDragOverlayCommandImplCopyWith(
          _$ShowDragOverlayCommandImpl value,
          $Res Function(_$ShowDragOverlayCommandImpl) then) =
      __$$ShowDragOverlayCommandImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object? ghostSpec, Offset position});
}

/// @nodoc
class __$$ShowDragOverlayCommandImplCopyWithImpl<$Res>
    extends _$DiagramCommandCopyWithImpl<$Res, _$ShowDragOverlayCommandImpl>
    implements _$$ShowDragOverlayCommandImplCopyWith<$Res> {
  __$$ShowDragOverlayCommandImplCopyWithImpl(
      _$ShowDragOverlayCommandImpl _value,
      $Res Function(_$ShowDragOverlayCommandImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ghostSpec = freezed,
    Object? position = null,
  }) {
    return _then(_$ShowDragOverlayCommandImpl(
      ghostSpec: freezed == ghostSpec ? _value.ghostSpec : ghostSpec,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Offset,
    ));
  }
}

/// @nodoc

class _$ShowDragOverlayCommandImpl extends ShowDragOverlayCommand {
  const _$ShowDragOverlayCommandImpl({this.ghostSpec, required this.position})
      : super._();

  @override
  final Object? ghostSpec;
  @override
  final Offset position;

  @override
  String toString() {
    return 'DiagramCommand.showDragOverlay(ghostSpec: $ghostSpec, position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowDragOverlayCommandImpl &&
            const DeepCollectionEquality().equals(other.ghostSpec, ghostSpec) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(ghostSpec), position);

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowDragOverlayCommandImplCopyWith<_$ShowDragOverlayCommandImpl>
      get copyWith => __$$ShowDragOverlayCommandImplCopyWithImpl<
          _$ShowDragOverlayCommandImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhysicalEvent origin) applyDefaultPanZoom,
    required TResult Function(Transform2D transform) setTransform,
    required TResult Function(
            List<DiagramObjectEntity> renderables, Rect logicalExtent)
        redraw,
    required TResult Function() enableAutoscroll,
    required TResult Function() disableAutoscroll,
    required TResult Function() returnToBounds,
    required TResult Function(Transform2D targetTransform, Duration duration)
        elasticBounceBack,
    required TResult Function(Offset velocity, Duration stepDuration)
        autoScrollStep,
    required TResult Function() stopAutoScroll,
    required TResult Function(Object? ghostSpec, Offset position)
        showDragOverlay,
    required TResult Function(Offset position) updateDragOverlay,
    required TResult Function() hideDragOverlay,
    required TResult Function(Offset startPosition) showSelectionOverlay,
    required TResult Function(Offset currentPosition) updateSelectionRect,
    required TResult Function() hideSelectionOverlay,
    required TResult Function(DiagramEventUnion originalEvent) handleAsUsual,
    required TResult Function(CursorEffect effect) setCursor,
  }) {
    return showDragOverlay(ghostSpec, position);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult? Function(Transform2D transform)? setTransform,
    TResult? Function(
            List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult? Function()? enableAutoscroll,
    TResult? Function()? disableAutoscroll,
    TResult? Function()? returnToBounds,
    TResult? Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult? Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult? Function()? stopAutoScroll,
    TResult? Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult? Function(Offset position)? updateDragOverlay,
    TResult? Function()? hideDragOverlay,
    TResult? Function(Offset startPosition)? showSelectionOverlay,
    TResult? Function(Offset currentPosition)? updateSelectionRect,
    TResult? Function()? hideSelectionOverlay,
    TResult? Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult? Function(CursorEffect effect)? setCursor,
  }) {
    return showDragOverlay?.call(ghostSpec, position);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult Function(Transform2D transform)? setTransform,
    TResult Function(List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult Function()? enableAutoscroll,
    TResult Function()? disableAutoscroll,
    TResult Function()? returnToBounds,
    TResult Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult Function()? stopAutoScroll,
    TResult Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult Function(Offset position)? updateDragOverlay,
    TResult Function()? hideDragOverlay,
    TResult Function(Offset startPosition)? showSelectionOverlay,
    TResult Function(Offset currentPosition)? updateSelectionRect,
    TResult Function()? hideSelectionOverlay,
    TResult Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult Function(CursorEffect effect)? setCursor,
    required TResult orElse(),
  }) {
    if (showDragOverlay != null) {
      return showDragOverlay(ghostSpec, position);
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
    required TResult Function(EnableAutoscrollCommand value) enableAutoscroll,
    required TResult Function(DisableAutoscrollCommand value) disableAutoscroll,
    required TResult Function(ReturnToBoundsCommand value) returnToBounds,
    required TResult Function(ElasticBounceBackCommand value) elasticBounceBack,
    required TResult Function(AutoScrollStepCommand value) autoScrollStep,
    required TResult Function(StopAutoScrollCommand value) stopAutoScroll,
    required TResult Function(ShowDragOverlayCommand value) showDragOverlay,
    required TResult Function(UpdateDragOverlayCommand value) updateDragOverlay,
    required TResult Function(HideDragOverlayCommand value) hideDragOverlay,
    required TResult Function(ShowSelectionOverlayCommand value)
        showSelectionOverlay,
    required TResult Function(UpdateSelectionRectCommand value)
        updateSelectionRect,
    required TResult Function(HideSelectionOverlayCommand value)
        hideSelectionOverlay,
    required TResult Function(_HandleAsUsualCommand value) handleAsUsual,
    required TResult Function(_SetCursorCommand value) setCursor,
  }) {
    return showDragOverlay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult? Function(SetTransformCommand value)? setTransform,
    TResult? Function(RedrawCommand value)? redraw,
    TResult? Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult? Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult? Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult? Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult? Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult? Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult? Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult? Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult? Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult? Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult? Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult? Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult? Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult? Function(_SetCursorCommand value)? setCursor,
  }) {
    return showDragOverlay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult Function(SetTransformCommand value)? setTransform,
    TResult Function(RedrawCommand value)? redraw,
    TResult Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult Function(_SetCursorCommand value)? setCursor,
    required TResult orElse(),
  }) {
    if (showDragOverlay != null) {
      return showDragOverlay(this);
    }
    return orElse();
  }
}

abstract class ShowDragOverlayCommand extends DiagramCommand {
  const factory ShowDragOverlayCommand(
      {final Object? ghostSpec,
      required final Offset position}) = _$ShowDragOverlayCommandImpl;
  const ShowDragOverlayCommand._() : super._();

  Object? get ghostSpec;
  Offset get position;

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShowDragOverlayCommandImplCopyWith<_$ShowDragOverlayCommandImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateDragOverlayCommandImplCopyWith<$Res> {
  factory _$$UpdateDragOverlayCommandImplCopyWith(
          _$UpdateDragOverlayCommandImpl value,
          $Res Function(_$UpdateDragOverlayCommandImpl) then) =
      __$$UpdateDragOverlayCommandImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Offset position});
}

/// @nodoc
class __$$UpdateDragOverlayCommandImplCopyWithImpl<$Res>
    extends _$DiagramCommandCopyWithImpl<$Res, _$UpdateDragOverlayCommandImpl>
    implements _$$UpdateDragOverlayCommandImplCopyWith<$Res> {
  __$$UpdateDragOverlayCommandImplCopyWithImpl(
      _$UpdateDragOverlayCommandImpl _value,
      $Res Function(_$UpdateDragOverlayCommandImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
  }) {
    return _then(_$UpdateDragOverlayCommandImpl(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Offset,
    ));
  }
}

/// @nodoc

class _$UpdateDragOverlayCommandImpl extends UpdateDragOverlayCommand {
  const _$UpdateDragOverlayCommandImpl({required this.position}) : super._();

  @override
  final Offset position;

  @override
  String toString() {
    return 'DiagramCommand.updateDragOverlay(position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateDragOverlayCommandImpl &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @override
  int get hashCode => Object.hash(runtimeType, position);

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateDragOverlayCommandImplCopyWith<_$UpdateDragOverlayCommandImpl>
      get copyWith => __$$UpdateDragOverlayCommandImplCopyWithImpl<
          _$UpdateDragOverlayCommandImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhysicalEvent origin) applyDefaultPanZoom,
    required TResult Function(Transform2D transform) setTransform,
    required TResult Function(
            List<DiagramObjectEntity> renderables, Rect logicalExtent)
        redraw,
    required TResult Function() enableAutoscroll,
    required TResult Function() disableAutoscroll,
    required TResult Function() returnToBounds,
    required TResult Function(Transform2D targetTransform, Duration duration)
        elasticBounceBack,
    required TResult Function(Offset velocity, Duration stepDuration)
        autoScrollStep,
    required TResult Function() stopAutoScroll,
    required TResult Function(Object? ghostSpec, Offset position)
        showDragOverlay,
    required TResult Function(Offset position) updateDragOverlay,
    required TResult Function() hideDragOverlay,
    required TResult Function(Offset startPosition) showSelectionOverlay,
    required TResult Function(Offset currentPosition) updateSelectionRect,
    required TResult Function() hideSelectionOverlay,
    required TResult Function(DiagramEventUnion originalEvent) handleAsUsual,
    required TResult Function(CursorEffect effect) setCursor,
  }) {
    return updateDragOverlay(position);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult? Function(Transform2D transform)? setTransform,
    TResult? Function(
            List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult? Function()? enableAutoscroll,
    TResult? Function()? disableAutoscroll,
    TResult? Function()? returnToBounds,
    TResult? Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult? Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult? Function()? stopAutoScroll,
    TResult? Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult? Function(Offset position)? updateDragOverlay,
    TResult? Function()? hideDragOverlay,
    TResult? Function(Offset startPosition)? showSelectionOverlay,
    TResult? Function(Offset currentPosition)? updateSelectionRect,
    TResult? Function()? hideSelectionOverlay,
    TResult? Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult? Function(CursorEffect effect)? setCursor,
  }) {
    return updateDragOverlay?.call(position);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult Function(Transform2D transform)? setTransform,
    TResult Function(List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult Function()? enableAutoscroll,
    TResult Function()? disableAutoscroll,
    TResult Function()? returnToBounds,
    TResult Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult Function()? stopAutoScroll,
    TResult Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult Function(Offset position)? updateDragOverlay,
    TResult Function()? hideDragOverlay,
    TResult Function(Offset startPosition)? showSelectionOverlay,
    TResult Function(Offset currentPosition)? updateSelectionRect,
    TResult Function()? hideSelectionOverlay,
    TResult Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult Function(CursorEffect effect)? setCursor,
    required TResult orElse(),
  }) {
    if (updateDragOverlay != null) {
      return updateDragOverlay(position);
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
    required TResult Function(EnableAutoscrollCommand value) enableAutoscroll,
    required TResult Function(DisableAutoscrollCommand value) disableAutoscroll,
    required TResult Function(ReturnToBoundsCommand value) returnToBounds,
    required TResult Function(ElasticBounceBackCommand value) elasticBounceBack,
    required TResult Function(AutoScrollStepCommand value) autoScrollStep,
    required TResult Function(StopAutoScrollCommand value) stopAutoScroll,
    required TResult Function(ShowDragOverlayCommand value) showDragOverlay,
    required TResult Function(UpdateDragOverlayCommand value) updateDragOverlay,
    required TResult Function(HideDragOverlayCommand value) hideDragOverlay,
    required TResult Function(ShowSelectionOverlayCommand value)
        showSelectionOverlay,
    required TResult Function(UpdateSelectionRectCommand value)
        updateSelectionRect,
    required TResult Function(HideSelectionOverlayCommand value)
        hideSelectionOverlay,
    required TResult Function(_HandleAsUsualCommand value) handleAsUsual,
    required TResult Function(_SetCursorCommand value) setCursor,
  }) {
    return updateDragOverlay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult? Function(SetTransformCommand value)? setTransform,
    TResult? Function(RedrawCommand value)? redraw,
    TResult? Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult? Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult? Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult? Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult? Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult? Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult? Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult? Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult? Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult? Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult? Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult? Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult? Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult? Function(_SetCursorCommand value)? setCursor,
  }) {
    return updateDragOverlay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult Function(SetTransformCommand value)? setTransform,
    TResult Function(RedrawCommand value)? redraw,
    TResult Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult Function(_SetCursorCommand value)? setCursor,
    required TResult orElse(),
  }) {
    if (updateDragOverlay != null) {
      return updateDragOverlay(this);
    }
    return orElse();
  }
}

abstract class UpdateDragOverlayCommand extends DiagramCommand {
  const factory UpdateDragOverlayCommand({required final Offset position}) =
      _$UpdateDragOverlayCommandImpl;
  const UpdateDragOverlayCommand._() : super._();

  Offset get position;

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateDragOverlayCommandImplCopyWith<_$UpdateDragOverlayCommandImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HideDragOverlayCommandImplCopyWith<$Res> {
  factory _$$HideDragOverlayCommandImplCopyWith(
          _$HideDragOverlayCommandImpl value,
          $Res Function(_$HideDragOverlayCommandImpl) then) =
      __$$HideDragOverlayCommandImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HideDragOverlayCommandImplCopyWithImpl<$Res>
    extends _$DiagramCommandCopyWithImpl<$Res, _$HideDragOverlayCommandImpl>
    implements _$$HideDragOverlayCommandImplCopyWith<$Res> {
  __$$HideDragOverlayCommandImplCopyWithImpl(
      _$HideDragOverlayCommandImpl _value,
      $Res Function(_$HideDragOverlayCommandImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HideDragOverlayCommandImpl extends HideDragOverlayCommand {
  const _$HideDragOverlayCommandImpl() : super._();

  @override
  String toString() {
    return 'DiagramCommand.hideDragOverlay()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HideDragOverlayCommandImpl);
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
    required TResult Function() enableAutoscroll,
    required TResult Function() disableAutoscroll,
    required TResult Function() returnToBounds,
    required TResult Function(Transform2D targetTransform, Duration duration)
        elasticBounceBack,
    required TResult Function(Offset velocity, Duration stepDuration)
        autoScrollStep,
    required TResult Function() stopAutoScroll,
    required TResult Function(Object? ghostSpec, Offset position)
        showDragOverlay,
    required TResult Function(Offset position) updateDragOverlay,
    required TResult Function() hideDragOverlay,
    required TResult Function(Offset startPosition) showSelectionOverlay,
    required TResult Function(Offset currentPosition) updateSelectionRect,
    required TResult Function() hideSelectionOverlay,
    required TResult Function(DiagramEventUnion originalEvent) handleAsUsual,
    required TResult Function(CursorEffect effect) setCursor,
  }) {
    return hideDragOverlay();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult? Function(Transform2D transform)? setTransform,
    TResult? Function(
            List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult? Function()? enableAutoscroll,
    TResult? Function()? disableAutoscroll,
    TResult? Function()? returnToBounds,
    TResult? Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult? Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult? Function()? stopAutoScroll,
    TResult? Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult? Function(Offset position)? updateDragOverlay,
    TResult? Function()? hideDragOverlay,
    TResult? Function(Offset startPosition)? showSelectionOverlay,
    TResult? Function(Offset currentPosition)? updateSelectionRect,
    TResult? Function()? hideSelectionOverlay,
    TResult? Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult? Function(CursorEffect effect)? setCursor,
  }) {
    return hideDragOverlay?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult Function(Transform2D transform)? setTransform,
    TResult Function(List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult Function()? enableAutoscroll,
    TResult Function()? disableAutoscroll,
    TResult Function()? returnToBounds,
    TResult Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult Function()? stopAutoScroll,
    TResult Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult Function(Offset position)? updateDragOverlay,
    TResult Function()? hideDragOverlay,
    TResult Function(Offset startPosition)? showSelectionOverlay,
    TResult Function(Offset currentPosition)? updateSelectionRect,
    TResult Function()? hideSelectionOverlay,
    TResult Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult Function(CursorEffect effect)? setCursor,
    required TResult orElse(),
  }) {
    if (hideDragOverlay != null) {
      return hideDragOverlay();
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
    required TResult Function(EnableAutoscrollCommand value) enableAutoscroll,
    required TResult Function(DisableAutoscrollCommand value) disableAutoscroll,
    required TResult Function(ReturnToBoundsCommand value) returnToBounds,
    required TResult Function(ElasticBounceBackCommand value) elasticBounceBack,
    required TResult Function(AutoScrollStepCommand value) autoScrollStep,
    required TResult Function(StopAutoScrollCommand value) stopAutoScroll,
    required TResult Function(ShowDragOverlayCommand value) showDragOverlay,
    required TResult Function(UpdateDragOverlayCommand value) updateDragOverlay,
    required TResult Function(HideDragOverlayCommand value) hideDragOverlay,
    required TResult Function(ShowSelectionOverlayCommand value)
        showSelectionOverlay,
    required TResult Function(UpdateSelectionRectCommand value)
        updateSelectionRect,
    required TResult Function(HideSelectionOverlayCommand value)
        hideSelectionOverlay,
    required TResult Function(_HandleAsUsualCommand value) handleAsUsual,
    required TResult Function(_SetCursorCommand value) setCursor,
  }) {
    return hideDragOverlay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult? Function(SetTransformCommand value)? setTransform,
    TResult? Function(RedrawCommand value)? redraw,
    TResult? Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult? Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult? Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult? Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult? Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult? Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult? Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult? Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult? Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult? Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult? Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult? Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult? Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult? Function(_SetCursorCommand value)? setCursor,
  }) {
    return hideDragOverlay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult Function(SetTransformCommand value)? setTransform,
    TResult Function(RedrawCommand value)? redraw,
    TResult Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult Function(_SetCursorCommand value)? setCursor,
    required TResult orElse(),
  }) {
    if (hideDragOverlay != null) {
      return hideDragOverlay(this);
    }
    return orElse();
  }
}

abstract class HideDragOverlayCommand extends DiagramCommand {
  const factory HideDragOverlayCommand() = _$HideDragOverlayCommandImpl;
  const HideDragOverlayCommand._() : super._();
}

/// @nodoc
abstract class _$$ShowSelectionOverlayCommandImplCopyWith<$Res> {
  factory _$$ShowSelectionOverlayCommandImplCopyWith(
          _$ShowSelectionOverlayCommandImpl value,
          $Res Function(_$ShowSelectionOverlayCommandImpl) then) =
      __$$ShowSelectionOverlayCommandImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Offset startPosition});
}

/// @nodoc
class __$$ShowSelectionOverlayCommandImplCopyWithImpl<$Res>
    extends _$DiagramCommandCopyWithImpl<$Res,
        _$ShowSelectionOverlayCommandImpl>
    implements _$$ShowSelectionOverlayCommandImplCopyWith<$Res> {
  __$$ShowSelectionOverlayCommandImplCopyWithImpl(
      _$ShowSelectionOverlayCommandImpl _value,
      $Res Function(_$ShowSelectionOverlayCommandImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startPosition = null,
  }) {
    return _then(_$ShowSelectionOverlayCommandImpl(
      startPosition: null == startPosition
          ? _value.startPosition
          : startPosition // ignore: cast_nullable_to_non_nullable
              as Offset,
    ));
  }
}

/// @nodoc

class _$ShowSelectionOverlayCommandImpl extends ShowSelectionOverlayCommand {
  const _$ShowSelectionOverlayCommandImpl({required this.startPosition})
      : super._();

  @override
  final Offset startPosition;

  @override
  String toString() {
    return 'DiagramCommand.showSelectionOverlay(startPosition: $startPosition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShowSelectionOverlayCommandImpl &&
            (identical(other.startPosition, startPosition) ||
                other.startPosition == startPosition));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startPosition);

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShowSelectionOverlayCommandImplCopyWith<_$ShowSelectionOverlayCommandImpl>
      get copyWith => __$$ShowSelectionOverlayCommandImplCopyWithImpl<
          _$ShowSelectionOverlayCommandImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhysicalEvent origin) applyDefaultPanZoom,
    required TResult Function(Transform2D transform) setTransform,
    required TResult Function(
            List<DiagramObjectEntity> renderables, Rect logicalExtent)
        redraw,
    required TResult Function() enableAutoscroll,
    required TResult Function() disableAutoscroll,
    required TResult Function() returnToBounds,
    required TResult Function(Transform2D targetTransform, Duration duration)
        elasticBounceBack,
    required TResult Function(Offset velocity, Duration stepDuration)
        autoScrollStep,
    required TResult Function() stopAutoScroll,
    required TResult Function(Object? ghostSpec, Offset position)
        showDragOverlay,
    required TResult Function(Offset position) updateDragOverlay,
    required TResult Function() hideDragOverlay,
    required TResult Function(Offset startPosition) showSelectionOverlay,
    required TResult Function(Offset currentPosition) updateSelectionRect,
    required TResult Function() hideSelectionOverlay,
    required TResult Function(DiagramEventUnion originalEvent) handleAsUsual,
    required TResult Function(CursorEffect effect) setCursor,
  }) {
    return showSelectionOverlay(startPosition);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult? Function(Transform2D transform)? setTransform,
    TResult? Function(
            List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult? Function()? enableAutoscroll,
    TResult? Function()? disableAutoscroll,
    TResult? Function()? returnToBounds,
    TResult? Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult? Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult? Function()? stopAutoScroll,
    TResult? Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult? Function(Offset position)? updateDragOverlay,
    TResult? Function()? hideDragOverlay,
    TResult? Function(Offset startPosition)? showSelectionOverlay,
    TResult? Function(Offset currentPosition)? updateSelectionRect,
    TResult? Function()? hideSelectionOverlay,
    TResult? Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult? Function(CursorEffect effect)? setCursor,
  }) {
    return showSelectionOverlay?.call(startPosition);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult Function(Transform2D transform)? setTransform,
    TResult Function(List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult Function()? enableAutoscroll,
    TResult Function()? disableAutoscroll,
    TResult Function()? returnToBounds,
    TResult Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult Function()? stopAutoScroll,
    TResult Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult Function(Offset position)? updateDragOverlay,
    TResult Function()? hideDragOverlay,
    TResult Function(Offset startPosition)? showSelectionOverlay,
    TResult Function(Offset currentPosition)? updateSelectionRect,
    TResult Function()? hideSelectionOverlay,
    TResult Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult Function(CursorEffect effect)? setCursor,
    required TResult orElse(),
  }) {
    if (showSelectionOverlay != null) {
      return showSelectionOverlay(startPosition);
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
    required TResult Function(EnableAutoscrollCommand value) enableAutoscroll,
    required TResult Function(DisableAutoscrollCommand value) disableAutoscroll,
    required TResult Function(ReturnToBoundsCommand value) returnToBounds,
    required TResult Function(ElasticBounceBackCommand value) elasticBounceBack,
    required TResult Function(AutoScrollStepCommand value) autoScrollStep,
    required TResult Function(StopAutoScrollCommand value) stopAutoScroll,
    required TResult Function(ShowDragOverlayCommand value) showDragOverlay,
    required TResult Function(UpdateDragOverlayCommand value) updateDragOverlay,
    required TResult Function(HideDragOverlayCommand value) hideDragOverlay,
    required TResult Function(ShowSelectionOverlayCommand value)
        showSelectionOverlay,
    required TResult Function(UpdateSelectionRectCommand value)
        updateSelectionRect,
    required TResult Function(HideSelectionOverlayCommand value)
        hideSelectionOverlay,
    required TResult Function(_HandleAsUsualCommand value) handleAsUsual,
    required TResult Function(_SetCursorCommand value) setCursor,
  }) {
    return showSelectionOverlay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult? Function(SetTransformCommand value)? setTransform,
    TResult? Function(RedrawCommand value)? redraw,
    TResult? Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult? Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult? Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult? Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult? Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult? Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult? Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult? Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult? Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult? Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult? Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult? Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult? Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult? Function(_SetCursorCommand value)? setCursor,
  }) {
    return showSelectionOverlay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult Function(SetTransformCommand value)? setTransform,
    TResult Function(RedrawCommand value)? redraw,
    TResult Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult Function(_SetCursorCommand value)? setCursor,
    required TResult orElse(),
  }) {
    if (showSelectionOverlay != null) {
      return showSelectionOverlay(this);
    }
    return orElse();
  }
}

abstract class ShowSelectionOverlayCommand extends DiagramCommand {
  const factory ShowSelectionOverlayCommand(
          {required final Offset startPosition}) =
      _$ShowSelectionOverlayCommandImpl;
  const ShowSelectionOverlayCommand._() : super._();

  Offset get startPosition;

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShowSelectionOverlayCommandImplCopyWith<_$ShowSelectionOverlayCommandImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateSelectionRectCommandImplCopyWith<$Res> {
  factory _$$UpdateSelectionRectCommandImplCopyWith(
          _$UpdateSelectionRectCommandImpl value,
          $Res Function(_$UpdateSelectionRectCommandImpl) then) =
      __$$UpdateSelectionRectCommandImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Offset currentPosition});
}

/// @nodoc
class __$$UpdateSelectionRectCommandImplCopyWithImpl<$Res>
    extends _$DiagramCommandCopyWithImpl<$Res, _$UpdateSelectionRectCommandImpl>
    implements _$$UpdateSelectionRectCommandImplCopyWith<$Res> {
  __$$UpdateSelectionRectCommandImplCopyWithImpl(
      _$UpdateSelectionRectCommandImpl _value,
      $Res Function(_$UpdateSelectionRectCommandImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPosition = null,
  }) {
    return _then(_$UpdateSelectionRectCommandImpl(
      currentPosition: null == currentPosition
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as Offset,
    ));
  }
}

/// @nodoc

class _$UpdateSelectionRectCommandImpl extends UpdateSelectionRectCommand {
  const _$UpdateSelectionRectCommandImpl({required this.currentPosition})
      : super._();

  @override
  final Offset currentPosition;

  @override
  String toString() {
    return 'DiagramCommand.updateSelectionRect(currentPosition: $currentPosition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSelectionRectCommandImpl &&
            (identical(other.currentPosition, currentPosition) ||
                other.currentPosition == currentPosition));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentPosition);

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSelectionRectCommandImplCopyWith<_$UpdateSelectionRectCommandImpl>
      get copyWith => __$$UpdateSelectionRectCommandImplCopyWithImpl<
          _$UpdateSelectionRectCommandImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhysicalEvent origin) applyDefaultPanZoom,
    required TResult Function(Transform2D transform) setTransform,
    required TResult Function(
            List<DiagramObjectEntity> renderables, Rect logicalExtent)
        redraw,
    required TResult Function() enableAutoscroll,
    required TResult Function() disableAutoscroll,
    required TResult Function() returnToBounds,
    required TResult Function(Transform2D targetTransform, Duration duration)
        elasticBounceBack,
    required TResult Function(Offset velocity, Duration stepDuration)
        autoScrollStep,
    required TResult Function() stopAutoScroll,
    required TResult Function(Object? ghostSpec, Offset position)
        showDragOverlay,
    required TResult Function(Offset position) updateDragOverlay,
    required TResult Function() hideDragOverlay,
    required TResult Function(Offset startPosition) showSelectionOverlay,
    required TResult Function(Offset currentPosition) updateSelectionRect,
    required TResult Function() hideSelectionOverlay,
    required TResult Function(DiagramEventUnion originalEvent) handleAsUsual,
    required TResult Function(CursorEffect effect) setCursor,
  }) {
    return updateSelectionRect(currentPosition);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult? Function(Transform2D transform)? setTransform,
    TResult? Function(
            List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult? Function()? enableAutoscroll,
    TResult? Function()? disableAutoscroll,
    TResult? Function()? returnToBounds,
    TResult? Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult? Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult? Function()? stopAutoScroll,
    TResult? Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult? Function(Offset position)? updateDragOverlay,
    TResult? Function()? hideDragOverlay,
    TResult? Function(Offset startPosition)? showSelectionOverlay,
    TResult? Function(Offset currentPosition)? updateSelectionRect,
    TResult? Function()? hideSelectionOverlay,
    TResult? Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult? Function(CursorEffect effect)? setCursor,
  }) {
    return updateSelectionRect?.call(currentPosition);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult Function(Transform2D transform)? setTransform,
    TResult Function(List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult Function()? enableAutoscroll,
    TResult Function()? disableAutoscroll,
    TResult Function()? returnToBounds,
    TResult Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult Function()? stopAutoScroll,
    TResult Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult Function(Offset position)? updateDragOverlay,
    TResult Function()? hideDragOverlay,
    TResult Function(Offset startPosition)? showSelectionOverlay,
    TResult Function(Offset currentPosition)? updateSelectionRect,
    TResult Function()? hideSelectionOverlay,
    TResult Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult Function(CursorEffect effect)? setCursor,
    required TResult orElse(),
  }) {
    if (updateSelectionRect != null) {
      return updateSelectionRect(currentPosition);
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
    required TResult Function(EnableAutoscrollCommand value) enableAutoscroll,
    required TResult Function(DisableAutoscrollCommand value) disableAutoscroll,
    required TResult Function(ReturnToBoundsCommand value) returnToBounds,
    required TResult Function(ElasticBounceBackCommand value) elasticBounceBack,
    required TResult Function(AutoScrollStepCommand value) autoScrollStep,
    required TResult Function(StopAutoScrollCommand value) stopAutoScroll,
    required TResult Function(ShowDragOverlayCommand value) showDragOverlay,
    required TResult Function(UpdateDragOverlayCommand value) updateDragOverlay,
    required TResult Function(HideDragOverlayCommand value) hideDragOverlay,
    required TResult Function(ShowSelectionOverlayCommand value)
        showSelectionOverlay,
    required TResult Function(UpdateSelectionRectCommand value)
        updateSelectionRect,
    required TResult Function(HideSelectionOverlayCommand value)
        hideSelectionOverlay,
    required TResult Function(_HandleAsUsualCommand value) handleAsUsual,
    required TResult Function(_SetCursorCommand value) setCursor,
  }) {
    return updateSelectionRect(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult? Function(SetTransformCommand value)? setTransform,
    TResult? Function(RedrawCommand value)? redraw,
    TResult? Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult? Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult? Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult? Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult? Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult? Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult? Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult? Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult? Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult? Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult? Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult? Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult? Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult? Function(_SetCursorCommand value)? setCursor,
  }) {
    return updateSelectionRect?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult Function(SetTransformCommand value)? setTransform,
    TResult Function(RedrawCommand value)? redraw,
    TResult Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult Function(_SetCursorCommand value)? setCursor,
    required TResult orElse(),
  }) {
    if (updateSelectionRect != null) {
      return updateSelectionRect(this);
    }
    return orElse();
  }
}

abstract class UpdateSelectionRectCommand extends DiagramCommand {
  const factory UpdateSelectionRectCommand(
          {required final Offset currentPosition}) =
      _$UpdateSelectionRectCommandImpl;
  const UpdateSelectionRectCommand._() : super._();

  Offset get currentPosition;

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateSelectionRectCommandImplCopyWith<_$UpdateSelectionRectCommandImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HideSelectionOverlayCommandImplCopyWith<$Res> {
  factory _$$HideSelectionOverlayCommandImplCopyWith(
          _$HideSelectionOverlayCommandImpl value,
          $Res Function(_$HideSelectionOverlayCommandImpl) then) =
      __$$HideSelectionOverlayCommandImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HideSelectionOverlayCommandImplCopyWithImpl<$Res>
    extends _$DiagramCommandCopyWithImpl<$Res,
        _$HideSelectionOverlayCommandImpl>
    implements _$$HideSelectionOverlayCommandImplCopyWith<$Res> {
  __$$HideSelectionOverlayCommandImplCopyWithImpl(
      _$HideSelectionOverlayCommandImpl _value,
      $Res Function(_$HideSelectionOverlayCommandImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$HideSelectionOverlayCommandImpl extends HideSelectionOverlayCommand {
  const _$HideSelectionOverlayCommandImpl() : super._();

  @override
  String toString() {
    return 'DiagramCommand.hideSelectionOverlay()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HideSelectionOverlayCommandImpl);
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
    required TResult Function() enableAutoscroll,
    required TResult Function() disableAutoscroll,
    required TResult Function() returnToBounds,
    required TResult Function(Transform2D targetTransform, Duration duration)
        elasticBounceBack,
    required TResult Function(Offset velocity, Duration stepDuration)
        autoScrollStep,
    required TResult Function() stopAutoScroll,
    required TResult Function(Object? ghostSpec, Offset position)
        showDragOverlay,
    required TResult Function(Offset position) updateDragOverlay,
    required TResult Function() hideDragOverlay,
    required TResult Function(Offset startPosition) showSelectionOverlay,
    required TResult Function(Offset currentPosition) updateSelectionRect,
    required TResult Function() hideSelectionOverlay,
    required TResult Function(DiagramEventUnion originalEvent) handleAsUsual,
    required TResult Function(CursorEffect effect) setCursor,
  }) {
    return hideSelectionOverlay();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult? Function(Transform2D transform)? setTransform,
    TResult? Function(
            List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult? Function()? enableAutoscroll,
    TResult? Function()? disableAutoscroll,
    TResult? Function()? returnToBounds,
    TResult? Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult? Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult? Function()? stopAutoScroll,
    TResult? Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult? Function(Offset position)? updateDragOverlay,
    TResult? Function()? hideDragOverlay,
    TResult? Function(Offset startPosition)? showSelectionOverlay,
    TResult? Function(Offset currentPosition)? updateSelectionRect,
    TResult? Function()? hideSelectionOverlay,
    TResult? Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult? Function(CursorEffect effect)? setCursor,
  }) {
    return hideSelectionOverlay?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult Function(Transform2D transform)? setTransform,
    TResult Function(List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult Function()? enableAutoscroll,
    TResult Function()? disableAutoscroll,
    TResult Function()? returnToBounds,
    TResult Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult Function()? stopAutoScroll,
    TResult Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult Function(Offset position)? updateDragOverlay,
    TResult Function()? hideDragOverlay,
    TResult Function(Offset startPosition)? showSelectionOverlay,
    TResult Function(Offset currentPosition)? updateSelectionRect,
    TResult Function()? hideSelectionOverlay,
    TResult Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult Function(CursorEffect effect)? setCursor,
    required TResult orElse(),
  }) {
    if (hideSelectionOverlay != null) {
      return hideSelectionOverlay();
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
    required TResult Function(EnableAutoscrollCommand value) enableAutoscroll,
    required TResult Function(DisableAutoscrollCommand value) disableAutoscroll,
    required TResult Function(ReturnToBoundsCommand value) returnToBounds,
    required TResult Function(ElasticBounceBackCommand value) elasticBounceBack,
    required TResult Function(AutoScrollStepCommand value) autoScrollStep,
    required TResult Function(StopAutoScrollCommand value) stopAutoScroll,
    required TResult Function(ShowDragOverlayCommand value) showDragOverlay,
    required TResult Function(UpdateDragOverlayCommand value) updateDragOverlay,
    required TResult Function(HideDragOverlayCommand value) hideDragOverlay,
    required TResult Function(ShowSelectionOverlayCommand value)
        showSelectionOverlay,
    required TResult Function(UpdateSelectionRectCommand value)
        updateSelectionRect,
    required TResult Function(HideSelectionOverlayCommand value)
        hideSelectionOverlay,
    required TResult Function(_HandleAsUsualCommand value) handleAsUsual,
    required TResult Function(_SetCursorCommand value) setCursor,
  }) {
    return hideSelectionOverlay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult? Function(SetTransformCommand value)? setTransform,
    TResult? Function(RedrawCommand value)? redraw,
    TResult? Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult? Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult? Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult? Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult? Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult? Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult? Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult? Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult? Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult? Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult? Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult? Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult? Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult? Function(_SetCursorCommand value)? setCursor,
  }) {
    return hideSelectionOverlay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult Function(SetTransformCommand value)? setTransform,
    TResult Function(RedrawCommand value)? redraw,
    TResult Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult Function(_SetCursorCommand value)? setCursor,
    required TResult orElse(),
  }) {
    if (hideSelectionOverlay != null) {
      return hideSelectionOverlay(this);
    }
    return orElse();
  }
}

abstract class HideSelectionOverlayCommand extends DiagramCommand {
  const factory HideSelectionOverlayCommand() =
      _$HideSelectionOverlayCommandImpl;
  const HideSelectionOverlayCommand._() : super._();
}

/// @nodoc
abstract class _$$HandleAsUsualCommandImplCopyWith<$Res> {
  factory _$$HandleAsUsualCommandImplCopyWith(_$HandleAsUsualCommandImpl value,
          $Res Function(_$HandleAsUsualCommandImpl) then) =
      __$$HandleAsUsualCommandImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DiagramEventUnion originalEvent});

  $DiagramEventUnionCopyWith<$Res> get originalEvent;
}

/// @nodoc
class __$$HandleAsUsualCommandImplCopyWithImpl<$Res>
    extends _$DiagramCommandCopyWithImpl<$Res, _$HandleAsUsualCommandImpl>
    implements _$$HandleAsUsualCommandImplCopyWith<$Res> {
  __$$HandleAsUsualCommandImplCopyWithImpl(_$HandleAsUsualCommandImpl _value,
      $Res Function(_$HandleAsUsualCommandImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originalEvent = null,
  }) {
    return _then(_$HandleAsUsualCommandImpl(
      originalEvent: null == originalEvent
          ? _value.originalEvent
          : originalEvent // ignore: cast_nullable_to_non_nullable
              as DiagramEventUnion,
    ));
  }

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DiagramEventUnionCopyWith<$Res> get originalEvent {
    return $DiagramEventUnionCopyWith<$Res>(_value.originalEvent, (value) {
      return _then(_value.copyWith(originalEvent: value));
    });
  }
}

/// @nodoc

class _$HandleAsUsualCommandImpl extends _HandleAsUsualCommand {
  const _$HandleAsUsualCommandImpl({required this.originalEvent}) : super._();

  @override
  final DiagramEventUnion originalEvent;

  @override
  String toString() {
    return 'DiagramCommand.handleAsUsual(originalEvent: $originalEvent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HandleAsUsualCommandImpl &&
            (identical(other.originalEvent, originalEvent) ||
                other.originalEvent == originalEvent));
  }

  @override
  int get hashCode => Object.hash(runtimeType, originalEvent);

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HandleAsUsualCommandImplCopyWith<_$HandleAsUsualCommandImpl>
      get copyWith =>
          __$$HandleAsUsualCommandImplCopyWithImpl<_$HandleAsUsualCommandImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhysicalEvent origin) applyDefaultPanZoom,
    required TResult Function(Transform2D transform) setTransform,
    required TResult Function(
            List<DiagramObjectEntity> renderables, Rect logicalExtent)
        redraw,
    required TResult Function() enableAutoscroll,
    required TResult Function() disableAutoscroll,
    required TResult Function() returnToBounds,
    required TResult Function(Transform2D targetTransform, Duration duration)
        elasticBounceBack,
    required TResult Function(Offset velocity, Duration stepDuration)
        autoScrollStep,
    required TResult Function() stopAutoScroll,
    required TResult Function(Object? ghostSpec, Offset position)
        showDragOverlay,
    required TResult Function(Offset position) updateDragOverlay,
    required TResult Function() hideDragOverlay,
    required TResult Function(Offset startPosition) showSelectionOverlay,
    required TResult Function(Offset currentPosition) updateSelectionRect,
    required TResult Function() hideSelectionOverlay,
    required TResult Function(DiagramEventUnion originalEvent) handleAsUsual,
    required TResult Function(CursorEffect effect) setCursor,
  }) {
    return handleAsUsual(originalEvent);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult? Function(Transform2D transform)? setTransform,
    TResult? Function(
            List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult? Function()? enableAutoscroll,
    TResult? Function()? disableAutoscroll,
    TResult? Function()? returnToBounds,
    TResult? Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult? Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult? Function()? stopAutoScroll,
    TResult? Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult? Function(Offset position)? updateDragOverlay,
    TResult? Function()? hideDragOverlay,
    TResult? Function(Offset startPosition)? showSelectionOverlay,
    TResult? Function(Offset currentPosition)? updateSelectionRect,
    TResult? Function()? hideSelectionOverlay,
    TResult? Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult? Function(CursorEffect effect)? setCursor,
  }) {
    return handleAsUsual?.call(originalEvent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult Function(Transform2D transform)? setTransform,
    TResult Function(List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult Function()? enableAutoscroll,
    TResult Function()? disableAutoscroll,
    TResult Function()? returnToBounds,
    TResult Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult Function()? stopAutoScroll,
    TResult Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult Function(Offset position)? updateDragOverlay,
    TResult Function()? hideDragOverlay,
    TResult Function(Offset startPosition)? showSelectionOverlay,
    TResult Function(Offset currentPosition)? updateSelectionRect,
    TResult Function()? hideSelectionOverlay,
    TResult Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult Function(CursorEffect effect)? setCursor,
    required TResult orElse(),
  }) {
    if (handleAsUsual != null) {
      return handleAsUsual(originalEvent);
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
    required TResult Function(EnableAutoscrollCommand value) enableAutoscroll,
    required TResult Function(DisableAutoscrollCommand value) disableAutoscroll,
    required TResult Function(ReturnToBoundsCommand value) returnToBounds,
    required TResult Function(ElasticBounceBackCommand value) elasticBounceBack,
    required TResult Function(AutoScrollStepCommand value) autoScrollStep,
    required TResult Function(StopAutoScrollCommand value) stopAutoScroll,
    required TResult Function(ShowDragOverlayCommand value) showDragOverlay,
    required TResult Function(UpdateDragOverlayCommand value) updateDragOverlay,
    required TResult Function(HideDragOverlayCommand value) hideDragOverlay,
    required TResult Function(ShowSelectionOverlayCommand value)
        showSelectionOverlay,
    required TResult Function(UpdateSelectionRectCommand value)
        updateSelectionRect,
    required TResult Function(HideSelectionOverlayCommand value)
        hideSelectionOverlay,
    required TResult Function(_HandleAsUsualCommand value) handleAsUsual,
    required TResult Function(_SetCursorCommand value) setCursor,
  }) {
    return handleAsUsual(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult? Function(SetTransformCommand value)? setTransform,
    TResult? Function(RedrawCommand value)? redraw,
    TResult? Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult? Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult? Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult? Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult? Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult? Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult? Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult? Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult? Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult? Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult? Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult? Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult? Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult? Function(_SetCursorCommand value)? setCursor,
  }) {
    return handleAsUsual?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult Function(SetTransformCommand value)? setTransform,
    TResult Function(RedrawCommand value)? redraw,
    TResult Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult Function(_SetCursorCommand value)? setCursor,
    required TResult orElse(),
  }) {
    if (handleAsUsual != null) {
      return handleAsUsual(this);
    }
    return orElse();
  }
}

abstract class _HandleAsUsualCommand extends DiagramCommand {
  const factory _HandleAsUsualCommand(
          {required final DiagramEventUnion originalEvent}) =
      _$HandleAsUsualCommandImpl;
  const _HandleAsUsualCommand._() : super._();

  DiagramEventUnion get originalEvent;

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HandleAsUsualCommandImplCopyWith<_$HandleAsUsualCommandImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetCursorCommandImplCopyWith<$Res> {
  factory _$$SetCursorCommandImplCopyWith(_$SetCursorCommandImpl value,
          $Res Function(_$SetCursorCommandImpl) then) =
      __$$SetCursorCommandImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CursorEffect effect});
}

/// @nodoc
class __$$SetCursorCommandImplCopyWithImpl<$Res>
    extends _$DiagramCommandCopyWithImpl<$Res, _$SetCursorCommandImpl>
    implements _$$SetCursorCommandImplCopyWith<$Res> {
  __$$SetCursorCommandImplCopyWithImpl(_$SetCursorCommandImpl _value,
      $Res Function(_$SetCursorCommandImpl) _then)
      : super(_value, _then);

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? effect = null,
  }) {
    return _then(_$SetCursorCommandImpl(
      effect: null == effect
          ? _value.effect
          : effect // ignore: cast_nullable_to_non_nullable
              as CursorEffect,
    ));
  }
}

/// @nodoc

class _$SetCursorCommandImpl extends _SetCursorCommand {
  const _$SetCursorCommandImpl({required this.effect}) : super._();

  @override
  final CursorEffect effect;

  @override
  String toString() {
    return 'DiagramCommand.setCursor(effect: $effect)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetCursorCommandImpl &&
            (identical(other.effect, effect) || other.effect == effect));
  }

  @override
  int get hashCode => Object.hash(runtimeType, effect);

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetCursorCommandImplCopyWith<_$SetCursorCommandImpl> get copyWith =>
      __$$SetCursorCommandImplCopyWithImpl<_$SetCursorCommandImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhysicalEvent origin) applyDefaultPanZoom,
    required TResult Function(Transform2D transform) setTransform,
    required TResult Function(
            List<DiagramObjectEntity> renderables, Rect logicalExtent)
        redraw,
    required TResult Function() enableAutoscroll,
    required TResult Function() disableAutoscroll,
    required TResult Function() returnToBounds,
    required TResult Function(Transform2D targetTransform, Duration duration)
        elasticBounceBack,
    required TResult Function(Offset velocity, Duration stepDuration)
        autoScrollStep,
    required TResult Function() stopAutoScroll,
    required TResult Function(Object? ghostSpec, Offset position)
        showDragOverlay,
    required TResult Function(Offset position) updateDragOverlay,
    required TResult Function() hideDragOverlay,
    required TResult Function(Offset startPosition) showSelectionOverlay,
    required TResult Function(Offset currentPosition) updateSelectionRect,
    required TResult Function() hideSelectionOverlay,
    required TResult Function(DiagramEventUnion originalEvent) handleAsUsual,
    required TResult Function(CursorEffect effect) setCursor,
  }) {
    return setCursor(effect);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult? Function(Transform2D transform)? setTransform,
    TResult? Function(
            List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult? Function()? enableAutoscroll,
    TResult? Function()? disableAutoscroll,
    TResult? Function()? returnToBounds,
    TResult? Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult? Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult? Function()? stopAutoScroll,
    TResult? Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult? Function(Offset position)? updateDragOverlay,
    TResult? Function()? hideDragOverlay,
    TResult? Function(Offset startPosition)? showSelectionOverlay,
    TResult? Function(Offset currentPosition)? updateSelectionRect,
    TResult? Function()? hideSelectionOverlay,
    TResult? Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult? Function(CursorEffect effect)? setCursor,
  }) {
    return setCursor?.call(effect);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhysicalEvent origin)? applyDefaultPanZoom,
    TResult Function(Transform2D transform)? setTransform,
    TResult Function(List<DiagramObjectEntity> renderables, Rect logicalExtent)?
        redraw,
    TResult Function()? enableAutoscroll,
    TResult Function()? disableAutoscroll,
    TResult Function()? returnToBounds,
    TResult Function(Transform2D targetTransform, Duration duration)?
        elasticBounceBack,
    TResult Function(Offset velocity, Duration stepDuration)? autoScrollStep,
    TResult Function()? stopAutoScroll,
    TResult Function(Object? ghostSpec, Offset position)? showDragOverlay,
    TResult Function(Offset position)? updateDragOverlay,
    TResult Function()? hideDragOverlay,
    TResult Function(Offset startPosition)? showSelectionOverlay,
    TResult Function(Offset currentPosition)? updateSelectionRect,
    TResult Function()? hideSelectionOverlay,
    TResult Function(DiagramEventUnion originalEvent)? handleAsUsual,
    TResult Function(CursorEffect effect)? setCursor,
    required TResult orElse(),
  }) {
    if (setCursor != null) {
      return setCursor(effect);
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
    required TResult Function(EnableAutoscrollCommand value) enableAutoscroll,
    required TResult Function(DisableAutoscrollCommand value) disableAutoscroll,
    required TResult Function(ReturnToBoundsCommand value) returnToBounds,
    required TResult Function(ElasticBounceBackCommand value) elasticBounceBack,
    required TResult Function(AutoScrollStepCommand value) autoScrollStep,
    required TResult Function(StopAutoScrollCommand value) stopAutoScroll,
    required TResult Function(ShowDragOverlayCommand value) showDragOverlay,
    required TResult Function(UpdateDragOverlayCommand value) updateDragOverlay,
    required TResult Function(HideDragOverlayCommand value) hideDragOverlay,
    required TResult Function(ShowSelectionOverlayCommand value)
        showSelectionOverlay,
    required TResult Function(UpdateSelectionRectCommand value)
        updateSelectionRect,
    required TResult Function(HideSelectionOverlayCommand value)
        hideSelectionOverlay,
    required TResult Function(_HandleAsUsualCommand value) handleAsUsual,
    required TResult Function(_SetCursorCommand value) setCursor,
  }) {
    return setCursor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult? Function(SetTransformCommand value)? setTransform,
    TResult? Function(RedrawCommand value)? redraw,
    TResult? Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult? Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult? Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult? Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult? Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult? Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult? Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult? Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult? Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult? Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult? Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult? Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult? Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult? Function(_SetCursorCommand value)? setCursor,
  }) {
    return setCursor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ApplyDefaultPanZoomCommand value)? applyDefaultPanZoom,
    TResult Function(SetTransformCommand value)? setTransform,
    TResult Function(RedrawCommand value)? redraw,
    TResult Function(EnableAutoscrollCommand value)? enableAutoscroll,
    TResult Function(DisableAutoscrollCommand value)? disableAutoscroll,
    TResult Function(ReturnToBoundsCommand value)? returnToBounds,
    TResult Function(ElasticBounceBackCommand value)? elasticBounceBack,
    TResult Function(AutoScrollStepCommand value)? autoScrollStep,
    TResult Function(StopAutoScrollCommand value)? stopAutoScroll,
    TResult Function(ShowDragOverlayCommand value)? showDragOverlay,
    TResult Function(UpdateDragOverlayCommand value)? updateDragOverlay,
    TResult Function(HideDragOverlayCommand value)? hideDragOverlay,
    TResult Function(ShowSelectionOverlayCommand value)? showSelectionOverlay,
    TResult Function(UpdateSelectionRectCommand value)? updateSelectionRect,
    TResult Function(HideSelectionOverlayCommand value)? hideSelectionOverlay,
    TResult Function(_HandleAsUsualCommand value)? handleAsUsual,
    TResult Function(_SetCursorCommand value)? setCursor,
    required TResult orElse(),
  }) {
    if (setCursor != null) {
      return setCursor(this);
    }
    return orElse();
  }
}

abstract class _SetCursorCommand extends DiagramCommand {
  const factory _SetCursorCommand({required final CursorEffect effect}) =
      _$SetCursorCommandImpl;
  const _SetCursorCommand._() : super._();

  CursorEffect get effect;

  /// Create a copy of DiagramCommand
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetCursorCommandImplCopyWith<_$SetCursorCommandImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
