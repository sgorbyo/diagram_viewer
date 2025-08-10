import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:diagram_viewer/events/transform_2d.dart';
import 'package:diagram_viewer/tools/transform2d/transform2d_utils.dart';

void main() {
  group('Transform2DUtils - Zoom limits', () {
    const diagramRect = Rect.fromLTWH(0, 0, 1000, 800);
    const viewport = Size(400, 300);

    test('respects dynamic min zoom at rest (no dynamic overscroll)', () {
      final minFit = Transform2DUtils.scaleToFit(
        contentRect: diagramRect,
        viewSize: viewport,
      );
      // Propose a scale much smaller than dynamic min
      final t = Transform2D(scale: minFit * 0.2, translation: Offset.zero);
      final capped = Transform2DUtils.capTransformWithZoomLimits(
        transform: t,
        diagramRect: diagramRect,
        size: viewport,
        dynamic: false,
        minZoom: 0.01,
        maxZoom: 10.0,
        preserveCentering: true,
        recenterSmallContent: true,
      );
      expect(capped.scale, closeTo(minFit, 1e-6));
    });

    test('allows small overscroll below dynamic min during interaction', () {
      final minFit = Transform2DUtils.scaleToFit(
        contentRect: diagramRect,
        viewSize: viewport,
      );
      final proposed = minFit * 0.5;
      final t = Transform2D(scale: proposed, translation: Offset.zero);
      final capped = Transform2DUtils.capTransformWithZoomLimits(
        transform: t,
        diagramRect: diagramRect,
        size: viewport,
        dynamic: true,
        minZoom: 0.01,
        maxZoom: 10.0,
        preserveCentering: false,
        recenterSmallContent: false,
      );
      final minAllowed = minFit * Transform2DUtils.zoomOverscrollFactor;
      expect(capped.scale, greaterThanOrEqualTo(minAllowed));
    });
  });
}
