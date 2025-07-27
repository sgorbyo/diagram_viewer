import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/diagram_viewer.dart';
import '../interfaces/i_diagram_controller_test.dart';

/// Integration test controller that simulates a real-world scenario
class IntegrationTestController implements IDiagramController {
  final StreamController<DiagramCommand> _commandController =
      StreamController<DiagramCommand>.broadcast();
  final StreamController<PhysicalEvent> _eventController =
      StreamController<PhysicalEvent>.broadcast();

  final List<TestDiagramObject> _objects;
  final Rect _logicalExtent;
  final DiagramConfiguration _configuration;

  // Track received events for testing
  final List<PhysicalEvent> _receivedEvents = [];
  final List<DiagramCommand> _sentCommands = [];

  IntegrationTestController({
    List<TestDiagramObject>? objects,
    Rect? logicalExtent,
    DiagramConfiguration? configuration,
  })  : _objects = objects ?? [],
        _logicalExtent = logicalExtent ?? const Rect.fromLTWH(0, 0, 1000, 1000),
        _configuration = configuration ?? DiagramConfiguration.defaults {
    _setupEventHandling();
  }

  void _setupEventHandling() {
    _eventController.stream.listen(_handlePhysicalEvent);
  }

  void _handlePhysicalEvent(PhysicalEvent event) {
    _receivedEvents.add(event);

    event.when(
      pointer: (eventId, logicalPosition, screenPosition, transformSnapshot,
          hitList, borderProximity, phase, rawEvent, delta, currentViewport) {
        if (hitList.isNotEmpty) {
          // Object manipulation - update model and redraw
          _updateObjectPosition(hitList.first, logicalPosition);
          _sendRedrawCommand();
        } else {
          // No object hit - apply default pan behavior
          _sendDefaultBehaviorCommand(event);
        }
      },
      gesture: (eventId,
          logicalPosition,
          screenPosition,
          transformSnapshot,
          hitList,
          borderProximity,
          phase,
          rawEvent,
          scale,
          rotation,
          currentViewport) {
        // Handle gesture events (zoom, rotation)
        _sendDefaultBehaviorCommand(event);
      },
      keyboard: (eventId, logicalPosition, transformSnapshot, hitList,
          borderProximity, rawEvent, pressedKeys, currentViewport) {
        // Handle keyboard shortcuts
        if (pressedKeys.contains(LogicalKeyboardKey.space)) {
          _sendRedrawCommand();
        }
      },
    );
  }

  void _updateObjectPosition(DiagramObjectEntity object, Offset newPosition) {
    // In a real implementation, you would update the model here
    // For testing, we just track that this method was called
    final _ = object as TestDiagramObject;
  }

  void _sendRedrawCommand() {
    final command = DiagramCommand.redraw(
      renderables: _objects,
      logicalExtent: _logicalExtent,
    );
    _sentCommands.add(command);
    _commandController.add(command);
  }

  void _sendDefaultBehaviorCommand(PhysicalEvent event) {
    final command = DiagramCommand.applyDefaultPanZoom(origin: event);
    _sentCommands.add(command);
    _commandController.add(command);
  }

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
  void addObject(TestDiagramObject object) {
    _objects.add(object);
  }

  List<PhysicalEvent> get receivedEvents => List.unmodifiable(_receivedEvents);
  List<DiagramCommand> get sentCommands => List.unmodifiable(_sentCommands);
}

