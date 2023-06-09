import 'dart:ui';
import 'package:diagram_viewer/tools/scrolling_matrix4.dart';
import 'package:equatable/equatable.dart';
import 'package:diagram_viewer/diagram_object_entity.dart';
import 'package:uuid/uuid.dart';
import 'package:vector_math/vector_math_64.dart';

class CerchioEntity extends Equatable implements DiagramObjectEntity {
  final Vector4 position;
  final double radius;
  final Rect rect;
  final String id;

  CerchioEntity({
    required this.position,
    required this.radius,
    String? id,
  })  : id = id ?? const Uuid().v1(),
        rect = Rect.fromCenter(
          center: Offset(
            position.x,
            position.y,
          ),
          width: radius * 2.0,
          height: radius * 2.0,
        ),
        super();

  @override
  List<Object?> get props => [id, position];

  @override
  Rect enclosingRect() => rect;

  @override
  void printOnCanvas({required Canvas canvas}) {
    Path path = Path()..addOval(enclosingRect());
    Paint paint = Paint();
    paint.strokeWidth = 1.5;
    paint.color = const Color.fromRGBO(0, 0, 255, 1.0);
    paint.style = PaintingStyle.stroke;
    canvas.drawPath(path, paint);
  }

  bool inMe({required Vector4 vector}) {
    if (enclosingRect().contains(vector.toOffset())) {
      return true;
    }
    return false;
  }
}
