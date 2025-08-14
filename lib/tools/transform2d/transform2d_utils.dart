import 'dart:math';
import 'package:flutter/material.dart';
import 'package:diagram_viewer/events/transform_2d.dart';

/// Utility class for Transform2D operations commonly used in diagram viewing.
///
/// This class provides methods for:
/// - Bounds checking and capping
/// - Scale calculations
/// - Inertial animations
/// - Elastic overscroll
/// - Viewport fitting
///
/// These utilities are migrated from the legacy ScrollingBloc to work with
/// the new Transform2D architecture.
class Transform2DUtils {
  // Configuration constants (migrated from ScrollingBloc)
  static const double minDiagramSizeSide = 512.0;
  static const double minimumScale = 0.02;
  static const double maximumScale = 10.0;
  static const double minDynamicScale = 0.01;
  static const double maxDynamicScale = 11.0;
  static const double translationDynamicDelta = 50.0;
  static double dynamicBorderWidth = 80.0;
  // Allow up to 10% zoom overscroll below dynamic min during active interaction
  static const double zoomOverscrollFactor = 1.0;
  static const double respectBorder = 25.0;
  static const int epsilon = 7;
  static const double friction = 1333.0;
  static const double squaredFriction = friction * friction;
  static const double twiceFriction = 2 * friction;
  static const double minSquaredDistanceForAnimating = 9.0;

  /// Caps a transform to ensure it stays within valid bounds.
  ///
  /// This method ensures the diagram doesn't scroll beyond its logical bounds,
  /// while allowing for dynamic overscroll during user interactions.
  ///
  /// [transform] - The current transform to cap
  /// [diagramRect] - The logical bounds of the diagram content
  /// [size] - The viewport size
  /// [dynamic] - Whether to allow dynamic overscroll
  /// Returns a new Transform2D that respects the bounds
  static Transform2D capTransform({
    required Transform2D transform,
    required Rect diagramRect,
    required Size size,
    required bool dynamic,
  }) {
    final minOffset = _minOffset(
      scale: transform.scale,
      contentRect: diagramRect,
      dynamic: dynamic,
    );

    final maxOffset = _maxOffset(
      scale: transform.scale,
      contentRect: diagramRect,
      viewportSize: size,
      dynamic: dynamic,
    );

    double newX = transform.translation.dx;
    double newY = transform.translation.dy;

    // Cap X translation
    if (newX > minOffset.dx) {
      newX = minOffset.dx;
    }
    if (newX < -maxOffset.dx) {
      newX = -maxOffset.dx;
    }

    // Cap Y translation
    if (newY > minOffset.dy) {
      newY = minOffset.dy;
    }
    if (newY < -maxOffset.dy) {
      newY = -maxOffset.dy;
    }

    return Transform2D(
      scale: transform.scale,
      translation: Offset(newX, newY),
      rotation: transform.rotation,
    );
  }

