import 'dart:async';

import 'package:diagram_viewer/diagram_content_repository.dart';
import 'package:diagram_viewer/diagram_object_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:diagram_viewer/tools/scrolling_matrix4.dart';

part 'diagram_viewer_event.dart';
part 'diagram_viewer_state.dart';
part 'diagram_viewer_bloc.freezed.dart';

class DiagramViewerBloc extends Bloc<DiagramViewerEvent, DiagramViewerState> {
  final DiagramContentRepository _contentRepository;
  StreamSubscription<List<DiagramObjectEntity>>? _contentSubscription;

  DiagramViewerBloc({
    required DiagramContentRepository contentRepository,
  })  : _contentRepository = contentRepository,
        super(DiagramViewerState.initial(matrix: Matrix4.identity())) {
    _contentSubscription = _contentRepository.stream.listen((content) {
      add(DiagramViewerEvent.contentChanged(content));
    });

    on<_ContentChanged>(_onContentChanged);
    on<_ViewportChanged>(_onViewportChanged);
    on<_ScaleStarted>(_onScaleStarted);
    on<_ScaleUpdated>(_onScaleUpdated);
    on<_ScaleEnded>(_onScaleEnded);
    on<_PanStarted>(_onPanStarted);
    on<_PanUpdated>(_onPanUpdated);
    on<_PanEnded>(_onPanEnded);
  }

  void _onViewportChanged(
    _ViewportChanged event,
    Emitter<DiagramViewerState> emit,
  ) {
    // Removed verbose viewport changed logging
    if (event.size == state.viewportSize) return;

    if (state.diagramRect != Rect.zero) {
      final newMatrix = ScrollingMatrix4.getInitialMatrix(
        diagramRect: state.diagramRect,
        viewportSize: event.size,
      );
      emit(state.copyWith(
        viewportSize: event.size,
        matrix: newMatrix,
      ));
    } else {
      emit(state.copyWith(
        viewportSize: event.size,
      ));
    }
  }

  void _onContentChanged(
    _ContentChanged event,
    Emitter<DiagramViewerState> emit,
  ) {
    // Removed verbose content changed logging
    final content = event.content;
    Rect diagramRect = Rect.zero;
    if (content.isNotEmpty) {
      diagramRect = content.first.enclosingRect();
      for (var i = 1; i < content.length; i++) {
        diagramRect = diagramRect.expandToInclude(content[i].enclosingRect());
      }
    }

    if (state.viewportSize != Size.zero) {
      final newMatrix = ScrollingMatrix4.getInitialMatrix(
        diagramRect: diagramRect,
        viewportSize: state.viewportSize,
      );
      emit(state.copyWith(
        content: content,
        diagramRect: diagramRect,
        matrix: newMatrix,
      ));
    } else {
      emit(state.copyWith(
        content: content,
        diagramRect: diagramRect,
      ));
    }
  }

  void _onScaleStarted(
    _ScaleStarted event,
    Emitter<DiagramViewerState> emit,
  ) {
    state.mapOrNull(
      idle: (idle) => emit(DiagramViewerState.scaling(
        matrix: idle.matrix,
        oldMatrix: idle.matrix,
        viewportSize: idle.viewportSize,
        diagramRect: idle.diagramRect,
        content: idle.content,
        selectedObjects: idle.selectedObjects,
      )),
    );
  }

  void _onScaleUpdated(
    _ScaleUpdated event,
    Emitter<DiagramViewerState> emit,
  ) {
    state.mapOrNull(scaling: (scaling) {
      // Start from the current matrix to accumulate changes smoothly
      final newMatrix = scaling.matrix.clone();

      // First apply the translation (pan) component using the focal point delta
      newMatrix.translate(event.focalPointDelta.dx, event.focalPointDelta.dy);

      // Then apply the scaling component around the focal point
      if (event.scale != 1.0) {
        final invMatrix = Matrix4.inverted(newMatrix);
        final focalPointLocal = invMatrix.transform3(
          Vector3(event.focalPoint.dx, event.focalPoint.dy, 0),
        );

        newMatrix
          ..translate(focalPointLocal.x, focalPointLocal.y)
          ..scale(event.scale, event.scale)
          ..translate(-focalPointLocal.x, -focalPointLocal.y);
      }

      emit(scaling.copyWith(matrix: newMatrix));
    });
  }

  void _onScaleEnded(
    _ScaleEnded event,
    Emitter<DiagramViewerState> emit,
  ) {
    state.mapOrNull(
      scaling: (scaling) => emit(DiagramViewerState.idle(
        matrix: scaling.matrix,
        viewportSize: scaling.viewportSize,
        diagramRect: scaling.diagramRect,
        content: scaling.content,
        selectedObjects: scaling.selectedObjects,
      )),
    );
  }

  void _onPanStarted(
    _PanStarted event,
    Emitter<DiagramViewerState> emit,
  ) {
    state.mapOrNull(
      idle: (idle) => emit(DiagramViewerState.panning(
        matrix: idle.matrix,
        viewportSize: idle.viewportSize,
        diagramRect: idle.diagramRect,
        content: idle.content,
        selectedObjects: idle.selectedObjects,
      )),
    );
  }

  void _onPanUpdated(
    _PanUpdated event,
    Emitter<DiagramViewerState> emit,
  ) {
    state.mapOrNull(panning: (panning) {
      final newMatrix = panning.matrix.clone();
      newMatrix.translate(event.delta.dx, event.delta.dy);
      emit(panning.copyWith(matrix: newMatrix));
    });
  }

  void _onPanEnded(
    _PanEnded event,
    Emitter<DiagramViewerState> emit,
  ) {
    state.mapOrNull(
      panning: (panning) => emit(DiagramViewerState.idle(
        matrix: panning.matrix,
        viewportSize: panning.viewportSize,
        diagramRect: panning.diagramRect,
        content: panning.content,
        selectedObjects: panning.selectedObjects,
      )),
    );
  }

  @override
  Future<void> close() {
    _contentSubscription?.cancel();
    return super.close();
  }
}
