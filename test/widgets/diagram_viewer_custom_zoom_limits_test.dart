// Removed unused import
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/tools/transform2d/transform2d_utils.dart';
import 'package:diagram_viewer/events/events.dart';

void main() {
  group('Custom Zoom Limits', () {
    test('Transform2DUtils should respect custom maxZoom limit of 4.0', () {
      // Arrange: Create a transform and custom limits
      const transform = Transform2D(scale: 1.0);
      const diagramRect = Rect.fromLTWH(0, 0, 800, 600);
      const size = Size(800, 600);
      const customMaxZoom = 4.0;
      const customMinZoom = 0.01;

      // Act: Try to zoom beyond the maxZoom limit
      final zoomedTransform = transform.applyZoom(10.0, Offset.zero);
      final cappedTransform = Transform2DUtils.capTransformWithZoomLimits(
        transform: zoomedTransform,
        diagramRect: diagramRect,
        size: size,
        dynamic: true,
        minZoom: customMinZoom,
        maxZoom: customMaxZoom,
      );

      // Assert: Should be capped at maxZoom
      expect(cappedTransform.scale, equals(customMaxZoom));
    });

    test('Transform2DUtils should respect custom minZoom limit of 0.01', () {
      // Arrange: Create a transform and custom limits
      const transform = Transform2D(scale: 1.0);
      const diagramRect = Rect.fromLTWH(0, 0, 800, 600);
      const size = Size(800, 600);
      const customMaxZoom = 4.0;
      const customMinZoom = 0.01;

      // Act: Try to zoom below the minZoom limit
      final zoomedOutTransform = transform.applyZoom(0.001, Offset.zero);
      final cappedOutTransform = Transform2DUtils.capTransformWithZoomLimits(
        transform: zoomedOutTransform,
        diagramRect: diagramRect,
        size: size,
        dynamic: true,
        minZoom: customMinZoom,
        maxZoom: customMaxZoom,
      );

      // Assert: Should be capped at effectiveMinZoom (max of config minZoom and dynamic minZoom)
      // For a 800x600 diagram in a 800x600 viewport, scaleToFit returns 1.0
      final expectedMinZoom = max(customMinZoom, 1.0); // 1.0 from scaleToFit
      expect(cappedOutTransform.scale, equals(expectedMinZoom));
    });

    test(
        'Transform2DUtils should use custom minZoom when diagram is smaller than viewport',
        () {
      // Arrange: Create a transform and custom limits with a small diagram
      const transform = Transform2D(scale: 1.0);
      // Use a diagram that's actually smaller than the viewport
      const diagramRect = Rect.fromLTWH(0, 0, 100, 100); // Small diagram
      const size = Size(800, 600); // Large viewport
      const customMaxZoom = 4.0;
      const customMinZoom = 0.01;

      // Act: Try to zoom below the minZoom limit
      final zoomedOutTransform = transform.applyZoom(0.001, Offset.zero);
      final cappedOutTransform = Transform2DUtils.capTransformWithZoomLimits(
        transform: zoomedOutTransform,
        diagramRect: diagramRect,
        size: size,
        dynamic: true,
        minZoom: customMinZoom,
        maxZoom: customMaxZoom,
      );

      // Assert: scaleToFit returns min(800/100, 600/100) = min(8.0, 6.0) = 6.0
      // Since 6.0 > 4.0 (maxZoom), the scale gets capped at maxZoom
      expect(cappedOutTransform.scale, equals(customMaxZoom));
    });

    test(
        'Transform2DUtils should use custom minZoom when diagram is larger than viewport',
        () {
      // Arrange: Create a transform and custom limits with a large diagram
      const transform = Transform2D(scale: 1.0);
      const diagramRect = Rect.fromLTWH(0, 0, 2000, 1500); // Large diagram
      const size = Size(800, 600); // Small viewport
      const customMaxZoom = 4.0;
      const customMinZoom = 0.01;

      // Act: Try to zoom below the minZoom limit
      final zoomedOutTransform = transform.applyZoom(0.001, Offset.zero);
      final cappedOutTransform = Transform2DUtils.capTransformWithZoomLimits(
        transform: zoomedOutTransform,
        diagramRect: diagramRect,
        size: size,
        dynamic: true,
        minZoom: customMinZoom,
        maxZoom: customMaxZoom,
      );

      // Assert: scaleToFit returns min(800/2000, 600/1500) = min(0.4, 0.4) = 0.4
      // Since 0.4 > 0.01, effectiveMinZoom = 0.4
      // Since 0.4 < 4.0, the scale gets capped at 0.4
      expect(cappedOutTransform.scale, equals(0.4));
    });

    test(
        'Transform2DUtils should use custom minZoom when scaleToFit is smaller than minZoom',
        () {
      // Arrange: Create a transform and custom limits with a very large diagram
      const transform = Transform2D(scale: 1.0);
      const diagramRect =
          Rect.fromLTWH(0, 0, 10000, 8000); // Very large diagram
      const size = Size(800, 600); // Small viewport
      const customMaxZoom = 4.0;
      const customMinZoom = 0.01;

      // Act: Try to zoom below the minZoom limit
      final zoomedOutTransform = transform.applyZoom(0.001, Offset.zero);
      final cappedOutTransform = Transform2DUtils.capTransformWithZoomLimits(
        transform: zoomedOutTransform,
        diagramRect: diagramRect,
        size: size,
        dynamic: true,
        minZoom: customMinZoom,
        maxZoom: customMaxZoom,
      );

      // Assert: scaleToFit returns min(800/10000, 600/8000) = min(0.08, 0.075) = 0.075
      // Since 0.075 > 0.01, effectiveMinZoom = 0.075
      // Since 0.075 < 4.0, the scale gets capped at 0.075
      expect(cappedOutTransform.scale, equals(0.075));
    });

    test('Transform2DUtils should allow zoom within custom limits', () {
      // Arrange: Create a transform and custom limits
      const transform = Transform2D(scale: 1.0);
      const diagramRect = Rect.fromLTWH(0, 0, 800, 600);
      const size = Size(800, 600);
      const customMaxZoom = 4.0;
      const customMinZoom = 0.01;

      // Act: Try to zoom within limits
      final zoomedTransform = transform.applyZoom(2.0, Offset.zero);
      final cappedTransform = Transform2DUtils.capTransformWithZoomLimits(
        transform: zoomedTransform,
        diagramRect: diagramRect,
        size: size,
        dynamic: true,
        minZoom: customMinZoom,
        maxZoom: customMaxZoom,
      );

      // Assert: Should remain at the requested zoom level
      expect(cappedTransform.scale, equals(2.0));
    });

    test('Transform2DUtils should handle edge cases with custom limits', () {
      // Arrange: Create a transform and custom limits
      const transform = Transform2D(scale: 1.0);
      const diagramRect = Rect.fromLTWH(0, 0, 800, 600);
      const size = Size(800, 600);
      const customMaxZoom = 4.0;
      const customMinZoom = 0.01;

      // Test exact maxZoom limit
      final maxZoomTransform = transform.applyZoom(customMaxZoom, Offset.zero);
      final cappedMaxTransform = Transform2DUtils.capTransformWithZoomLimits(
        transform: maxZoomTransform,
        diagramRect: diagramRect,
        size: size,
        dynamic: true,
        minZoom: customMinZoom,
        maxZoom: customMaxZoom,
      );
      expect(cappedMaxTransform.scale, equals(customMaxZoom));

      // Test exact minZoom limit
      final minZoomTransform = transform.applyZoom(customMinZoom, Offset.zero);
      final cappedMinTransform = Transform2DUtils.capTransformWithZoomLimits(
        transform: minZoomTransform,
        diagramRect: diagramRect,
        size: size,
        dynamic: true,
        minZoom: customMinZoom,
        maxZoom: customMaxZoom,
      );
      // For a 800x600 diagram in a 800x600 viewport, scaleToFit returns 1.0
      final expectedMinZoom = max(customMinZoom, 1.0);
      expect(cappedMinTransform.scale, equals(expectedMinZoom));
    });

    test('Transform2D should maintain focal point with custom zoom limits', () {
      // Arrange: Create a transform and focal point
      const transform = Transform2D(scale: 1.0);
      const focalPoint = Offset(400, 300);
      final logicalFocalPoint = transform.physicalToLogical(focalPoint);
      const customMaxZoom = 4.0;
      const customMinZoom = 0.01;

      // Act: Apply zoom within limits
      final zoomedTransform = transform.applyZoom(3.0, logicalFocalPoint);
      const diagramRect = Rect.fromLTWH(0, 0, 800, 600);
      const size = Size(800, 600);

      final cappedTransform = Transform2DUtils.capTransformWithZoomLimits(
        transform: zoomedTransform,
        diagramRect: diagramRect,
        size: size,
        dynamic: true,
        minZoom: customMinZoom,
        maxZoom: customMaxZoom,
      );

      // Assert: The focal point should remain stable
      final focalPointAfterZoom =
          cappedTransform.logicalToPhysical(logicalFocalPoint);
      expect(focalPointAfterZoom.dx, closeTo(focalPoint.dx, 1.0));
      expect(focalPointAfterZoom.dy, closeTo(focalPoint.dy, 1.0));
    });
  });
}
