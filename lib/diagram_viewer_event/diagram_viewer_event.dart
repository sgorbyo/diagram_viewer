import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vector_math/vector_math_64.dart';

part 'diagram_viewer_event.freezed.dart';

@freezed
class DiagramViewerEvent with _$DiagramViewerEvent {
  const factory DiagramViewerEvent.startDrag({
    required Vector4 coordinates,
    required Map<String, dynamic> piggyback,
  }) = _StartDrag;
  const factory DiagramViewerEvent.continueDrag({
    required Vector4 coordinates,
    required Vector4 delta,
    required Map<String, dynamic>? piggyback,
  }) = _ContinueDrag;
  const factory DiagramViewerEvent.endDrag() = _EndDrag;
  const factory DiagramViewerEvent.doubleTap({
    required Vector4 coordinates,
    required Map<String, dynamic>? piggyback,
  }) = _DoubleTap;
}
