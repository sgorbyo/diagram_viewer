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
  InteractionKind _lastInteractionKind = InteractionKind.other;
  DateTime? _lastZoomEventTime;
  bool _zoomSequenceOriginWasSmall = false;

  TransformBloc({
    required this.configuration,
    Rect? diagramRect,
    Size? viewportSize,
  }) : super(const TransformState.initial()) {
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
    // Compute strict (non-dynamic) clamped transform
    final strict = Transform2DUtils.capTransformWithZoomLimits(
      transform: start,
      diagramRect: current.diagramRect,
      size: current.viewportSize,
      dynamic: false,
      minZoom: configuration.minZoom,
      maxZoom: configuration.maxZoom,
      preserveCentering: true,
      recenterSmallContent: false,
    );
    // Determine per-axis correction using dynamic window policy
    const double epsilon = 0.5; // window epsilon
    const double epsilonStrict = 0.01; // strict snap threshold
    final scaledWidth = current.diagramRect.width * start.scale;
    final scaledHeight = current.diagramRect.height * start.scale;
    final isSmallerH = scaledWidth <= current.viewportSize.width;
    final isSmallerV = scaledHeight <= current.viewportSize.height;

    // Compute dynamic window around center for small-content axes
    final centerOffsetX = (current.viewportSize.width - scaledWidth) / 2;
    final centerTargetX =
        -current.diagramRect.left * start.scale + centerOffsetX;
    final minCenterX = centerTargetX - Transform2DUtils.dynamicBorderWidth;
    final maxCenterX = centerTargetX + Transform2DUtils.dynamicBorderWidth;

    final centerOffsetY = (current.viewportSize.height - scaledHeight) / 2;
    final centerTargetY =
        -current.diagramRect.top * start.scale + centerOffsetY;
    final minCenterY = centerTargetY - Transform2DUtils.dynamicBorderWidth;
    final maxCenterY = centerTargetY + Transform2DUtils.dynamicBorderWidth;

    bool correctX;
    bool correctY;

    if (_lastInteractionKind == InteractionKind.zoom) {
      // After zoom: recenter small-content axes; large-content axes snap if deviated
      correctX = isSmallerH ||
          (!isSmallerH &&
              (start.translation.dx - strict.translation.dx).abs() >
                  epsilonStrict);
      correctY = isSmallerV ||
          (!isSmallerV &&
              (start.translation.dy - strict.translation.dy).abs() >
                  epsilonStrict);
    } else if (_lastInteractionKind == InteractionKind.pan) {
      // After pan: for small-content axes, recenter toward strict (exact center)
      // For large-content axes, snap to strict if deviated beyond epsilonStrict
      correctX =
          (start.translation.dx - strict.translation.dx).abs() > epsilonStrict;
      correctY =
          (start.translation.dy - strict.translation.dy).abs() > epsilonStrict;
    } else {
      // Other interactions: preserve small-content axes within elastic window;
      // correct only if outside the window boundaries. Large-content: snap if deviated.
      correctX = !isSmallerH
          ? (start.translation.dx - strict.translation.dx).abs() > epsilonStrict
          : (start.translation.dx <= minCenterX + epsilon ||
              start.translation.dx >= maxCenterX - epsilon);
      correctY = !isSmallerV
          ? (start.translation.dy - strict.translation.dy).abs() > epsilonStrict
          : (start.translation.dy <= minCenterY + epsilon ||
              start.translation.dy >= maxCenterY - epsilon);
    }

    final target = Transform2D(
      scale: start.scale,
      translation: Offset(
        correctX ? strict.translation.dx : start.translation.dx,
        correctY ? strict.translation.dy : start.translation.dy,
      ),
      rotation: start.rotation,
    );

    // Immediate snap if zero duration: behavior depends on last interaction
    if (duration == Duration.zero) {
      if (_lastInteractionKind == InteractionKind.zoom) {
        // After zoom, snap to strict with recentering on small-content axes
        final strictZoom = Transform2DUtils.capTransformWithZoomLimits(
          transform: start,
          diagramRect: current.diagramRect,
          size: current.viewportSize,
          dynamic: false,
          minZoom: configuration.minZoom,
          maxZoom: configuration.maxZoom,
          preserveCentering: true,
          recenterSmallContent: true,
        );
        // ignore: invalid_use_of_visible_for_testing_member
        emit(TransformState.updated(
          transform: strictZoom,
          diagramRect: current.diagramRect,
          viewportSize: current.viewportSize,
        ));
        return;
      } else {
        // Pan/Other: snap micro-overscrolls to nearest strict anchors per-axis
        final (double minX, double maxX) =
            Transform2DUtils.legalTranslationRangeX(
          scale: start.scale,
          diagramRect: current.diagramRect,
          viewportSize: current.viewportSize,
          dynamic: false,
          preserveCentering: true,
          recenterSmallContent: false,
          currentY: start.translation.dy,
        );
        final (double minY, double maxY) =
            Transform2DUtils.legalTranslationRangeY(
          scale: start.scale,
          diagramRect: current.diagramRect,
          viewportSize: current.viewportSize,
          dynamic: false,
          preserveCentering: true,
          recenterSmallContent: false,
          currentX: start.translation.dx,
        );
        const double epsilonSnap =
            0.51; // snap micro-overscrolls to closest anchor
        double anchorX = start.translation.dx;
        double anchorY = start.translation.dy;
        final double distToMinX = (start.translation.dx - minX).abs();
        final double distToMaxX = (start.translation.dx - maxX).abs();
        if (distToMinX < epsilonSnap || distToMaxX < epsilonSnap) {
          anchorX = (distToMinX <= distToMaxX) ? minX : maxX;
        }
        final double distToMinY = (start.translation.dy - minY).abs();
        final double distToMaxY = (start.translation.dy - maxY).abs();
        if (distToMinY < epsilonSnap || distToMaxY < epsilonSnap) {
          anchorY = (distToMinY <= distToMaxY) ? minY : maxY;
        }

        final snappedImmediate = Transform2D(
          scale: strict.scale,
          translation: Offset(anchorX, anchorY),
          rotation: strict.rotation,
        );

        // ignore: invalid_use_of_visible_for_testing_member
        emit(TransformState.updated(
          transform: snappedImmediate,
          diagramRect: current.diagramRect,
          viewportSize: current.viewportSize,
        ));
        return;
      }
    }

    // If already at target, nothing to animate
    if ((start.translation - target.translation).distance < 0.01 &&
        (start.scale - target.scale).abs() < 0.0001 &&
        (start.rotation - target.rotation).abs() < 0.0001) {
      return;
    }

    _bounceTimer?.cancel();
    final totalMs = duration.inMilliseconds;
    const frameMs = 16;
    final steps = (totalMs / frameMs).clamp(1, 240).round();
    var step = 0;
    _bounceTimer =
        Timer.periodic(const Duration(milliseconds: frameMs), (timer) {
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
        _lastInteractionKind = InteractionKind.zoom;
        _handleZoom(scale, focalPoint, currentTransform, emit);
      },
      pan: (delta, currentTransform) {
        _lastInteractionKind = InteractionKind.pan;
        _handlePan(delta, currentTransform, emit);
      },
      reset: () {
        _lastInteractionKind = InteractionKind.other;
        _reset(emit);
      },
      updateDiagramBounds: (diagramRect, viewportSize) {
        _lastInteractionKind = InteractionKind.other;
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
    final currentState = state;
    final viewportSize = currentState.viewportSize;
    final diagramRect = currentState.diagramRect;

    // Determine if this is a new zoom burst (gap > 300ms)
    final now = DateTime.timestamp();
    final bool newBurst = _lastZoomEventTime == null ||
        now.difference(_lastZoomEventTime!).inMilliseconds > 300;
    _lastZoomEventTime = now;

    final wasSmallH =
        diagramRect.width * currentTransform.scale <= viewportSize.width;
    final wasSmallV =
        diagramRect.height * currentTransform.scale <= viewportSize.height;
    final wasSmall = wasSmallH || wasSmallV;

    if (newBurst) {
      _zoomSequenceOriginWasSmall = wasSmall;
    } else if (wasSmall) {
      // Once the sequence passes into small-content state, latch to center-anchored mode
      _zoomSequenceOriginWasSmall = true;
    }

    final prevPhysicalFocal = currentTransform.logicalToPhysical(focalPoint);
    final newTransform = currentTransform.applyZoom(scale, focalPoint);

    Transform2D cappedScaleTransform =
        Transform2DUtils.capTransformWithZoomLimits(
      transform: newTransform,
      diagramRect: diagramRect,
      size: viewportSize,
      dynamic: true,
      minZoom: configuration.minZoom,
      maxZoom: configuration.maxZoom,
      preserveCentering: true,
      recenterSmallContent: false,
    );

    Offset desiredTranslation;
    if (_zoomSequenceOriginWasSmall) {
      final viewportCenter =
          Offset(viewportSize.width / 2, viewportSize.height / 2);
      final logicalCenter = diagramRect.center;
      desiredTranslation =
          viewportCenter - logicalCenter * cappedScaleTransform.scale;
    } else {
      desiredTranslation =
          prevPhysicalFocal - focalPoint * cappedScaleTransform.scale;
    }
    cappedScaleTransform =
        cappedScaleTransform.copyWith(translation: desiredTranslation);

    final finalTransform = Transform2DUtils.capTransformWithZoomLimits(
      transform: cappedScaleTransform,
      diagramRect: diagramRect,
      size: viewportSize,
      dynamic: false,
      minZoom: configuration.minZoom,
      maxZoom: configuration.maxZoom,
      preserveCentering: true,
      recenterSmallContent: true,
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
    const initialTransform = Transform2D();
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