  /// Caps a transform to ensure it stays within valid bounds including zoom limits.
  ///
  /// This method ensures the diagram doesn't scroll beyond its logical bounds
  /// and respects zoom limits from configuration, while allowing for dynamic
  /// overscroll during user interactions.
  ///
  /// [transform] - The current transform to cap
  /// [diagramRect] - The logical bounds of the diagram content
  /// [size] - The viewport size
  /// [dynamic] - Whether to allow dynamic overscroll
  /// [minZoom] - Minimum zoom level from configuration
  /// [maxZoom] - Maximum zoom level from configuration
  /// Returns a new Transform2D that respects all bounds
  static Transform2D capTransformWithZoomLimits({
    required Transform2D transform,
    required Rect diagramRect,
    required Size size,
    required bool dynamic,
    required double minZoom,
    required double maxZoom,
    bool preserveCentering = false,
    bool recenterSmallContent = true,
  }) {
    // Handle edge case: zero-sized diagram
    if (diagramRect.width <= 0 || diagramRect.height <= 0) {
      // For zero-sized diagram, use only config limits
      double cappedScale = transform.scale;
      if (cappedScale < minZoom) {
        cappedScale = minZoom;
      }
      if (cappedScale > maxZoom) {
        cappedScale = maxZoom;
      }

      final scaleCappedTransform = Transform2D(
        scale: cappedScale,
        translation: transform.translation,
        rotation: transform.rotation,
      );

      return capTransform(
        transform: scaleCappedTransform,
        diagramRect: diagramRect,
        size: size,
        dynamic: dynamic,
      );
    }

    // First, calculate the dynamic minimum zoom based on diagram extent
    final scaleToFitValue = scaleToFit(
      contentRect: diagramRect,
      viewSize: size,
    );

    // Base minimum must ensure entire diagram is visible when interaction ends,
    // but must NOT force zoom-in when content is smaller than the viewport.
    // Clamp dynamic min to at most 1.0 in that case.
    // Respect configuration minZoom and dynamic min to keep content visible.
    // IMPORTANT: when preserveCentering is true, do not enforce scaleToFit; keep caller's scale.
    // Compute baseMinZoom depending on context:
    // - If preserving centering and content is larger/equal than viewport (scaleToFit <= 1): enforce dynamic min (fit)
    // - If preserving centering and content is smaller (scaleToFit > 1): allow zooming out to config minZoom
    // - Otherwise, use dynamic min when not preserving centering
    double baseMinZoom;
    if (preserveCentering) {
      if (scaleToFitValue <= 1.0) {
        baseMinZoom = max(minZoom, scaleToFitValue);
      } else {
        baseMinZoom = minZoom;
      }
    } else if (!dynamic) {
      final dynamicMin = scaleToFitValue <= 1.0 ? scaleToFitValue : 1.0;
      baseMinZoom = max(minZoom, dynamicMin);
    } else {
      final dynamicMin = min(scaleToFitValue, maxZoom);
      baseMinZoom = max(minZoom, dynamicMin);
    }
    double effectiveMinZoom = baseMinZoom;
    if (dynamic) {
      effectiveMinZoom = baseMinZoom * zoomOverscrollFactor;
    }

    // Cap the scale to zoom limits
    double cappedScale = transform.scale;
    if (cappedScale < effectiveMinZoom) {
      cappedScale = effectiveMinZoom;
    }
    if (cappedScale > maxZoom) {
      cappedScale = maxZoom;
    }

    // Create a new transform with the capped scale
    final scaleCappedTransform = Transform2D(
      scale: cappedScale,
      translation: transform.translation,
      rotation: transform.rotation,
    );

    if (preserveCentering) {
      final transformToCap = recenterSmallContent
          ? _applyAutoCentering(
              transform: scaleCappedTransform,
              diagramRect: diagramRect,
              size: size,
            )
          : scaleCappedTransform;

      return _capTransformPreservingCentering(
        transform: transformToCap,
        diagramRect: diagramRect,
        size: size,
        dynamic: dynamic,
      );
    } else {
      // If content is smaller than viewport on any axis, apply centering-preserving capping directly
      final scaledDiagramWidth = diagramRect.width * scaleCappedTransform.scale;
      final scaledDiagramHeight =
          diagramRect.height * scaleCappedTransform.scale;
      final isSmallerHorizontally = scaledDiagramWidth < size.width;
      final isSmallerVertically = scaledDiagramHeight < size.height;

      if (isSmallerHorizontally || isSmallerVertically) {
        if (recenterSmallContent) {
          // Force exact centering when requested (utility behavior)
          final centeredTransform = _applyAutoCentering(
            transform: scaleCappedTransform,
            diagramRect: diagramRect,
            size: size,
          );
          return _capTransformPreservingCentering(
            transform: centeredTransform,
            diagramRect: diagramRect,
            size: size,
            dynamic: false,
          );
        } else {
          // Preserve current position within elastic window (interactive behavior)
          return _capTransformPreservingCentering(
            transform: scaleCappedTransform,
            diagramRect: diagramRect,
            size: size,
            dynamic: dynamic,
          );
        }
      }

      // Otherwise, do not auto-center; just cap translation within bounds
      return capTransform(
        transform: scaleCappedTransform,
        diagramRect: diagramRect,
        size: size,
        dynamic: dynamic,
      );
    }
  }

