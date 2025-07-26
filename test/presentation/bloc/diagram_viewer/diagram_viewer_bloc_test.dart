import 'dart:async';

import 'package:diagram_viewer/diagram_content_repository.dart';
import 'package:diagram_viewer/diagram_object_entity.dart';
import 'package:diagram_viewer/presentation/bloc/diagram_viewer/diagram_viewer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

class MockDiagramContentRepository extends Mock
    implements DiagramContentRepository {}

class MockDiagramObjectEntity extends Mock implements DiagramObjectEntity {}

void main() {
  group('DiagramViewerBloc', () {
    late DiagramViewerBloc bloc;
    late MockDiagramContentRepository mockRepository;
    late StreamController<List<DiagramObjectEntity>> streamController;

    setUp(() {
      mockRepository = MockDiagramContentRepository();
      streamController = StreamController<List<DiagramObjectEntity>>();
      when(() => mockRepository.stream)
          .thenAnswer((_) => streamController.stream);
      bloc = DiagramViewerBloc(contentRepository: mockRepository);
    });

    test('initial state is correct', () {
      expect(
        bloc.state,
        isA<DiagramViewerState>().having(
          (s) => s.mapOrNull(initial: (_) => true),
          'is initial state',
          isTrue,
        ),
      );
    });

    blocTest<DiagramViewerBloc, DiagramViewerState>(
      'emits new state with content when repository updates',
      build: () {
        // Return the existing bloc instance for this test
        return bloc;
      },
      act: (bloc) {
        final mockObject = MockDiagramObjectEntity();
        when(() => mockObject.enclosingRect())
            .thenReturn(const Rect.fromLTWH(0, 0, 100, 100));
        streamController.add([mockObject]);
      },
      expect: () => [
        isA<DiagramViewerState>()
            .having(
              (s) => s.mapOrNull(initial: (s) => s.content.length),
              'content length',
              1,
            )
            .having(
              (s) => s.mapOrNull(initial: (s) => s.diagramRect),
              'diagramRect',
              const Rect.fromLTWH(0, 0, 100, 100),
            ),
      ],
    );
  });
}
