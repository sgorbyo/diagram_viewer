import 'package:flutter/material.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/events/events.dart';

/// Custom painter for the diagram.
class DiagramPainter extends CustomPainter {
  final Transform2D transform;
  final List<DiagramObjectEntity> objects;
  final Rect logicalExtent;
  final DiagramConfiguration configuration;
  final bool debug;

  DiagramPainter({
    required this.transform,
    required this.objects,
    required this.logicalExtent,
    required this.configuration,
    required this.debug,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Apply transformation
    canvas.save();
    canvas.transform(transform.toMatrix4().storage);

    // Draw background
    _drawBackground(canvas, size);

    // Draw diagram area
    _drawDiagramArea(canvas);

    // Draw objects
    _drawObjects(canvas);

    // Draw debug information
    if (debug) {
      _drawDebugInfo(canvas, size);
    }

    canvas.restore();
  }

  void _drawBackground(Canvas canvas, Size size) {
    final backgroundPaint = Paint()
      ..color = Colors.grey.shade200
      ..style = PaintingStyle.fill;

    final largeRect = Rect.fromCenter(
      center: Offset.zero,
      width: size.width * 10,
      height: size.height * 10,
    );
    canvas.drawRect(largeRect, backgroundPaint);
  }

  void _drawDiagramArea(Canvas canvas) {
    final diagramAreaPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawRect(logicalExtent, diagramAreaPaint);
  }

  void _drawObjects(Canvas canvas) {
    final sortedObjects = List<DiagramObjectEntity>.from(objects)
      ..sort((a, b) => a.zOrder.compareTo(b.zOrder));

    for (final object in sortedObjects) {
      if (object.isVisible) {
        object.paint(canvas);
      }
    }
  }

  void _drawDebugInfo(Canvas canvas, Size size) {
    final debugPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    canvas.drawRect(logicalExtent, debugPaint);

    for (final object in objects) {
      final boundsPaint = Paint()
        ..color = Colors.blue
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.0;

      canvas.drawRect(object.logicalBounds, boundsPaint);
    }
  }

  @override
  bool shouldRepaint(covariant DiagramPainter oldDelegate) {
    return transform != oldDelegate.transform ||
        objects != oldDelegate.objects ||
        logicalExtent != oldDelegate.logicalExtent ||
        configuration != oldDelegate.configuration ||
        debug != oldDelegate.debug;
  }

  /// Performs hit testing at the given logical point.
  ///
  /// Returns a list of objects that contain the point, ordered by z-order
  /// (highest z-order first). Returns null if no objects are hit.
  ///
  /// @param point The logical point to test
  /// @return List of hit objects ordered by z-order, or null if no hits
  List<DiagramObjectEntity>? findObjectsAtPoint(Offset point) {
    final hitObjects = <DiagramObjectEntity>[];

    for (final object in objects) {
      if (object.isVisible && object.isInteractive && object.contains(point)) {
        hitObjects.add(object);
      }
    }

    if (hitObjects.isEmpty) {
      return null;
    }

    // Sort by z-order (highest first)
    hitObjects.sort((a, b) => b.zOrder.compareTo(a.zOrder));

    return hitObjects;
  }
}
