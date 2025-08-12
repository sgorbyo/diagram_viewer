import 'dart:async';
// removed: import 'dart:math';
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
  Offset? _dragOffsetFromCenter; // distanza mouse->centro al dragBegin
  bool _autoScrolling = false;

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
        if (event.hitList.isNotEmpty) {
          // Start object drag - store the object being dragged
          _draggedObject = event.hitList.first;
          // calcola offset relativo dal centro per evitare il "salto"
          _dragOffsetFromCenter =
              event.logicalPosition - _draggedObject!.center;
          _startObjectDrag(_draggedObject!);
        } else {
          // Background drag - let DiagramViewer handle pan
          _commandController.add(DiagramCommand.setTransform(
            transform: event.transformSnapshot,
          ));
        }
      },
      dragContinue: (event) {
        if (_draggedObject != null) {
          // Continue object drag - use the stored object regardless of hitList
          try {
            final targetCenter =
                event.logicalPosition - (_dragOffsetFromCenter ?? Offset.zero);
            _updateObjectPosition(_draggedObject!, targetCenter);
            sendRedrawCommand();
          } catch (_) {
            // Ignore model update errors for unknown test entities
          }

          // Edge autoscroll orchestration (basic): se vicino ai bordi, invia AutoScrollStep
          final bp = event.metadata['borderProximity'] as Map<String, dynamic>?;
          if (bp != null) {
            final bool isNearAny = (bp['isNearLeft'] == true) ||
                (bp['isNearRight'] == true) ||
                (bp['isNearTop'] == true) ||
                (bp['isNearBottom'] == true);
            if (isNearAny) {
              final double normalized =
                  (bp['normalizedDistance'] as double?) ?? 0.0; // 0..1
              final double intensity = (1.0 - normalized).clamp(0.0, 1.0);
              const double baseSpeed = 600.0; // px/s
              double vx = 0, vy = 0;
              // Directions: near left => move content right (+x), near right => move left (-x)
              if (bp['isNearLeft'] == true) vx += baseSpeed * intensity;
              if (bp['isNearRight'] == true) vx -= baseSpeed * intensity;
              // near top => move content down (+y), near bottom => move up (-y)
              if (bp['isNearTop'] == true) vy += baseSpeed * intensity;
              if (bp['isNearBottom'] == true) vy -= baseSpeed * intensity;
              _commandController.add(DiagramCommand.autoScrollStep(
                velocity: Offset(vx, vy),
              ));
              _autoScrolling = true;
            } else {
              if (_autoScrolling) {
                _commandController.add(const DiagramCommand.stopAutoScroll());
                _autoScrolling = false;
              }
            }
          }
        } else {
          // Background pan - calculate pan transform based on delta
          final currentTransform = event.transformSnapshot;
          final panDelta = event.delta;
          final newTransform = currentTransform.applyPan(panDelta);
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
          _dragOffsetFromCenter = null;
          sendRedrawCommand();
          if (_autoScrolling) {
            _commandController.add(const DiagramCommand.stopAutoScroll());
            _autoScrolling = false;
          }
        } else {
          // Background drag end - let DiagramViewer handle it
          _commandController.add(DiagramCommand.setTransform(
            transform: event.transformSnapshot,
          ));
        }
      },
      scroll: (event) {
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
      dragTargetEnter: (
        String eventId,
        Object dataPreview,
        Offset screenPosition,
        Offset logicalPosition,
        Transform2D transformSnapshot,
        Duration timestamp,
      ) {
        // Show ghost at pointer position
        _commandController.add(DiagramCommand.showDragOverlay(
          ghostSpec: dataPreview,
          position: screenPosition,
        ));
      },
      dragTargetOver: (
        String eventId,
        Object dataPreview,
        Offset screenPosition,
        Offset logicalPosition,
        Transform2D transformSnapshot,
        Duration timestamp,
      ) {
        // Update ghost position
        _commandController.add(DiagramCommand.updateDragOverlay(
          position: screenPosition,
        ));
      },
      dragTargetLeave: (
        String eventId,
        Transform2D transformSnapshot,
        Duration timestamp,
      ) {
        // Hide ghost when leaving
        _commandController.add(const DiagramCommand.hideDragOverlay());
      },
      dragTargetDrop: (
        String eventId,
        Object data,
        Offset screenPosition,
        Offset logicalPosition,
        Transform2D transformSnapshot,
        Duration timestamp,
      ) {
        // Hide ghost on drop
        _commandController.add(const DiagramCommand.hideDragOverlay());
        // Parse payload and create a new object into storage
        if (data is Map<String, dynamic> && data['type'] == 'circle') {
          final double radius = (data['radius'] as num?)?.toDouble() ?? 40.0;
          // Create a new model at logicalPosition
          final model = CerchioModel(center: logicalPosition, radius: radius);
          _storage[model.id] = model;
          _updateLogicalExtentAndRedraw();
        }
      },
      // Handle other events with default behavior
      doubleTap: (event) => _handleDoubleTap(event),
      longPress: (event) => _handleLongPress(event),
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
      // Create a new model instance with the same id to update the position
      final updatedModel = CerchioModel(
        center: newPosition,
        radius: model.radius,
        id: model.id, // Preserve the existing id
      );
      _storage[model.id] = updatedModel;
      // updated position

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
  DiagramConfiguration get configuration => const DiagramConfiguration(
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

  // _randomPopulate removed (unused)

  void _regularPopulate(int howMany) {
    int spacing = 150;
    // Generating evenly distributed circles
    for (int row = 0; row < 10; row++) {
      for (int col = 0; col < 10; col++) {
        double x = col * spacing.toDouble() + radius * 2;
        double y = row * spacing.toDouble() + radius * 2;
        CerchioModel model = CerchioModel(
          center: Offset(x, y),
          radius: radius,
        );
        _storage[model.id] = model;
        // generated circle
      }
    }
    // End generation
  }

  // Helper methods for drag operations
  void _startObjectDrag(DiagramObjectEntity object) {
    // Start of drag
  }

  void _endObjectDrag() {
    // End of drag
  }

  // Removed unused helper methods (_applyScroll, _startPinch, _applyPinch, _endPinch)

  // Helper methods for other events
  void _handleDoubleTap(DiagramDoubleTap event) {
    // Double tap
  }

  void _handleLongPress(DiagramLongPress event) {
    // Long press
  }

  @override
  void dispose() {
    _commandController.close();
    _eventController.close();
  }
}
