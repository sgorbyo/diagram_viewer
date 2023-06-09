import 'dart:async';
import 'dart:math';

import 'package:diagram_viewer/tools/scrolling_matrix4.dart';
import 'package:logger/logger.dart';

import 'cerchio_entity.dart';
import 'package:diagram_viewer/diagram_content_repository.dart';
import 'package:vector_math/vector_math_64.dart';

class CerchioRepository extends DiagramContentRepository {
  final Map<String, CerchioEntity> _storage = {};
  static const width = 1024;
  static const height = 768;
  static const radius = 50.0;
  static const squaredRadius = radius * radius;
  // Initializing a stream controller
  final StreamController<List<CerchioEntity>> _controller =
      StreamController<List<CerchioEntity>>();

  var logger = Logger();

  CerchioRepository() {
    _randomPopulate(50);
    stream = _controller.stream;
    _sendToStream();
  }

  @override
  void restart() => _sendToStream();

  String? cerchioAtOffset({required Vector4 vector}) {
    String result = _storage.keys
        .firstWhere((k) => _storage[k]!.inMe(vector: vector), orElse: () => "");

    return result == "" ? null : result;
  }

  void moveCerchioBy(
      {required String cerchioId, required Vector4 deltaVector}) {
    Vector4 newPos = _storage[cerchioId]!.position.movedBy(deltaVector);
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
      _storage[entity.id] = entity;
    }
  }
}
