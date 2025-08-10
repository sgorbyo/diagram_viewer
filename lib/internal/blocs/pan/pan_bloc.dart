import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diagram_viewer/events/events.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/tools/transform2d/transform2d_utils.dart';
import 'pan_event.dart';
import 'pan_state.dart';

/// BLoC for managing pan operations
class PanBloc extends Bloc<PanEvent, PanState> {
  final DiagramConfiguration configuration;
  final Rect diagramRect;
  final Size viewportSize;

  PanBloc({
    required this.configuration,
    required this.diagramRect,
    required this.viewportSize,
  }) : super(const PanState.initial()) {
    on<PanEvent>(_onPanEvent);
  }

  void _onPanEvent(PanEvent event, Emitter<PanState> emit) {
    event.when(
      pan: (delta, currentTransform) {
        _handlePan(delta, currentTransform, emit);
      },
      keyboardPan: (direction, currentTransform) {
        _handleKeyboardPan(direction, currentTransform, emit);
      },
      autoCenter: (currentTransform) {
        _handleAutoCenter(currentTransform, emit);
      },
      reset: () {
        _reset(emit);
      },
    );
  }

  void _handlePan(
    Offset delta,
    Transform2D currentTransform,
    Emitter<PanState> emit,
  ) {
    final newTransform = currentTransform.applyPan(delta);

    final finalTransform = Transform2DUtils.capTransformWithZoomLimits(
      transform: newTransform,
      diagramRect: diagramRect,
      size: viewportSize,
      dynamic: true,
      minZoom: configuration.minZoom,
      maxZoom: configuration.maxZoom,
    );

    emit(PanState.panning(
      translation: finalTransform.translation,
      delta: delta,
    ));
  }

  void _handleKeyboardPan(
    Offset direction,
    Transform2D currentTransform,
    Emitter<PanState> emit,
  ) {
    const panStep = 50.0;
    final delta = Offset(direction.dx * panStep, direction.dy * panStep);

    final newTransform = currentTransform.applyPan(delta);

    final finalTransform = Transform2DUtils.capTransformWithZoomLimits(
      transform: newTransform,
      diagramRect: diagramRect,
      size: viewportSize,
      dynamic: false,
      minZoom: configuration.minZoom,
      maxZoom: configuration.maxZoom,
    );

    emit(PanState.panning(
      translation: finalTransform.translation,
      delta: delta,
    ));
  }

  void _handleAutoCenter(
    Transform2D currentTransform,
    Emitter<PanState> emit,
  ) {
    final autoCenteredTransform = Transform2DUtils.capTransformWithZoomLimits(
      transform: currentTransform,
      diagramRect: diagramRect,
      size: viewportSize,
      dynamic: false,
      minZoom: configuration.minZoom,
      maxZoom: configuration.maxZoom,
    );

    emit(PanState.autoCentering(
      translation: autoCenteredTransform.translation,
      targetTranslation: autoCenteredTransform.translation,
    ));
  }

  void _reset(Emitter<PanState> emit) {
    emit(const PanState.initial());
  }
}
