import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diagram_viewer/events/events.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/tools/transform2d/transform2d_utils.dart';
import 'transform_event.dart';
import 'transform_state.dart';

/// BLoC for managing overall transform operations
class TransformBloc extends Bloc<TransformEvent, TransformState> {
  final DiagramConfiguration configuration;
  Timer? _bounceTimer;
  bool _needsBounceBack = false;

  TransformBloc({
    required this.configuration,
    Rect? diagramRect,
    Size? viewportSize,
  }) : super(TransformState.initial()) {
    on<TransformEvent>(_onTransformEvent);

    // Apply initial bounds and auto-centering if provided
    if (diagramRect != null && viewportSize != null) {
      final autoCenteredTransform = Transform2DUtils.capTransformWithZoomLimits(
        transform: const Transform2D(),
        diagramRect: diagramRect,
        size: viewportSize,
        dynamic: false,
        minZoom: configuration.minZoom,
        maxZoom: configuration.maxZoom,
        preserveCentering: true,
        recenterSmallContent: true,
      );

      // ignore: invalid_use_of_visible_for_testing_member
      emit(TransformState.initial(
        transform: autoCenteredTransform,
        diagramRect: diagramRect,
        viewportSize: viewportSize,
      ));
    }
  }

  bool _isFrozen = false;

  // Public control for freeze during drag
  void setFrozenDuringDrag(bool frozen) {
    _isFrozen = frozen;
  }

  // Public bounce-back helper
  void bounceBack(Duration duration) {
    final current = state;
    final start = current.transform;
    // Compute explicit centering when content is smaller on any axis
    final scaledWidth = current.diagramRect.width * start.scale;
    final scaledHeight = current.diagramRect.height * start.scale;
    final isSmallerH = scaledWidth < current.viewportSize.width;
    final isSmallerV = scaledHeight < current.viewportSize.height;

    double tx = start.translation.dx;
    double ty = start.translation.dy;
    if (isSmallerH) {
      tx = (current.viewportSize.width - scaledWidth) / 2;
    }
    if (isSmallerV) {
      ty = (current.viewportSize.height - scaledHeight) / 2;
    }
    final centered = Transform2D(
      scale: start.scale,
      translation: Offset(
        -current.diagramRect.left * start.scale + tx,
        -current.diagramRect.top * start.scale + ty,
      ),
      rotation: start.rotation,
    );
    // Final target through capping to respect limits on large-content axes
    final target = Transform2DUtils.capTransformWithZoomLimits(
      transform: centered,
      diagramRect: current.diagramRect,
      size: current.viewportSize,
      dynamic: false,
      minZoom: configuration.minZoom,
      maxZoom: configuration.maxZoom,
      preserveCentering: true,
      recenterSmallContent: false,
    );

    // If already at target, nothing to animate
    if ((start.translation - target.translation).distance < 0.5 &&
        (start.scale - target.scale).abs() < 0.001) {
      return;
    }

    // Immediate snap if zero duration
    if (duration == Duration.zero) {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(TransformState.updated(
        transform: target,
        diagramRect: current.diagramRect,
        viewportSize: current.viewportSize,
      ));
      return;
    }

    _bounceTimer?.cancel();
    final totalMs = duration.inMilliseconds;
    final frameMs = 16;
    final steps = (totalMs / frameMs).clamp(1, 240).round();
    var step = 0;
    _bounceTimer = Timer.periodic(Duration(milliseconds: frameMs), (timer) {
      step++;
      final t = (step / steps).clamp(0.0, 1.0);
      // Use configurable easing curve for better perceived smoothness
      final eased = configuration.bounceCurve.transform(t);
      final interpTranslation =
          Offset.lerp(start.translation, target.translation, eased) ??
              target.translation;
      final interpScale = start.scale + (target.scale - start.scale) * eased;
      final interpRotation =
          start.rotation + (target.rotation - start.rotation) * eased;

      final interp = Transform2D(
        scale: interpScale,
        translation: interpTranslation,
        rotation: interpRotation,
      );

      // ignore: invalid_use_of_visible_for_testing_member
      emit(TransformState.updated(
        transform: interp,
        diagramRect: current.diagramRect,
        viewportSize: current.viewportSize,
      ));

      if (step >= steps) {
        timer.cancel();
        _bounceTimer = null;
      }
    });
  }

  void _onTransformEvent(TransformEvent event, Emitter<TransformState> emit) {
    event.when(
      updateTransform: (transform) {
        _updateTransform(transform, emit);
      },
      zoom: (scale, focalPoint, currentTransform) {
        _handleZoom(scale, focalPoint, currentTransform, emit);
      },
      pan: (delta, currentTransform) {
        _handlePan(delta, currentTransform, emit);
      },
      reset: () {
        _reset(emit);
      },
      updateDiagramBounds: (diagramRect, viewportSize) {
        _updateDiagramBounds(diagramRect, viewportSize, emit);
      },
    );
  }

