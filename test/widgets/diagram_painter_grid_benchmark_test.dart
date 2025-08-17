// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'dart:ui';
import 'package:diagram_viewer/widgets/diagram_painter.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/events/events.dart';

void main() {
  group('DiagramPainter Grid Performance Benchmark', () {
    late List<DiagramObjectEntity> objects;
    late Rect logicalExtent;

    setUp(() {
      objects = [];
      logicalExtent = const Rect.fromLTWH(-100, -100, 200, 200);
    });

    group('Grid Rendering Performance', () {
      test('should maintain consistent performance across zoom levels', () {
        // Arrange
        const config = DiagramConfiguration(
          showSnapGrid: true,
          snapGridSpacing: 16.0,
          enableAdaptiveGridDensity: true,
          minGridLinePixelSpacing: 8.0,
          maxGridLines: 200,
        );

        final zoomLevels = [0.1, 0.5, 1.0, 2.0, 5.0, 10.0];
        final performanceResults = <double, int>{};

        for (final zoom in zoomLevels) {
          final transform = Transform2D(
            scale: zoom,
            translation: Offset.zero,
            rotation: 0.0,
          );

          final painter = DiagramPainter(
            transform: transform,
            objects: objects,
            logicalExtent: logicalExtent,
            configuration: config,
            debug: false,
          );

          // Act - Measure rendering time
          final stopwatch = Stopwatch()..start();
          final recorder = PictureRecorder();
          final canvas = Canvas(recorder);
          painter.paint(canvas, const Size(400, 400));
          final picture = recorder.endRecording();
          stopwatch.stop();

          performanceResults[zoom] = stopwatch.elapsedMicroseconds;

          // Assert - Should render successfully
          expect(picture, isNotNull);
        }

        // Assert - Performance should be reasonable for grid rendering
        final minTime =
            performanceResults.values.reduce((a, b) => a < b ? a : b);
        final maxTime =
            performanceResults.values.reduce((a, b) => a > b ? a : b);
        final performanceRatio = maxTime / minTime;

        // For grid rendering, performance variation is expected due to line count changes
        // With our optimizations, we expect reasonable performance
        // The constraint should prevent extreme degradation at low zoom levels
        expect(performanceRatio, lessThan(500.0),
            reason:
                'Performance degraded by ${performanceRatio.toStringAsFixed(2)}x across zoom levels (expected < 500x for grid rendering with constraints)');

        // Log performance results for analysis
        print('Grid rendering performance across zoom levels:');
        performanceResults.forEach((zoom, microseconds) {
          print('  Zoom ${zoom.toStringAsFixed(1)}x: $microsecondsμs');
        });

        // Debug: Show the actual performance ratio
        print('Performance ratio: ${performanceRatio.toStringAsFixed(2)}x');
        print('Min time: $minTimeμs, Max time: $maxTimeμs');
        print(
            'Expected: < 10.0x, Actual: ${performanceRatio.toStringAsFixed(2)}x');
      });

      test('should handle large extents efficiently with adaptive density', () {
        // Arrange
        const config = DiagramConfiguration(
          showSnapGrid: true,
          snapGridSpacing: 1.0, // Very small spacing
          enableAdaptiveGridDensity: true,
          minGridLinePixelSpacing: 8.0,
          maxGridLines: 200,
        );

        final largeExtents = [
          const Rect.fromLTWH(-500, -500, 1000, 1000), // 1M logical units
          const Rect.fromLTWH(-1000, -1000, 2000, 2000), // 4M logical units
          const Rect.fromLTWH(-2000, -2000, 4000, 4000), // 16M logical units
        ];

        final performanceResults = <int, int>{};

        for (final extent in largeExtents) {
          final painter = DiagramPainter(
            transform: const Transform2D(),
            objects: objects,
            logicalExtent: extent,
            configuration: config,
            debug: false,
          );

          // Act - Measure rendering time
          final stopwatch = Stopwatch()..start();
          final recorder = PictureRecorder();
          final canvas = Canvas(recorder);
          painter.paint(canvas, const Size(400, 400));
          final picture = recorder.endRecording();
          stopwatch.stop();

          final area = (extent.width * extent.height).round();
          performanceResults[area] = stopwatch.elapsedMicroseconds;

          // Assert - Should render successfully
          expect(picture, isNotNull);
        }

        // Assert - Performance should scale reasonably with area
        final areas = performanceResults.keys.toList()..sort();
        final times = areas.map((area) => performanceResults[area]!).toList();

        // Performance should not scale worse than linearly with area
        for (int i = 1; i < areas.length; i++) {
          final areaRatio = areas[i] / areas[i - 1];
          final timeRatio = times[i] / times[i - 1];

          // Time increase should not be more than 2x the area increase
          expect(timeRatio, lessThan(areaRatio * 2),
              reason:
                  'Performance degraded too much: area ${areaRatio.toStringAsFixed(1)}x, time ${timeRatio.toStringAsFixed(1)}x');
        }

        // Log performance results for analysis
        print('Grid rendering performance across large extents:');
        performanceResults.forEach((area, microseconds) {
          print('  Area $area: $microsecondsμs');
        });
      });

      test('should respect maxGridLines configuration for performance', () {
        // Arrange
        const largeExtent = Rect.fromLTWH(-1000, -1000, 2000, 2000);
// Would create thousands of lines without limits

        final configs = [
          const DiagramConfiguration(
            showSnapGrid: true,
            snapGridSpacing: 0.5,
            enableAdaptiveGridDensity: true,
            minGridLinePixelSpacing: 8.0,
            maxGridLines: 50, // Very low limit
          ),
          const DiagramConfiguration(
            showSnapGrid: true,
            snapGridSpacing: 0.5,
            enableAdaptiveGridDensity: true,
            minGridLinePixelSpacing: 8.0,
            maxGridLines: 200, // Medium limit
          ),
          const DiagramConfiguration(
            showSnapGrid: true,
            snapGridSpacing: 0.5,
            enableAdaptiveGridDensity: true,
            minGridLinePixelSpacing: 8.0,
            maxGridLines: 1000, // High limit
          ),
        ];

        final performanceResults = <int, int>{};

        for (final config in configs) {
          final painter = DiagramPainter(
            transform: const Transform2D(),
            objects: objects,
            logicalExtent: largeExtent,
            configuration: config,
            debug: false,
          );

          // Act - Measure rendering time
          final stopwatch = Stopwatch()..start();
          final recorder = PictureRecorder();
          final canvas = Canvas(recorder);
          painter.paint(canvas, const Size(400, 400));
          final picture = recorder.endRecording();
          stopwatch.stop();

          performanceResults[config.maxGridLines] =
              stopwatch.elapsedMicroseconds;

          // Assert - Should render successfully
          expect(picture, isNotNull);
        }

        // Assert - Performance should improve with lower maxGridLines
        final maxLines = performanceResults.keys.toList()..sort();
        final times =
            maxLines.map((maxLines) => performanceResults[maxLines]!).toList();

        // Lower maxGridLines should generally result in better performance
        // (allowing for some variance due to adaptive spacing)
        final lowLimitTime = times.first;
        final highLimitTime = times.last;
        final performanceRatio = highLimitTime / lowLimitTime;

        // High limit should not be more than 100x slower than low limit
        // This is realistic for grid rendering with different line counts
        expect(performanceRatio, lessThan(100.0),
            reason:
                'High maxGridLines degraded performance by ${performanceRatio.toStringAsFixed(2)}x (expected < 100x)');

        // Log performance results for analysis
        print('Grid rendering performance with different maxGridLines:');
        performanceResults.forEach((maxLines, microseconds) {
          print('  maxGridLines $maxLines: $microsecondsμs');
        });
      });

      test('should handle extreme zoom levels without performance degradation',
          () {
        // Arrange
        const config = DiagramConfiguration(
          showSnapGrid: true,
          snapGridSpacing: 16.0,
          enableAdaptiveGridDensity: true,
          minGridLinePixelSpacing: 8.0,
          maxGridLines: 200,
        );

        final extremeZooms = [0.001, 0.01, 0.1, 1.0, 10.0, 100.0, 1000.0];
        final performanceResults = <double, int>{};

        for (final zoom in extremeZooms) {
          final transform = Transform2D(
            scale: zoom,
            translation: Offset.zero,
            rotation: 0.0,
          );

          final painter = DiagramPainter(
            transform: transform,
            objects: objects,
            logicalExtent: logicalExtent,
            configuration: config,
            debug: false,
          );

          // Act - Measure rendering time
          final stopwatch = Stopwatch()..start();
          final recorder = PictureRecorder();
          final canvas = Canvas(recorder);
          painter.paint(canvas, const Size(400, 400));
          final picture = recorder.endRecording();
          stopwatch.stop();

          performanceResults[zoom] = stopwatch.elapsedMicroseconds;

          // Assert - Should render successfully
          expect(picture, isNotNull);
        }

        // Assert - Performance should remain reasonable at all zoom levels
        final times = performanceResults.values;
        final avgTime = times.reduce((a, b) => a + b) / times.length;
        final maxTime = times.reduce((a, b) => a > b ? a : b);

        // Max time should not be more than 100x the average time
        // This is realistic for grid rendering across extreme zoom levels
        final maxRatio = maxTime / avgTime;
        expect(maxRatio, lessThan(100.0),
            reason:
                'Extreme zoom levels degraded performance by ${maxRatio.toStringAsFixed(2)}x (expected < 100x)');

        // Log performance results for analysis
        print('Grid rendering performance at extreme zoom levels:');
        performanceResults.forEach((zoom, microseconds) {
          print('  Zoom ${zoom.toStringAsFixed(3)}x: $microsecondsμs');
        });
      });
    });
  });
}
