import 'dart:async';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/events/events.dart';
import '../cerchio_entity.dart';
import '../cerchio_model.dart';

/// Example implementation of IDiagramController for the example app.
///
/// This controller demonstrates how to implement the IDiagramController interface
/// to provide business logic for the DiagramViewer.
class ExampleDiagramController implements IDiagramController {
  final Map<String, CerchioModel> _storage = {};
  static const width = 1024;
  static const height = 768;
  static const radius = 50.0;
  DiagramObjectEntity? _draggedObject;

  final StreamController<DiagramCommand> _commandController =
      StreamController<DiagramCommand>.broadcast();
  final StreamController<DiagramEventUnion> _eventController =
      StreamController<DiagramEventUnion>.broadcast();

  ExampleDiagramController() {
    // _randomPopulate(50);
    _regularPopulate(50);
    _setupEventHandling();

    // Send initial redraw command with calculated logical extent
    // This ensures the DiagramViewer knows about all objects and the correct diagram area
    _updateLogicalExtentAndRedraw();
  }

  void _setupEventHandling() {
    _eventController.stream.listen(_handleDiagramEvent);
  }

  void _handleDiagramEvent(DiagramEventUnion event) {
    print('ExampleDiagramController: Received event: ${event.runtimeType}');
    event.when(
      tap: (event) {
        if (event.hitList.isNotEmpty) {
          // Business logic: sposta oggetto
          _updateObjectPosition(event.hitList.first, event.logicalPosition);
          sendRedrawCommand();
        } else {
          // Background tap - do nothing
        }
      },
      dragBegin: (event) {
        print(
            'ExampleDiagramController: dragBegin - hitList.length=${event.hitList.length}');
        if (event.hitList.isNotEmpty) {
          // Start object drag - store the object being dragged
          _draggedObject = event.hitList.first;
          print(
              'ExampleDiagramController: dragBegin - stored _draggedObject=${_draggedObject?.id}');
          _startObjectDrag(_draggedObject!);
        } else {
          // Background drag - let DiagramViewer handle pan
          _commandController.add(DiagramCommand.setTransform(
            transform: event.transformSnapshot,
          ));
        }
      },
      dragContinue: (event) {
        print(
            'ExampleDiagramController: dragContinue - _draggedObject=${_draggedObject?.id}, hitList.length=${event.hitList.length}');
        if (_draggedObject != null) {
          // Continue object drag - use the stored object regardless of hitList
          print(
              'ExampleDiagramController: dragContinue - updating object position');
          _updateObjectPosition(_draggedObject!, event.logicalPosition);
          sendRedrawCommand();
        } else {
          // Background pan - calculate pan transform based on delta
          final currentTransform = event.transformSnapshot;
          final panDelta = event.delta;
          final newTransform = currentTransform.applyPan(panDelta);

          print(
              'ExampleDiagramController: dragContinue - no dragged object, sending setTransform with pan');
          _commandController.add(DiagramCommand.setTransform(
            transform: newTransform,
          ));
        }
      },
      dragEnd: (event) {
        if (_draggedObject != null) {
          // End object drag
          _endObjectDrag();
          _draggedObject = null;
          sendRedrawCommand();
        } else {
          // Background drag end - let DiagramViewer handle it
          _commandController.add(DiagramCommand.setTransform(
            transform: event.transformSnapshot,
          ));
        }
      },
      scroll: (event) {
        print(
            'ExampleDiagramController: Received scroll event - delta: ${event.scrollDelta}, direction: ${event.scrollDirection}, velocity: ${event.scrollVelocity}');

        // Check if this is a keyboard event
        final isKeyboardEvent = event.metadata['source'] == 'keyboard';

        if (isKeyboardEvent) {
          // Handle keyboard navigation
          final pressedKeys = event.metadata['pressedKeys'] as List<String>?;
          if (pressedKeys != null) {
            _handleKeyboardNavigation(pressedKeys, event.transformSnapshot);
          }
        } else {
          // Handle normal scroll - calculate pan based on scroll delta and direction
          final currentTransform = event.transformSnapshot;
          final scrollDelta = Offset(
            event.scrollDirection.dx * event.scrollDelta,
            event.scrollDirection.dy * event.scrollDelta,
          );
          final newTransform = currentTransform.applyPan(scrollDelta);

          print(
              'ExampleDiagramController: scroll - delta=${event.scrollDelta}, direction=${event.scrollDirection}, velocity=${event.scrollVelocity}');
          _commandController.add(DiagramCommand.setTransform(
            transform: newTransform,
          ));
        }
      },
      pinchBegin: (event) {
        // Start zoom/rotate - let DiagramViewer handle
        _commandController.add(DiagramCommand.setTransform(
          transform: event.transformSnapshot,
        ));
      },
      pinchContinue: (event) {
        // Continue zoom/rotate - let DiagramViewer handle
        _commandController.add(DiagramCommand.setTransform(
          transform: event.transformSnapshot,
        ));
      },
      pinchEnd: (event) {
        // End zoom/rotate - let DiagramViewer handle with bounce back if needed
        _commandController.add(DiagramCommand.setTransform(
          transform: event.transformSnapshot,
        ));
      },
      // Handle other events with default behavior
      doubleTap: (event) => _handleDoubleTap(event),
      longPress: (event) => _handleLongPress(event),
    );
  }

