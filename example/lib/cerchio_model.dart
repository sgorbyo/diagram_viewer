import 'dart:ui';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class CerchioModel extends Equatable {
  final Offset center;
  final String id;
  final double radius;

  CerchioModel({
    required this.center,
    required this.radius,
    String? id,
  })  : id = id ?? const Uuid().v1(),
        super();

  @override
  List<Object?> get props => [id, center, radius];
}