  void _updateTransform(Transform2D transform, Emitter<TransformState> emit) {
    final currentState = state;

    // Apply limits with elastic window when content is smaller than viewport
    final scaledWidth = currentState.diagramRect.width * transform.scale;
    final scaledHeight = currentState.diagramRect.height * transform.scale;
    final isSmallerH = scaledWidth < currentState.viewportSize.width;
    final isSmallerV = scaledHeight < currentState.viewportSize.height;

    final finalTransform = Transform2DUtils.capTransformWithZoomLimits(
      transform: transform,
      diagramRect: currentState.diagramRect,
      size: currentState.viewportSize,
      dynamic: _isFrozen ? true : false,
      minZoom: configuration.minZoom,
      maxZoom: configuration.maxZoom,
      preserveCentering: isSmallerH || isSmallerV,
      recenterSmallContent: !_isFrozen && (isSmallerH || isSmallerV),
    );

    emit(TransformState.updated(
      transform: finalTransform,
      diagramRect: currentState.diagramRect,
      viewportSize: currentState.viewportSize,
    ));
  }

  void _handleZoom(
    double scale,
    Offset focalPoint,
    Transform2D currentTransform,
    Emitter<TransformState> emit,
  ) {
    final newTransform = currentTransform.applyZoom(scale, focalPoint);
    final currentState = state;
    final scaledWidth = currentState.diagramRect.width * newTransform.scale;
    final scaledHeight = currentState.diagramRect.height * newTransform.scale;
    final isSmallerH = scaledWidth < currentState.viewportSize.width;
    final isSmallerV = scaledHeight < currentState.viewportSize.height;

    final finalTransform = Transform2DUtils.capTransformWithZoomLimits(
      transform: newTransform,
      diagramRect: currentState.diagramRect,
      size: currentState.viewportSize,
      dynamic: true,
      minZoom: configuration.minZoom,
      maxZoom: configuration.maxZoom,
      preserveCentering: isSmallerH || isSmallerV,
      recenterSmallContent: false,
    );

    emit(TransformState.updated(
      transform: finalTransform,
      diagramRect: currentState.diagramRect,
      viewportSize: currentState.viewportSize,
    ));
  }

  void _handlePan(
    Offset delta,
    Transform2D currentTransform,
    Emitter<TransformState> emit,
  ) {
    final newTransform = currentTransform.applyPan(delta);
    final currentState = state;

    final finalTransform = Transform2DUtils.capTransformWithZoomLimits(
      transform: newTransform,
      diagramRect: currentState.diagramRect,
      size: currentState.viewportSize,
      dynamic: true,
      minZoom: configuration.minZoom,
      maxZoom: configuration.maxZoom,
      preserveCentering: true,
      recenterSmallContent: false,
    );

    emit(TransformState.updated(
      transform: finalTransform,
      diagramRect: currentState.diagramRect,
      viewportSize: currentState.viewportSize,
    ));
  }

  void _reset(Emitter<TransformState> emit) {
    final currentState = state;

    // Apply auto-centering during initialization to fix coordinate offset
    final initialTransform = const Transform2D();
    final autoCenteredTransform = Transform2DUtils.capTransformWithZoomLimits(
      transform: initialTransform,
      diagramRect: currentState.diagramRect,
      size: currentState.viewportSize,
      dynamic: true,
      minZoom: configuration.minZoom,
      maxZoom: configuration.maxZoom,
      preserveCentering: true,
      recenterSmallContent: true,
    );

    emit(TransformState.initial(
      transform: autoCenteredTransform,
      diagramRect: currentState.diagramRect,
      viewportSize: currentState.viewportSize,
    ));
  }

  void _updateDiagramBounds(
    Rect diagramRect,
    Size viewportSize,
    Emitter<TransformState> emit,
  ) {
    final currentState = state;

    final currentTransform = currentState.transform;

    // Recenter only if not frozen during drag
    // final shouldRecenter = !_isFrozen; // not used

    Transform2D effectiveTransform = currentTransform;

    if (!_isFrozen) {
      _needsBounceBack = false;
      // Determine if content is smaller than viewport on any axis at current scale
      final scaledWidth = diagramRect.width * currentTransform.scale;
      final scaledHeight = diagramRect.height * currentTransform.scale;
      final isSmallerH = scaledWidth < viewportSize.width;
      final isSmallerV = scaledHeight < viewportSize.height;

      if (isSmallerH || isSmallerV) {
        // When content is smaller on at least one axis, allow auto-centering
        effectiveTransform = Transform2DUtils.capTransformWithZoomLimits(
          transform: currentTransform,
          diagramRect: diagramRect,
          size: viewportSize,
          dynamic: false,
          minZoom: configuration.minZoom,
          maxZoom: configuration.maxZoom,
          preserveCentering: true,
          recenterSmallContent: true,
        );
      } else {
        // Content is larger than viewport on both axes: keep current translation (no snap/recenter)
        effectiveTransform = currentTransform;
      }
    } else {
      // We received bounds updates during drag; defer correction with a bounce after drag ends
      _needsBounceBack = true;
    }

    emit(TransformState.updated(
      transform: effectiveTransform,
      diagramRect: diagramRect,
      viewportSize: viewportSize,
    ));
  }

  bool get needsBounceBack => _needsBounceBack;
  void clearBounceBackFlag() => _needsBounceBack = false;

  @override
  Future<void> close() {
    _bounceTimer?.cancel();
    _bounceTimer = null;
    return super.close();
  }
}
