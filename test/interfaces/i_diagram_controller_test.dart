import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/events/events.dart';

/// Mock implementation of IDiagramController for testing
class MockDiagramController implements IDiagramController {
  final StreamController<DiagramCommand> _commandController =
      StreamController<DiagramCommand>.broadcast();
  final StreamController<PhysicalEvent> _eventController =
      StreamController<PhysicalEvent>.broadcast();

  final List<DiagramObjectEntity> _objects;
  final Rect _logicalExtent;
  final DiagramConfiguration _configuration;

  MockDiagramController({
    List<DiagramObjectEntity>? objects,
    Rect? logicalExtent,
    DiagramConfiguration? configuration,
  })  : _objects = objects ?? [],
        _logicalExtent = logicalExtent ?? const Rect.fromLTWH(0, 0, 1000, 1000),
        _configuration = configuration ?? DiagramConfiguration.defaults;

  @override
  Stream<DiagramCommand> get commandStream => _commandController.stream;

  @override
  StreamSink<PhysicalEvent> get eventsSink => _eventController.sink;

  @override
  Rect get logicalExtent => _logicalExtent;

  @override
  DiagramConfiguration get configuration => _configuration;

  @override
  List<DiagramObjectEntity> get objects => _objects;

  @override
  void dispose() {
    _commandController.close();
    _eventController.close();
  }

  // Helper methods for testing
  void addObject(DiagramObjectEntity object) {
    _objects.add(object);
  }

  void sendCommand(DiagramCommand command) {
    _commandController.add(command);
  }
}

void main() {
  group('IDiagramController Interface Tests', () {
    late MockDiagramController controller;

    setUp(() {
      controller = MockDiagramController();
    });

    tearDown(() {
      controller.dispose();
    });

    group('Basic Interface Compliance', () {
      test('should provide commandStream', () {
        expect(controller.commandStream, isA<Stream<DiagramCommand>>());
      });

      test('should provide eventsSink', () {
        expect(controller.eventsSink, isA<StreamSink<PhysicalEvent>>());
      });

      test('should provide logicalExtent', () {
        expect(controller.logicalExtent, isA<Rect>());
      });

      test('should provide configuration', () {
        expect(controller.configuration, isA<DiagramConfiguration>());
      });

      test('should provide objects list', () {
        expect(controller.objects, isA<List<DiagramObjectEntity>>());
      });

      test('should implement dispose method', () {
        expect(() => controller.dispose(), returnsNormally);
      });
    });

    group('Configuration Defaults', () {
      test('should provide default configuration', () {
        final defaultConfig = DiagramConfiguration.defaults;
        expect(defaultConfig, isNotNull);
        expect(defaultConfig.backgroundColor, isA<Color>());
        expect(defaultConfig.edgeThreshold, isA<double>());
        expect(defaultConfig.maxZoom, isA<double>());
        expect(defaultConfig.minZoom, isA<double>());
      });
    });

    group('Event Handling', () {
      test('should be able to send events through sink', () {
        // Create a mock pointer event for testing
        final mockPointerEvent = PointerDownEvent(
          position: const Offset(200, 200),
          kind: PointerDeviceKind.mouse,
        );

        final event = PhysicalEvent.pointer(
          eventId: 'test-1',
          logicalPosition: const Offset(100, 100),
          screenPosition: const Offset(200, 200),
          transformSnapshot: Transform2D.identity,
          hitList: [],
          borderProximity: BorderProximity.none,
          phase: InteractionPhase.start,
          rawEvent: mockPointerEvent,
          delta: Offset.zero,
        );

        expect(() => controller.eventsSink.add(event), returnsNormally);
      });

      test('should be able to send commands through stream', () {
        const command = DiagramCommand.redraw(
          renderables: [],
          logicalExtent: const Rect.fromLTWH(0, 0, 1000, 1000),
        );

        expect(() => controller.sendCommand(command), returnsNormally);
      });
    });

    group('Object Management', () {
      test('should be able to add objects', () {
        final testObject = TestDiagramObject(
          bounds: const Rect.fromLTWH(0, 0, 100, 100),
          color: Colors.red,
          id: 'test-1',
        );

        controller.addObject(testObject);
        expect(controller.objects.length, 1);
        expect(controller.objects.first, equals(testObject));
      });
    });
  });
}

/// Test implementation of DiagramObjectEntity
class TestDiagramObject extends DiagramObjectEntity {
  final Rect bounds;
  final Color color;
  final String _id;

  TestDiagramObject({
    required this.bounds,
    required this.color,
    required String id,
  }) : _id = id;

  @override
  String get id => _id;

  @override
  Rect get logicalBounds => bounds;

  @override
  void paint(Canvas canvas) {
    final paint = Paint()..color = color;
    canvas.drawRect(bounds, paint);
  }

  @override
  List<Object?> get props => [bounds, color, _id];
}
