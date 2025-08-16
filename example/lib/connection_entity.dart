import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:flutter/material.dart';
import 'package:diagram_viewer/tools/rendering/rendering_facilities.dart';
import 'dart:math';

class ConnectionEntity extends DiagramObjectEntity {
  final String _id;
  final Offset startCenter;
  final Offset endCenter;
  final double endpointRadius;
  final Paint linePaint;
  final int _zOrder;

  ConnectionEntity({
    required String id,
    required this.startCenter,
    required this.endCenter,
    this.endpointRadius = 50.0,
    Color color = Colors.black,
    int zOrder = 10,
  })  : _id = id,
        linePaint = Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.0,
        _zOrder = zOrder;

  @override
  String get id => _id;

  @override
  Rect get logicalBounds =>
      Rect.fromPoints(startCenter, endCenter).inflate(endpointRadius + 8);

  @override
  int get zOrder => _zOrder;

  @override
  void paint(Canvas canvas) {
    // Base path from start to end
    final path = Path()
      ..moveTo(startCenter.dx, startCenter.dy)
      ..lineTo(endCenter.dx, endCenter.dy);

    // Clip paths representing endpoint circles
    final startClip = Path()
      ..addOval(Rect.fromCircle(center: startCenter, radius: endpointRadius));
    final endClip = Path()
      ..addOval(Rect.fromCircle(center: endCenter, radius: endpointRadius));

    final trimmed = RenderingFacilities.trimPathAgainstClips(
      path: path,
      startClipPath: startClip,
      endClipPath: endClip,
    );

    canvas.drawPath(trimmed, linePaint);

    // Draw a small label at t=0.5 aligned to tangent as a demo of text-on-path
    final sample =
        RenderingFacilities.computePointAndTangentAt(path: trimmed, t: 0.5);

    // Normalize the angle to ensure text is always readable (not upside down)
    double normalizedAngle = sample.angleRadians;

    // The goal is to ensure the text is always readable from left to right
    // We need to handle the case where the text would appear upside down

    // First, normalize the angle to the range [-π, π]
    while (normalizedAngle > pi) {
      normalizedAngle -= 2 * pi;
    }
    while (normalizedAngle < -pi) {
      normalizedAngle += 2 * pi;
    }

    // If the angle is pointing downward (between π/2 and 3π/2 or between -3π/2 and -π/2),
    // flip it by π to make the text readable
    // This covers the cases where the line goes from right to left or has steep negative slopes
    if ((normalizedAngle > pi / 2 && normalizedAngle < 3 * pi / 2) ||
        (normalizedAngle < -pi / 2 && normalizedAngle > -3 * pi / 2)) {
      normalizedAngle += pi;
    }

    // Normalize again to keep within [-π, π]
    while (normalizedAngle > pi) {
      normalizedAngle -= 2 * pi;
    }
    while (normalizedAngle < -pi) {
      normalizedAngle += 2 * pi;
    }

    RenderingFacilities.withRotationAt(
      canvas: canvas,
      pivot: sample.position,
      angleRadians: normalizedAngle,
      draw: (c) {
        const text = 'conn';
        final tp = TextPainter(
          text: const TextSpan(
              text: text, style: TextStyle(fontSize: 10, color: Colors.black)),
          textDirection: TextDirection.ltr,
        )..layout();

        // Position the text above the line, not below
        final textOffset = Offset(tp.width / 2, tp.height + 2);
        tp.paint(c, sample.position - textOffset);
      },
    );
  }

  @override
  bool contains(Offset point) {
    final path = Path()
      ..moveTo(startCenter.dx, startCenter.dy)
      ..lineTo(endCenter.dx, endCenter.dy);
    final startClip = Path()
      ..addOval(Rect.fromCircle(center: startCenter, radius: endpointRadius));
    final endClip = Path()
      ..addOval(Rect.fromCircle(center: endCenter, radius: endpointRadius));
    final trimmed = RenderingFacilities.trimPathAgainstClips(
      path: path,
      startClipPath: startClip,
      endClipPath: endClip,
    );
    return RenderingFacilities.isPointNearPath(
        path: trimmed, point: point, tolerance: 6.0);
  }

  @override
  List<Object> get props => [
        _id,
        startCenter,
        endCenter,
        endpointRadius,
        linePaint.color,
        linePaint.strokeWidth,
        _zOrder,
      ];
}
