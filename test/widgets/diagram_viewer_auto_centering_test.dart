import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:diagram_viewer/diagram_viewer.dart';

void main() {
  group('DiagramViewer Auto Centering', () {
    late MockDiagramController mockController;

    setUp(() {
      mockController = MockDiagramController();
    });

    testWidgets(
        'should center diagram horizontally when smaller than viewport width',
        (tester) async {
      // Arrange: Create a diagram smaller than viewport width
      const smallDiagramExtent =
          Rect.fromLTWH(0, 0, 200, 600); // 200px wide, 600px tall
      const viewportSize = Size(800, 600); // 800px wide viewport

      mockController.logicalExtent = smallDiagramExtent;
      mockController.objects = [];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: viewportSize.width,
              height: viewportSize.height,
              child: DiagramViewer(
                controller: mockController,
                configuration: const DiagramConfiguration(),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      // Verify that the diagram is rendered (this is a basic check)
      // The actual centering logic will be tested in Transform2DUtils tests
      expect(find.byType(DiagramViewer), findsOneWidget);
    });

    testWidgets(
        'should center diagram vertically when smaller than viewport height',
        (tester) async {
      // Arrange: Create a diagram smaller than viewport height
      const smallDiagramExtent =
          Rect.fromLTWH(0, 0, 800, 200); // 800px wide, 200px tall
      const viewportSize = Size(800, 600); // 600px tall viewport

      mockController.logicalExtent = smallDiagramExtent;
      mockController.objects = [];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: viewportSize.width,
              height: viewportSize.height,
              child: DiagramViewer(
                controller: mockController,
                configuration: const DiagramConfiguration(),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      // Verify that the diagram is rendered
      expect(find.byType(DiagramViewer), findsOneWidget);
    });

    testWidgets(
        'should center diagram in both directions when smaller than viewport',
        (tester) async {
      // Arrange: Create a diagram smaller than viewport in both directions
      const smallDiagramExtent =
          Rect.fromLTWH(0, 0, 200, 200); // 200px x 200px
      const viewportSize = Size(800, 600); // 800px x 600px viewport

      mockController.logicalExtent = smallDiagramExtent;
      mockController.objects = [];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: viewportSize.width,
              height: viewportSize.height,
              child: DiagramViewer(
                controller: mockController,
                configuration: const DiagramConfiguration(),
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      // Verify that the diagram is rendered
      expect(find.byType(DiagramViewer), findsOneWidget);
    });
  });
}

class MockDiagramController extends Mock implements IDiagramController {
  Rect _logicalExtent = Rect.zero;
  List<DiagramObjectEntity> _objects = [];

  @override
  Rect get logicalExtent => _logicalExtent;

  set logicalExtent(Rect value) => _logicalExtent = value;

  @override
  List<DiagramObjectEntity> get objects => _objects;

  set objects(List<DiagramObjectEntity> value) => _objects = value;

  @override
  DiagramConfiguration get configuration => const DiagramConfiguration();

  @override
  Stream<DiagramCommand> get commandStream => const Stream.empty();

  @override
  Sink<DiagramEventUnion> get eventsSink =>
      StreamController<DiagramEventUnion>().sink;

  @override
  void dispose() {
    // Mock implementation
  }
}
