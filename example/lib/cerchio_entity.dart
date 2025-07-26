import 'dart:ui';
import 'package:diagram_viewer/interfaces/diagram_object_entity.dart';
import 'package:diagram_viewer/events/transform_2d.dart';
import 'package:vector_math/vector_math.dart';

class CerchioEntity extends DiagramObjectEntity {
  final Vector4 position;
  final double radius;
  final String _id;

  CerchioEntity({
    required this.position,
    required this.radius,
    required String id,
  }) : _id = id;

  @override
  String get id => _id;

  @override
  Rect get logicalBounds => Rect.fromCenter(
        center: Offset(position.x, position.y),
        width: radius * 2,
        height: radius * 2,
      );

  @override
  void paint(Canvas canvas, Transform2D transform) {
    final physicalCenter = transform.logicalToPhysical(Offset(position.x, position.y));
    final physicalRadius = radius * transform.scale;
    
    final path = Path()..addOval(Rect.fromCircle(
      center: physicalCenter,
      radius: physicalRadius,
    ));
    
    final paint = Paint()
      ..strokeWidth = 1.5 * transform.scale
      ..color = const Color.fromRGBO(0, 0, 255, 1.0)
      ..style = PaintingStyle.stroke;
    
    canvas.drawPath(path, paint);
  }

  @override
  bool contains(Offset point) {
    return (point - Offset(position.x, position.y)).distance <= radius;
  }

  @override
  List<Object?> get props => [_id, position, radius];

  // Deprecated methods for backward compatibility
  @override
  @Deprecated('Use logicalBounds instead')
  Rect enclosingRect() => logicalBounds;

  @override
  @Deprecated('Use paint instead')
  void printOnCanvas({required Canvas canvas}) {
    final paint = Paint()
      ..strokeWidth = 1.5
      ..color = const Color.fromRGBO(0, 0, 255, 1.0)
      ..style = PaintingStyle.stroke;
    
    final path = Path()..addOval(logicalBounds);
    canvas.drawPath(path, paint);
  }
}
