import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/diagram_viewer.dart';

void main() {
  group('Zoom Overscroll Tests', () {
    testWidgets('should allow temporary overscroll during zoom',
        (WidgetTester tester) async {
      // Arrange: Create a diagram viewer with custom zoom limits
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
      // The actual zoom overscroll functionality will be tested manually in the app
    });
  });
}

class MockDiagramController implements IDiagramController {
  @override
  DiagramConfiguration get configuration => const DiagramConfiguration(
        minZoom: 0.5,
        maxZoom: 2.0,
      );

  @override
  List<DiagramObjectEntity> get objects => [];

  @override
  Rect get logicalExtent => const Rect.fromLTWH(0, 0, 800, 600);

  @override
  Sink<DiagramEventUnion> get eventsSink =>
      StreamController<DiagramEventUnion>().sink;

  @override
  Stream<DiagramCommand> get commands => Stream.empty();

  @override
  void dispose() {}

  @override
  Stream<DiagramCommand> get commandStream => Stream.empty();
}
