/// Export file for all DiagramViewer events and commands.
///
/// This file exports all the event and command classes used by the
/// DiagramViewer package. Import this file to get access to all
/// events and commands in one place.
///
/// ## Usage
///
/// ```dart
/// import 'package:diagram_viewer/events/events.dart';
///
/// // Use PhysicalEvent for event handling
/// void handleEvent(PhysicalEvent event) {
///   // Handle the event...
/// }
///
/// // Use DiagramCommand for sending commands
/// void sendCommand(DiagramCommand command) {
///   // Send the command...
/// }
///
/// // Use Transform2D for transformations
/// final transform = Transform2D(scale: 2.0, translation: Offset(10, 20));
///
/// // Use BorderProximity for edge detection
/// final proximity = BorderProximity(isNearLeft: true, distanceFromEdge: 25.0);
/// ```

export 'physical_event.dart';
export 'diagram_command.dart';
export 'transform_2d.dart';
export 'border_proximity.dart';
