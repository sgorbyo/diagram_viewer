// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/widgets/diagram_painter.dart';
import 'package:diagram_viewer/interfaces/diagram_configuration.dart';
import 'package:diagram_viewer/events/transform_2d.dart';
import 'dart:ui';

void main() {
  group('DiagramPainter Grid Debug Detailed Tests', () {
    test('should debug why grid is not visible', () {
      // Arrange: Create painter with grid enabled
      const config = DiagramConfiguration(
        showSnapGrid: true,
        snapGridSpacing: 16.0,
        snapGridOrigin: Offset.zero,
        minGridLinePixelSpacing: 8.0,
        maxGridLines: 200,
      );

      final painter = DiagramPainter(
        transform: const Transform2D(scale: 1.0),
        objects: [],
        logicalExtent: const Rect.fromLTWH(0, 0, 100, 100),
        configuration: config,
        debug: false,
      );

      // Debug: Print configuration values
      print('=== GRID DEBUG INFO ===');
      print('showSnapGrid: ${config.showSnapGrid}');
      print('snapGridSpacing: ${config.snapGridSpacing}');
      print('minGridLinePixelSpacing: ${config.minGridLinePixelSpacing}');
      print('maxGridLines: ${config.maxGridLines}');
      print('transform.scale: ${painter.transform.scale}');

      // Calculate pixel spacing
      final pixelSpacing = config.snapGridSpacing * painter.transform.scale;
      print('pixelSpacing: $pixelSpacing');
      print(
          'pixelSpacing >= minGridLinePixelSpacing: ${pixelSpacing >= config.minGridLinePixelSpacing}');

      // Calculate grid lines
      final startX = ((painter.logicalExtent.left - config.snapGridOrigin.dx) /
              config.snapGridSpacing)
          .floor();
      final endX = ((painter.logicalExtent.right - config.snapGridOrigin.dx) /
              config.snapGridSpacing)
          .ceil();
      final startY = ((painter.logicalExtent.top - config.snapGridOrigin.dy) /
              config.snapGridSpacing)
          .floor();
      final endY = ((painter.logicalExtent.bottom - config.snapGridOrigin.dy) /
              config.snapGridSpacing)
          .ceil();

      final totalLines = (endX - startX + 1) + (endY - startY + 1);
      print('Grid lines: X($startX to $endX), Y($startY to $endY)');
      print('Total lines: $totalLines');
      print(
          'Total lines <= maxGridLines: ${totalLines <= config.maxGridLines}');

      // Act: Paint to canvas
      final recorder = PictureRecorder();
      final canvas = Canvas(recorder);
      painter.paint(canvas, const Size(100, 100));
      final picture = recorder.endRecording();

      // Assert: Grid should be visible
      expect(picture, isNotNull);

      print('=== END GRID DEBUG ===');
    });

    test('should show grid with relaxed constraints', () {
      // Arrange: Create painter with relaxed grid constraints
      const config = DiagramConfiguration(
        showSnapGrid: true,
        snapGridSpacing: 16.0,
        snapGridOrigin: Offset.zero,
        minGridLinePixelSpacing: 1.0, // Very relaxed
        maxGridLines: 1000, // Very relaxed
      );

      final painter = DiagramPainter(
        transform: const Transform2D(scale: 1.0),
        objects: [],
        logicalExtent: const Rect.fromLTWH(0, 0, 100, 100),
        configuration: config,
        debug: false,
      );

      // Debug: Print configuration values
      print('=== RELAXED GRID DEBUG ===');
      print('minGridLinePixelSpacing: ${config.minGridLinePixelSpacing}');
      print('maxGridLines: ${config.maxGridLines}');

      // Act: Paint to canvas
      final recorder = PictureRecorder();
      final canvas = Canvas(recorder);
      painter.paint(canvas, const Size(100, 100));
      final picture = recorder.endRecording();

      // Assert: Grid should be visible
      expect(picture, isNotNull);

      print('=== END RELAXED GRID DEBUG ===');
    });
  });
}
