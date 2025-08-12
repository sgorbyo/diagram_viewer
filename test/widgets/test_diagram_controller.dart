import 'dart:async';
import 'package:flutter/material.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/events/events.dart';
// Removed unused import

/// Test diagram controller that implements the proper architecture
///
/// This controller receives DiagramEventUnion events and decides whether to use
/// default pan/zoom behavior or custom logic, following the Diagrammer-Controller pattern.
///
/// For testing pan limits, it always uses default behavior to ensure the
/// DiagramViewer's built-in pan limits are tested.
class TestDiagramController implements IDiagramController {
  final StreamController<DiagramCommand> _commandController =
      StreamController<DiagramCommand>.broadcast();
  final StreamController<DiagramEventUnion> _eventController =
      StreamController<DiagramEventUnion>.broadcast();

  /// Stream of commands sent to the Diagrammer
  @override
  Stream<DiagramCommand> get commandStream => _commandController.stream;

  /// List of objects in the diagram (empty for testing)
  @override
  List<DiagramObjectEntity> get objects => [];

  /// Current logical extent of the diagram
  @override
  Rect get logicalExtent => const Rect.fromLTWH(0, 0, 100, 100);

  /// Configuration for the diagram
  @override
  DiagramConfiguration get configuration => const DiagramConfiguration(
        minZoom: 0.1,
        maxZoom: 10.0,
        edgeThreshold: 50.0,
      );

  /// Sink for sending events to the controller
  @override
  Sink<DiagramEventUnion> get eventsSink => _eventController.sink;

  TestDiagramController() {
    _setupEventHandling();
  }

  void sendCommand(DiagramCommand command) {
    _commandController.add(command);
  }

  void _setupEventHandling() {
    _eventController.stream.listen(_handleDiagramEvent);
  }

  bool _isDraggingObject = false;

  /// Handle diagram events from the DiagramViewer
  ///
  /// This is where the controller decides between:
  /// - Model mutation (custom logic)
  /// - Default behavior (pan/zoom)
  void _handleDiagramEvent(DiagramEventUnion event) {
    // For testing pan limits, we simulate default pan/zoom behavior
    // by directly setting transforms based on the events

    event.when(
      tap: (event) {
        // No action needed for tap
      },
      dragBegin: (event) {
        _isDraggingObject = true;
      },
      dragContinue: (event) {
        // If dragging an object, do not pan the viewer
        if (!_isDraggingObject) {
          final currentTransform = event.transformSnapshot;
          final panDelta = event.delta;
          final newTransform = currentTransform.applyPan(panDelta);
          _commandController
              .add(DiagramCommand.setTransform(transform: newTransform));
        }
      },
      dragEnd: (event) {
        _isDraggingObject = false;
      },
      scroll: (event) {
        // Handle scroll with delta
        final currentTransform = event.transformSnapshot;
        final scrollDelta = event.scrollDelta;
        // Convert scrollDelta (double) to Offset for panning
        final panDelta = Offset(
          event.scrollDirection.dx * scrollDelta,
          event.scrollDirection.dy * scrollDelta,
        );
        final newTransform = currentTransform.applyPan(panDelta);

        _commandController
            .add(DiagramCommand.setTransform(transform: newTransform));
      },
      pinchBegin: (event) {
        // No action needed for begin
      },
      pinchContinue: (event) {
        // Handle zoom with scale
        final currentTransform = event.transformSnapshot;
        final scale = event.scale;
        final focalPoint = event.focalPoint;
        final newTransform = currentTransform.applyZoom(scale, focalPoint);

        _commandController
            .add(DiagramCommand.setTransform(transform: newTransform));
      },
      pinchEnd: (event) {
        // No action needed for end
      },
      dragTargetEnter: (
        String eventId,
        Object dataPreview,
        Offset screenPosition,
        Offset logicalPosition,
        Transform2D transformSnapshot,
        Duration timestamp,
      ) {},
      dragTargetOver: (
        String eventId,
        Object dataPreview,
        Offset screenPosition,
        Offset logicalPosition,
        Transform2D transformSnapshot,
        Duration timestamp,
      ) {},
      dragTargetLeave: (
        String eventId,
        Transform2D transformSnapshot,
        Duration timestamp,
      ) {},
      dragTargetDrop: (
        String eventId,
        Object data,
        Offset screenPosition,
        Offset logicalPosition,
        Transform2D transformSnapshot,
        Duration timestamp,
      ) {},
      doubleTap: (event) {
        // No action needed for double tap
      },
      longPress: (event) {
        // No action needed for long press
      },
    );
  }

  /// Dispose resources
  @override
  void dispose() {
    _commandController.close();
    _eventController.close();
  }

  /// Simulate a pan gesture directly for testing
  /// This bypasses the event system and directly applies a pan transform
  void handlePan(Offset delta) {
    // Create a mock drag event to simulate panning
    final mockDragEvent = DiagramEventUnion.dragContinue(
      DiagramDragContinue(
        eventId: 'test-pan-${DateTime.now().millisecondsSinceEpoch}',
        logicalPosition: Offset.zero,
        screenPosition: Offset.zero,
        transformSnapshot: const Transform2D(), // Start from identity transform
        hitList: [],
        timestamp: Duration.zero,
        metadata: {},
        delta: delta,
        totalDelta: delta,
        duration: Duration.zero,
        velocity: Offset.zero,
      ),
    );

    // Send the event through the normal event handling
    _eventController.add(mockDragEvent);
  }
}
