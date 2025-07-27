import 'dart:async';
import 'dart:math';
import 'package:flutter/services.dart';
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
    _setupEventHandling();

    // Send initial redraw command with calculated logical extent
    // This ensures the DiagramViewer knows about all objects and the correct diagram area
    _updateLogicalExtentAndRedraw();
  }

  void _setupEventHandling() {
    _eventController.stream.listen(_handlePhysicalEvent);
  }

  void _handlePhysicalEvent(PhysicalEvent event) {
    event.when(
      pointer: (eventId, logicalPosition, screenPosition, transformSnapshot,
          hitList, borderProximity, phase, rawEvent, delta, currentViewport) {
        if (hitList.isNotEmpty) {
          // Business logic: sposta oggetto
          _updateObjectPosition(hitList.first, logicalPosition);
          _sendRedrawCommand(currentViewport);
        } else {
          // Business logic: richiedi comportamento di default
          _commandController
              .add(DiagramCommand.applyDefaultPanZoom(origin: event));
        }
      },
      gesture: (eventId,
          logicalPosition,
          screenPosition,
          transformSnapshot,
          hitList,
          borderProximity,
          phase,
          rawEvent,
          scale,
          rotation,
          currentViewport) {
        // Business logic: richiedi comportamento di default per gesture
        _commandController
            .add(DiagramCommand.applyDefaultPanZoom(origin: event));
      },
      keyboard: (eventId, logicalPosition, transformSnapshot, hitList,
          borderProximity, rawEvent, pressedKeys, currentViewport) {
        // Handle keyboard shortcuts
        if (pressedKeys.contains(LogicalKeyboardKey.space)) {
          _sendRedrawCommand(currentViewport);
        } else {
          // Business logic: richiedi comportamento di default per tastiera
          _commandController
              .add(DiagramCommand.applyDefaultPanZoom(origin: event));
        }
      },
    );
  }

  /// Update object position in the model.
  void _updateObjectPosition(DiagramObjectEntity object, Offset newPosition) {
    if (object is CerchioEntity) {
      final model = _storage.values.firstWhere(
        (model) => model.id == object.id,
        orElse: () =>
            throw Exception('Model not found for object ${object.id}'),
      );
      model.position.x = newPosition.dx;
      model.position.y = newPosition.dy;

      // After updating position, we need to recalculate the logical extent
      // and send a redraw command with the updated extent
      _updateLogicalExtentAndRedraw();
    }
  }

  /// Calculate the current logical extent based on all objects
  Rect _calculateCurrentLogicalExtent() {
    if (_storage.isEmpty) {
      // Default extent when no objects exist
      return Rect.fromCenter(
        center: Offset.zero,
        width: 512,
        height: 512,
      );
    }

    // Start with the first object's bounds
    Rect bounds = _storage.values.first.position.toRect().inflate(radius);

    // Expand to include all objects
    for (final model in _storage.values) {
      bounds = bounds.expandToInclude(
        model.position.toRect().inflate(radius),
      );
    }

    // Add padding around the bounds
    return bounds.inflate(50); // Increased padding for better visibility
  }

  /// Update logical extent and send redraw command
  void _updateLogicalExtentAndRedraw() {
    final newLogicalExtent = _calculateCurrentLogicalExtent();

    // Send redraw command with updated logical extent
    _commandController.add(DiagramCommand.redraw(
      renderables: objects, // Send all objects, not just visible ones
      logicalExtent: newLogicalExtent,
    ));
  }

  /// Send redraw command to DiagramViewer
  void _sendRedrawCommand(Rect currentViewport) {
    // Always send all objects and current logical extent
    // The DiagramViewer will handle visibility and culling
    _commandController.add(DiagramCommand.redraw(
      renderables: objects,
      logicalExtent: logicalExtent,
    ));
  }

  @override
  Stream<DiagramCommand> get commandStream => _commandController.stream;

  @override
  StreamSink<PhysicalEvent> get eventsSink => _eventController.sink;

  @override
  Rect get logicalExtent => _calculateCurrentLogicalExtent();

  @override
  DiagramConfiguration get configuration => DiagramConfiguration.defaults;

  @override
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