  /// Update object position in the model.
  void _updateObjectPosition(DiagramObjectEntity object, Offset newPosition) {
    print(
        '_updateObjectPosition: object=${object.id}, newPosition=$newPosition');
    if (object is CerchioEntity) {
      final model = _storage.values.firstWhere(
        (model) => model.id == object.id,
        orElse: () =>
            throw Exception('Model not found for object ${object.id}'),
      );
      final oldPosition = model.center;
      // Create a new model instance with the same id to update the position
      final updatedModel = CerchioModel(
        center: newPosition,
        radius: model.radius,
        id: model.id, // Preserve the existing id
      );
      _storage[model.id] = updatedModel;
      print('_updateObjectPosition: updated from $oldPosition to $newPosition');

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
    Rect bounds = Rect.fromCircle(
      center: _storage.values.first.center,
      radius: radius,
    ).inflate(radius);

    // Expand to include all objects
    for (final model in _storage.values) {
      bounds = bounds.expandToInclude(
        Rect.fromCircle(
          center: model.center,
          radius: radius,
        ).inflate(radius),
      );
    }

    // Add padding around the bounds
    bounds = bounds.inflate(50); // Increased padding for better visibility

    // Enforce minimum size as per specs (512x512)
    const double minSide = 512.0;
    final double finalWidth = bounds.width < minSide ? minSide : bounds.width;
    final double finalHeight =
        bounds.height < minSide ? minSide : bounds.height;
    if (finalWidth != bounds.width || finalHeight != bounds.height) {
      bounds = Rect.fromCenter(
        center: bounds.center,
        width: finalWidth,
        height: finalHeight,
      );
    }

    return bounds;
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
  void sendRedrawCommand() {
    print('sendRedrawCommand: sending ${objects.length} objects');
    // Always send all objects and current logical extent
    // The DiagramViewer will handle visibility and culling
    _commandController.add(DiagramCommand.redraw(
      renderables: objects,
      logicalExtent: logicalExtent,
    ));
  }

  /// Handle keyboard navigation events
  void _handleKeyboardNavigation(
      List<String> pressedKeys, Transform2D currentTransform) {
    print(
        'ExampleDiagramController: _handleKeyboardNavigation - pressedKeys: $pressedKeys');

    // Calculate scroll delta and direction based on pressed keys
    double scrollDelta = 0.0;
    Offset scrollDirection = Offset.zero;

    for (final key in pressedKeys) {
      switch (key) {
        case 'Arrow Up':
          scrollDelta = 50.0;
          scrollDirection =
              const Offset(0, 1); // View moves down, content moves up
          break;
        case 'Arrow Down':
          scrollDelta = 50.0;
          scrollDirection =
              const Offset(0, -1); // View moves up, content moves down
          break;
        case 'Arrow Left':
          scrollDelta = 50.0;
          scrollDirection =
              const Offset(1, 0); // View moves right, content moves left
          break;
        case 'Arrow Right':
          scrollDelta = 50.0;
          scrollDirection =
              const Offset(-1, 0); // View moves left, content moves right
          break;
        case 'Page Up':
          scrollDelta = 200.0;
          scrollDirection =
              const Offset(0, 1); // View moves down, content moves up
          break;
        case 'Page Down':
          scrollDelta = 200.0;
          scrollDirection =
              const Offset(0, -1); // View moves up, content moves down
          break;
        case 'Home':
          scrollDelta = 200.0;
          scrollDirection =
              const Offset(0, 1); // View moves down, content moves up
          break;
        case 'End':
          scrollDelta = 200.0;
          scrollDirection =
              const Offset(0, -1); // View moves up, content moves down
          break;
      }
    }

    if (scrollDelta > 0.0) {
      // Calculate pan based on keyboard input
      final panDelta = Offset(
        scrollDirection.dx * scrollDelta,
        scrollDirection.dy * scrollDelta,
      );
      final newTransform = currentTransform.applyPan(panDelta);

      print(
          'ExampleDiagramController: keyboard navigation - delta: $scrollDelta, direction: $scrollDirection');
      _commandController.add(DiagramCommand.setTransform(
        transform: newTransform,
      ));
    }
  }

  @override
  Stream<DiagramCommand> get commandStream => _commandController.stream;

  @override
  StreamSink<DiagramEventUnion> get eventsSink => _eventController.sink;

  @override
  Rect get logicalExtent => _calculateCurrentLogicalExtent();

  @override
  DiagramConfiguration get configuration => DiagramConfiguration(
        maxZoom: 4.0, // Zoom massimo 4x
        minZoom: 0.01, // Zoom minimo 1%
      );

  @override
  List<DiagramObjectEntity> get objects {
    final List<DiagramObjectEntity> result = [];
    for (final model in _storage.values) {
      final entity = CerchioEntity(
        center: model.center,
        radius: model.radius,
        id: model.id,
      );
      result.add(entity);
    }
    return result;
  }

  void _randomPopulate(int howMany) {
    Random random = Random();
    print('=== GENERATING $howMany RANDOM CIRCLES ===');
    for (int j = howMany; j > 0; j--) {
      final x = radius + (width - 2 * radius) * random.nextDouble();
      final y = radius + (height - 2 * radius) * random.nextDouble();
      CerchioModel model = CerchioModel(
        center: Offset(x, y),
        radius: radius,
      );
      _storage[model.id] = model;
      print(
          'Circle ${j.toString().padLeft(2)}: center=(${x.toStringAsFixed(1)}, ${y.toStringAsFixed(1)}), id=${model.id}');
    }
    print('=== END GENERATION ===');
  }

  void _regularPopulate(int howMany) {
    Random random = Random();
    int spacing = 150;
    int rowLength = 10;
    print('=== GENERATING $howMany EVENLY DISTRIBUTED CIRCLES ===');
    for (int row = 0; row < 10; row++) {
      for (int col = 0; col < 10; col++) {
        double x = col * spacing.toDouble() + radius * 2;
        double y = row * spacing.toDouble() + radius * 2;
        CerchioModel model = CerchioModel(
          center: Offset(x, y),
          radius: radius,
        );
        _storage[model.id] = model;
        print(
            'Circle ${(row * 10 + col + 1).toString().padLeft(2)}: center=(${x.toStringAsFixed(1)}, ${y.toStringAsFixed(1)}), id=${model.id}');
      }
    }
    print('=== END GENERATION ===');
  }

  // Helper methods for drag operations
  void _startObjectDrag(DiagramObjectEntity object) {
    // For now, just log the start of drag
    print('Started dragging object: ${object.id}');
  }

  void _endObjectDrag() {
    // For now, just log the end of drag
    print('Ended dragging');
  }

  // Helper methods for scroll operations
  void _applyScroll(double scrollDelta, double scrollVelocity) {
    // For now, just log the scroll
    print('Scroll: delta=$scrollDelta, velocity=$scrollVelocity');
  }

  // Helper methods for pinch operations
  void _startPinch(Offset focalPoint) {
    // For now, just log the start of pinch
    print('Started pinch at: $focalPoint');
  }

  void _applyPinch(double scale, double rotation, Offset focalPoint) {
    // For now, just log the pinch
    print('Pinch: scale=$scale, rotation=$rotation, focalPoint=$focalPoint');
  }

  void _endPinch() {
    // For now, just log the end of pinch
    print('Ended pinch');
  }

  // Helper methods for other events
  void _handleDoubleTap(DiagramDoubleTap event) {
    // For now, just log the double tap
    print('Double tap at: ${event.logicalPosition}');
  }

  void _handleLongPress(DiagramLongPress event) {
    // For now, just log the long press
    print('Long press at: ${event.logicalPosition}');
  }

  @override
  void dispose() {
    _commandController.close();
    _eventController.close();
  }
}
