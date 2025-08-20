import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/events/transform_2d.dart';
import 'package:diagram_viewer/events/mouse_button.dart';

part 'diagram_event.freezed.dart';

/// Base data for all diagram events
class DiagramEventData {
  final String eventId;
  final Offset logicalPosition;
  final Offset screenPosition;
  final Transform2D transformSnapshot;
  final List<DiagramObjectEntity> hitList;
  final Duration timestamp;
  final Map<String, dynamic> metadata;

  const DiagramEventData({
    required this.eventId,
    required this.logicalPosition,
    required this.screenPosition,
    required this.transformSnapshot,
    required this.hitList,
    required this.timestamp,
    required this.metadata,
  });
}

/// Puntual events (no phases)
@freezed
class DiagramTap with _$DiagramTap {
  const factory DiagramTap({
    required String eventId,
    required Offset logicalPosition,
    required Offset screenPosition,
    required Transform2D transformSnapshot,
    required List<DiagramObjectEntity> hitList,
    required Duration timestamp,
    required Map<String, dynamic> metadata,
    required int fingerCount,
    required MouseButton? mouseButton,
    required bool isOnObject,
    required Duration pressDuration,
    required Offset velocity,
  }) = _DiagramTap;
}

@freezed
class DiagramDoubleTap with _$DiagramDoubleTap {
  const factory DiagramDoubleTap({
    required String eventId,
    required Offset logicalPosition,
    required Offset screenPosition,
    required Transform2D transformSnapshot,
    required List<DiagramObjectEntity> hitList,
    required Duration timestamp,
    required Map<String, dynamic> metadata,
    required int fingerCount,
    required MouseButton? mouseButton,
    required bool isOnObject,
    required Duration intervalBetweenTaps,
  }) = _DiagramDoubleTap;
}

@freezed
class DiagramLongPress with _$DiagramLongPress {
  const factory DiagramLongPress({
    required String eventId,
    required Offset logicalPosition,
    required Offset screenPosition,
    required Transform2D transformSnapshot,
    required List<DiagramObjectEntity> hitList,
    required Duration timestamp,
    required Map<String, dynamic> metadata,
    required int fingerCount,
    required MouseButton? mouseButton,
    required bool isOnObject,
    required Duration pressDuration,
  }) = _DiagramLongPress;
}

@freezed
class DiagramScroll with _$DiagramScroll {
  const factory DiagramScroll({
    required String eventId,
    required Offset logicalPosition,
    required Offset screenPosition,
    required Transform2D transformSnapshot,
    required List<DiagramObjectEntity> hitList,
    required Duration timestamp,
    required Map<String, dynamic> metadata,
    required double scrollDelta,
    required double scrollVelocity,
    required Duration scrollDuration,
    required Offset scrollDirection,
    required bool isInertial,
    required int scrollCount,
    double? suggestedInertiaDuration,
    double? suggestedInertiaDecay,
  }) = _DiagramScroll;
}

/// Events with phases (Begin/Continue/End)
@freezed
class DiagramDragBegin with _$DiagramDragBegin {
  const factory DiagramDragBegin({
    required String eventId,
    required Offset logicalPosition,
    required Offset screenPosition,
    required Transform2D transformSnapshot,
    required List<DiagramObjectEntity> hitList,
    required Duration timestamp,
    required Map<String, dynamic> metadata,
    required int fingerCount,
    required MouseButton? mouseButton,
    required bool isOnObject,
  }) = _DiagramDragBegin;
}

@freezed
class DiagramDragContinue with _$DiagramDragContinue {
  const factory DiagramDragContinue({
    required String eventId,
    required Offset logicalPosition,
    required Offset screenPosition,
    required Transform2D transformSnapshot,
    required List<DiagramObjectEntity> hitList,
    required Duration timestamp,
    required Map<String, dynamic> metadata,
    required Offset delta,
    required Offset totalDelta,
    required Duration duration,
    required Offset velocity,
    Offset? snappedLogicalPosition,
  }) = _DiagramDragContinue;
}

@freezed
class DiagramDragEnd with _$DiagramDragEnd {
  const factory DiagramDragEnd({
    required String eventId,
    required Offset logicalPosition,
    required Offset screenPosition,
    required Transform2D transformSnapshot,
    required List<DiagramObjectEntity> hitList,
    required Duration timestamp,
    required Map<String, dynamic> metadata,
    required Offset totalDelta,
    required Duration totalDuration,
    required Offset finalVelocity,
    required bool wasCancelled,
    Offset? snappedLogicalPosition,
  }) = _DiagramDragEnd;
}

