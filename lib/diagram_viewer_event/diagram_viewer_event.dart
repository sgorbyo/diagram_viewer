import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vector_math/vector_math_64.dart';

import '../diagram_object_entity.dart';

part 'diagram_viewer_event.freezed.dart';

@freezed
class DiagramViewerEvent with _$DiagramViewerEvent {
  const factory DiagramViewerEvent.startDrag({
    required Vector4 coordinates,
  }) = _StartDrag;
  const factory DiagramViewerEvent.continueDrag({
    required Vector4 coordinates,
    required Vector4 delta,
  }) = _ContinueDrag;
  const factory DiagramViewerEvent.endDrag() = _EndDrag;
}