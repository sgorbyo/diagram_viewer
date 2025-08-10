import 'dart:ui';
import 'dart:convert';
import 'package:diagram_viewer/interfaces/diagram_object_entity.dart';
import 'package:diagram_viewer/interfaces/moveable_node.dart';

/// An example implementation of a serializable movable circle entity.
///
/// This class demonstrates how to use the MoveableNode mixin with serialization
/// support, ensuring that the center position is properly saved and restored.
///
/// ## Features
///
/// - **Movement**: Can be moved using relative or absolute positioning
/// - **Serialization**: Supports JSON serialization/deserialization
/// - **Center Tracking**: The center position is included in serialization
/// - **State Restoration**: Can restore state from serialized data
// ignore: must_be_immutable
class CerchioSerializableEntity extends DiagramObjectEntity with MoveableNode {
  final Offset _originalCenter;
  final double radius;
  final String _id;
  final Paint _paint;

  CerchioSerializableEntity({
    required Offset center,
    required this.radius,
    required String id,
    Paint? paint,
  })  : _originalCenter = center,
        _id = id,
        _paint = paint ?? _createDefaultPaint() {
    // Initialize the center position
    initializeCenter(center);
  }

  /// Creates a CerchioSerializableEntity from serialized JSON data.
  ///
  /// This constructor restores the object state from JSON, including
  /// the current center position.
  ///
  /// @param json The JSON data to deserialize from
  /// @return A new CerchioSerializableEntity with restored state
  factory CerchioSerializableEntity.fromJson(Map<String, dynamic> json) {
    final originalCenter = Offset(
      json['originalCenter']['x'].toDouble(),
      json['originalCenter']['y'].toDouble(),
    );

    final entity = CerchioSerializableEntity(
      center: originalCenter,
      radius: json['radius'].toDouble(),
      id: json['id'],
    );

    // Restore the center position from serialized data
    final centerX = json['center']['x'].toDouble();
    final centerY = json['center']['y'].toDouble();
    entity.moveTo(Offset(centerX, centerY));

    return entity;
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
  List<Object?> get props => [_id, _originalCenter, radius, _paint, center];

  /// Returns the original center position.
  Offset get originalCenter => _originalCenter;

  /// Returns the current center position.
  Offset get currentCenter => center;

  /// Converts this object to a JSON representation.
  ///
  /// This method serializes the object state, including the current center position,
  /// making it possible to restore the object state later.
  ///
  /// @return A JSON representation of this object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'originalCenter': {
        'x': _originalCenter.dx,
        'y': _originalCenter.dy,
      },
      'center': {
        'x': center.dx,
        'y': center.dy,
      },
      'radius': radius,
    };
  }

  /// Converts this object to a JSON string.
  ///
  /// @return A JSON string representation of this object
  String toJsonString() {
    return jsonEncode(toJson());
  }

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
