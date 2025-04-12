import 'dart:ui';

import 'package:equatable/equatable.dart';

/// An abstract base class that defines the contract for all drawable objects
/// within the diagram viewer.
///
/// All objects that are displayed in the diagram viewer must implement this
/// interface. The DiagramViewer uses these methods to properly render and
/// position diagram elements within the viewing area.
///
/// ## Responsibilities
///
/// Diagram objects have two primary responsibilities:
///
/// 1. **Self-measurement**: Each object must be able to calculate its own
///    bounding rectangle using [enclosingRect]
/// 2. **Self-rendering**: Each object must know how to render itself onto
///    a canvas using [printOnCanvas]
///
/// ## Implementation Guidelines
///
/// When implementing this class:
///
/// - The [enclosingRect] should return the minimum rectangle that completely
///   contains the visual representation of the object
/// - The [printOnCanvas] method should handle all drawing operations for the object,
///   considering the current transformation matrix of the canvas
/// - The [Equatable] implementation should include all properties that define
///   the object's identity and appearance
///
/// ## Example Implementation
///
/// ```dart
/// class CircleObject extends DiagramObjectEntity {
///   final Offset center;
///   final double radius;
///   final Paint paint;
///
///   CircleObject({
///     required this.center,
///     required this.radius,
///     required this.paint,
///   });
///
///   @override
///   Rect enclosingRect() {
///     return Rect.fromCircle(center: center, radius: radius);
///   }
///
///   @override
///   void printOnCanvas({required Canvas canvas}) {
///     canvas.drawCircle(center, radius, paint);
///   }
///
///   @override
///   List<Object> get props => [center, radius, paint];
/// }
/// ```
abstract class DiagramObjectEntity extends Equatable {
  /// Calculates and returns the minimum rectangle that completely contains
  /// this diagram object.
  ///
  /// This method is used by the DiagramViewer to:
  /// - Determine visibility of objects in the current viewport
  /// - Calculate the total content bounds for scrolling limits
  /// - Optimize rendering by skipping objects outside the visible area
  ///
  /// The rectangle should be calculated in the object's local coordinate system,
  /// not accounting for any transformation applied by the viewer.
  Rect enclosingRect();

  /// Renders the diagram object onto the provided canvas.
  ///
  /// This method is called by the DiagramViewer when the object needs to be drawn.
  /// The canvas will already have any necessary transformation matrix applied
  /// for the current view state (translation, scale, rotation).
  ///
  /// Implementation should:
  /// - Draw all visual elements of the object
  /// - Handle any object-specific styling or effects
  /// - Consider performance optimizations for complex objects
  ///
  /// @param canvas The canvas onto which the object should render itself
  void printOnCanvas({required Canvas canvas});
}
