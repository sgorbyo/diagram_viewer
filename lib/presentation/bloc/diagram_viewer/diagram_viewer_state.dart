part of 'diagram_viewer_bloc.dart';

@freezed
class DiagramViewerState with _$DiagramViewerState {
  factory DiagramViewerState.initial({
    required Matrix4 matrix,
    @Default(Size.zero) Size viewportSize,
    @Default(Rect.zero) Rect diagramRect,
    @Default([]) List<DiagramObjectEntity> content,
    @Default([]) List<DiagramObjectEntity> selectedObjects,
  }) = _Initial;

  const factory DiagramViewerState.loading({
    required Matrix4 matrix,
    required Size viewportSize,
    required Rect diagramRect,
    required List<DiagramObjectEntity> content,
    required List<DiagramObjectEntity> selectedObjects,
  }) = _Loading;

  const factory DiagramViewerState.animatingToIdle({
    required Matrix4 matrix,
    required Matrix4 oldMatrix,
    required Size viewportSize,
    required Rect diagramRect,
    required List<DiagramObjectEntity> content,
    required List<DiagramObjectEntity> selectedObjects,
  }) = _AnimatingToIdle;

  const factory DiagramViewerState.idle({
    required Matrix4 matrix,
    required Size viewportSize,
    required Rect diagramRect,
    required List<DiagramObjectEntity> content,
    required List<DiagramObjectEntity> selectedObjects,
  }) = _Idle;

  const factory DiagramViewerState.panning({
    required Matrix4 matrix,
    required Size viewportSize,
    required Rect diagramRect,
    required List<DiagramObjectEntity> content,
    required List<DiagramObjectEntity> selectedObjects,
  }) = _Panning;

  const factory DiagramViewerState.scaling({
    required Matrix4 matrix,
    required Matrix4 oldMatrix,
    required Size viewportSize,
    required Rect diagramRect,
    required List<DiagramObjectEntity> content,
    required List<DiagramObjectEntity> selectedObjects,
  }) = _Scaling;
}
