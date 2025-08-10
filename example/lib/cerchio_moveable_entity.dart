import 'dart:ui';
import 'package:diagram_viewer/interfaces/diagram_object_entity.dart';
import 'package:diagram_viewer/interfaces/moveable_node.dart';

/// An example implementation of a movable circle entity.
///
/// This class demonstrates how to use the MoveableNode mixin to create
/// diagram objects that can be moved around the diagram.
///
/// ## Features
///
/// - **Movement**: Can be moved using relative or absolute positioning
/// - **Position Tracking**: Maintains original position and current offset
/// - **Hit Testing**: Proper hit testing that accounts for movement
/// - **Rendering**: Renders at the current position
// ignore: must_be_immutable
class CerchioMoveableEntity extends DiagramObjectEntity with MoveableNode {
  final double radius;
  final String _id;
  final Paint _paint;

  CerchioMoveableEntity({
    required Offset center,
    required this.radius,
    required String id,
    Paint? paint,
  })  : _id = id,
        _paint = paint ?? _createDefaultPaint() {
    // Initialize the center position
    initializeCenter(center);
  }

  static Paint _createDefaultPaint() {
    return Paint()
      ..strokeWidth = 1.5
      ..color = const Color.fromRGBO(0, 0, 255, 1.0)
      ..style = PaintingStyle.stroke;
  }

  @override
  String get id => _id;

  @override
  Rect get logicalBounds {
    return Rect.fromCircle(
      center: center,
      radius: radius,
    );
  }

  @override
  void paint(Canvas canvas) {
    final path = Path()
      ..addOval(Rect.fromCircle(
        center: center,
        radius: radius,
      ));

    canvas.drawPath(path, _paint);
  }

  @override
  bool contains(Offset point) {
    final distance = (point - center).distance;
    return distance <= radius;
  }

  @override
  List<Object?> get props => [_id, center, radius, _paint];

  /// Moves the circle by the specified amount.
  ///
  /// This is a convenience method that uses the MoveableNode functionality.
  ///
  /// @param dx The horizontal offset to move by
  /// @param dy The vertical offset to move by
  void moveByAmount(double dx, double dy) {
    moveBy(Offset(dx, dy));
  }

  /// Moves the circle to the specified position.
  ///
  /// This is a convenience method that uses the MoveableNode functionality.
  ///
  /// @param x The target x coordinate
  /// @param y The target y coordinate
  void moveToPosition(double x, double y) {
    moveTo(Offset(x, y));
  }

  // Deprecated methods for backward compatibility
  @Deprecated('Use logicalBounds instead')
  Rect enclosingRect() => logicalBounds;

  @Deprecated('Use paint instead')
  void printOnCanvas({required Canvas canvas}) {
    paint(canvas);
  }
}
