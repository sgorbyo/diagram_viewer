import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'cerchio_model.dart';
import 'cerchio_entity.dart';
import 'package:diagram_viewer/diagram_content_repository.dart';
import 'package:vector_math/vector_math.dart';

class CerchioRepository extends DiagramContentRepository {
  final Map<String, CerchioModel> _storage = {};
  static const width = 1024;
  static const height = 768;
  static const radius = 50.0;
  Rect _lastArea = Rect.zero;
  // Initializing a stream controller
  final StreamController<List<CerchioEntity>> _controller =
      StreamController<List<CerchioEntity>>();

  //late final Stream<List<CerchioEntity>> stream;

  CerchioRepository() {
    _randomPopulate(50);
    stream = _controller.stream;
    _sendToStream();
  }

  @override
  void restart() => _sendToStream();

  void _sendToStream() => _controller.sink.add(
        _storage.values
            .map(
              (CerchioModel e) => CerchioEntity(
                position: e.position,
                id: e.id,
                radius: e.radius,
              ),
            )
            .toList(),
      );

  void _randomPopulate(int howMany) {
    Random random = Random();
    for (int j = howMany; j > 0; j--) {
      CerchioModel model = CerchioModel(
        position: Vector4(
          radius + (width - 2 * radius) * random.nextDouble(),
          radius + (height - 2 * radius) * random.nextDouble(),
          0.0,
          0.0,
        ),
        radius: radius,
      );
      _storage[model.id] = model;
    }
  }
}
