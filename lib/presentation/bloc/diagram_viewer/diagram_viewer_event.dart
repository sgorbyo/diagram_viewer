part of 'diagram_viewer_bloc.dart';

@freezed
class DiagramViewerEvent with _$DiagramViewerEvent {
  const factory DiagramViewerEvent.contentChanged(
    List<DiagramObjectEntity> content,
  ) = _ContentChanged;

  const factory DiagramViewerEvent.viewportChanged({
    required Size size,
  }) = _ViewportChanged;

  const factory DiagramViewerEvent.animationEnded() = _AnimationEnded;

  const factory DiagramViewerEvent.panStarted() = _PanStarted;
  const factory DiagramViewerEvent.panUpdated(Offset delta) = _PanUpdated;
  const factory DiagramViewerEvent.panEnded() = _PanEnded;

  const factory DiagramViewerEvent.scaleStarted() = _ScaleStarted;
  const factory DiagramViewerEvent.scaleUpdated(
      double scale, Offset focalPoint, Offset focalPointDelta) = _ScaleUpdated;
  const factory DiagramViewerEvent.scaleEnded() = _ScaleEnded;
}
