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
  static double dynamicBorderWidth = 150.0;
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
      physicalContentRect.width.toPrecision(epsilon) >= viewPortSize.width.toPrecision(epsilon) ||
      physicalContentRect.height.toPrecision(epsilon) >= viewPortSize.height.toPrecision(epsilon),
    );

    if (physicalContentRect.width.toPrecision(epsilon) < viewPortSize.width.toPrecision(epsilon)) {
      return Rect.fromCenter(
        center: physicalContentRect.center,
        width: viewPortSize.width,
        height: physicalContentRect.height,
      );
    }

    if (physicalContentRect.height.toPrecision(epsilon) < viewPortSize.height.toPrecision(epsilon)) {
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
}

/// Extension on double to provide precision comparison.
extension PrecisionExtension on double {
  double toPrecision(int precision) {
    return double.parse(toStringAsFixed(precision));
  }
}
