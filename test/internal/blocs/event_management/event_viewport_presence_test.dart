import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/internal/blocs/event_management/event_management_bloc.dart';
import 'package:diagram_viewer/internal/blocs/event_management/event_management_event.dart';
import 'package:diagram_viewer/events/events.dart';

void main() {
  test('PhysicalEvent carries a non-zero viewport when configured', () async {
    final bloc = EventManagementBloc();
    bloc.configureDependencies(viewportSize: const Size(800, 600));
    final emitted = <PhysicalEvent>[];
    bloc.physicalEvents.listen(emitted.add);

    const down = PointerDownEvent(position: Offset(10, 20), pointer: 1);
    bloc.add(const EventManagementEvent.startPointerEvent(
      rawEvent: down,
      logicalPosition: Offset(5, 10),
      hitResults: [],
      pressedKeys: {},
    ));
    await Future<void>.delayed(const Duration(milliseconds: 5));

    expect(emitted, isNotEmpty);
    final pv = emitted.first;
    pv.map(
      pointer: (p) {
        expect(p.currentViewport.width, greaterThan(0));
        expect(p.currentViewport.height, greaterThan(0));
      },
      gesture: (_) => fail('Expected pointer event'),
      keyboard: (_) => fail('Expected pointer event'),
      dndTargetEnter: (_) => fail('Expected pointer event'),
      dndTargetOver: (_) => fail('Expected pointer event'),
      dndTargetLeave: (_) => fail('Expected pointer event'),
      dndTargetDrop: (_) => fail('Expected pointer event'),
    );

    await bloc.close();
  });
}
