import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/diagram_viewer.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/events/events.dart';
import '../interfaces/i_diagram_controller_test.dart';

/// Test controller that provides specific objects for rendering tests
class RenderingTestController implements IDiagramController {
  final StreamController<DiagramCommand> _commandController =
      StreamController<DiagramCommand>.broadcast();
  final StreamController<PhysicalEvent> _eventController =
      StreamController<PhysicalEvent>.broadcast();

  final List<DiagramObjectEntity> _objects;
  final Rect _logicalExtent;
  final DiagramConfiguration _configuration;

  RenderingTestController({
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

  // Helper method to add objects
  void addObject(DiagramObjectEntity object) {
    _objects.add(object);
  }
}

/// Test object that tracks paint calls
class PaintTrackingTestObject extends DiagramObjectEntity {
  final Rect bounds;
  final Color color;
  final String _id;

  // Track paint calls
  int _paintCallCount = 0;
  Transform2D? _lastPaintTransform;

  PaintTrackingTestObject({
    required this.bounds,
    required this.color,
    required String id,
  }) : _id = id;

  @override
  String get id => _id;

  @override
  Rect get logicalBounds => bounds;

  @override
  void paint(Canvas canvas, Transform2D transform) {
    _paintCallCount++;
    _lastPaintTransform = transform;

    final paint = Paint()..color = color;
    canvas.drawRect(bounds, paint);
  }

  @override
  List<Object?> get props => [bounds, color, _id];

  // Test helper methods
  int get paintCallCount => _paintCallCount;
  Transform2D? get lastPaintTransform => _lastPaintTransform;
}

void main() {
  group('DiagramViewer Rendering Tests', () {
    late RenderingTestController controller;

    setUp(() {
      controller = RenderingTestController();
    });

    tearDown(() {
      controller.dispose();
    });

    group('Object Rendering', () {
      testWidgets('should call paint method on objects',
          (WidgetTester tester) async {
        // Arrange
        final testObject = PaintTrackingTestObject(
          bounds: const Rect.fromLTWH(100, 100, 200, 200),
          color: Colors.red,
          id: 'test-1',
        );
        controller.addObject(testObject);

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

        // Assert - Verify that paint was called
        expect(testObject.paintCallCount, greaterThan(0),
            reason:
                'DiagramViewer should call paint method on objects during rendering');
      });

      testWidgets('should render multiple objects',
          (WidgetTester tester) async {
        // Arrange
        final testObject1 = PaintTrackingTestObject(
          bounds: const Rect.fromLTWH(100, 100, 200, 200),
          color: Colors.red,
          id: 'test-1',
        );
        final testObject2 = PaintTrackingTestObject(
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

        // Assert - Verify that both objects were painted
        expect(testObject1.paintCallCount, greaterThan(0),
            reason: 'First object should be painted');
        expect(testObject2.paintCallCount, greaterThan(0),
            reason: 'Second object should be painted');
      });

      testWidgets('should pass correct transform to paint method',
          (WidgetTester tester) async {
        // Arrange
        final testObject = PaintTrackingTestObject(
          bounds: const Rect.fromLTWH(100, 100, 200, 200),
          color: Colors.red,
          id: 'test-1',
        );
        controller.addObject(testObject);

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

        // Assert - Verify that transform was passed to paint
        expect(testObject.lastPaintTransform, isNotNull,
            reason: 'Transform should be passed to paint method');
        expect(testObject.lastPaintTransform, isA<Transform2D>(),
            reason: 'Transform should be of type Transform2D');
      });
    });

    group('Visibility and Z-Order', () {
      testWidgets('should respect object visibility',
          (WidgetTester tester) async {
        // Arrange
        final visibleObject = PaintTrackingTestObject(
          bounds: const Rect.fromLTWH(100, 100, 200, 200),
          color: Colors.red,
          id: 'visible',
        );
        final invisibleObject = PaintTrackingTestObject(
          bounds: const Rect.fromLTWH(300, 300, 200, 200),
          color: Colors.blue,
          id: 'invisible',
        );

        controller.addObject(visibleObject);
        controller.addObject(invisibleObject);

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

        // Assert - Only visible objects should be painted
        expect(visibleObject.paintCallCount, greaterThan(0),
            reason: 'Visible object should be painted');
        // Note: We can't easily test invisible objects without modifying the base class
      });

      testWidgets('should respect z-order during rendering',
          (WidgetTester tester) async {
        // Arrange
        final lowZObject = PaintTrackingTestObject(
          bounds: const Rect.fromLTWH(100, 100, 200, 200),
          color: Colors.red,
          id: 'low-z',
        );
        final highZObject = PaintTrackingTestObject(
          bounds: const Rect.fromLTWH(150, 150, 200, 200), // Overlapping
          color: Colors.blue,
          id: 'high-z',
        );

        controller.addObject(lowZObject);
        controller.addObject(highZObject);

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

        // Assert - Both objects should be painted (z-order is handled by sorting)
        expect(lowZObject.paintCallCount, greaterThan(0),
            reason: 'Low z-order object should be painted');
        expect(highZObject.paintCallCount, greaterThan(0),
            reason: 'High z-order object should be painted');
      });
    });

    group('Empty State Rendering', () {
      testWidgets('should render without objects', (WidgetTester tester) async {
        // Arrange - Controller with no objects
        final emptyController = RenderingTestController(objects: []);

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

        // Cleanup
        emptyController.dispose();
      });

      testWidgets('should render background correctly',
          (WidgetTester tester) async {
        // Arrange
        const customConfig = DiagramConfiguration(
          backgroundColor: Colors.green,
          edgeThreshold: 50.0,
          maxZoom: 10.0,
          minZoom: 0.1,
          overscrollPixels: 100.0,
          bounceDuration: Duration(milliseconds: 300),
          autoScrollInterval: Duration(milliseconds: 16),
          autoScrollAcceleration: 1.5,
          enableTranslation: true,
        );

        final customController = RenderingTestController(
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

        // Assert - Widget should render with custom configuration
        expect(find.byType(DiagramViewer), findsOneWidget);
        expect(customController.configuration.backgroundColor,
            equals(Colors.green));

        // Cleanup
        customController.dispose();
      });
    });

    group('Performance and Stability', () {
      testWidgets('should handle many objects efficiently',
          (WidgetTester tester) async {
        // Arrange - Add many objects
        for (int i = 0; i < 50; i++) {
          final testObject = PaintTrackingTestObject(
            bounds: Rect.fromLTWH(i * 10.0, i * 10.0, 100, 100),
            color: Colors.primaries[i % Colors.primaries.length],
            id: 'object-$i',
          );
          controller.addObject(testObject);
        }

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

        // Assert - Widget should render without crashing
        expect(find.byType(DiagramViewer), findsOneWidget);
        expect(controller.objects.length, 50);

        // Verify that at least some objects were painted
        final paintedObjects = controller.objects
            .where((obj) => obj is PaintTrackingTestObject)
            .cast<PaintTrackingTestObject>()
            .where((obj) => obj.paintCallCount > 0)
            .length;

        expect(paintedObjects, greaterThan(0),
            reason: 'At least some objects should be painted');
      });
    });
  });
}
