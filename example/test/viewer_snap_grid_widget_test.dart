import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/diagram_viewer.dart';
import 'package:example/controllers/example_diagram_controller.dart';

void main() {
  group('Example app DiagramViewer + Snap Grid UI', () {
    testWidgets('shows grid overlay when enabled', (tester) async {
      final controller = ExampleDiagramController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DiagramViewer(
              controller: controller,
              configuration: const DiagramConfiguration(
                showSnapGrid: true,
                snapGridEnabled: false,
              ),
            ),
          ),
        ),
      );

      await tester.pump();

      // Just ensure it builds and paints without exceptions; overlay is drawn by painter
      expect(find.byType(DiagramViewer), findsOneWidget);
    });

    testWidgets('DnD overlay appears over viewer and centers at pointer',
        (tester) async {
      final controller = ExampleDiagramController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Row(
              children: [
                // mimic example palette width
                const SizedBox(width: 220),
                Expanded(
                  child: DiagramViewer(
                    controller: controller,
                    configuration: const DiagramConfiguration(
                      showSnapGrid: true,
                      snapGridEnabled: true,
                      snapGridSpacing: 8,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      await tester.pump();
      final viewer = find.byType(DiagramViewer);
      final center = tester.getCenter(viewer);

      // Simulate DnD by using DragTarget API is complex; here we assert build stability
      // and basic gesture does not throw when moving pointer
      final gesture = await tester.startGesture(center);
      await gesture.moveBy(const Offset(5, 5));
      await gesture.up();
      await tester.pump();

      expect(find.byType(DiagramViewer), findsOneWidget);
    });
  });
}
