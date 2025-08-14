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
    // Sfondo viewer (non trasformato) grigio molto chiaro per distinguere dal bianco del diagramma
    final viewerBg = Paint()
      ..color = const Color(0xFFE5E7EB)
      ..style = PaintingStyle.fill;
    canvas.drawRect(Offset.zero & size, viewerBg);

    // Applica la trasformazione e dipingi l'area logica + oggetti
    canvas.save();
    canvas.transform(transform.toMatrix4().storage);
    _drawBackground(canvas, size);
    if (configuration.showSnapGrid) {
      _drawSnapGrid(canvas);
    }
    _drawDiagramArea(canvas);
    _drawObjects(canvas);
    if (debug) {
      _drawDebugInfo(canvas, size);
    }
    canvas.restore();
  }

  void _drawBackground(Canvas canvas, Size size) {
    // Riempie l'area del diagramma (logicalExtent) di bianco, così l'interno è bianco
    final diagramBg = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawRect(logicalExtent, diagramBg);
  }

  void _drawDiagramArea(Canvas canvas) {
    // Non disegnare un layer extra: lo sfondo è già l'extent logico
  }

  void _drawSnapGrid(Canvas canvas) {
    final spacing = configuration.snapGridSpacing;
    if (spacing <= 0) return;
    final origin = configuration.snapGridOrigin;
    final extent = logicalExtent;
    final paint = Paint()
      ..color = const Color(0x11000000)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0 / transform.scale.clamp(1.0, double.infinity);

    // Vertical lines
    final startXUnits = ((extent.left - origin.dx) / spacing).floor();
    final endXUnits = ((extent.right - origin.dx) / spacing).ceil();
    for (int i = startXUnits; i <= endXUnits; i++) {
      final x = origin.dx + i * spacing;
      canvas.drawLine(Offset(x, extent.top), Offset(x, extent.bottom), paint);
    }

    // Horizontal lines
    final startYUnits = ((extent.top - origin.dy) / spacing).floor();
    final endYUnits = ((extent.bottom - origin.dy) / spacing).ceil();
    for (int j = startYUnits; j <= endYUnits; j++) {
      final y = origin.dy + j * spacing;
      canvas.drawLine(Offset(extent.left, y), Offset(extent.right, y), paint);
    }
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
