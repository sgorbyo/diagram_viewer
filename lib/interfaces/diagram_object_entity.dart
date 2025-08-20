import 'dart:ui';

import 'package:equatable/equatable.dart';

/// An abstract base class that defines the contract for all drawable objects
/// within the diagram viewer.
///
/// This class provides enhanced functionality including hit-testing, z-order management,
/// and improved rendering with Transform2D. It serves as the single source of truth
/// for diagram object contracts.
///
/// ## Responsibilities
///
/// Diagram objects have several responsibilities:
///
/// 1. **Self-measurement**: Each object must be able to calculate its own
///    bounding rectangle using [logicalBounds]
/// 2. **Self-rendering**: Each object must know how to render itself onto
///    a canvas using [paint]
/// 3. **Hit-testing**: Each object must support hit-testing via [contains]
/// 4. **Identity**: Each object must have a unique [id]
/// 5. **Layering**: Each object must have a [zOrder] for proper layering
///
/// ## Implementation Guidelines
///
/// When implementing this class:
///
/// - The [logicalBounds] should return the minimum rectangle that completely
///   contains the visual representation of the object
/// - The [paint] method should handle all drawing operations for the object,
///   using the provided Transform2D for coordinate conversion
/// - The [contains] method should implement proper hit-testing
/// - The [id] should be unique within the diagram
/// - The [zOrder] should determine the rendering order (higher = on top)
///
/// ## Available Mixins
///
/// The following mixins are available to enhance diagram objects:
///
/// - **[MoveableNode]**: Provides movement capabilities with center position management
///   and relative movement methods. Use this mixin when you need objects that
///   can be moved around the diagram. The mixin adds a `center` property that
///   represents the logical center position of the object.
///
/// ## Example Implementation
///
/// ```dart
/// class CircleObject extends DiagramObjectEntity {
///   final String _id;
///   final Offset center;
///   final double radius;
///   final Paint paint;
///   final int _zOrder;
///
///   CircleObject({
///     required String id,
///     required this.center,
///     required this.radius,
///     required this.paint,
///     int zOrder = 100,
///   }) : _id = id, _zOrder = zOrder;
///
///   @override
///   String get id => _id;
///
///   @override
///   Rect get logicalBounds => Rect.fromCircle(center: center, radius: radius);
///
///   @override
///   int get zOrder => _zOrder;
///
///   @override
///   void paint(Canvas canvas, Transform2D transform) {
///     final physicalCenter = transform.logicalToPhysical(center);
///     canvas.drawCircle(physicalCenter, radius * transform.scale, paint);
///   }
///
///   @override
///   bool contains(Offset point) {
///     return (point - center).distance <= radius;
///   }
///
///   @override
///   List<Object> get props => [_id, center, radius, paint, _zOrder];
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
  ///
  /// Returns the logical bounds of this object.
  ///
  /// This method provides the minimum rectangle that completely contains
  /// this diagram object. It is used by the DiagramViewer to:
  /// - Determine visibility of objects in the current viewport
  /// - Calculate the total content bounds for scrolling limits
  /// - Optimize rendering by skipping objects outside the visible area
  ///
  /// The rectangle should be calculated in the object's local coordinate system,
  /// not accounting for any transformation applied by the viewer.
  Rect get logicalBounds;

  /// Paints this object on the given canvas.
  ///
  /// This method is called by the DiagramViewer when the object needs to be drawn.
  /// The canvas is already transformed to logical coordinates, so objects should
  /// draw using their logical coordinates directly.
  ///
  /// Implementation should:
  /// - Draw all visual elements of the object using logical coordinates
  /// - Handle any object-specific styling or effects
  /// - Consider performance optimizations for complex objects
  ///
  /// @param canvas The canvas to paint on (already transformed to logical coordinates)
  void paint(Canvas canvas);

  /// Returns the unique identifier for this object.
  ///
  /// This ID should be unique within the diagram and stable across updates.
  /// Default implementation uses the object's hash code.
  String get id => hashCode.toString();

  /// Returns the center point of this object.
  ///
  /// This is the logical center point of the object in diagram coordinates.
  /// Default implementation uses the center of logicalBounds.
  Offset get center => logicalBounds.center;

  /// Returns the z-order (layer) of this object.
  ///
  /// Objects with higher z-order values are rendered on top of objects
  /// with lower z-order values. Default implementation returns 100.
  int get zOrder => 100;

  /// Checks if this object contains the given point.
  ///
  /// This method is used for hit-testing to determine if a user interaction
  /// occurred on this object. Default implementation uses the logical bounds.
  ///
  /// @param point The point to test (in logical coordinates)
  /// @return true if the point is within this object's bounds
  bool contains(Offset point) {
    return logicalBounds.contains(point);
  }

  /// Returns true if this object is visible.
  ///
  /// Default implementation returns true. Override this method to implement
  /// visibility logic.
  bool get isVisible => true;

  /// Returns true if this object can be interacted with.
  ///
  /// Default implementation returns true. Override this method to implement
  /// interaction logic.
  bool get isInteractive => true;

  /// Presentation hint: whether this object is considered selected.
  /// The controller's model should drive this flag. Default: false.
  bool get isSelected => false;
}
