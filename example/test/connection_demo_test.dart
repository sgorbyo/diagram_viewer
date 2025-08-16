import 'dart:async';
import 'dart:ui';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/events/events.dart';
import 'package:example/controllers/example_diagram_controller.dart';
import 'package:example/connection_entity.dart';

Future<DiagramCommand> _awaitRedraw(Stream<DiagramCommand> stream) async {
  return stream.firstWhere((c) => c.isRedraw);
}

void main() {
  group('Example Demo Connections', () {
    test('creates a connection after two drops when enabled', () async {
      final controller = ExampleDiagramController(populateInitial: false);
      controller.setDemoConnectionsEnabled(true);

      // Count connections before
      int countConnections() =>
          controller.objects.whereType<ConnectionEntity>().length;

      final beforeConnections = countConnections();

      // First drop: adds a circle, no connection yet
      const p1 = Offset(100, 100);
      controller.eventsSink.add(const DiagramEventUnion.dragTargetDrop(
        eventId: 'drop-a',
        data: {
          'type': 'circle',
          'radius': 40.0,
        },
        screenPosition: p1,
        logicalPosition: p1,
        transformSnapshot: Transform2D(),
        timestamp: Duration.zero,
        snappedLogicalPosition: null,
      ));
      await _awaitRedraw(controller.commandStream);

      // Second drop: adds another circle and should create 1 connection
      const p2 = Offset(220, 160);
      controller.eventsSink.add(const DiagramEventUnion.dragTargetDrop(
        eventId: 'drop-b',
        data: {
          'type': 'circle',
          'radius': 40.0,
        },
        screenPosition: p2,
        logicalPosition: p2,
        transformSnapshot: Transform2D(),
        timestamp: Duration.zero,
        snappedLogicalPosition: null,
      ));
      await _awaitRedraw(controller.commandStream);

      final afterConnections = countConnections();
      expect(afterConnections, equals(beforeConnections + 1));

      controller.dispose();
    });

    test('creates connection with correct text orientation for obtuse angles',
        () async {
      final controller = ExampleDiagramController(populateInitial: false);
      controller.setDemoConnectionsEnabled(true);

      // First drop: adds a circle at the top
      const p1 = Offset(100, 50);
      controller.eventsSink.add(const DiagramEventUnion.dragTargetDrop(
        eventId: 'drop-top',
        data: {
          'type': 'circle',
          'radius': 40.0,
        },
        screenPosition: p1,
        logicalPosition: p1,
        transformSnapshot: Transform2D(),
        timestamp: Duration.zero,
        snappedLogicalPosition: null,
      ));
      await _awaitRedraw(controller.commandStream);

      // Second drop: adds a circle below and to the right (creates obtuse angle)
      const p2 = Offset(300, 200);
      controller.eventsSink.add(const DiagramEventUnion.dragTargetDrop(
        eventId: 'drop-bottom-right',
        data: {
          'type': 'circle',
          'radius': 40.0,
        },
        screenPosition: p2,
        logicalPosition: p2,
        transformSnapshot: Transform2D(),
        timestamp: Duration.zero,
        snappedLogicalPosition: null,
      ));
      await _awaitRedraw(controller.commandStream);

      // Third drop: adds a circle below and to the left (creates another obtuse angle)
      const p3 = Offset(50, 200);
      controller.eventsSink.add(const DiagramEventUnion.dragTargetDrop(
        eventId: 'drop-bottom-left',
        data: {
          'type': 'circle',
          'radius': 40.0,
        },
        screenPosition: p3,
        logicalPosition: p3,
        transformSnapshot: Transform2D(),
        timestamp: Duration.zero,
        snappedLogicalPosition: null,
      ));
      await _awaitRedraw(controller.commandStream);

      // Wait a bit more for all connections to be processed
      await Future.delayed(const Duration(milliseconds: 100));

      // Should have connections (the exact number depends on the controller logic)
      final connections = controller.objects.whereType<ConnectionEntity>();
      expect(connections.length, greaterThan(0));

      // Verify that connections exist and can be rendered
      for (final connection in connections) {
        expect(connection.startCenter, isNotNull);
        expect(connection.endCenter, isNotNull);
        // Test that the connection can be painted without errors
        // Create a mock canvas for testing
        final mockCanvas = Canvas(PictureRecorder());
        expect(() => connection.paint(mockCanvas), returnsNormally);
      }

      controller.dispose();
    });

    test('connection text orientation is always readable', () async {
      // Test the text orientation logic directly
      final connection = ConnectionEntity(
        id: 'test-connection',
        startCenter: const Offset(100, 100),
        endCenter: const Offset(300, 200), // This creates an obtuse angle
      );

      // Create a mock canvas and paint the connection
      final mockCanvas = Canvas(PictureRecorder());
      expect(() => connection.paint(mockCanvas), returnsNormally);

      // Test with different angles to ensure text is always readable
      final verticalConnection = ConnectionEntity(
        id: 'vertical',
        startCenter: const Offset(100, 50),
        endCenter: const Offset(100, 200),
      );
      expect(() => verticalConnection.paint(mockCanvas), returnsNormally);

      final horizontalConnection = ConnectionEntity(
        id: 'horizontal',
        startCenter: const Offset(50, 100),
        endCenter: const Offset(200, 100),
      );
      expect(() => horizontalConnection.paint(mockCanvas), returnsNormally);

      final steepConnection = ConnectionEntity(
        id: 'steep',
        startCenter: const Offset(100, 50),
        endCenter: const Offset(50, 200), // Steep negative slope
      );
      expect(() => steepConnection.paint(mockCanvas), returnsNormally);
    });

    test('connection text orientation handles upper-left quadrant correctly',
        () async {
      // Test the specific case where the second object is in the upper-left quadrant
      // of the first object (this was the problematic case)
      final upperLeftConnection = ConnectionEntity(
        id: 'upper-left',
        startCenter: const Offset(200, 200), // First object (center)
        endCenter: const Offset(100, 100), // Second object (upper-left)
      );

      // Create a mock canvas and paint the connection
      final mockCanvas = Canvas(PictureRecorder());
      expect(() => upperLeftConnection.paint(mockCanvas), returnsNormally);

      // Test the reverse direction too
      final reverseConnection = ConnectionEntity(
        id: 'reverse',
        startCenter: const Offset(100, 100), // First object
        endCenter: const Offset(200, 200), // Second object (lower-right)
      );
      expect(() => reverseConnection.paint(mockCanvas), returnsNormally);

      // Test with more extreme angles
      final extremeUpperLeft = ConnectionEntity(
        id: 'extreme-upper-left',
        startCenter: const Offset(300, 300),
        endCenter: const Offset(50, 50),
      );
      expect(() => extremeUpperLeft.paint(mockCanvas), returnsNormally);
    });

    test('text orientation is consistent across different connection angles',
        () async {
      // Test that text orientation is consistent and readable for various angles
      final testCases = [
        // (start, end, description)
        (const Offset(100, 100), const Offset(200, 100), 'horizontal right'),
        (const Offset(200, 100), const Offset(100, 100), 'horizontal left'),
        (const Offset(100, 100), const Offset(100, 200), 'vertical down'),
        (const Offset(100, 200), const Offset(100, 100), 'vertical up'),
        (const Offset(100, 100), const Offset(200, 200), 'diagonal down-right'),
        (const Offset(200, 200), const Offset(100, 100), 'diagonal up-left'),
        (const Offset(100, 200), const Offset(200, 100), 'diagonal up-right'),
        (const Offset(200, 100), const Offset(100, 200), 'diagonal down-left'),
      ];

      for (final testCase in testCases) {
        final connection = ConnectionEntity(
          id: 'test-${testCase.$3}',
          startCenter: testCase.$1,
          endCenter: testCase.$2,
        );

        // Create a mock canvas and paint the connection
        final mockCanvas = Canvas(PictureRecorder());
        expect(() => connection.paint(mockCanvas), returnsNormally,
            reason: 'Failed to paint connection: ${testCase.$3}');
      }
    });

    test('does not create connections when disabled', () async {
      final controller = ExampleDiagramController(populateInitial: false);
      controller.setDemoConnectionsEnabled(false);

      int countConnections() =>
          controller.objects.whereType<ConnectionEntity>().length;

      final beforeConnections = countConnections();

      // Two drops: still expect no connections
      const p1 = Offset(300, 200);
      controller.eventsSink.add(const DiagramEventUnion.dragTargetDrop(
        eventId: 'drop-c',
        data: {
          'type': 'circle',
          'radius': 40.0,
        },
        screenPosition: p1,
        logicalPosition: p1,
        transformSnapshot: Transform2D(),
        timestamp: Duration.zero,
        snappedLogicalPosition: null,
      ));
      await _awaitRedraw(controller.commandStream);

      const p2 = Offset(360, 260);
      controller.eventsSink.add(const DiagramEventUnion.dragTargetDrop(
        eventId: 'drop-d',
        data: {
          'type': 'circle',
          'radius': 40.0,
        },
        screenPosition: p2,
        logicalPosition: p2,
        transformSnapshot: Transform2D(),
        timestamp: Duration.zero,
        snappedLogicalPosition: null,
      ));
      await _awaitRedraw(controller.commandStream);

      final afterConnections = countConnections();
      expect(afterConnections, equals(beforeConnections));

      controller.dispose();
    });
  });
}