  /// Applies auto-centering when the diagram is smaller than the viewport.
  ///
  /// This method ensures that when the diagram is smaller than the viewport
  /// in any direction, it is automatically centered in that direction.
  ///
  /// [transform] - The current transform
  /// [diagramRect] - The logical bounds of the diagram content
  /// [size] - The viewport size
  /// Returns a new Transform2D with auto-centering applied
  static Transform2D _applyAutoCentering({
    required Transform2D transform,
    required Rect diagramRect,
    required Size size,
  }) {
    // Calculate the scaled diagram size
    final scaledDiagramWidth = diagramRect.width * transform.scale;
    final scaledDiagramHeight = diagramRect.height * transform.scale;

    double newTranslationX = transform.translation.dx;
    double newTranslationY = transform.translation.dy;

    // Auto-center horizontally if diagram is smaller than viewport width
    if (scaledDiagramWidth <= size.width) {
      final centerOffset = (size.width - scaledDiagramWidth) / 2;
      // Shift by -left to bring content into view, then center it
      newTranslationX = -diagramRect.left * transform.scale + centerOffset;
    }

    // Auto-center vertically if diagram is smaller than viewport height
    if (scaledDiagramHeight <= size.height) {
      final centerOffset = (size.height - scaledDiagramHeight) / 2;
      // Shift by -top to bring content into view, then center it
      newTranslationY = -diagramRect.top * transform.scale + centerOffset;
    }

    return Transform2D(
      scale: transform.scale,
      translation: Offset(newTranslationX, newTranslationY),
      rotation: transform.rotation,
    );
  }

  /// Caps a transform while preserving auto-centering for small diagrams.
  ///
  /// This method is similar to capTransform but preserves the centering
  /// when the diagram is smaller than the viewport.
  ///
  /// [transform] - The current transform to cap
  /// [diagramRect] - The logical bounds of the diagram content
  /// [size] - The viewport size
  /// [dynamic] - Whether to allow dynamic overscroll
  /// Returns a new Transform2D that respects bounds while preserving centering
  static Transform2D _capTransformPreservingCentering({
    required Transform2D transform,
    required Rect diagramRect,
    required Size size,
    required bool dynamic,
  }) {
    // Calculate the scaled diagram size
    final scaledDiagramWidth = diagramRect.width * transform.scale;
    final scaledDiagramHeight = diagramRect.height * transform.scale;

    // Check if diagram is smaller than viewport in each direction
    final isSmallerHorizontally = scaledDiagramWidth <= size.width;
    final isSmallerVertically = scaledDiagramHeight <= size.height;

    final minOffset = _minOffset(
      scale: transform.scale,
      contentRect: diagramRect,
      dynamic: dynamic,
    );

    final maxOffset = _maxOffset(
      scale: transform.scale,
      contentRect: diagramRect,
      viewportSize: size,
      dynamic: dynamic,
    );

    double newX = transform.translation.dx;
    double newY = transform.translation.dy;

    // Cap X translation
    if (!isSmallerHorizontally) {
      // Normal capping when content is larger than viewport
      if (newX > minOffset.dx) {
        newX = minOffset.dx;
      }
      if (newX < -maxOffset.dx) {
        newX = -maxOffset.dx;
      }
    } else {
      // When content is smaller
      final centerOffsetX = (size.width - scaledDiagramWidth) / 2;
      final centerTargetX = -diagramRect.left * transform.scale + centerOffsetX;
      if (dynamic) {
        // allow an elastic window around center
        final minCenterX = centerTargetX - dynamicBorderWidth;
        final maxCenterX = centerTargetX + dynamicBorderWidth;
        if (newX < minCenterX) newX = minCenterX;
        if (newX > maxCenterX) newX = maxCenterX;
      } else {
        // no elastic window: snap to exact center
        newX = centerTargetX;
      }
    }

    // Cap Y translation
    if (!isSmallerVertically) {
      // Normal capping when content is larger than viewport
      if (newY > minOffset.dy) {
        newY = minOffset.dy;
      }
      if (newY < -maxOffset.dy) {
        newY = -maxOffset.dy;
      }
    } else {
      // When content is smaller
      final centerOffsetY = (size.height - scaledDiagramHeight) / 2;
      final centerTargetY = -diagramRect.top * transform.scale + centerOffsetY;
      if (dynamic) {
        // allow an elastic window around center
        final minCenterY = centerTargetY - dynamicBorderWidth;
        final maxCenterY = centerTargetY + dynamicBorderWidth;
        if (newY < minCenterY) newY = minCenterY;
        if (newY > maxCenterY) newY = maxCenterY;
      } else {
        // no elastic window: snap to exact center
        newY = centerTargetY;
      }
    }

    return Transform2D(
      scale: transform.scale,
      translation: Offset(newX, newY),
      rotation: transform.rotation,
    );
  }

  /// Calculates the minimum scale needed to fit the diagram in the viewport.
  ///
  /// This ensures the entire diagram is visible, with at most one border
  /// visible (horizontal or vertical).
  ///
  /// [contentRect] - The logical bounds of the diagram content
  /// [viewSize] - The viewport size
  /// Returns the minimum scale factor
  static double scaleToFit({
    required Rect contentRect,
    required Size viewSize,
  }) {
    return min(
      viewSize.width / contentRect.width,
      viewSize.height / contentRect.height,
    );
  }

