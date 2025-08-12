import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/widgets/diagram_viewer.dart';
import 'package:diagram_viewer/events/events.dart';
import 'test_diagram_controller.dart';

void main() {
  testWidgets('SetCursor command updates MouseRegion key', (tester) async {
    final controller = TestDiagramController();
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: DiagramViewer(controller: controller),
      ),
    ));

    // Initially basic
    expect(find.byKey(const ValueKey('cursor_basic')), findsOneWidget);

    controller.commandStream.listen((_) {});
    controller.eventsSink; // keep reference

    // Send setCursor command
    controller.commandStream; // ensure stream is active
    controller.commandStream; // no-op
    controller.commandStream; // no-op
    // Directly add command via controller helper is not exposed here,
    // so use a local DiagramViewerContent not accessible. Instead, rebuild not needed:
    // We'll simulate by sending the command through a StreamController in TestDiagramController.
    controller
        .sendCommand(const DiagramCommand.setCursor(effect: CursorEffect.grab));
    await tester.pump();

    expect(find.byKey(const ValueKey('cursor_grab')), findsOneWidget);
  });
}
