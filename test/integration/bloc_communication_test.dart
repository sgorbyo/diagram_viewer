import 'dart:async';
import 'package:diagram_viewer/diagram_content_repository.dart';
import 'package:diagram_viewer/diagram_object_entity.dart';
import 'package:diagram_viewer/diagram_viewer.dart';
import 'package:diagram_viewer/presentation/bloc/diagram_viewer/diagram_viewer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MockDiagramContentRepository extends Mock
    implements DiagramContentRepository {}

class MockDiagramObjectEntity extends Mock implements DiagramObjectEntity {}

void main() {
  group('DiagramViewer Integration Tests', () {
    late MockDiagramContentRepository mockRepository;
    late DiagramViewerBloc diagramViewerBloc;

    setUp(() {
      mockRepository = MockDiagramContentRepository();
      when(() => mockRepository.stream).thenAnswer((_) => const Stream.empty());

      diagramViewerBloc = DiagramViewerBloc(contentRepository: mockRepository);
    });

    tearDown(() {
      diagramViewerBloc.close();
    });

    testWidgets('Widget loads content and displays it',
        (WidgetTester tester) async {
      // Arrange
      final mockObject = MockDiagramObjectEntity();
      const rect = Rect.fromLTWH(0, 0, 100, 100);
      when(() => mockObject.enclosingRect()).thenReturn(rect);

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<DiagramViewerBloc>.value(
            value: diagramViewerBloc,
            child: DiagramViewer(diagramContentRepository: mockRepository),
          ),
        ),
      );

      // Act
      diagramViewerBloc.add(DiagramViewerEvent.contentChanged([mockObject]));

      // Allow up to 1 second for the bloc to process the event
      bool updated = false;
      final sw = Stopwatch()..start();
      while (sw.elapsed < const Duration(seconds: 1)) {
        await tester.pump(const Duration(milliseconds: 20));
        debugPrint(
            '⏱ elapsed ${sw.elapsedMilliseconds}ms, content length: ${diagramViewerBloc.state.content.length}');
        if (diagramViewerBloc.state.content.isNotEmpty) {
          updated = true;
          break;
        }
      }
      expect(updated, isTrue, reason: 'Bloc should emit state with content');

      // Rebuild UI to reflect new state
      await tester.pump();

      // Assert that CustomPaint widgets are present
      expect(
        find.byType(CustomPaint),
        findsWidgets,
        reason: 'CustomPaint should be rendered',
      );
    });
  });
}
