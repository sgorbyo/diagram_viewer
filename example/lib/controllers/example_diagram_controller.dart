import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/events/events.dart';
import '../cerchio_entity.dart';
import '../cerchio_model.dart';
import 'package:vector_math/vector_math.dart';

/// Example implementation of IDiagramController for the example app.
///
/// This controller demonstrates how to implement the IDiagramController interface
/// to provide business logic for the DiagramViewer.
class ExampleDiagramController implements IDiagramController {
  final Map<String, CerchioModel> _storage = {};
  static const width = 1024;
  static const height = 768;
  static const radius = 50.0;

  final StreamController<DiagramCommand> _commandController =
      StreamController<DiagramCommand>.broadcast();
  final StreamController<PhysicalEvent> _eventController =
      StreamController<PhysicalEvent>.broadcast();

  ExampleDiagramController() {
    _randomPopulate(50);
  }

  @override
  Stream<DiagramCommand> get commandStream => _commandController.stream;

  @override
  StreamSink<PhysicalEvent> get eventsSink => _eventController.sink;

  @override
  Rect get logicalExtent {
    if (_storage.isEmpty) {
      return Rect.fromCenter(
        center: Offset.zero,
        width: 512,
        height: 512,
      );
    }

    Rect bounds = _storage.values.first.position.toRect().inflate(radius);
    for (final model in _storage.values) {
      bounds = bounds.expandToInclude(
        model.position.toRect().inflate(radius),
      );
    }
    return bounds.inflate(25); // Add padding
  }

  @override
  DiagramConfiguration get configuration => DiagramConfiguration.defaults;

  List<DiagramObjectEntity> get objects {
    final List<DiagramObjectEntity> result = [];
    for (final model in _storage.values) {
      final entity = CerchioEntity(
        position: model.position,
        radius: model.radius,
        id: model.id,
      );
      result.add(entity);
    }
    return result;
  }

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

  @override
  void dispose() {
    _commandController.close();
    _eventController.close();
  }
}

/// Extension to convert Vector4 to Rect for bounds calculation.
extension Vector4RectExtension on Vector4 {
  Rect toRect() {
    return Rect.fromCenter(
      center: Offset(x, y),
      width: 0,
      height: 0,
    );
  }
}