@freezed
class DiagramPinchBegin with _$DiagramPinchBegin {
  const factory DiagramPinchBegin({
    required String eventId,
    required Offset logicalPosition,
    required Offset screenPosition,
    required Transform2D transformSnapshot,
    required List<DiagramObjectEntity> hitList,
    required Duration timestamp,
    required Map<String, dynamic> metadata,
    required int fingerCount,
    required Offset focalPoint,
  }) = _DiagramPinchBegin;
}

@freezed
class DiagramPinchContinue with _$DiagramPinchContinue {
  const factory DiagramPinchContinue({
    required String eventId,
    required Offset logicalPosition,
    required Offset screenPosition,
    required Transform2D transformSnapshot,
    required List<DiagramObjectEntity> hitList,
    required Duration timestamp,
    required Map<String, dynamic> metadata,
    required double scale,
    required double rotation,
    required Offset focalPoint,
    required Duration duration,
  }) = _DiagramPinchContinue;
}

@freezed
class DiagramPinchEnd with _$DiagramPinchEnd {
  const factory DiagramPinchEnd({
    required String eventId,
    required Offset logicalPosition,
    required Offset screenPosition,
    required Transform2D transformSnapshot,
    required List<DiagramObjectEntity> hitList,
    required Duration timestamp,
    required Map<String, dynamic> metadata,
    required double finalScale,
    required double finalRotation,
    required Duration totalDuration,
    required bool wasCancelled,
  }) = _DiagramPinchEnd;
}

/// Union type for all diagram events
@freezed
class DiagramEventUnion with _$DiagramEventUnion {
  const factory DiagramEventUnion.tap(DiagramTap event) = _Tap;
  const factory DiagramEventUnion.doubleTap(DiagramDoubleTap event) =
      _DoubleTap;
  const factory DiagramEventUnion.longPress(DiagramLongPress event) =
      _LongPress;
  const factory DiagramEventUnion.scroll(DiagramScroll event) = _Scroll;
  const factory DiagramEventUnion.dragBegin(DiagramDragBegin event) =
      _DragBegin;
  const factory DiagramEventUnion.dragContinue(DiagramDragContinue event) =
      _DragContinue;
  const factory DiagramEventUnion.dragEnd(DiagramDragEnd event) = _DragEnd;
  const factory DiagramEventUnion.pinchBegin(DiagramPinchBegin event) =
      _PinchBegin;
  const factory DiagramEventUnion.pinchContinue(DiagramPinchContinue event) =
      _PinchContinue;
  const factory DiagramEventUnion.pinchEnd(DiagramPinchEnd event) = _PinchEnd;

  // Selection area (rectangular lasso) events
  const factory DiagramEventUnion.selectionAreaStart({
    required String eventId,
    required Rect logicalRect,
    required Transform2D transformSnapshot,
    required Duration timestamp,
    required List<String> coveredObjectIds,
  }) = _SelectionAreaStart;

  const factory DiagramEventUnion.selectionAreaUpdate({
    required String eventId,
    required Rect logicalRect,
    required Transform2D transformSnapshot,
    required Duration timestamp,
    required List<String> coveredObjectIds,
  }) = _SelectionAreaUpdate;

  const factory DiagramEventUnion.selectionAreaEnd({
    required String eventId,
    required Rect logicalRect,
    required Transform2D transformSnapshot,
    required Duration timestamp,
    required List<String> coveredObjectIds,
  }) = _SelectionAreaEnd;

  // In‑App Drag & Drop (Target) events
  const factory DiagramEventUnion.dragTargetEnter({
    required String eventId,
    required Object dataPreview,
    required Offset screenPosition,
    required Offset logicalPosition,
    required Transform2D transformSnapshot,
    required Duration timestamp,
  }) = _DragTargetEnter;

  const factory DiagramEventUnion.dragTargetOver({
    required String eventId,
    required Object dataPreview,
    required Offset screenPosition,
    required Offset logicalPosition,
    required Transform2D transformSnapshot,
    required Duration timestamp,
    Offset? snappedLogicalPosition,
  }) = _DragTargetOver;

  const factory DiagramEventUnion.dragTargetLeave({
    required String eventId,
    required Transform2D transformSnapshot,
    required Duration timestamp,
  }) = _DragTargetLeave;

  const factory DiagramEventUnion.dragTargetDrop({
    required String eventId,
    required Object data,
    required Offset screenPosition,
    required Offset logicalPosition,
    required Transform2D transformSnapshot,
    required Duration timestamp,
    Offset? snappedLogicalPosition,
  }) = _DragTargetDrop;
}
