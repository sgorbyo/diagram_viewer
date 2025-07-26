import 'package:flutter/material.dart';
import 'package:diagram_viewer/events/transform_2d.dart';

/// Interface that defines how diagram objects interact with the DiagramViewer.
///
/// This interface extends the existing `DiagramObjectEntity` contract to include
/// all the functionality needed for the new architecture. Objects that implement
/// this interface can be:
/// - Rendered by the DiagramViewer
/// - Hit-tested for user interactions
/// - Managed by the Controller's business logic
///
/// ## Implementation Requirements
///
/// When implementing this interface, you must provide:
/// 1. **Rendering**: The `paint` method for drawing the object
/// 2. **Hit-testing**: The `contains` method for interaction detection
/// 3. **Bounds**: The `logicalBounds` getter for layout calculations
/// 4. **Z-order**: The `zOrder` getter for layering
/// 5. **Identity**: The `id` getter for object identification
///
/// ## Example Implementation
///
/// ```dart
/// class MyDiagramObject implements IDiagramObject {
///   final String _id;
///   final Rect _bounds;
///   final int _zOrder;
///   final Color _color;
///   final String _text;
///
///   MyDiagramObject({
///     required String id,
///     required Rect bounds,
///     required int zOrder,
///     required Color color,
///     required String text,
///   }) : _id = id,
///        _bounds = bounds,
///        _zOrder = zOrder,
///        _color = color,
///        _text = text;
///
///   @override
///   String get id => _id;
///
///   @override
///   Rect get logicalBounds => _bounds;
///
///   @override
///   int get zOrder => _zOrder;
///
///   @override
///   void paint(Canvas canvas, Transform2D transform) {
///     final paint = Paint()
///       ..color = _color
///       ..style = PaintingStyle.fill;
///
///     final transformedBounds = transform.logicalToPhysical(_bounds.topLeft) &
///                               transform.logicalToPhysical(_bounds.bottomRight);
///
///     canvas.drawRect(transformedBounds, paint);
///
///     // Draw text
///     final textPainter = TextPainter(
///       text: TextSpan(text: _text),
///       textDirection: TextDirection.ltr,
///     );
///     textPainter.layout();
///     textPainter.paint(canvas, transform.logicalToPhysical(_bounds.center));
///   }
///
///   @override
///   bool contains(Offset point) {
///     return _bounds.contains(point);
///   }
/// }
/// ```
abstract class IDiagramObject {
  /// Unique identifier for this object.
  ///
  /// This ID is used by the Controller to identify and manage objects.
  /// It should be unique within the diagram and stable across updates.
  String get id;

  /// Logical bounds of this object in diagram coordinates.
  ///
  /// These bounds define the object's position and size in the diagram's
  /// coordinate system. The DiagramViewer uses these bounds for:
  /// - Hit-testing
  /// - Layout calculations
  /// - Bounds checking
  /// - Auto-scroll calculations
  ///
  /// The bounds should be updated whenever the object's position or size changes.
  Rect get logicalBounds;

  /// Z-order (layer) of this object.
  ///
  /// Objects with higher z-order values are rendered on top of objects
  /// with lower z-order values. This determines the visual layering
  /// of objects in the diagram.
  ///
  /// Typical z-order values:
  /// - Background objects: 0-99
  /// - Regular objects: 100-999
  /// - Foreground objects: 1000+
  /// - UI overlays: 10000+
  int get zOrder;

  /// Paint this object on the given canvas.
  ///
  /// This method is called by the DiagramViewer to render the object.
  /// The canvas is already set up with the appropriate transformation,
  /// so you can draw in logical coordinates and the transformation
  /// will be applied automatically.
  ///
  /// [canvas] - The canvas to paint on
  /// [transform] - The current transformation (for coordinate conversion)
  ///
  /// ## Implementation Guidelines
  ///
  /// 1. **Use logical coordinates**: Draw using the object's logical bounds
  /// 2. **Convert coordinates**: Use `transform.logicalToPhysical()` for screen coordinates
  /// 3. **Handle transformations**: The canvas transformation is already applied
  /// 4. **Optimize rendering**: Avoid expensive operations in this method
  /// 5. **Respect bounds**: Don't draw outside the object's logical bounds
  void paint(Canvas canvas, Transform2D transform);

  /// Check if this object contains the given point.
  ///
  /// This method is used for hit-testing to determine if a user interaction
  /// (click, drag, etc.) occurred on this object.
  ///
  /// [point] - The point to test (in logical coordinates)
  /// Returns true if the point is within this object's bounds
  ///
  /// ## Implementation Guidelines
  ///
  /// 1. **Use logical coordinates**: The point is in diagram coordinates
  /// 2. **Check bounds**: Test against the object's logical bounds
  /// 3. **Consider shape**: For complex shapes, implement proper hit-testing
  /// 4. **Performance**: This method is called frequently, so keep it fast
  /// 5. **Consistency**: The result should match what the user sees
  bool contains(Offset point);

  /// Returns true if this object is visible.
  ///
  /// This method can be used to conditionally render objects or exclude
  /// them from hit-testing. Objects that return false will not be
  /// rendered or hit-tested.
  ///
  /// Default implementation returns true. Override this method to
  /// implement visibility logic.
  bool get isVisible => true;

  /// Returns true if this object can be interacted with.
  ///
  /// This method can be used to disable interactions on certain objects.
  /// Objects that return false will not be included in hit-test results.
  ///
  /// Default implementation returns true. Override this method to
  /// implement interaction logic.
  bool get isInteractive => true;

  /// Returns a debug representation of this object.
  ///
  /// This method is used for debugging and logging. It should return
  /// a string that identifies the object and its key properties.
  ///
  /// Default implementation returns the object's ID. Override this method
  /// to provide more detailed information.
  @override
  String toString() =>
      'IDiagramObject(id: $id, bounds: $logicalBounds, zOrder: $zOrder)';
}
