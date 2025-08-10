import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diagram_viewer/events/events.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/tools/transform2d/transform2d_utils.dart';
import 'zoom_event.dart';
import 'zoom_state.dart';

/// BLoC for managing zoom operations
class ZoomBloc extends Bloc<ZoomEvent, ZoomState> {
  final DiagramConfiguration configuration;
  final Rect diagramRect;
  final Size viewportSize;

  Timer? _bounceBackTimer;
  bool _isOverscrolled = false;

  ZoomBloc({
    required this.configuration,
    required this.diagramRect,
    required this.viewportSize,
  }) : super(const ZoomState.initial()) {
    on<ZoomEvent>(_onZoomEvent);
  }

  void _onZoomEvent(ZoomEvent event, Emitter<ZoomState> emit) {
    event.when(
      mouseWheelZoom: (scrollDelta, screenPosition, currentTransform) {
        _handleMouseWheelZoom(
            scrollDelta, screenPosition, currentTransform, emit);
      },
      pinchZoom: (scale, screenPosition, currentTransform) {
        _handlePinchZoom(scale, screenPosition, currentTransform, emit);
      },
      keyboardZoom: (zoomIn, currentTransform) {
        _handleKeyboardZoom(zoomIn, currentTransform, emit);
      },
      executeBounceBack: () {
        _executeBounceBack(emit);
      },
      reset: () {
        _reset(emit);
      },
    );
  }

  void _handleMouseWheelZoom(
    double scrollDelta,
    Offset screenPosition,
    Transform2D currentTransform,
    Emitter<ZoomState> emit,
  ) {
    const zoomFactor = 1.2;
    final scale = scrollDelta < 0 ? zoomFactor : 1.0 / zoomFactor;

    // Check if we're trying to zoom beyond limits
    final wouldExceedMaxZoom =
        currentTransform.scale * scale > configuration.maxZoom;
    final wouldExceedMinZoom =
        currentTransform.scale * scale < configuration.minZoom;

    // If we're at the normal limits and trying to go beyond, block the event
    if ((wouldExceedMaxZoom &&
            currentTransform.scale >= configuration.maxZoom &&
            !_isOverscrolled) ||
        (wouldExceedMinZoom &&
            currentTransform.scale <= configuration.minZoom &&
            !_isOverscrolled)) {
      return; // Block the zoom event completely
    }

    final focalPointInLogical =
        currentTransform.physicalToLogical(screenPosition);
    final newTransform = currentTransform.applyZoom(scale, focalPointInLogical);

    final finalTransform = Transform2DUtils.capTransformWithZoomLimits(
      transform: newTransform,
      diagramRect: diagramRect,
      size: viewportSize,
      dynamic: true,
      minZoom: configuration.minZoom,
      maxZoom: configuration.maxZoom,
    );

    _scheduleBounceBack();

    emit(ZoomState.zooming(
      isOverscrolled: _isOverscrolled,
      currentScale: finalTransform.scale,
      focalPoint: focalPointInLogical,
    ));
  }

  void _handlePinchZoom(
    double scale,
    Offset screenPosition,
    Transform2D currentTransform,
    Emitter<ZoomState> emit,
  ) {
    // Check if we're trying to zoom beyond limits
    final wouldExceedMaxZoom =
        currentTransform.scale * scale > configuration.maxZoom;
    final wouldExceedMinZoom =
        currentTransform.scale * scale < configuration.minZoom;

    // If we're at the normal limits and trying to go beyond, block the event
    if ((wouldExceedMaxZoom &&
            currentTransform.scale >= configuration.maxZoom &&
            !_isOverscrolled) ||
        (wouldExceedMinZoom &&
            currentTransform.scale <= configuration.minZoom &&
            !_isOverscrolled)) {
      return; // Block the zoom event completely
    }

    final focalPointInLogical =
        currentTransform.physicalToLogical(screenPosition);
    final newTransform = currentTransform.applyZoom(scale, focalPointInLogical);

    final finalTransform = Transform2DUtils.capTransformWithZoomLimits(
      transform: newTransform,
      diagramRect: diagramRect,
      size: viewportSize,
      dynamic: true,
      minZoom: configuration.minZoom,
      maxZoom: configuration.maxZoom,
    );

    _scheduleBounceBack();

    emit(ZoomState.zooming(
      isOverscrolled: _isOverscrolled,
      currentScale: finalTransform.scale,
      focalPoint: focalPointInLogical,
    ));
  }

  void _handleKeyboardZoom(
    bool zoomIn,
    Transform2D currentTransform,
    Emitter<ZoomState> emit,
  ) {
    const zoomStep = 1.2;
    final scale = zoomIn ? zoomStep : 1.0 / zoomStep;
    final centerPoint = Offset(viewportSize.width / 2, viewportSize.height / 2);
    final focalPointInLogical = currentTransform.physicalToLogical(centerPoint);

    final newTransform = currentTransform.applyZoom(scale, focalPointInLogical);

    final finalTransform = Transform2DUtils.capTransformWithZoomLimits(
      transform: newTransform,
      diagramRect: diagramRect,
      size: viewportSize,
      dynamic: false,
      minZoom: configuration.minZoom,
      maxZoom: configuration.maxZoom,
    );

    emit(ZoomState.zooming(
      isOverscrolled: false,
      currentScale: finalTransform.scale,
      focalPoint: focalPointInLogical,
    ));
  }

  void _scheduleBounceBack() {
    _bounceBackTimer?.cancel();
    _isOverscrolled = true;

    _bounceBackTimer = Timer(const Duration(milliseconds: 300), () {
      if (_isOverscrolled) {
        add(const ZoomEvent.executeBounceBack());
      }
    });
  }

  void _executeBounceBack(Emitter<ZoomState> emit) {
    _isOverscrolled = false;
    emit(const ZoomState.initial());
  }

  void _reset(Emitter<ZoomState> emit) {
    _bounceBackTimer?.cancel();
    _isOverscrolled = false;
    emit(const ZoomState.initial());
  }

  @override
  Future<void> close() {
    _bounceBackTimer?.cancel();
    return super.close();
  }
}
