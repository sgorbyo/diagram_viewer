import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class RenderingFacilities {
  RenderingFacilities._();

  /// Result of sampling a path at parametric position t
  static ({Offset position, double angleRadians}) computePointAndTangentAt({
    required Path path,
    required double t,
  }) {
    assert(t >= 0.0 && t <= 1.0);
    final metrics = path.computeMetrics().toList(growable: false);
    double fullLength = 0.0;
    for (final m in metrics) {
      fullLength += m.length;
    }
    double target = fullLength * t;
    ui.PathMetric? chosen;
    for (final m in metrics) {
      if (target <= m.length) {
        chosen = m;
        break;
      } else {
        target -= m.length;
      }
    }
    chosen ??= metrics.last;
    final tangent =
        chosen.getTangentForOffset(target.clamp(0.0, chosen.length))!;
    // Convert to screen-space convention (y down). Flutter's tangent seems y-up; flip sign.
    final angle = -tangent.angle;
    return (position: tangent.position, angleRadians: angle);
  }

  /// Distance from a point to the closest point on the path
  static double pointToPathDistance({
    required Path path,
    required Offset point,
    int samplesPerSegment = 64,
  }) {
    double best = double.infinity;
    for (final metric in path.computeMetrics()) {
      for (int i = 0; i <= samplesPerSegment; i++) {
        final d = metric.length * (i / samplesPerSegment);
        final tangent = metric.getTangentForOffset(d);
        if (tangent == null) continue;
        final candidate = tangent.position;
        final dist = (candidate - point).distance;
        if (dist < best) best = dist;
      }
    }
    return best.isFinite ? best : double.infinity;
  }

  /// Returns true if point is within [tolerance] from the path
  static bool isPointNearPath({
    required Path path,
    required Offset point,
    required double tolerance,
  }) {
    return pointToPathDistance(path: path, point: point) <= tolerance;
  }

  /// Trims the given [path] against optional start/end clip paths.
  /// For straight lines, approximates by shortening the line to the intersection
  /// with the clip boundaries.
  static Path trimPathAgainstClips({
    required Path path,
    Path? startClipPath,
    Path? endClipPath,
  }) {
    // Reduce to a single straight segment from first to last point in the path
    final metrics = path.computeMetrics().toList();
    if (metrics.isEmpty) return path;
    final first = metrics.first;
    final last = metrics.last;
    final start = first.getTangentForOffset(0)!.position;
    final end = last.getTangentForOffset(last.length)!.position;

    Offset newStart = start;
    Offset newEnd = end;

    if (startClipPath != null) {
      newStart = _clipEndpointAlongSegment(
        from: start,
        to: end,
        clip: startClipPath,
        searchFromStart: true,
      );
    }
    if (endClipPath != null) {
      newEnd = _clipEndpointAlongSegment(
        from: end,
        to: start,
        clip: endClipPath,
        searchFromStart: true,
      );
    }

    final result = Path()
      ..moveTo(newStart.dx, newStart.dy)
      ..lineTo(newEnd.dx, newEnd.dy);
    return result;
  }

  static Offset _clipEndpointAlongSegment({
    required Offset from,
    required Offset to,
    required Path clip,
    required bool searchFromStart,
  }) {
    // Ensure a starts inside and b is outside (move a slightly along the segment if on boundary)
    Offset a = from;
    for (int i = 0; i < 4 && !clip.contains(a); i++) {
      a = _moveAlongSegment(from: a, toward: to, distance: 0.5);
    }
    Offset b = to;
    for (int i = 0; i < 4 && clip.contains(b); i++) {
      b = _moveAlongSegment(from: b, toward: a, distance: 0.5);
    }
    // Binary search along the segment to find the boundary
    for (int i = 0; i < 20; i++) {
      final mid = Offset(
        (a.dx + b.dx) / 2,
        (a.dy + b.dy) / 2,
      );
      final inside = _isPointInsidePath(clip, mid);
      if (inside) {
        // move outward
        a = mid;
      } else {
        // move inward
        b = mid;
      }
    }
    return searchFromStart ? b : a;
  }

  static Offset _moveAlongSegment({
    required Offset from,
    required Offset toward,
    required double distance,
    bool invert = false,
  }) {
    final dir = (toward - from);
    final len = dir.distance;
    if (len == 0) return from;
    final unit = Offset(dir.dx / len, dir.dy / len);
    return invert ? from - unit * distance : from + unit * distance;
  }

  static bool _isPointInsidePath(Path clip, Offset point) {
    return clip.contains(point);
  }

  /// Executes [draw] with the canvas rotated around [pivot] by [angleRadians].
  static void withRotationAt({
    required Canvas canvas,
    required Offset pivot,
    required double angleRadians,
    required void Function(Canvas c) draw,
  }) {
    canvas.save();
    canvas.translate(pivot.dx, pivot.dy);
    canvas.rotate(angleRadians);
    canvas.translate(-pivot.dx, -pivot.dy);
    draw(canvas);
    canvas.restore();
  }
}