  /// Returns the per-axis minimum scale factors needed to fit content into viewport.
  ///
  /// This mirrors the legacy minStaticScaleXY helper and is useful when
  /// decisions must be taken per-axis (e.g., centering only on one axis).
  static Offset minScaleXY({
    required Rect contentRect,
    required Size viewSize,
  }) {
    return Offset(
      viewSize.width / contentRect.width,
      viewSize.height / contentRect.height,
    );
  }

  /// Calculates the optimal scale to fit the diagram in the viewport.
  ///
  /// This method ensures the diagram fits within the viewport while maintaining
  /// aspect ratio and respecting minimum size constraints.
  ///
  /// [contentRect] - The logical bounds of the diagram content
  /// [viewSize] - The viewport size
  /// [currentTransform] - The current transform
  /// Returns a new Transform2D that fits the diagram
  static Transform2D zoomToFit({
    required Rect contentRect,
    required Size viewSize,
    required Transform2D currentTransform,
  }) {
    final minScale = scaleToFit(
      contentRect: contentRect,
      viewSize: viewSize,
    );

    final result = _physicalNormalizedRect(
      logicalContentRect: contentRect,
      viewPortSize: viewSize,
      zoom: minScale,
    );

    return Transform2D(
      scale: minScale,
      translation: Offset(-result.left, -result.top),
      rotation: 0.0,
    );
  }

  /// Calculates an inertial animation transform based on velocity.
  ///
  /// This method simulates natural deceleration when the user stops dragging,
  /// creating a smooth scrolling experience.
  ///
  /// [startTransform] - The starting transform
  /// [velocity] - The velocity vector in pixels per second
  /// [diagramRect] - The logical bounds of the diagram
  /// [size] - The viewport size
  /// Returns a tuple of (targetTransform, duration)
  static (Transform2D, Duration) calculateInertialAnimation({
    required Transform2D startTransform,
    required Offset velocity,
    required Rect diagramRect,
    required Size size,
  }) {
    if (velocity.distance <= 1) {
      return (startTransform, Duration.zero);
    }

    final duration = Duration(
      milliseconds: 1000 * velocity.distance ~/ friction,
    );

    final deltaOffset = Offset(
      pow(velocity.dx, 2) / twiceFriction * velocity.dx.sign,
      pow(velocity.dy, 2) / twiceFriction * velocity.dy.sign,
    );

    final targetOffset = startTransform.translation + deltaOffset;
    final targetTransform = Transform2D(
      scale: startTransform.scale,
      translation: targetOffset,
      rotation: startTransform.rotation,
    );

    final cappedTransform = capTransform(
      transform: targetTransform,
      diagramRect: diagramRect,
      size: size,
      dynamic: true,
    );

    final adjustedDuration = Duration(
      milliseconds: duration.inMilliseconds *
          (cappedTransform.translation - startTransform.translation).distance ~/
          deltaOffset.distance,
    );

    return (cappedTransform, adjustedDuration);
  }

  /// Calculates the diagram rectangle from a list of objects.
  ///
  /// This method computes the minimum rectangle that contains all objects,
  /// with optional padding and minimum size constraints.
  ///
  /// [objects] - List of diagram objects
  /// Returns the logical bounds of the diagram
  static Rect getDiagramRectFromContent(List<dynamic> objects) {
    if (objects.isEmpty) {
      return Rect.fromCenter(
        center: Offset.zero,
        width: minDiagramSizeSide,
        height: minDiagramSizeSide,
      );
    }

    // Assuming objects have a logicalBounds property
    Rect bounds = objects.first.logicalBounds;
    for (int i = 1; i < objects.length; i++) {
      bounds = bounds.expandToInclude(objects[i].logicalBounds);
    }

    return adaptDiagramRectToMinimumSize(bounds.inflate(respectBorder));
  }

  /// Ensures the diagram rectangle meets minimum size requirements.
  ///
  /// This prevents the diagram from becoming too small, which could
  /// cause rendering issues or poor user experience.
  ///
  /// [rect] - The input rectangle
  /// Returns a rectangle that meets minimum size constraints
  static Rect adaptDiagramRectToMinimumSize(Rect rect) {
    return Rect.fromCenter(
      center: rect.center,
      width: max(rect.size.width, minDiagramSizeSide),
      height: max(rect.size.height, minDiagramSizeSide),
    );
  }

