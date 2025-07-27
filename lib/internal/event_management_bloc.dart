import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:diagram_viewer/events/events.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';

part 'event_management_bloc.freezed.dart';

/// Internal BLoC for managing event priorities and interaction states
/// This handles the complexity of deciding which events go where
class EventManagementBloc
    extends Bloc<EventManagementEvent, EventManagementState> {
  final IDiagramController _controller;

  EventManagementBloc(this._controller)
      : super(const EventManagementState.idle()) {
    on<EventManagementEvent>(_onEvent);
  }

  Future<void> _onEvent(
    EventManagementEvent event,
    Emitter<EventManagementState> emit,
  ) async {
    await event.when(
      // Handle incoming physical events
      physicalEventReceived: (physicalEvent) async {
        final currentState = state;

        await currentState.when(
          idle: () async {
            // No active interaction, delegate to controller
            _controller.eventsSink.add(physicalEvent);
          },
          panning: (interactionId) async {
            if (physicalEvent.eventId == interactionId) {
              // Continue panning interaction
              emit(EventManagementState.panning(interactionId));
              // Handle pan directly in DiagramViewer
              add(EventManagementEvent.handleDefaultPanZoom(physicalEvent));
            } else {
              // Different event, delegate to controller
              _controller.eventsSink.add(physicalEvent);
            }
          },
          zooming: (interactionId) async {
            if (physicalEvent.eventId == interactionId) {
              // Continue zooming interaction
              emit(EventManagementState.zooming(interactionId));
              // Handle zoom directly in DiagramViewer
              add(EventManagementEvent.handleDefaultPanZoom(physicalEvent));
            } else {
              // Different event, delegate to controller
              _controller.eventsSink.add(physicalEvent);
            }
          },
          objectDragging: (interactionId, objectId) async {
            if (physicalEvent.eventId == interactionId) {
              // Continue object dragging
              emit(
                  EventManagementState.objectDragging(interactionId, objectId));
              // Delegate to controller for object manipulation
              _controller.eventsSink.add(physicalEvent);
            } else {
              // Different event, delegate to controller
              _controller.eventsSink.add(physicalEvent);
            }
          },
        );
      },

      // Handle default pan/zoom behavior
      handleDefaultPanZoom: (physicalEvent) async {
        // Emit an event to notify the DiagramViewer to handle this
        // The DiagramViewer will listen to this and call _handleDefaultPanZoom
      },

      // Handle interaction start
      interactionStarted: (interactionType, eventId, objectId) async {
        switch (interactionType) {
          case InteractionType.pan:
            emit(EventManagementState.panning(eventId));
            break;
          case InteractionType.zoom:
            emit(EventManagementState.zooming(eventId));
            break;
          case InteractionType.objectDrag:
            if (objectId != null) {
              emit(EventManagementState.objectDragging(eventId, objectId));
            }
            break;
        }
      },

      // Handle interaction end
      interactionEnded: (eventId) async {
        final currentState = state;
        await currentState.when(
          idle: () async {
            // Already idle, do nothing
          },
          panning: (interactionId) async {
            if (eventId == interactionId) {
              emit(const EventManagementState.idle());
            }
          },
          zooming: (interactionId) async {
            if (eventId == interactionId) {
              emit(const EventManagementState.idle());
            }
          },
          objectDragging: (interactionId, objectId) async {
            if (eventId == interactionId) {
              emit(const EventManagementState.idle());
            }
          },
        );
      },

      // Handle controller commands
      controllerCommandReceived: (command) async {
        // Forward commands to DiagramViewer
        // This will be handled by the DiagramViewer
      },
    );
  }
}

/// Events for the EventManagementBloc
@freezed
class EventManagementEvent with _$EventManagementEvent {
  const factory EventManagementEvent.physicalEventReceived(
      PhysicalEvent event) = _PhysicalEventReceived;
  const factory EventManagementEvent.handleDefaultPanZoom(PhysicalEvent event) =
      _HandleDefaultPanZoom;
  const factory EventManagementEvent.interactionStarted(
          InteractionType type, String eventId, [String? objectId]) =
      _InteractionStarted;
  const factory EventManagementEvent.interactionEnded(String eventId) =
      _InteractionEnded;
  const factory EventManagementEvent.controllerCommandReceived(
      DiagramCommand command) = _ControllerCommandReceived;
}

/// States for the EventManagementBloc
@freezed
class EventManagementState with _$EventManagementState {
  const factory EventManagementState.idle() = _Idle;
  const factory EventManagementState.panning(String interactionId) = _Panning;
  const factory EventManagementState.zooming(String interactionId) = _Zooming;
  const factory EventManagementState.objectDragging(
      String interactionId, String objectId) = _ObjectDragging;
}

/// Types of interactions
enum InteractionType {
  pan,
  zoom,
  objectDrag,
}
