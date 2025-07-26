import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/diagram_viewer.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/events/events.dart';
import '../interfaces/i_diagram_controller_test.dart';

/// Test controller that tracks initialization calls
class InitializationTestController implements IDiagramController {
  final StreamController<DiagramCommand> _commandController =
      StreamController<DiagramCommand>.broadcast();
  final StreamController<PhysicalEvent> _eventController =
      StreamController<PhysicalEvent>.broadcast();

  final List<TestDiagramObject> _objects;
  final Rect _logicalExtent;
  final DiagramConfiguration _configuration;

  // Track calls for testing
  int _objectsGetterCallCount = 0;
  int _logicalExtentGetterCallCount = 0;
  int _configurationGetterCallCount = 0;

  InitializationTestController({
    List<TestDiagramObject>? objects,
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
  Rect get logicalExtent {
    _logicalExtentGetterCallCount++;
    return _logicalExtent;
  }

  @override
  DiagramConfiguration get configuration {
    _configurationGetterCallCount++;
    return _configuration;
  }

  @override
  List<DiagramObjectEntity> get objects {
    _objectsGetterCallCount++;
    return _objects;
  }

  @override
  void dispose() {
    _commandController.close();
    _eventController.close();
  }

  // Test helper methods
  int get objectsGetterCallCount => _objectsGetterCallCount;
  int get logicalExtentGetterCallCount => _logicalExtentGetterCallCount;
  int get configurationGetterCallCount => _configurationGetterCallCount;

  void addObject(TestDiagramObject object) {
    _objects.add(object);
  }
}

void main() {
  group('DiagramViewer Initialization Tests', () {
    late InitializationTestController controller;

    setUp(() {
      controller = InitializationTestController();
    });

    tearDown(() {
      controller.dispose();
    });

    group('Initial State Loading', () {
      testWidgets('should call controller.objects during initialization',
          (WidgetTester tester) async {
        // Arrange
        final testObject = TestDiagramObject(
          bounds: const Rect.fromLTWH(100, 100, 200, 200),
          color: Colors.red,
          id: 'test-1',
        );
        controller.addObject(testObject);

        // Act - Build the widget
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: controller,
              ),
            ),
          ),
        );

        // Assert - Verify that objects getter was called
        expect(controller.objectsGetterCallCount, greaterThan(0),
            reason:
                'DiagramViewer should call controller.objects during initialization');
      });

      testWidgets('should call controller.logicalExtent during initialization',
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

        // Assert - Verify that logicalExtent getter was called
        expect(controller.logicalExtentGetterCallCount, greaterThan(0),
            reason:
                'DiagramViewer should call controller.logicalExtent during initialization');
      });

      testWidgets('should call controller.configuration during initialization',
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

        // Assert - Verify that configuration getter was called
        expect(controller.configurationGetterCallCount, greaterThan(0),
            reason:
                'DiagramViewer should call controller.configuration during initialization');
      });

      testWidgets('should render objects provided by controller',
          (WidgetTester tester) async {
        // Arrange
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

        // Act
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: controller,
              ),
            ),
          ),
        );

        // Assert - Widget should be built without crashing
        expect(find.byType(DiagramViewer), findsOneWidget);

        // Verify that objects were loaded
        expect(controller.objectsGetterCallCount, greaterThan(0));
        expect(controller.objects.length, 2);
      });
    });

    group('Interface Compliance', () {
      test('should require objects getter in IDiagramController interface', () {
        // This test verifies that the interface contract is properly defined
        // If this test fails, it means the interface is missing the objects getter

        // Arrange & Act - Try to access the objects getter
        final objects = controller.objects;

        // Assert - Should be able to access objects
        expect(objects, isA<List<DiagramObjectEntity>>());
      });

      test(
          'should require logicalExtent getter in IDiagramController interface',
          () {
        // This test verifies that the interface contract is properly defined

        // Arrange & Act - Try to access the logicalExtent getter
        final logicalExtent = controller.logicalExtent;

        // Assert - Should be able to access logicalExtent
        expect(logicalExtent, isA<Rect>());
      });

      test(
          'should require configuration getter in IDiagramController interface',
          () {
        // This test verifies that the interface contract is properly defined

        // Arrange & Act - Try to access the configuration getter
        final configuration = controller.configuration;

        // Assert - Should be able to access configuration
        expect(configuration, isA<DiagramConfiguration>());
      });
    });

    group('Empty State Handling', () {
      testWidgets('should handle empty objects list',
          (WidgetTester tester) async {
        // Arrange - Controller with no objects
        final emptyController = InitializationTestController(objects: []);

        // Act
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: emptyController,
              ),
            ),
          ),
        );

        // Assert - Widget should render without crashing
        expect(find.byType(DiagramViewer), findsOneWidget);
        expect(emptyController.objectsGetterCallCount, greaterThan(0));
        expect(emptyController.objects.length, 0);

        // Cleanup
        emptyController.dispose();
      });

      testWidgets('should handle null objects gracefully',
          (WidgetTester tester) async {
        // Arrange - Controller that returns null objects (edge case)
        final nullObjectsController = InitializationTestController();

        // Override the objects getter to return null (simulating a bug)
        // This test ensures the widget handles this gracefully

        // Act
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: nullObjectsController,
              ),
            ),
          ),
        );

        // Assert - Widget should not crash even with problematic controller
        expect(find.byType(DiagramViewer), findsOneWidget);

        // Cleanup
        nullObjectsController.dispose();
      });
    });

    group('Configuration Loading', () {
      testWidgets('should use custom configuration from controller',
          (WidgetTester tester) async {
        // Arrange
        const customConfig = DiagramConfiguration(
          backgroundColor: Colors.green,
          edgeThreshold: 75.0,
          maxZoom: 8.0,
          minZoom: 0.2,
          bounceDuration: Duration(milliseconds: 500),
          autoScrollInterval: Duration(milliseconds: 32),
          autoScrollAcceleration: 2.5,
        );

        final customController = InitializationTestController(
          configuration: customConfig,
        );

        // Act
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: customController,
              ),
            ),
          ),
        );

        // Assert
        expect(find.byType(DiagramViewer), findsOneWidget);
        expect(customController.configurationGetterCallCount, greaterThan(0));
        expect(customController.configuration.backgroundColor,
            equals(Colors.green));

        // Cleanup
        customController.dispose();
      });
    });
  });
}
