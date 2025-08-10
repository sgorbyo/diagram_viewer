import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/diagram_viewer.dart';
import '../interfaces/i_diagram_controller_test.dart';

void main() {
  group('DiagramViewer Artifacts Prevention Tests', () {
    late MockDiagramController mockController;

    setUp(() {
      mockController = MockDiagramController();
    });

    tearDown(() {
      mockController.dispose();
    });

    group('Background Consistency', () {
      testWidgets(
          'should maintain consistent background during rapid extent changes',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
              ),
            ),
          ),
        );

        // Act - Send multiple rapid redraw commands with different extents
        // This simulates the scenario where objects move quickly and cause rapid extent updates
        for (int i = 0; i < 10; i++) {
          final extent =
              Rect.fromLTWH(i * 50.0, i * 50.0, 200 + i * 10, 200 + i * 10);
          mockController.sendCommand(DiagramCommand.redraw(
            renderables: [],
            logicalExtent: extent,
          ));
          await tester.pump();
        }

        // Assert - Widget should handle rapid changes without crashing
        expect(find.byType(DiagramViewer), findsOneWidget);
      });

      testWidgets('should handle extreme extent changes',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
              ),
            ),
          ),
        );

        // Act - Test extreme extent changes that could cause artifacts
        const smallExtent = Rect.fromLTWH(0, 0, 100, 100);
        const largeExtent = Rect.fromLTWH(-1000, -1000, 3000, 3000);
        const normalExtent = Rect.fromLTWH(100, 100, 500, 500);

        mockController.sendCommand(const DiagramCommand.redraw(
          renderables: [],
          logicalExtent: smallExtent,
        ));
        await tester.pump();

        mockController.sendCommand(const DiagramCommand.redraw(
          renderables: [],
          logicalExtent: largeExtent,
        ));
        await tester.pump();

        mockController.sendCommand(const DiagramCommand.redraw(
          renderables: [],
          logicalExtent: normalExtent,
        ));
        await tester.pump();

        // Assert - Widget should handle extreme changes without crashing
        expect(find.byType(DiagramViewer), findsOneWidget);
      });
    });

    group('Transform Consistency', () {
      testWidgets('should maintain background consistency during transforms',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
              ),
            ),
          ),
        );

        // Act - Apply various transforms that could cause artifacts
        final transforms = [
          const Transform2D(scale: 0.5, translation: Offset(100, 100)),
          const Transform2D(scale: 2.0, translation: Offset(-200, -200)),
          const Transform2D(scale: 1.0, translation: Offset(0, 0)),
          const Transform2D(scale: 3.0, translation: Offset(500, 500)),
        ];

        for (final transform in transforms) {
          mockController
              .sendCommand(DiagramCommand.setTransform(transform: transform));
          await tester.pump();
        }

        // Assert - Widget should handle transforms without crashing
        expect(find.byType(DiagramViewer), findsOneWidget);
      });

      testWidgets('should handle rapid transform changes',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
              ),
            ),
          ),
        );

        // Act - Rapid transform changes (simulating pan/zoom gestures)
        for (int i = 0; i < 20; i++) {
          final transform = Transform2D(
            scale: 1.0 + (i * 0.1),
            translation: Offset(i * 10.0, i * 5.0),
          );
          mockController
              .sendCommand(DiagramCommand.setTransform(transform: transform));
          await tester.pump();
        }

        // Assert - Widget should handle rapid transforms without crashing
        expect(find.byType(DiagramViewer), findsOneWidget);
      });
    });

    group('Combined Operations', () {
      testWidgets('should handle extent and transform changes together',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
              ),
            ),
          ),
        );

        // Act - Combine extent and transform changes
        for (int i = 0; i < 5; i++) {
          // Change extent
          final extent =
              Rect.fromLTWH(i * 100.0, i * 100.0, 300 + i * 50, 300 + i * 50);
          mockController.sendCommand(DiagramCommand.redraw(
            renderables: [],
            logicalExtent: extent,
          ));
          await tester.pump();

          // Change transform
          final transform = Transform2D(
            scale: 1.0 + (i * 0.2),
            translation: Offset(i * 50.0, i * 25.0),
          );
          mockController
              .sendCommand(DiagramCommand.setTransform(transform: transform));
          await tester.pump();
        }

        // Assert - Widget should handle combined changes without crashing
        expect(find.byType(DiagramViewer), findsOneWidget);
      });

      testWidgets('should handle default pan/zoom with extent changes',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
              ),
            ),
          ),
        );

        // Act - Simulate default pan/zoom operations with extent changes
        const event = PhysicalEvent.pointer(
          eventId: 'test-1',
          logicalPosition: Offset(100, 100),
          screenPosition: Offset(100, 100),
          transformSnapshot: Transform2D(),
          hitList: [],
          borderProximity: BorderProximity.none,
          phase: InteractionPhase.update,
          rawEvent: PointerMoveEvent(position: Offset(100, 100)),
          delta: Offset(10, 10),
          currentViewport: Rect.fromLTWH(0, 0, 800, 600),
          pressedMouseButtons: {},
          pressedKeys: {},
          activeInteraction: null,
        );

        // Send default pan/zoom command
        mockController
            .sendCommand(const DiagramCommand.applyDefaultPanZoom(origin: event));
        await tester.pump();

        // Change extent
        mockController.sendCommand(const DiagramCommand.redraw(
          renderables: [],
          logicalExtent: Rect.fromLTWH(50, 50, 400, 400),
        ));
        await tester.pump();

        // Assert - Widget should handle the combination without crashing
        expect(find.byType(DiagramViewer), findsOneWidget);
      });
    });

    group('Stress Testing', () {
      testWidgets('should handle continuous rapid changes',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
              ),
            ),
          ),
        );

        // Act - Continuous rapid changes (stress test)
        for (int i = 0; i < 50; i++) {
          // Alternate between extent and transform changes
          if (i % 2 == 0) {
            final extent = Rect.fromLTWH(
              (i * 20) % 500,
              (i * 15) % 500,
              200 + (i % 10) * 20,
              200 + (i % 10) * 20,
            );
            mockController.sendCommand(DiagramCommand.redraw(
              renderables: [],
              logicalExtent: extent,
            ));
          } else {
            final transform = Transform2D(
              scale: 0.5 + (i % 10) * 0.1,
              translation: Offset((i * 10) % 200, (i * 5) % 200),
            );
            mockController
                .sendCommand(DiagramCommand.setTransform(transform: transform));
          }
          await tester.pump();
        }

        // Assert - Widget should remain stable under stress
        expect(find.byType(DiagramViewer), findsOneWidget);
      });

      testWidgets('should handle large object sets with extent changes',
          (WidgetTester tester) async {
        // Arrange
        final largeObjectSet = <TestDiagramObject>[];
        for (int i = 0; i < 100; i++) {
          largeObjectSet.add(TestDiagramObject(
            bounds: Rect.fromLTWH(i * 10.0, i * 10.0, 50, 50),
            color: Colors.primaries[i % Colors.primaries.length],
            id: 'stress-test-$i',
          ));
        }

        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
              ),
            ),
          ),
        );

        // Act - Send large object set with changing extents
        for (int i = 0; i < 10; i++) {
          final extent = Rect.fromLTWH(
            i * 50.0,
            i * 50.0,
            1000 + i * 100,
            1000 + i * 100,
          );
          mockController.sendCommand(DiagramCommand.redraw(
            renderables: largeObjectSet,
            logicalExtent: extent,
          ));
          await tester.pump();
        }

        // Assert - Widget should handle large object sets without crashing
        expect(find.byType(DiagramViewer), findsOneWidget);
      });
    });

    group('Edge Cases', () {
      testWidgets('should handle zero-sized extent',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
              ),
            ),
          ),
        );

        // Act - Test zero-sized extent
        const zeroExtent = Rect.fromLTWH(0, 0, 0, 0);
        mockController.sendCommand(const DiagramCommand.redraw(
          renderables: [],
          logicalExtent: zeroExtent,
        ));
        await tester.pump();

        // Assert - Widget should handle zero extent without crashing
        expect(find.byType(DiagramViewer), findsOneWidget);
      });

      testWidgets('should handle negative extent coordinates',
          (WidgetTester tester) async {
        // Arrange
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: DiagramViewer(
                controller: mockController,
              ),
            ),
          ),
        );

        // Act - Test negative coordinates
        const negativeExtent = Rect.fromLTWH(-100, -100, 200, 200);
        mockController.sendCommand(const DiagramCommand.redraw(
          renderables: [],
          logicalExtent: negativeExtent,
        ));
        await tester.pump();

        // Assert - Widget should handle negative coordinates without crashing
        expect(find.byType(DiagramViewer), findsOneWidget);
      });
    });
  });
}
