part of 'scrolling_bloc.dart';

@freezed
class ScrollingDynamicParams with _$ScrollingDynamicParams {
       const factory ScrollingDynamicParams({
              required List<DiagramObjectEntity> content,
              required double minStaticX,
              required double minDynamicX,
              required double maxStaticX,
              required double maxDynamicX,
              required double minStaticY,
              required double minDynamicY,
              required double maxStaticY,
              required double maxDynamicY,
              required double minStaticScale,
              required double minDynamicScale,
              required double maxStaticScale,
              required double maxDynamicScale,
              required Offset hardOffset,
              required double scale,
              required Size size,
              required Rect contentRect,
       }) = _ScrollingDynamicParams;
}
