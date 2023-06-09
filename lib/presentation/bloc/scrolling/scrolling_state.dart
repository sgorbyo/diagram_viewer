part of 'scrolling_bloc.dart';

@freezed
class ScrollingState with _$ScrollingState {
  const factory ScrollingState.initial({
    required Matrix4 matrix,
    List<DiagramObjectEntity>? content,
    Size? size,
    Rect? diagramRect,
  }) = _ScrollingInitial;
  const factory ScrollingState.animatingInitialToIdle({
    required Matrix4 oldMatrix,
    required Matrix4 matrix,
    required List<DiagramObjectEntity> content,
    required Size size,
    required Rect diagramRect,
  }) = _ScrollingAnimatingInitialToIdle;
  const factory ScrollingState.idle({
    required Matrix4 matrix,
    required List<DiagramObjectEntity> content,
    required Size size,
    required Rect diagramRect,
  }) = _ScrollingIdle;
  const factory ScrollingState.scrolling({
    required Matrix4 matrix,
    required List<DiagramObjectEntity> content,
    required ValueUpdater<Offset> translationUpdater,
    required ValueUpdater<double> scaleUpdater,
    required Size size,
    required Rect diagramRect,
    required double squaredDistance,
    required DateTime eventDateTime,
  }) = _ScrollingScrolling;
  const factory ScrollingState.animatingInertialScrolling({
    required Matrix4 oldMatrix,
    required Matrix4 matrix,
    required int animationTimeInMilliseconds,
    required List<DiagramObjectEntity> content,
    required Size size,
    required Rect diagramRect,
  }) = _ScrollingAnimatingInertialScrolling;
  const factory ScrollingState.stoppingAnimation({
    required Matrix4 matrix,
    required List<DiagramObjectEntity> content,
    required Size size,
    required Rect diagramRect,
    required ScaleStartDetails details,
  }) = _StoppingAnimation;
  const factory ScrollingState.animatingFromOutOfBounds({
    required Matrix4 oldMatrix,
    required Matrix4 matrix,
    required List<DiagramObjectEntity> content,
    required Size size,
    required Rect diagramRect,
  }) = _ScrollingAnimatingFromOutOfBounds;
  const factory ScrollingState.externalOperation({
    required Matrix4 matrix,
    required List<DiagramObjectEntity> content,
    required Size size,
    required Rect diagramRect,
    required Map<String, dynamic> piggyback,
  }) = _ScrollingExternalOperation;
}