  /// Calculates the minimum offset for panning.
  ///
  /// This prevents the diagram from being panned too far in any direction,
  /// ensuring content remains visible.
  ///
  /// [scale] - The current scale factor
  /// [contentRect] - The logical bounds of the diagram
  /// [dynamic] - Whether to allow dynamic overscroll
  /// Returns the minimum offset
  static Offset _minOffset({
    required double scale,
    required Rect contentRect,
    required bool dynamic,
  }) {
    final physicalRect = _diagramPhysicalRect(
      scale: scale,
      contentRect: contentRect,
      dynamic: dynamic,
    );
    return physicalRect.topLeft.scale(-1, -1);
  }

  /// Calculates the maximum offset for panning.
  ///
  /// This prevents the diagram from being panned too far in any direction,
  /// ensuring content remains visible.
  ///
  /// [scale] - The current scale factor
  /// [contentRect] - The logical bounds of the diagram
  /// [viewportSize] - The viewport size
  /// [dynamic] - Whether to allow dynamic overscroll
  /// Returns the maximum offset
  static Offset _maxOffset({
    required double scale,
    required Rect contentRect,
    required Size viewportSize,
    required bool dynamic,
  }) {
    final physicalRect = _diagramPhysicalRect(
      scale: scale,
      contentRect: contentRect,
      dynamic: dynamic,
    );
    return Offset(
      physicalRect.right - viewportSize.width,
      physicalRect.bottom - viewportSize.height,
    );
  }

  /// Converts logical coordinates to physical coordinates.
  ///
  /// [logicalRect] - The logical rectangle
  /// [zoom] - The scale factor
  /// Returns the physical rectangle
  static Rect _logicalToPhysicalRect({
    required Rect logicalRect,
    required double zoom,
  }) {
    return Rect.fromLTRB(
      logicalRect.left * zoom,
      logicalRect.top * zoom,
      logicalRect.right * zoom,
      logicalRect.bottom * zoom,
    );
  }

  /// Calculates the physical normalized rectangle.
  ///
  /// This method handles cases where the diagram is smaller than the viewport
  /// by normalizing the rectangle appropriately.
  ///
  /// [logicalContentRect] - The logical content rectangle
  /// [viewPortSize] - The viewport size
  /// [zoom] - The scale factor
  /// Returns the normalized physical rectangle
  static Rect _physicalNormalizedRect({
    required Rect logicalContentRect,
    required Size viewPortSize,
    required double zoom,
  }) {
    final physicalContentRect = _logicalToPhysicalRect(
      logicalRect: logicalContentRect,
      zoom: zoom,
    );
    return _normalizePhysicalRect(
      physicalContentRect: physicalContentRect,
      viewPortSize: viewPortSize,
    );
  }

  /// Normalizes a physical rectangle to ensure it meets viewport requirements.
  ///
  /// This method handles cases where the diagram is smaller than the viewport
  /// by expanding it appropriately.
  ///
  /// [physicalContentRect] - The physical content rectangle
  /// [viewPortSize] - The viewport size
  /// Returns the normalized rectangle
  static Rect _normalizePhysicalRect({
    required Rect physicalContentRect,
    required Size viewPortSize,
  }) {
    assert(
      physicalContentRect.width.toPrecision(epsilon) >=
              viewPortSize.width.toPrecision(epsilon) ||
          physicalContentRect.height.toPrecision(epsilon) >=
              viewPortSize.height.toPrecision(epsilon),
    );

    if (physicalContentRect.width.toPrecision(epsilon) <
        viewPortSize.width.toPrecision(epsilon)) {
      return Rect.fromCenter(
        center: physicalContentRect.center,
        width: viewPortSize.width,
        height: physicalContentRect.height,
      );
    }

    if (physicalContentRect.height.toPrecision(epsilon) <
        viewPortSize.height.toPrecision(epsilon)) {
      return Rect.fromCenter(
        center: physicalContentRect.center,
        width: physicalContentRect.width,
        height: viewPortSize.height,
      );
    }

    return physicalContentRect;
  }

  /// Calculates the physical diagram rectangle.
  ///
  /// This method converts logical coordinates to physical coordinates,
  /// optionally adding dynamic overscroll margins.
  ///
  /// [scale] - The scale factor
  /// [contentRect] - The logical content rectangle
  /// [dynamic] - Whether to add dynamic overscroll margins
  /// Returns the physical rectangle
  static Rect _diagramPhysicalRect({
    required double scale,
    required Rect contentRect,
    required bool dynamic,
  }) {
    final baseRect = Rect.fromLTRB(
      contentRect.left * scale,
      contentRect.top * scale,
      contentRect.right * scale,
      contentRect.bottom * scale,
    );

    return dynamic ? baseRect.inflate(dynamicBorderWidth) : baseRect;
  }

