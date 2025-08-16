import 'dart:math' as math;
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:diagram_viewer/tools/rendering/rendering_facilities.dart';

void main() {
  group('RenderingFacilities - Text on Path helpers', () {
    test(
        'computePointAndTangentAt returns mid-point and angle for horizontal line',
        () {
      final path = Path()
        ..moveTo(0, 0)
        ..lineTo(10, 0);

      final result =
          RenderingFacilities.computePointAndTangentAt(path: path, t: 0.5);
      expect(result.position.dx, closeTo(5.0, 1e-6));
      expect(result.position.dy, closeTo(0.0, 1e-6));
      expect(result.angleRadians, closeTo(0.0, 1e-6));
    });

    test(
        'computePointAndTangentAt returns mid-point and 45deg angle for diagonal line',
        () {
      final path = Path()
        ..moveTo(0, 0)
        ..lineTo(10, 10);

      final result =
          RenderingFacilities.computePointAndTangentAt(path: path, t: 0.5);
      expect(result.position.dx, closeTo(5.0, 1e-2));
      expect(result.position.dy, closeTo(5.0, 1e-2));
      expect(result.angleRadians, closeTo(math.pi / 4, 1e-3));
    });
  });

  group('RenderingFacilities - Point to Path distance', () {
    test('distance to circle path is correct within tolerance', () {
      final circle = Path()
        ..addOval(Rect.fromCircle(center: const Offset(0, 0), radius: 10));
      final p1 = const Offset(12, 0); // ~2px from circle
      final d1 =
          RenderingFacilities.pointToPathDistance(path: circle, point: p1);
      expect(d1, closeTo(2.0, 0.5));

      final p2 = const Offset(25, 0); // ~15px from circle
      final d2 =
          RenderingFacilities.pointToPathDistance(path: circle, point: p2);
      expect(d2, greaterThan(10.0));

      expect(
          RenderingFacilities.isPointNearPath(
              path: circle, point: p1, tolerance: 2.1),
          isTrue);
      expect(
          RenderingFacilities.isPointNearPath(
              path: circle, point: p1, tolerance: 1.9),
          isFalse);
    });
  });

  group('RenderingFacilities - Path trim/clipping', () {
    test('trims line endpoints against circular clip paths', () {
      final line = Path()
        ..moveTo(-10, 0)
        ..lineTo(10, 0);
      final startClip = Path()
        ..addOval(Rect.fromCircle(center: const Offset(-10, 0), radius: 5));
      final endClip = Path()
        ..addOval(Rect.fromCircle(center: const Offset(10, 0), radius: 5));

      final trimmed = RenderingFacilities.trimPathAgainstClips(
        path: line,
        startClipPath: startClip,
        endClipPath: endClip,
      );

      final metrics = trimmed.computeMetrics().toList();
      expect(metrics.length, 1);
      final metric = metrics.first;
      final startPt = metric.getTangentForOffset(0)!.position;
      final endPt = metric.getTangentForOffset(metric.length)!.position;

      expect(startPt.dx, closeTo(-5.0, 0.5));
      expect(startPt.dy, closeTo(0.0, 0.5));
      expect(endPt.dx, closeTo(5.0, 0.5));
      expect(endPt.dy, closeTo(0.0, 0.5));
    });
  });
}
