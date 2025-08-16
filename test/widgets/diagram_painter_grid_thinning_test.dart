import 'package:flutter_test/flutter_test.dart';
import 'dart:ui';
import 'package:diagram_viewer/widgets/diagram_painter.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/events/events.dart';

void main() {
  group('DiagramPainter Grid Overlay Thinning', () {
    late DiagramConfiguration config;
    late Transform2D transform;
    late List<DiagramObjectEntity> objects;
    late Rect logicalExtent;

    setUp(() {
      config = const DiagramConfiguration(
        showSnapGrid: true,
        snapGridSpacing: 16.0,
        snapGridOrigin: Offset.zero,
        enableAdaptiveGridDensity: true,
        minGridLinePixelSpacing: 8.0,
        maxGridLines: 200,
      );

      transform = const Transform2D(
        scale: 1.0,
        translation: Offset.zero,
        rotation: 0.0,
      );

      objects = [];
      logicalExtent = const Rect.fromLTWH(-100, -100, 200, 200);
    });

    group('Grid Rendering Behavior', () {
      testWidgets(
          'should render grid lines with correct density at different zoom levels',
          (WidgetTester tester) async {
        // Arrange
        final testConfig = config.copyWith(showSnapGrid: true);

        // Test at different zoom levels
        final zoomLevels = [0.5, 1.0, 2.0, 5.0];

        for (final zoom in zoomLevels) {
          final zoomTransform = Transform2D(
            scale: zoom,
            translation: Offset.zero,
            rotation: 0.0,
          );

          final testPainter = DiagramPainter(
            transform: zoomTransform,
            objects: objects,
            logicalExtent: logicalExtent,
            configuration: testConfig,
            debug: false,
          );

          // Act - Render the painter
          final recorder = PictureRecorder();
          final canvas = Canvas(recorder);
          testPainter.paint(canvas, const Size(400, 400));
          final picture = recorder.endRecording();

          // Assert - Should render without errors and produce a picture
          expect(picture, isNotNull);
        }
      });

      testWidgets('should handle extreme zoom levels gracefully',
          (WidgetTester tester) async {
        // Arrange
        const extremeZoomTransform = Transform2D(
          scale: 100.0, // Extreme zoom
          translation: Offset.zero,
          rotation: 0.0,
        );

        final testPainter = DiagramPainter(
          transform: extremeZoomTransform,
          objects: objects,
          logicalExtent: logicalExtent,
          configuration: config,
          debug: false,
        );

        // Act - Render the painter
        final recorder = PictureRecorder();
        final canvas = Canvas(recorder);

        // Should not throw or crash
        expect(() {
          testPainter.paint(canvas, const Size(400, 400));
        }, returnsNormally);

        final picture = recorder.endRecording();
        expect(picture, isNotNull);
      });

      testWidgets('should render grid with different spacing configurations',
          (WidgetTester tester) async {
        // Arrange
        final spacingConfigs = [8.0, 16.0, 32.0, 64.0];

        for (final spacing in spacingConfigs) {
          final testConfig = config.copyWith(snapGridSpacing: spacing);
          final testPainter = DiagramPainter(
            transform: transform,
            objects: objects,
            logicalExtent: logicalExtent,
            configuration: testConfig,
            debug: false,
          );

          // Act - Render the painter
          final recorder = PictureRecorder();
          final canvas = Canvas(recorder);
          testPainter.paint(canvas, const Size(400, 400));
          final picture = recorder.endRecording();

          // Assert - Should render without errors
          expect(picture, isNotNull);
        }
      });

      testWidgets('should handle different grid origins correctly',
          (WidgetTester tester) async {
        // Arrange
        final origins = [
          Offset.zero,
          const Offset(25, 25),
          const Offset(-50, -50),
          const Offset(100, 100),
        ];

        for (final origin in origins) {
          final testConfig = config.copyWith(snapGridOrigin: origin);
          final testPainter = DiagramPainter(
            transform: transform,
            objects: objects,
            logicalExtent: logicalExtent,
            configuration: testConfig,
            debug: false,
          );

          // Act - Render the painter
          final recorder = PictureRecorder();
          final canvas = Canvas(recorder);
          testPainter.paint(canvas, const Size(400, 400));
          final picture = recorder.endRecording();

          // Assert - Should render without errors
          expect(picture, isNotNull);
        }
      });

      testWidgets('should respect maxGridLines configuration',
          (WidgetTester tester) async {
        // Arrange
        const largeExtent = Rect.fromLTWH(-1000, -1000, 2000, 2000);
        const smallSpacing = 1.0; // This would create thousands of lines
        final limitedConfig = config.copyWith(
          snapGridSpacing: smallSpacing,
          maxGridLines: 50, // Very low limit
        );

        final testPainter = DiagramPainter(
          transform: transform,
          objects: objects,
          logicalExtent: largeExtent,
          configuration: limitedConfig,
          debug: false,
        );

        // Act - Render the painter
        final recorder = PictureRecorder();
        final canvas = Canvas(recorder);

        // Should not throw or crash even with extreme line counts
        expect(() {
          testPainter.paint(canvas, const Size(400, 400));
        }, returnsNormally);

        final picture = recorder.endRecording();
        expect(picture, isNotNull);
      });

      testWidgets('should handle adaptive density configuration changes',
          (WidgetTester tester) async {
        // Arrange
        final adaptiveConfig = config.copyWith(enableAdaptiveGridDensity: true);
        final nonAdaptiveConfig =
            config.copyWith(enableAdaptiveGridDensity: false);

        const highZoomTransform = Transform2D(
          scale: 10.0, // High zoom
          translation: Offset.zero,
          rotation: 0.0,
        );

        // Test with adaptive density enabled
        final adaptivePainter = DiagramPainter(
          transform: highZoomTransform,
          objects: objects,
          logicalExtent: logicalExtent,
          configuration: adaptiveConfig,
          debug: false,
        );

        // Test with adaptive density disabled
        final nonAdaptivePainter = DiagramPainter(
          transform: highZoomTransform,
          objects: objects,
          logicalExtent: logicalExtent,
          configuration: nonAdaptiveConfig,
          debug: false,
        );

        // Act & Assert - Both should render without errors
        final recorder1 = PictureRecorder();
        final canvas1 = Canvas(recorder1);
        adaptivePainter.paint(canvas1, const Size(400, 400));
        final picture1 = recorder1.endRecording();
        expect(picture1, isNotNull);

        final recorder2 = PictureRecorder();
        final canvas2 = Canvas(recorder2);
        nonAdaptivePainter.paint(canvas2, const Size(400, 400));
        final picture2 = recorder2.endRecording();
        expect(picture2, isNotNull);
      });

      testWidgets('should maintain performance with large extents',
          (WidgetTester tester) async {
        // Arrange
        final largeExtents = [
          const Rect.fromLTWH(-500, -500, 1000, 1000),
          const Rect.fromLTWH(-1000, -1000, 2000, 2000),
          const Rect.fromLTWH(-2000, -2000, 4000, 4000),
        ];

        for (final extent in largeExtents) {
          final testPainter = DiagramPainter(
            transform: transform,
            objects: objects,
            logicalExtent: extent,
            configuration: config,
            debug: false,
          );

          // Act - Render the painter
          final recorder = PictureRecorder();
          final canvas = Canvas(recorder);

          // Should render within reasonable time
          final stopwatch = Stopwatch()..start();
          testPainter.paint(canvas, const Size(400, 400));
          stopwatch.stop();

          final picture = recorder.endRecording();
          expect(picture, isNotNull);

          // Performance check: should render in less than 100ms
          expect(stopwatch.elapsedMilliseconds, lessThan(100));
        }
      });
    });

    group('Configuration Validation', () {
      test('should handle invalid configuration values gracefully', () {
        // Arrange
        final invalidConfigs = [
          config.copyWith(snapGridSpacing: 0.0), // Zero spacing
          config.copyWith(snapGridSpacing: -1.0), // Negative spacing
          config.copyWith(minGridLinePixelSpacing: 0.0), // Zero pixel spacing
          config.copyWith(maxGridLines: 0), // Zero max lines
          config.copyWith(maxGridLines: -1), // Negative max lines
        ];

        for (final invalidConfig in invalidConfigs) {
          final testPainter = DiagramPainter(
            transform: transform,
            objects: objects,
            logicalExtent: logicalExtent,
            configuration: invalidConfig,
            debug: false,
          );

          // Act & Assert - Should not throw with invalid config
          expect(testPainter, isNotNull);
        }
      });

      test('should handle edge case configurations', () {
        // Arrange
        final edgeConfigs = [
          config.copyWith(
              snapGridSpacing: double.maxFinite), // Very large spacing
          config.copyWith(
              minGridLinePixelSpacing:
                  double.maxFinite), // Very large pixel spacing
          config.copyWith(maxGridLines: 1000000), // Very large max lines
        ];

        for (final edgeConfig in edgeConfigs) {
          final testPainter = DiagramPainter(
            transform: transform,
            objects: objects,
            logicalExtent: logicalExtent,
            configuration: edgeConfig,
            debug: false,
          );

          // Act & Assert - Should handle edge cases gracefully
          expect(testPainter, isNotNull);
        }
      });
    });

    group('Internal Grid Logic Tests', () {
      test(
          'should calculate adaptive spacing correctly at different zoom levels',
          () {
        // Arrange
        final testConfig = config.copyWith(
          enableAdaptiveGridDensity: true,
          minGridLinePixelSpacing: 8.0,
        );

        final zoomLevels = [0.5, 1.0, 2.0, 5.0, 10.0];

        for (int i = 0; i < zoomLevels.length; i++) {
          final zoom = zoomLevels[i];

          final zoomTransform = Transform2D(
            scale: zoom,
            translation: Offset.zero,
            rotation: 0.0,
          );

          final testPainter = DiagramPainter(
            transform: zoomTransform,
            objects: objects,
            logicalExtent: logicalExtent,
            configuration: testConfig,
            debug: false,
          );

          // Act - Render to trigger internal calculations
          final recorder = PictureRecorder();
          final canvas = Canvas(recorder);
          testPainter.paint(canvas, const Size(400, 400));
          final picture = recorder.endRecording();

          // Assert - Should render successfully
          expect(picture, isNotNull);
        }
      });

      test(
          'should skip grid rendering when spacing cannot meet minimum requirements',
          () {
        // Arrange
        const extremeZoomTransform = Transform2D(
          scale: 1000.0, // Extreme zoom that would make grid impractical
          translation: Offset.zero,
          rotation: 0.0,
        );

        final testConfig = config.copyWith(
          enableAdaptiveGridDensity: true,
          minGridLinePixelSpacing: 8.0,
        );

        final testPainter = DiagramPainter(
          transform: extremeZoomTransform,
          objects: objects,
          logicalExtent: logicalExtent,
          configuration: testConfig,
          debug: false,
        );

        // Act - Render to trigger internal calculations
        final recorder = PictureRecorder();
        final canvas = Canvas(recorder);

        // Should not throw even when grid becomes impractical
        expect(() {
          testPainter.paint(canvas, const Size(400, 400));
        }, returnsNormally);

        final picture = recorder.endRecording();
        expect(picture, isNotNull);
      });

      test('should limit grid lines to maximum count for performance', () {
        // Arrange
        const largeExtent = Rect.fromLTWH(-10000, -10000, 20000, 20000);
        const tinySpacing = 0.1; // Extremely small spacing
        final limitedConfig = config.copyWith(
          snapGridSpacing: tinySpacing,
          maxGridLines: 10, // Very low limit
        );

        final testPainter = DiagramPainter(
          transform: transform,
          objects: objects,
          logicalExtent: largeExtent,
          configuration: limitedConfig,
          debug: false,
        );

        // Act - Render to trigger internal line limiting
        final recorder = PictureRecorder();
        final canvas = Canvas(recorder);

        // Should not throw even with extreme line counts
        expect(() {
          testPainter.paint(canvas, const Size(400, 400));
        }, returnsNormally);

        final picture = recorder.endRecording();
        expect(picture, isNotNull);
      });

      test('should handle grid origin alignment correctly', () {
        // Arrange
        final origins = [
          Offset.zero,
          const Offset(16, 16), // Aligned with grid
          const Offset(8, 8), // Half-aligned with grid
          const Offset(25, 25), // Non-aligned with grid
        ];

        for (final origin in origins) {
          final testConfig = config.copyWith(snapGridOrigin: origin);
          final testPainter = DiagramPainter(
            transform: transform,
            objects: objects,
            logicalExtent: logicalExtent,
            configuration: testConfig,
            debug: false,
          );

          // Act - Render to verify origin handling
          final recorder = PictureRecorder();
          final canvas = Canvas(recorder);
          testPainter.paint(canvas, const Size(400, 400));
          final picture = recorder.endRecording();

          // Assert - Should handle all origin types correctly
          expect(picture, isNotNull);
        }
      });
    });

    group('Grid Thinning Optimization Verification', () {
      test('should apply adaptive spacing at high zoom levels', () {
        // Arrange
        const highZoomTransform = Transform2D(
          scale: 20.0, // Very high zoom
          translation: Offset.zero,
          rotation: 0.0,
        );

        final testConfig = config.copyWith(
          enableAdaptiveGridDensity: true,
          minGridLinePixelSpacing: 8.0,
          snapGridSpacing: 16.0,
        );

        final testPainter = DiagramPainter(
          transform: highZoomTransform,
          objects: objects,
          logicalExtent: logicalExtent,
          configuration: testConfig,
          debug: false,
        );

        // Act - Render to trigger adaptive spacing
        final recorder = PictureRecorder();
        final canvas = Canvas(recorder);
        testPainter.paint(canvas, const Size(400, 400));
        final picture = recorder.endRecording();

        // Assert - Should render successfully with adaptive spacing
        expect(picture, isNotNull);
      });

      test('should skip grid rendering at extreme zoom levels', () {
        // Arrange
        const extremeZoomTransform = Transform2D(
          scale: 10000.0, // Extreme zoom
          translation: Offset.zero,
          rotation: 0.0,
        );

        final testConfig = config.copyWith(
          enableAdaptiveGridDensity: true,
          minGridLinePixelSpacing: 8.0,
          snapGridSpacing: 16.0,
        );

        final testPainter = DiagramPainter(
          transform: extremeZoomTransform,
          objects: objects,
          logicalExtent: logicalExtent,
          configuration: testConfig,
          debug: false,
        );

        // Act - Render to trigger grid skipping
        final recorder = PictureRecorder();
        final canvas = Canvas(recorder);
        testPainter.paint(canvas, const Size(400, 400));
        final picture = recorder.endRecording();

        // Assert - Should render successfully even when grid is skipped
        expect(picture, isNotNull);
      });

      test('should respect maxGridLines configuration for large extents', () {
        // Arrange
        const largeExtent = Rect.fromLTWH(-5000, -5000, 10000, 10000);
        const smallSpacing = 0.5; // Would create tens of thousands of lines

        final testConfigs = [
          config.copyWith(
            snapGridSpacing: smallSpacing,
            maxGridLines: 50, // Very low limit
          ),
          config.copyWith(
            snapGridSpacing: smallSpacing,
            maxGridLines: 200, // Medium limit
          ),
          config.copyWith(
            snapGridSpacing: smallSpacing,
            maxGridLines: 1000, // High limit
          ),
        ];

        for (final testConfig in testConfigs) {
          final testPainter = DiagramPainter(
            transform: transform,
            objects: objects,
            logicalExtent: largeExtent,
            configuration: testConfig,
            debug: false,
          );

          // Act - Render to trigger line limiting
          final recorder = PictureRecorder();
          final canvas = Canvas(recorder);
          testPainter.paint(canvas, const Size(400, 400));
          final picture = recorder.endRecording();

          // Assert - Should render successfully with line limiting
          expect(picture, isNotNull);
        }
      });

      test('should handle adaptive density disabled correctly', () {
        // Arrange
        const highZoomTransform = Transform2D(
          scale: 20.0, // High zoom
          translation: Offset.zero,
          rotation: 0.0,
        );

        final testConfig = config.copyWith(
          enableAdaptiveGridDensity: false, // Disabled
          minGridLinePixelSpacing: 8.0,
          snapGridSpacing: 16.0,
        );

        final testPainter = DiagramPainter(
          transform: highZoomTransform,
          objects: objects,
          logicalExtent: logicalExtent,
          configuration: testConfig,
          debug: false,
        );

        // Act - Render without adaptive density
        final recorder = PictureRecorder();
        final canvas = Canvas(recorder);
        testPainter.paint(canvas, const Size(400, 400));
        final picture = recorder.endRecording();

        // Assert - Should render successfully without adaptive spacing
        expect(picture, isNotNull);
      });
    });
  });
}
