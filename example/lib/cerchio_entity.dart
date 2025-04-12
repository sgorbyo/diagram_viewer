import 'dart:ui';
import 'package:equatable/equatable.dart';
import 'package:diagram_viewer/diagram_object_entity.dart';
import 'package:vector_math/vector_math.dart';

class CerchioEntity extends Equatable implements DiagramObjectEntity {
  final Vector4 position;
  final double radius;
  final String id;

  const CerchioEntity({
    required this.position,
    required this.radius,
    required this.id,
  }) : super();

  @override
  List<Object?> get props => [id, position];

  @override
  Rect enclosingRect() => Rect.fromCenter(
        center: Offset(
          position.x,
          position.y,
        ),
        width: radius,
        height: radius,
      );

  @override
  void printOnCanvas({required Canvas canvas}) {
    Path path = Path()..addOval(enclosingRect());
    Paint paint = Paint();
    paint.strokeWidth = 1.5;
    paint.color = const Color.fromRGBO(0, 0, 255, 1.0);
    paint.style = PaintingStyle.stroke;
    canvas.drawPath(path, paint);
  }
}
