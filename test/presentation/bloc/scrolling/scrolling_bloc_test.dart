import 'dart:async';
import 'dart:ui';

import 'package:bloc_test/bloc_test.dart';
import 'package:diagram_viewer/diagram_content_repository.dart';
import 'package:diagram_viewer/diagram_object_entity.dart';
import 'package:diagram_viewer/presentation/bloc/scrolling/scrolling_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vector_math/vector_math_64.dart';

class MockDiagramContentRepository extends Mock
    implements DiagramContentRepository {
  final StreamController<List<DiagramObjectEntity>> _controller =
      StreamController<List<DiagramObjectEntity>>();

  // static MockDocumentsDirectoryStreamController testStreamController =
  //     MockDocumentsDirectoryStreamController();
  // MockDocumentsDirectoryRepository({@factoryParam required UserId userId}) {
  //   throwOnMissingStub(this);
  //   when(this.documentModels)
  //       .thenAnswer((invocation) => testStreamController.stream);
  // }
}

void main() {
  group('ScrollingBloc usual operations', () {
    late ScrollingBloc scrollingBloc;
    late MockDiagramContentRepository contentRepository;

    setUp(() {
      contentRepository = MockDiagramContentRepository();
      when(() => contentRepository.stream)
          .thenAnswer((_) => contentRepository._controller.stream);
    });

    blocTest(
      "Go through External Drag Operation and verify that the continueDrag "
      "operation does not issue a new state",
      build: () => ScrollingBloc(contentRepository: contentRepository),
      seed: () => ScrollingState.idle(
        matrix: Matrix4.identity(),
        content: [],
        size: const Size(100, 100),
        diagramRect: const Rect.fromLTRB(-256.0, -256.0, 256.0, 256.0),
      ),
      act: (bloc) {
        bloc.add(const ScrollingEvent.startExternalDragOperation(piggyback: {
          "ObjectAtPoint": "0101010101010101010",
        }));
        bloc.add(const ScrollingEvent.continueExternalDragOperation(piggyback: {
          "ObjectAtPoint": "0101010101010101010",
        }));
      },
      expect: () => [
        ScrollingState.externalOperation(
          matrix: Matrix4.identity(),
          content: [],
          size: const Size(100.0, 100.0),
          diagramRect: const Rect.fromLTRB(-256.0, -256.0, 256.0, 256.0),
          piggyback: {
            "ObjectAtPoint": "0101010101010101010",
          },
        )
      ],
    );

    blocTest(
      "Go through External Drag Operation and back to Idle",
      build: () => ScrollingBloc(contentRepository: contentRepository),
      seed: () => ScrollingState.idle(
        matrix: Matrix4.identity(),
        content: [],
        size: const Size(100, 100),
        diagramRect: const Rect.fromLTRB(-256.0, -256.0, 256.0, 256.0),
      ),
      act: (bloc) {
        bloc.add(const ScrollingEvent.startExternalDragOperation(piggyback: {
          "ObjectAtPoint": "0101010101010101010",
        }));
        bloc.add(const ScrollingEvent.continueExternalDragOperation(piggyback: {
          "ObjectAtPoint": "0101010101010101010",
        }));
        bloc.add(const ScrollingEvent.endExternalDragOperation());
      },
      expect: () => [
        ScrollingState.externalOperation(
          matrix: Matrix4.identity(),
          content: [],
          size: const Size(100.0, 100.0),
          diagramRect: const Rect.fromLTRB(-256.0, -256.0, 256.0, 256.0),
          piggyback: {
            "ObjectAtPoint": "0101010101010101010",
          },
        ),
        ScrollingState.idle(
          matrix: Matrix4.identity(),
          content: [],
          size: const Size(100.0, 100.0),
          diagramRect: const Rect.fromLTRB(-256.0, -256.0, 256.0, 256.0),
        ),
      ],
    );
  });
}
