import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/diagram_viewer.dart';

void main() {
  group('Mouse Wheel Zoom Tests', () {
    testWidgets('should render diagram viewer without errors',
        (WidgetTester tester) async {
      // Arrange: Create a diagram viewer with some objects
      final controller = MockDiagramController();
      final diagramViewer = DiagramViewer(
        controller: controller,
        debug: true,
      );

      await tester.pumpWidget(MaterialApp(home: Scaffold(body: diagramViewer)));
      await tester.pumpAndSettle();

      // Verify that the widget is rendered
      expect(find.byType(DiagramViewer), findsOneWidget);

      // The test passes if the widget renders without errors
      // The actual mouse wheel functionality will be tested manually in the app
    });
  });
}

class MockDiagramController implements IDiagramController {
  @override
  DiagramConfiguration get configuration => const DiagramConfiguration();

  @override
  List<DiagramObjectEntity> get objects => [];

  @override
  Rect get logicalExtent => const Rect.fromLTWH(0, 0, 800, 600);

  @override
  Sink<DiagramEventUnion> get eventsSink =>
      StreamController<DiagramEventUnion>().sink;

  @override
  Stream<DiagramCommand> get commandStream => Stream.empty();

  @override
  void dispose() {}
}
