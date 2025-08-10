import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/diagram_viewer.dart';
import 'package:diagram_viewer/events/events.dart';

// Removed unused imports

void main() {
  group('DiagramViewer Focal Point Stability', () {
    test('Transform2D should maintain focal point during zoom operations', () {
      // Arrange: Create a transform and focal point
      final transform = const Transform2D();
      final focalPoint = Offset(400, 300); // Screen coordinates
      final logicalFocalPoint = transform.physicalToLogical(focalPoint);

      // Act: Apply zoom operations
      var currentTransform = transform;

      // First zoom in
      currentTransform = currentTransform.applyZoom(1.5, logicalFocalPoint);

      // Second zoom in
      currentTransform = currentTransform.applyZoom(1.2, logicalFocalPoint);

      // Third zoom out
      currentTransform = currentTransform.applyZoom(0.8, logicalFocalPoint);

      // Assert: The focal point in screen coordinates should remain the same
      final focalPointInScreenAfterZoom =
          currentTransform.logicalToPhysical(logicalFocalPoint);

      // The focal point should be very close to the original focal point
      expect(focalPointInScreenAfterZoom.dx, closeTo(focalPoint.dx, 1.0));
      expect(focalPointInScreenAfterZoom.dy, closeTo(focalPoint.dy, 1.0));
    });

    test(
        'Transform2D should maintain focal point during realistic touchpad zoom simulation',
        () {
      // Arrange: Create a transform and focal point
      final transform = const Transform2D();
      final focalPoint = Offset(400, 300); // Screen coordinates
      final logicalFocalPoint = transform.physicalToLogical(focalPoint);

      // Act: Simulate realistic touchpad zoom with incremental steps
      var currentTransform = transform;
      final zoomSteps = [1.1, 1.05, 1.02, 0.98, 0.95, 0.9];

      for (final zoomStep in zoomSteps) {
        currentTransform =
            currentTransform.applyZoom(zoomStep, logicalFocalPoint);
      }

      // Assert: The focal point in screen coordinates should remain the same
      final focalPointInScreenAfterZoom =
          currentTransform.logicalToPhysical(logicalFocalPoint);

      // The focal point should be very close to the original focal point
      expect(focalPointInScreenAfterZoom.dx, closeTo(focalPoint.dx, 1.0));
      expect(focalPointInScreenAfterZoom.dy, closeTo(focalPoint.dy, 1.0));
    });

    test('Transform2D should maintain focal point during large zoom operations',
        () {
      // Arrange: Create a transform and focal point
      final transform = const Transform2D();
      final focalPoint = Offset(400, 300); // Screen coordinates
      final logicalFocalPoint = transform.physicalToLogical(focalPoint);

      // Act: Apply large zoom operations
      var currentTransform = transform;

      // Large zoom in
      currentTransform = currentTransform.applyZoom(3.0, logicalFocalPoint);

      // Large zoom out
      currentTransform = currentTransform.applyZoom(0.3, logicalFocalPoint);

      // Assert: The focal point in screen coordinates should remain the same
      final focalPointInScreenAfterZoom =
          currentTransform.logicalToPhysical(logicalFocalPoint);

      // The focal point should be very close to the original focal point
      expect(focalPointInScreenAfterZoom.dx, closeTo(focalPoint.dx, 1.0));
      expect(focalPointInScreenAfterZoom.dy, closeTo(focalPoint.dy, 1.0));
    });

    test(
        'Transform2D should maintain focal point at different screen positions',
        () {
      // Arrange: Test different focal points
      final focalPoints = [
        Offset(0, 0), // Top-left
        Offset(400, 300), // Center
        Offset(800, 600), // Bottom-right
        Offset(200, 150), // Top-left quadrant
        Offset(600, 450), // Bottom-right quadrant
      ];

      for (final focalPoint in focalPoints) {
        final transform = const Transform2D();
        final logicalFocalPoint = transform.physicalToLogical(focalPoint);

        // Act: Apply zoom operations
        var currentTransform = transform;
        currentTransform = currentTransform.applyZoom(2.0, logicalFocalPoint);
        currentTransform = currentTransform.applyZoom(0.5, logicalFocalPoint);

        // Assert: The focal point in screen coordinates should remain the same
        final focalPointInScreenAfterZoom =
            currentTransform.logicalToPhysical(logicalFocalPoint);

        // The focal point should be very close to the original focal point
        expect(focalPointInScreenAfterZoom.dx, closeTo(focalPoint.dx, 1.0),
            reason: 'Focal point X should be stable at ${focalPoint.dx}');
        expect(focalPointInScreenAfterZoom.dy, closeTo(focalPoint.dy, 1.0),
            reason: 'Focal point Y should be stable at ${focalPoint.dy}');
      }
    });
  });
}
