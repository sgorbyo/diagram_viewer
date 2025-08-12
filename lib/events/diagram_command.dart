import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:diagram_viewer/events/physical_event.dart';
import 'package:diagram_viewer/events/transform_2d.dart';
import 'package:diagram_viewer/interfaces/diagram_object_entity.dart';

part 'diagram_command.freezed.dart';

/// Commands sent from the Controller to the DiagramViewer.
///
/// This sealed class defines all the commands that the Controller can send
/// to the DiagramViewer to control its behavior and visualization. The
/// DiagramViewer listens to these commands and executes them accordingly.
///
/// ## Architecture
///
/// The Controller interprets PhysicalEvents and sends appropriate DiagramCommands
/// back to the DiagramViewer. This creates a clear separation of concerns:
/// - Controller: Business logic and event interpretation
/// - DiagramViewer: Rendering and command execution
///
/// ## Command Types
///
/// - [DiagramCommand.applyDefaultPanZoom]: Execute default pan/zoom behavior
/// - [DiagramCommand.setTransform]: Apply specific transformation
/// - [DiagramCommand.redraw]: Update visualization with new objects
/// - [DiagramCommand.elasticBounceBack]: Return to valid bounds with animation
/// - [DiagramCommand.autoScrollStep]: Execute incremental scroll
/// - [DiagramCommand.stopAutoScroll]: Stop ongoing auto-scroll
///
/// ## Example Usage
///
/// ```dart
/// // Send a command to apply default pan/zoom behavior
/// _commandController.add(DiagramCommand.applyDefaultPanZoom(origin: event));
///
/// // Send a command to update the diagram with new objects
/// _commandController.add(DiagramCommand.redraw(
///   renderables: updatedObjects,
///   logicalExtent: newExtent,
/// ));
///
/// // Send a command to set a specific transform
/// _commandController.add(DiagramCommand.setTransform(
///   transform: Transform2D(scale: 2.0, translation: Offset(10, 20)),
/// ));
/// ```
@freezed
class DiagramCommand with _$DiagramCommand {
  const DiagramCommand._();

  /// Execute default pan/zoom behavior for the given event.
  ///
  /// This command tells the DiagramViewer to apply its default behavior
  /// (pan, zoom, etc.) for the specified physical event. This is typically
  /// used when the Controller determines that no business logic should
  /// be applied to the event.
  ///
  /// [origin] - The physical event that triggered this command
  const factory DiagramCommand.applyDefaultPanZoom({
    required PhysicalEvent origin,
  }) = ApplyDefaultPanZoomCommand;

  /// Apply specific transformation matrix.
  ///
  /// This command tells the DiagramViewer to apply a specific transformation
  /// (scale, translation, rotation). This is typically used when the Controller
  /// wants precise control over the diagram's view.
  ///
  /// [transform] - The transformation to apply
  const factory DiagramCommand.setTransform({
    required Transform2D transform,
  }) = SetTransformCommand;

  /// Update visualization with new renderables and extent.
  ///
  /// This command tells the DiagramViewer to redraw the diagram with new
  /// objects and/or a new logical extent. This is typically used when the
  /// Controller has updated its model and wants to reflect those changes
  /// in the visualization.
  ///
  /// [renderables] - List of objects to render
  /// [logicalExtent] - New logical extent of the diagram
  const factory DiagramCommand.redraw({
    required List<DiagramObjectEntity> renderables,
    required Rect logicalExtent,
  }) = RedrawCommand;

  /// Return to valid bounds with animation.
  ///
  /// This command tells the DiagramViewer to animate back to valid bounds
  /// when the current transform would place the view outside the diagram's
  /// logical extent. This creates a smooth "bounce back" effect.
  ///
  /// [targetTransform] - The target transformation to animate to
  /// [duration] - Duration of the animation
  const factory DiagramCommand.elasticBounceBack({
    required Transform2D targetTransform,
    @Default(Duration(milliseconds: 300)) Duration duration,
  }) = ElasticBounceBackCommand;

  /// Execute incremental scroll with specified velocity.
  ///
  /// This command tells the DiagramViewer to perform an incremental scroll
  /// step, typically used for auto-scrolling when objects are dragged near
  /// the viewport edges.
  ///
  /// [velocity] - The scroll velocity (pixels per second)
  /// [stepDuration] - Duration of this scroll step
  const factory DiagramCommand.autoScrollStep({
    required Offset velocity,
    @Default(Duration(milliseconds: 16)) Duration stepDuration,
  }) = AutoScrollStepCommand;

  /// Stop any ongoing auto-scroll.
  ///
  /// This command tells the DiagramViewer to stop any ongoing auto-scroll
  /// operation. This is typically used when an object is no longer being
  /// dragged or when it moves away from the viewport edges.
  const factory DiagramCommand.stopAutoScroll() = StopAutoScrollCommand;

  // In-App Drag & Drop (Target) feedback commands (reserved names)
  // Placeholders intentionally omitted to avoid generating new union cases now.

  /// Returns true if this command is an ApplyDefaultPanZoom command.
  bool get isApplyDefaultPanZoom => this is ApplyDefaultPanZoomCommand;

  /// Returns true if this command is a SetTransform command.
  bool get isSetTransform => this is SetTransformCommand;

  /// Returns true if this command is a Redraw command.
  bool get isRedraw => this is RedrawCommand;

  /// Returns true if this command is an ElasticBounceBack command.
  bool get isElasticBounceBack => this is ElasticBounceBackCommand;

  /// Returns true if this command is an AutoScrollStep command.
  bool get isAutoScrollStep => this is AutoScrollStepCommand;

  /// Returns true if this command is a StopAutoScroll command.
  bool get isStopAutoScroll => this is StopAutoScrollCommand;

  /// Returns true if this command affects the transform.
  bool get affectsTransform =>
      isApplyDefaultPanZoom || isSetTransform || isElasticBounceBack;

  /// Returns true if this command affects the content.
  bool get affectsContent => isRedraw;

  /// Returns true if this command affects auto-scrolling.
  bool get affectsAutoScroll => isAutoScrollStep || isStopAutoScroll;

  /// Returns a description of this command for debugging.
  String get description => when(
        applyDefaultPanZoom: (origin) =>
            'ApplyDefaultPanZoom(${origin.runtimeType})',
        setTransform: (transform) =>
            'SetTransform(scale: ${transform.scale}, translation: ${transform.translation})',
        redraw: (renderables, logicalExtent) =>
            'Redraw(${renderables.length} objects, extent: $logicalExtent)',
        elasticBounceBack: (targetTransform, duration) =>
            'ElasticBounceBack(duration: $duration)',
        autoScrollStep: (velocity, stepDuration) =>
            'AutoScrollStep(velocity: $velocity, duration: $stepDuration)',
        stopAutoScroll: () => 'StopAutoScroll',
      );
}