void main() {
  group('DiagramViewer Integration Tests', () {
    late IntegrationTestController controller;

    setUp(() {
      controller = IntegrationTestController();
    });

    tearDown(() {
      controller.dispose();
    });

    group('Full System Integration', () {
      testWidgets('should handle complete event flow',
          (WidgetTester tester) async {
        // Arrange
        final testObject = TestDiagramObject(
          bounds: const Rect.fromLTWH(100, 100, 200, 200),
          color: Colors.red,
          id: 'test-1',
        );
        controller.addObject(testObject);

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: controller,
              ),
            ),
          ),
        );

        // Act - Simulate user interaction
        await tester.tap(find.byType(DiagramViewer));
        await tester.pump();

        // Assert - Verify that events were processed
        expect(controller.receivedEvents.length, greaterThan(0));
        expect(controller.sentCommands.length, greaterThan(0));
      });

      testWidgets('should maintain state consistency',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: controller,
              ),
            ),
          ),
        );

        // Act - Add objects after widget is built
        final testObject1 = TestDiagramObject(
          bounds: const Rect.fromLTWH(100, 100, 200, 200),
          color: Colors.red,
          id: 'test-1',
        );
        final testObject2 = TestDiagramObject(
          bounds: const Rect.fromLTWH(300, 300, 200, 200),
          color: Colors.blue,
          id: 'test-2',
        );

        controller.addObject(testObject1);
        controller.addObject(testObject2);

        await tester.pump();

        // Assert - Widget should handle state changes without crashing
        expect(find.byType(DiagramViewer), findsOneWidget);
        expect(controller.objects.length, 2);
      });
    });

    group('Event Processing', () {
      testWidgets('should process pointer events correctly',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: controller,
              ),
            ),
          ),
        );

        // Act - Simulate pointer events
        await tester.tap(find.byType(DiagramViewer));
        await tester.pump();

        // Assert
        expect(controller.receivedEvents.length, greaterThan(0));

        final firstEvent = controller.receivedEvents.first;
        expect(firstEvent.isPointer, isTrue);
      });

      testWidgets('should send appropriate commands for different events',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: controller,
              ),
            ),
          ),
        );

        // Act - Simulate interaction
        await tester.tap(find.byType(DiagramViewer));
        await tester.pump();

        // Assert
        expect(controller.sentCommands.length, greaterThan(0));

        // Verify that commands are of the expected types
        for (final command in controller.sentCommands) {
          expect(command, isA<DiagramCommand>());
        }
      });
    });

    group('Configuration Integration', () {
      testWidgets('should use custom configuration',
          (WidgetTester tester) async {
        // Arrange
        final customConfig = DiagramConfiguration(
          backgroundColor: Colors.green,
          edgeThreshold: 75.0,
          maxZoom: 8.0,
          minZoom: 0.2,
          bounceDuration: const Duration(milliseconds: 500),
          autoScrollInterval: const Duration(milliseconds: 32),
          autoScrollAcceleration: 2.5,
        );

        final customController = IntegrationTestController(
          configuration: customConfig,
        );

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: customController,
              ),
            ),
          ),
        );

        // Act
        await tester.pump();

        // Assert
        expect(find.byType(DiagramViewer), findsOneWidget);
        expect(customController.configuration.backgroundColor,
            equals(Colors.green));
        expect(customController.configuration.edgeThreshold, equals(75.0));

        // Cleanup
        customController.dispose();
      });
    });

    group('Performance and Stability', () {
      testWidgets('should handle rapid state changes',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: controller,
              ),
            ),
          ),
        );

        // Act - Rapidly add and remove objects
        for (int i = 0; i < 10; i++) {
          final testObject = TestDiagramObject(
            bounds: Rect.fromLTWH(i * 50.0, i * 50.0, 100, 100),
            color: Colors.primaries[i % Colors.primaries.length],
            id: 'test-$i',
          );
          controller.addObject(testObject);
          await tester.pump();
        }

        // Assert - Widget should remain stable
        expect(find.byType(DiagramViewer), findsOneWidget);
        expect(controller.objects.length, 10);
      });

      testWidgets('should handle widget disposal gracefully',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: controller,
              ),
            ),
          ),
        );

        // Act - Dispose the widget
        await tester.pumpWidget(Container());

        // Assert - Controller should still be functional
        expect(
            () => controller.addObject(TestDiagramObject(
                  bounds: const Rect.fromLTWH(0, 0, 100, 100),
                  color: Colors.red,
                  id: 'disposal-test',
                )),
            returnsNormally);
      });
    });
  });
}