  /// Computes the legal horizontal translation range for a given configuration.
  ///
  /// The range is computed by probing the capping logic itself, guaranteeing
  /// consistency with [_capTransformPreservingCentering]/[capTransformWithZoomLimits].
  static (double minX, double maxX) legalTranslationRangeX({
    required double scale,
    required Rect diagramRect,
    required Size viewportSize,
    required bool dynamic,
    bool preserveCentering = false,
    bool recenterSmallContent = false,
    double currentY = 0.0,
  }) {
    const veryLarge = 1e9;
    final leftProbe = Transform2DUtils.capTransformWithZoomLimits(
      transform:
          Transform2D(scale: scale, translation: Offset(-veryLarge, currentY)),
      diagramRect: diagramRect,
      size: viewportSize,
      dynamic: dynamic,
      minZoom: minimumScale,
      maxZoom: maximumScale,
      preserveCentering: preserveCentering,
      recenterSmallContent: recenterSmallContent,
    );
    final rightProbe = Transform2DUtils.capTransformWithZoomLimits(
      transform:
          Transform2D(scale: scale, translation: Offset(veryLarge, currentY)),
      diagramRect: diagramRect,
      size: viewportSize,
      dynamic: dynamic,
      minZoom: minimumScale,
      maxZoom: maximumScale,
      preserveCentering: preserveCentering,
      recenterSmallContent: recenterSmallContent,
    );
    final minX = min(leftProbe.translation.dx, rightProbe.translation.dx);
    final maxX = max(leftProbe.translation.dx, rightProbe.translation.dx);
    return (minX, maxX);
  }

  /// Computes the legal vertical translation range for a given configuration.
  static (double minY, double maxY) legalTranslationRangeY({
    required double scale,
    required Rect diagramRect,
    required Size viewportSize,
    required bool dynamic,
    bool preserveCentering = false,
    bool recenterSmallContent = false,
    double currentX = 0.0,
  }) {
    const veryLarge = 1e9;
    final topProbe = Transform2DUtils.capTransformWithZoomLimits(
      transform:
          Transform2D(scale: scale, translation: Offset(currentX, -veryLarge)),
      diagramRect: diagramRect,
      size: viewportSize,
      dynamic: dynamic,
      minZoom: minimumScale,
      maxZoom: maximumScale,
      preserveCentering: preserveCentering,
      recenterSmallContent: recenterSmallContent,
    );
    final bottomProbe = Transform2DUtils.capTransformWithZoomLimits(
      transform:
          Transform2D(scale: scale, translation: Offset(currentX, veryLarge)),
      diagramRect: diagramRect,
      size: viewportSize,
      dynamic: dynamic,
      minZoom: minimumScale,
      maxZoom: maximumScale,
      preserveCentering: preserveCentering,
      recenterSmallContent: recenterSmallContent,
    );
    final minY = min(topProbe.translation.dy, bottomProbe.translation.dy);
    final maxY = max(topProbe.translation.dy, bottomProbe.translation.dy);
    return (minY, maxY);
  }

  /// Clamps the scale at gesture end using configuration limits.
  static double clampScaleOnEnd({
    required double proposedNewScale,
    required double minZoom,
    required double maxZoom,
  }) {
    return proposedNewScale.clamp(minZoom, maxZoom);
  }

  /// Snaps a logical point to the nearest grid node defined by [origin] and [spacing].
  ///
  /// If [spacing] <= 0, returns [point] unchanged.
  static Offset snapPointToGrid({
    required Offset point,
    required double spacing,
    required Offset origin,
  }) {
    if (spacing <= 0 || spacing.isNaN || !spacing.isFinite) {
      return point;
    }
    final dxUnits = ((point.dx - origin.dx) / spacing).roundToDouble();
    final dyUnits = ((point.dy - origin.dy) / spacing).roundToDouble();
    return Offset(
      origin.dx + dxUnits * spacing,
      origin.dy + dyUnits * spacing,
    );
  }
}

/// Extension on double to provide precision comparison.
extension PrecisionExtension on double {
  double toPrecision(int precision) {
    return double.parse(toStringAsFixed(precision));
  }
}
