part of 'scrolling_bloc.dart';

@freezed
class ScrollingEvent with _$ScrollingEvent {
  const factory ScrollingEvent.startScale(
      {required ScaleStartDetails details}) = _StartScale;
  const factory ScrollingEvent.continueScale(
      {required ScaleUpdateDetails details,
      Offset? additionalFocalPoint}) = _ContinueScale;
  const factory ScrollingEvent.endScale({required ScaleEndDetails details}) =
      _EndScale;
  const factory ScrollingEvent.restartScale({
    required ScaleStartDetails details,
    required Matrix4 matrix,
  }) = _RestartScale;
  const factory ScrollingEvent.viewportChanged({required Size size}) =
      _ViewportChanged;
  const factory ScrollingEvent.contentChanged(
      {required List<DiagramObjectEntity> list}) = _ContentChanged;
  const factory ScrollingEvent.initialToIdleAnimationEnd() =
      _InitialToIdleAnimationEnd;
  const factory ScrollingEvent.outOfBoundsToIdleAnimationEnd() =
      _OutOfBoundsToIdleAnimationEnd;
  const factory ScrollingEvent.inertialAnimationEnd({
    required Matrix4 reachedMatrix,
  }) = _InertialAnimationEnd;
  const factory ScrollingEvent.inertialAnimationStop() = _InertialAnimationStop;
  const factory ScrollingEvent.scrollingAnimationEnd() = _ScrollingAnimationEnd;
  const factory ScrollingEvent.startExternalDragOperation({dynamic piggyback}) =
      _StartExternalDragOperation;
  const factory ScrollingEvent.continueExternalDragOperation(
      {required Vector4 localFocalPoint,
      required Vector4 localDelta,
      dynamic piggyback}) = _ContinueExternalDragOperation;
  const factory ScrollingEvent.endExternalDragOperation() =
      _EndExternalDragOperation;
}
