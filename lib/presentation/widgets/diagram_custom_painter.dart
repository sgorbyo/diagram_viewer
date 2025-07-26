import 'package:diagram_viewer/presentation/bloc/diagram_viewer/diagram_viewer_bloc.dart';
import 'package:flutter/material.dart';

class DiagramCustomPainter extends CustomPainter {
  final DiagramViewerState state;
  final Paint backgroundPaint;
  final Paint outsidePaint;

  DiagramCustomPainter({required this.state})
      : backgroundPaint = Paint()
          ..color = const Color.fromRGBO(250, 250, 250, 1.0)
          ..style = PaintingStyle.fill,
        outsidePaint = Paint()
          ..color = const Color.fromRGBO(128, 128, 128, 1.0)
          ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    // Removed verbose paint logging

    // Paint outside area first so we can see diagram boundaries
    final fullRect = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawPath(fullRect, outsidePaint);

    canvas.save();
    canvas.transform(state.matrix.storage);

    // Draw diagram background
    if (state.diagramRect != Rect.zero) {
      final backgroundPath = Path()..addRect(state.diagramRect);
      canvas.drawPath(backgroundPath, backgroundPaint);
    }

    // Draw content
    for (final object in state.content) {
      object.printOnCanvas(canvas: canvas);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Keep it simple for now
  }
}
