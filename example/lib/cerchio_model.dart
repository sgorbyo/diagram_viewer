import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';
import 'package:vector_math/vector_math.dart';

class CerchioModel extends Equatable {
  final Vector4 position;
  final String id;
  final double radius;

  CerchioModel({
    required this.position,
    required this.radius,
  })  : id = const Uuid().v1(),
        super();

  @override
  List<Object?> get props => [id, position, radius];
}
