import 'dart:async';
import 'dart:math';

import 'cerchio_entity.dart';
import 'package:diagram_viewer/diagram_content_repository.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:flutter/material.dart';

class CerchioRepository extends DiagramContentRepository {
  final Map<String, CerchioEntity> _storage = {};
  static const width = 1024;
  static const height = 768;
  static const radius = 50.0;
  static const squaredRadius = radius * radius;
  // Initializing a stream controller
  final StreamController<List<CerchioEntity>> _controller =
      StreamController<List<CerchioEntity>>();

  CerchioRepository() {
    _randomPopulate(50);
    // CerchioEntity model = CerchioEntity(
    //   position: Vector4(
    //     0.0,
    //     0.0,
    //     0.0,
    //     1.0,
    //   ),
    //   radius: radius,
    // );
    // _storage[model.id] = model;
    // model = CerchioEntity(
    //   position: Vector4(
    //     1500.5,
    //     1500.5,
    //     0.0,
    //     1.0,
    //   ),
    //   radius: radius,
    // );
    // _storage[model.id] = model;
    // model = CerchioEntity(
    //   position: Vector4(
    //     0.0,
    //     1500.5,
    //     0.0,
    //     1.0,
    //   ),
    //   radius: radius,
    // );
    // _storage[model.id] = model;
    // model = CerchioEntity(
    //   position: Vector4(
    //     1500.5,
    //     0.0,
    //     0.0,
    //     1.0,
    //   ),
    //   radius: radius,
    // );
    // _storage[model.id] = model;
    stream = _controller.stream;
    _sendToStream();
  }

  @override
  void restart() => _sendToStream();

  String? cerchioAtOffset({required Vector4 vector}) {
    String? result;
    double squaredDistance = double.infinity;
    _storage.forEach((key, value) {
      double currentSqDistance = value.position.distanceToSquared(vector);
      if (value.inMe(vector: vector) && currentSqDistance < squaredDistance) {
        result = key;
        squaredDistance = currentSqDistance;
      }
    });
    return result;
  }

  void moveCerchioBy(
      {required String cerchioId, required Vector4 deltaVector}) {
    Vector4 newPos = _storage[cerchioId]!.position + deltaVector;
    _storage[cerchioId] = CerchioEntity(
      id: _storage[cerchioId]!.id,
      position: newPos,
      radius: radius,
    );
    _sendToStream();
  }

  void _sendToStream() => _controller.sink.add(
        _storage.values.toList(),
      );

  void _randomPopulate(int howMany) {
    Random random = Random();
    for (int j = howMany; j > 0; j--) {
      CerchioEntity entity = CerchioEntity(
        position: Vector4(
          radius + (width - 2 * radius) * random.nextDouble(),
          radius + (height - 2 * radius) * random.nextDouble(),
          0.0,
          1.0,
        ),
        radius: radius,
      );
      debugPrint("Entity at ${entity.position}");
      _storage[entity.id] = entity;
    }
  }
}
