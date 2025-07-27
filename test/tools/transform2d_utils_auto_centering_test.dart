import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/tools/transform2d/transform2d_utils.dart';
import 'package:diagram_viewer/events/events.dart';

void main() {
  group('Transform2DUtils Auto-Centering', () {
    test('should center diagram horizontally when smaller than viewport width',
        () {
      // Arrange: Diagram smaller than viewport width
      final diagramRect =
          Rect.fromLTWH(0, 0, 200, 400); // 200px wide, 400px tall
      final viewportSize = Size(800, 600); // 800px wide viewport
      final transform = const Transform2D();

      // Act: Apply auto-centering
      final result = Transform2DUtils.capTransformWithZoomLimits(
        transform: transform,
        diagramRect: diagramRect,
        size: viewportSize,
        dynamic: true,
        minZoom: 0.1,
        maxZoom: 10.0,
      );

      // Assert: Diagram should be centered horizontally
      // The diagram is 200px wide, scaled to 300px (200 * 1.5), viewport is 800px wide
      // Center should be at (800 - 300) / 2 = 250px from left
      expect(result.translation.dx, closeTo(250, 1.0));

      // Vertical translation should be 0 (diagram fills height)
      expect(result.translation.dy, closeTo(0, 1.0));
    });

    test('should center diagram vertically when smaller than viewport height',
        () {
      // Arrange: Diagram smaller than viewport height
      final diagramRect =
          Rect.fromLTWH(0, 0, 800, 200); // 800px wide, 200px tall
      final viewportSize = Size(800, 600); // 600px tall viewport
      final transform = const Transform2D();

      // Act: Apply auto-centering
      final result = Transform2DUtils.capTransformWithZoomLimits(
        transform: transform,
        diagramRect: diagramRect,
        size: viewportSize,
        dynamic: true,
        minZoom: 0.1,
        maxZoom: 10.0,
      );

      // Assert: Diagram should be centered vertically
      // The diagram is 200px tall, viewport is 600px tall
      // Center should be at (600 - 200) / 2 = 200px from top
      expect(result.translation.dy, closeTo(200, 1.0));

      // Horizontal translation should be 0 (diagram fills width)
      expect(result.translation.dx, closeTo(0, 1.0));
    });

    test('should center diagram in both directions when smaller than viewport',
        () {
      // Arrange: Diagram smaller than viewport in both directions
      final diagramRect = Rect.fromLTWH(0, 0, 200, 200); // 200px x 200px
      final viewportSize = Size(800, 600); // 800px x 600px viewport
      final transform = const Transform2D();

      // Act: Apply auto-centering
      final result = Transform2DUtils.capTransformWithZoomLimits(
        transform: transform,
        diagramRect: diagramRect,
        size: viewportSize,
        dynamic: true,
        minZoom: 0.1,
        maxZoom: 10.0,
      );

      // Assert: Diagram should be centered in both directions
      // Horizontal: (800 - 600) / 2 = 100px (200 * 3 = 600)
      expect(result.translation.dx, closeTo(100, 1.0));

      // Vertical: (600 - 600) / 2 = 0px (200 * 3 = 600)
      expect(result.translation.dy, closeTo(0, 1.0));
    });

    test('should maintain centering after zoom operations', () {
      // Arrange: Diagram smaller than viewport width
      final diagramRect = Rect.fromLTWH(0, 0, 200, 400);
      final viewportSize = Size(800, 600);
      final transform = const Transform2D().applyZoom(2.0, Offset(400, 300));

      // Act: Apply auto-centering
      final result = Transform2DUtils.capTransformWithZoomLimits(
        transform: transform,
        diagramRect: diagramRect,
        size: viewportSize,
        dynamic: true,
        minZoom: 0.1,
        maxZoom: 10.0,
      );

      // Assert: After zoom, the diagram should still be centered horizontally
      // The diagram is now 400px wide (200 * 2), viewport is 800px wide
      // Center should be at (800 - 400) / 2 = 200px from left
      expect(result.translation.dx, closeTo(200, 1.0));
    });

    test('should not center when diagram is larger than viewport', () {
      // Arrange: Diagram larger than viewport
      final diagramRect =
          Rect.fromLTWH(0, 0, 1000, 800); // Larger than viewport
      final viewportSize = Size(800, 600);
      final transform = const Transform2D();

      // Act: Apply auto-centering
      final result = Transform2DUtils.capTransformWithZoomLimits(
        transform: transform,
        diagramRect: diagramRect,
        size: viewportSize,
        dynamic: true,
        minZoom: 0.1,
        maxZoom: 10.0,
      );

      // Assert: Should not center when diagram is larger than viewport
      // The transform should be scaled to fit, not centered
      expect(result.scale,
          lessThanOrEqualTo(1.0)); // Should be scaled down or equal
      expect(result.translation.dx, closeTo(0, 1.0)); // No horizontal centering
      expect(result.translation.dy, closeTo(0, 1.0)); // No vertical centering
    });

    test('should handle zero-sized diagram gracefully', () {
      // Arrange: Zero-sized diagram
      final diagramRect = Rect.zero;
      final viewportSize = Size(800, 600);
      final transform = const Transform2D();

      // Act: Apply auto-centering
      final result = Transform2DUtils.capTransformWithZoomLimits(
        transform: transform,
        diagramRect: diagramRect,
        size: viewportSize,
        dynamic: true,
        minZoom: 0.1,
        maxZoom: 10.0,
      );

      // Assert: Should handle gracefully without errors
      expect(result, isNotNull);
      expect(result.scale, greaterThan(0));
    });
  });
}
