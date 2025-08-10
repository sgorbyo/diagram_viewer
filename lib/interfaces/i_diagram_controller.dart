import 'package:flutter/material.dart';
import 'package:diagram_viewer/events/physical_event.dart';
import 'package:diagram_viewer/events/diagram_event.dart';
import 'package:diagram_viewer/events/diagram_command.dart';
import 'package:diagram_viewer/interfaces/diagram_configuration.dart';
import 'package:diagram_viewer/interfaces/diagram_object_entity.dart';

/// Main interface that clients must implement to provide diagram business logic
/// to the DiagramViewer.
///
/// This interface defines the contract between the DiagramViewer (rendering engine)
/// and the client's business logic (Controller). The client is responsible for:
/// - Interpreting logical diagram events from the DiagramViewer
/// - Making business logic decisions
/// - Sending commands back to the DiagramViewer
/// - Managing the diagram's logical extent
/// - Providing configuration
///
/// ## Architecture
///
/// The DiagramViewer is completely agnostic to the type of diagram being displayed.
/// Different clients can implement this interface to create:
/// - ERD (Entity Relationship Diagrams)
/// - Genograms
/// - STD (State Transition Diagrams)
/// - Flowcharts
/// - Any other type of diagram
///
/// ## Implementation Guidelines
///
/// When implementing this interface:
///
/// 1. **Event Interpretation**: Receive DiagramEventUnion from DiagramViewer and
///    interpret them based on your business logic
/// 2. **Command Generation**: Send appropriate DiagramCommands back to DiagramViewer
///    based on your interpretation
/// 3. **Extent Management**: Calculate and provide the logical extent of your diagram
/// 4. **Configuration**: Provide appropriate configuration for your diagram type
/// 5. **Lifecycle**: Properly dispose of resources when the controller is no longer needed
///
/// ## Example Implementation
///
/// ```dart
/// class MyDiagramController implements IDiagramController {
///   final _commandController = StreamController<DiagramCommand>.broadcast();
///   final _eventSink = StreamController<DiagramEventUnion>();
///   final List<MyDiagramObject> _objects = [];
///
///   MyDiagramController() {
///     _eventSink.stream.listen(_handleDiagramEvent);
///   }
///
///   @override
///   Stream<DiagramCommand> get commandStream => _commandController.stream;
///
///   @override
///   Sink<DiagramEventUnion> get eventsSink => _eventSink;
///
///   @override
///   Rect get logicalExtent => _calculateExtent();
///
///   @override
///   DiagramConfiguration get configuration => DiagramConfiguration(
///     backgroundColor: Colors.white,
///     edgeThreshold: 50.0,
///     maxZoom: 10.0,
///   );
///
///   void _handleDiagramEvent(DiagramEventUnion event) {
///     event.when(
///       tap: (event) {
///         if (event.isOnObject) {
///           // Object selection
///           _selectObject(event.hitList.first);
///         } else {
///           // Background tap - deselect
///           _deselectAll();
///         }
///         _sendRedrawCommand();
///       },
///       dragBegin: (event) {
///         if (event.isOnObject) {
///           // Start object drag
///           _startObjectDrag(event.hitList.first);
///         }
///       },
///       dragContinue: (event) {
///         if (event.isOnObject) {
///           // Continue object drag
///           _updateObjectPosition(event.hitList.first, event.logicalPosition);
///         } else {
///           // Background pan
///           _applyPan(event.delta);
///         }
///         _sendRedrawCommand();
///       },
///       dragEnd: (event) {
///         if (event.isOnObject) {
///           // End object drag
///           _endObjectDrag();
///         }
///         _sendRedrawCommand();
///       },
///       scroll: (event) {
///         // Handle scroll with inertia
///         _applyScroll(event.scrollDelta, event.scrollVelocity);
///         _sendRedrawCommand();
///       },
///       pinchBegin: (event) {
///         // Start zoom/rotate
///         _startPinch(event.focalPoint);
///       },
///       pinchContinue: (event) {
///         // Continue zoom/rotate
///         _applyPinch(event.scale, event.rotation, event.focalPoint);
///         _sendRedrawCommand();
///       },
///       pinchEnd: (event) {
///         // End zoom/rotate
///         _endPinch();
///         _sendRedrawCommand();
///       },
///       // Handle other events...
///       doubleTap: (event) => _handleDoubleTap(event),
///       longPress: (event) => _handleLongPress(event),
///     );
///   }
///
///   void _sendRedrawCommand() {
///     _commandController.add(DiagramCommand.redraw(
///       renderables: _objects,
///       logicalExtent: logicalExtent,
///     ));
///   }
///
///   @override
///   void dispose() {
///     _commandController.close();
///     _eventSink.close();
///   }
/// }
/// ```
abstract class IDiagramController {
  /// Stream of commands from the Controller to the DiagramViewer.
  ///
  /// The DiagramViewer listens to this stream and executes the commands
  /// to update its rendering state. Commands include:
  /// - ApplyDefaultPanZoom: Execute default pan/zoom behavior
  /// - SetTransform: Apply specific transformation
  /// - Redraw: Update visualization with new objects
  /// - ElasticBounceBack: Return to valid bounds with animation
  /// - AutoScrollStep: Execute incremental scroll
  /// - StopAutoScroll: Stop ongoing auto-scroll
  Stream<DiagramCommand> get commandStream;

  /// Sink for logical diagram events from the DiagramViewer to the Controller.
  ///
  /// The DiagramViewer sends translated logical events through this sink.
  /// Each event contains:
  /// - Logical coordinates (converted from screen coordinates)
  /// - Transform snapshot at the time of the event
  /// - Hit-test results (list of objects at the event location)
  /// - Event-specific data (velocity, duration, etc.)
  /// - Event type (tap, drag, pinch, scroll, etc.)
  Sink<DiagramEventUnion> get eventsSink;

  /// The logical extent of the diagram in diagram coordinates.
  ///
  /// This rectangle defines the total bounds of all diagram content.
  /// The DiagramViewer uses this to:
  /// - Calculate minimum zoom level
  /// - Constrain panning operations
  /// - Determine auto-scroll boundaries
  /// - Optimize rendering
  ///
  /// The client is responsible for calculating and updating this extent
  /// whenever the diagram content changes.
  Rect get logicalExtent;

  /// Configuration for the diagram.
  ///
  /// This provides the DiagramViewer with settings for:
  /// - Visual appearance (background color, etc.)
  /// - Interaction behavior (edge thresholds, zoom limits, etc.)
  /// - Animation parameters (bounce duration, auto-scroll intervals, etc.)
  ///
  /// The client can customize these settings based on the diagram type
  /// and user preferences.
  DiagramConfiguration get configuration;

  /// List of diagram objects to be rendered.
  ///
  /// The DiagramViewer uses this list to render the diagram content.
  /// The client is responsible for providing and updating this list
  /// based on the current state of the diagram.
  List<DiagramObjectEntity> get objects;

  /// Dispose of the controller and release all resources.
  ///
  /// This method should:
  /// 1. Close all streams and sinks
  /// 2. Cancel any ongoing operations
  /// 3. Release any held resources
  /// 4. Clean up any subscriptions
  ///
  /// The DiagramViewer will call this method when it is disposed.
  void dispose();
}
