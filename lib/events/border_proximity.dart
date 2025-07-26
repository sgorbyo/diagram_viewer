import 'package:freezed_annotation/freezed_annotation.dart';

part 'border_proximity.freezed.dart';

/// Information about proximity to diagram borders.
///
/// This class tracks whether an event or object is near the edges of the
/// diagram viewport. This information is used for:
/// - Auto-scrolling when objects are dragged near edges
/// - Visual feedback for edge proximity
/// - Boundary constraint calculations
///
/// ## Example Usage
///
/// ```dart
/// final proximity = BorderProximity(
///   isNearLeft: true,
///   isNearRight: false,
///   isNearTop: false,
///   isNearBottom: true,
///   distanceFromEdge: 25.0,
///   threshold: 50.0,
/// );
///
/// if (proximity.isNearAnyEdge) {
///   // Trigger auto-scroll or visual feedback
///   _startAutoScroll(proximity);
/// }
/// ```
@freezed
class BorderProximity with _$BorderProximity {
  const BorderProximity._();

  const factory BorderProximity({
    /// Whether the point is near the left edge of the viewport.
    @Default(false) bool isNearLeft,

    /// Whether the point is near the right edge of the viewport.
    @Default(false) bool isNearRight,

    /// Whether the point is near the top edge of the viewport.
    @Default(false) bool isNearTop,

    /// Whether the point is near the bottom edge of the viewport.
    @Default(false) bool isNearBottom,

    /// Distance from the nearest edge in pixels.
    ///
    /// This is the minimum distance to any edge that the point is near.
    /// If the point is not near any edge, this should be a large value.
    @Default(double.infinity) double distanceFromEdge,

    /// Threshold distance that determines "nearness" to an edge.
    ///
    /// Points within this distance from an edge are considered "near" that edge.
    /// This threshold is typically configurable and independent of zoom level.
    @Default(50.0) double threshold,
  }) = _BorderProximity;

  /// Creates a BorderProximity indicating no proximity to any edge.
  ///
  /// This factory constructor creates a BorderProximity that indicates
  /// the point is not near any edge of the viewport.
  static const BorderProximity none = BorderProximity(
    isNearLeft: false,
    isNearRight: false,
    isNearTop: false,
    isNearBottom: false,
    distanceFromEdge: double.infinity,
    threshold: 50.0,
  );

  /// Returns true if the point is near any edge.
  bool get isNearAnyEdge =>
      isNearLeft || isNearRight || isNearTop || isNearBottom;

  /// Returns true if the point is near a horizontal edge (top or bottom).
  bool get isNearHorizontalEdge => isNearTop || isNearBottom;

  /// Returns true if the point is near a vertical edge (left or right).
  bool get isNearVerticalEdge => isNearLeft || isNearRight;

  /// Returns the number of edges the point is near.
  int get nearEdgeCount {
    int count = 0;
    if (isNearLeft) count++;
    if (isNearRight) count++;
    if (isNearTop) count++;
    if (isNearBottom) count++;
    return count;
  }

  /// Returns true if the point is near multiple edges (corner case).
  bool get isNearMultipleEdges => nearEdgeCount > 1;

  /// Returns the edge that the point is closest to.
  ///
  /// Returns null if the point is not near any edge.
  String? get closestEdge {
    if (!isNearAnyEdge) return null;

    // Find the edge with the smallest distance
    double minDistance = double.infinity;
    String? closest;

    if (isNearLeft && distanceFromEdge < minDistance) {
      minDistance = distanceFromEdge;
      closest = 'left';
    }
    if (isNearRight && distanceFromEdge < minDistance) {
      minDistance = distanceFromEdge;
      closest = 'right';
    }
    if (isNearTop && distanceFromEdge < minDistance) {
      minDistance = distanceFromEdge;
      closest = 'top';
    }
    if (isNearBottom && distanceFromEdge < minDistance) {
      minDistance = distanceFromEdge;
      closest = 'bottom';
    }

    return closest;
  }

  /// Returns a normalized distance from the nearest edge.
  ///
  /// This value ranges from 0.0 (at the edge) to 1.0 (at the threshold).
  /// Values greater than 1.0 indicate the point is beyond the threshold.
  double get normalizedDistance {
    if (!isNearAnyEdge) return 1.0;
    return (distanceFromEdge / threshold).clamp(0.0, 1.0);
  }

  /// Returns true if the point is very close to an edge (within 25% of threshold).
  bool get isVeryNearEdge => normalizedDistance < 0.25;

  /// Returns true if the point is moderately close to an edge (25-75% of threshold).
  bool get isModeratelyNearEdge =>
      normalizedDistance >= 0.25 && normalizedDistance < 0.75;

  /// Returns true if the point is just within the threshold (75-100% of threshold).
  bool get isJustWithinThreshold =>
      normalizedDistance >= 0.75 && normalizedDistance <= 1.0;
}
