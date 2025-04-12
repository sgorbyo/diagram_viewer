import 'dart:async';

import 'package:diagram_viewer/diagram_content_repository.dart';
import 'package:diagram_viewer/diagram_object_entity.dart';
import 'package:diagram_viewer/presentation/bloc/scrolling/scrolling_bloc.dart';
import 'package:diagram_viewer/presentation/widgets/scrolling_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockScrollingBloc extends Mock implements ScrollingBloc {
  final List<ScrollingEvent> addedEvents = [];
  final _stateController = StreamController<ScrollingState>.broadcast();
  ScrollingState _currentState = ScrollingState.initial(
      matrix: Matrix4.identity(),
      content: const [],
      size: const Size(800, 600),
      diagramRect: const Rect.fromLTWH(0, 0, 1000, 1000));

  MockScrollingBloc() {
    when(() => stream).thenAnswer((_) => _stateController.stream);
  }

  @override
  void add(ScrollingEvent event) {
    addedEvents.add(event);
    // Per debugging: print('Event added: $event');
  }

  @override
  ScrollingState get state => _currentState;

  void emitState(ScrollingState newState) {
    _currentState = newState;
    _stateController.add(newState);
  }

  @override
  Future<void> close() async {
    await _stateController.close();
    return Future<void>.value();
  }

  void dispose() {
    // Metodo custom per cleanup nei test
  }
}

class MockValueUpdater<T> extends Mock implements ValueUpdater<T> {
  @override
  T update(T value) => value;
}

class MockDiagramObjectEntity extends Mock implements DiagramObjectEntity {}

class MockDiagramContentRepository extends Mock
    implements DiagramContentRepository {}

void main() {
  late MockScrollingBloc mockScrollingBloc;
  late MockDiagramContentRepository mockDiagramContentRepository;
  final testMatrix = Matrix4.identity();
  final testContent = <DiagramObjectEntity>[];
  const testDiagramRect = Rect.fromLTWH(0, 0, 1000, 1000);
  const testSize = Size(800, 600);

  setUpAll(() {
    registerFallbackValue(ScaleUpdateDetails());
    registerFallbackValue(Offset.zero);
    registerFallbackValue(1.0);
    registerFallbackValue(ScrollingState.initial(
        matrix: testMatrix,
        content: testContent,
        size: testSize,
        diagramRect: testDiagramRect));
    registerFallbackValue(const ScrollingEvent.viewportChanged(size: testSize));
  });

  setUp(() {
    mockScrollingBloc = MockScrollingBloc();
    mockDiagramContentRepository = MockDiagramContentRepository();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: RepositoryProvider<DiagramContentRepository>(
        create: (context) => mockDiagramContentRepository,
        child: BlocProvider<ScrollingBloc>(
          create: (context) => mockScrollingBloc,
          child: const ScrollingView(
            shouldTranslate: true,
            shouldScale: true,
            shouldRotate: true,
            clipChild: true,
          ),
        ),
      ),
    );
  }

  group('ScrollingView Widget Tests', () {
    tearDown(() {
      mockScrollingBloc.dispose();
      mockScrollingBloc.close();
    });

    testWidgets('ScrollingView initializes and responds to viewport changes',
        (WidgetTester tester) async {
      // Setup initial state using `when`
      when(() => mockScrollingBloc.state).thenReturn(ScrollingState.initial(
        matrix: testMatrix,
        content: testContent,
        size: testSize,
        diagramRect: testDiagramRect,
      ));

      // Mock the add method
      when(() => mockScrollingBloc.add(any())).thenReturn(null);

      // Render the widget
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump(const Duration(milliseconds: 100));

      // Verify event was sent using mocktail's verification
      verify(() => mockScrollingBloc.add(any(
            that: predicate((event) =>
                event is ScrollingEvent &&
                event.toString().contains('viewportChanged')),
          ))).called(greaterThanOrEqualTo(1));

      // Verify CustomPaint is rendered
      expect(find.byType(CustomPaint), findsOneWidget);
    });

    testWidgets('ScrollingView handles scale start event',
        (WidgetTester tester) async {
      mockScrollingBloc.emitState(ScrollingState.initial(
          matrix: testMatrix,
          content: testContent,
          size: testSize,
          diagramRect: testDiagramRect));
      await tester.pumpWidget(createWidgetUnderTest());

      // Find the ScrollingView and simulate a scale start gesture
      final gesture = await tester.startGesture(Offset.zero);
      await tester.pump();

      // Verify that the ScrollingBloc received the startScale event
      verify(() => mockScrollingBloc.add(any(
            that: predicate((event) =>
                event is ScrollingEvent &&
                event.maybeMap(
                  startScale: (_) => true,
                  orElse: () => false,
                )),
          ))).called(1);

      verify(() => mockScrollingBloc.add(any(
            that: predicate((event) =>
                event is ScrollingEvent &&
                event.maybeMap(
                  startScale: (_) => true,
                  orElse: () => false,
                )),
          ))).called(1);

      verify(() => mockScrollingBloc.add(any(
            that: predicate((event) =>
                event is ScrollingEvent && event.toString().contains('start')),
          ))).called(1);

      await gesture.up();
    });

    testWidgets('ScrollingView handles scale update event',
        (WidgetTester tester) async {
      mockScrollingBloc.emitState(ScrollingState.initial(
          matrix: testMatrix,
          content: testContent,
          size: testSize,
          diagramRect: testDiagramRect));
      await tester.pumpWidget(createWidgetUnderTest());

      // Start a gesture
      final gesture = await tester.startGesture(Offset.zero);
      await tester.pump();

      // Simulate a scale update
      await gesture.moveBy(const Offset(10, 10));
      await tester.pump();

      // Verify that the ScrollingBloc received the continueScale event
      verify(() => mockScrollingBloc.add(any(
            that: predicate((event) =>
                event is ScrollingEvent &&
                event.maybeMap(
                  continueScale: (_) => true,
                  orElse: () => false,
                )),
          ))).called(1);

      verify(() => mockScrollingBloc.add(any(
            that: predicate((event) =>
                event is ScrollingEvent &&
                event.maybeMap(
                  continueScale: (_) => true,
                  orElse: () => false,
                )),
          ))).called(1);

      verify(() => mockScrollingBloc.add(any(
            that: predicate((event) =>
                event is ScrollingEvent && event.toString().contains('update')),
          ))).called(1);

      await gesture.up();
    });

    testWidgets('ScrollingView handles scale end event',
        (WidgetTester tester) async {
      mockScrollingBloc.emitState(ScrollingState.initial(
          matrix: testMatrix,
          content: testContent,
          size: testSize,
          diagramRect: testDiagramRect));
      await tester.pumpWidget(createWidgetUnderTest());

      // Start a gesture
      final gesture = await tester.startGesture(Offset.zero);
      await tester.pump();

      // End the gesture
      await gesture.up();
      await tester.pump();

      verify(() => mockScrollingBloc.add(any(
            that: predicate((event) =>
                event is ScrollingEvent &&
                event.maybeMap(
                  endScale: (_) => true,
                  orElse: () => false,
                )),
          ))).called(1);

      verify(() => mockScrollingBloc.add(any(
            that: predicate((event) =>
                event is ScrollingEvent &&
                event.maybeMap(
                  endScale: (_) => true,
                  orElse: () => false,
                )),
          ))).called(1);

      verify(() => mockScrollingBloc.add(any(
            that: predicate((event) =>
                event is ScrollingEvent && event.toString().contains('end')),
          ))).called(1);
    });

    testWidgets('ScrollingView handles animations correctly',
        (WidgetTester tester) async {
      mockScrollingBloc.emitState(ScrollingState.initial(
          matrix: testMatrix,
          content: testContent,
          size: testSize,
          diagramRect: testDiagramRect));

      await tester.pumpWidget(createWidgetUnderTest());

      // Simulate animation state changes
      mockScrollingBloc.emitState(ScrollingState.animatingInitialToIdle(
          oldMatrix: testMatrix,
          matrix: testMatrix,
          content: testContent,
          size: testSize,
          diagramRect: testDiagramRect));
      await tester.pump();

      // Verify CustomPaint is still present during animation
      expect(find.byType(CustomPaint), findsOneWidget);

      // Change to scrolling state
      mockScrollingBloc.emitState(ScrollingState.scrolling(
          matrix: testMatrix,
          diagramRect: testDiagramRect,
          content: testContent,
          translationUpdater: MockValueUpdater<Offset>(),
          scaleUpdater: MockValueUpdater<double>(),
          size: testSize,
          squaredDistance: 0.0,
          eventDateTime: DateTime.now()));
      await tester.pump();

      expect(find.byType(CustomPaint), findsOneWidget);

      // Verify scale related events using ScrollingEvent instead of type matching
      verify(() => mockScrollingBloc.add(any(
            that: predicate((event) =>
                event is ScrollingEvent &&
                event.toString().contains('viewportChanged')),
          ))).called(1);
    });

    testWidgets('ScrollingView handles multi-finger gestures',
        (WidgetTester tester) async {
      mockScrollingBloc.emitState(ScrollingState.initial(
          matrix: testMatrix,
          content: testContent,
          size: testSize,
          diagramRect: testDiagramRect));

      await tester.pumpWidget(createWidgetUnderTest());

      // Start two gestures
      final gesture1 = await tester.startGesture(const Offset(0, 0));
      final gesture2 = await tester.startGesture(const Offset(50, 50));
      await tester.pump();

      // Move both fingers
      await gesture1.moveBy(const Offset(20, 20));
      await gesture2.moveBy(const Offset(-20, -20));
      await tester.pump();

      // End gestures
      await gesture1.up();
      await gesture2.up();
      await tester.pump();

      // Verify events using predicate instead of type matching
      verify(() => mockScrollingBloc.add(any(
            that: predicate((event) =>
                event is ScrollingEvent && event.toString().contains('scale')),
          ))).called(any);
    });

    testWidgets('ScrollingView handles rapid gesture sequences',
        (WidgetTester tester) async {
      mockScrollingBloc.emitState(ScrollingState.initial(
          matrix: testMatrix,
          content: testContent,
          size: testSize,
          diagramRect: testDiagramRect));

      await tester.pumpWidget(createWidgetUnderTest());

      // Perform rapid sequence of gestures
      for (int i = 0; i < 5; i++) {
        final gesture = await tester.startGesture(Offset(i * 10.0, i * 10.0));
        await tester.pump(const Duration(milliseconds: 16)); // ~ 1 frame
        await gesture.moveBy(const Offset(5, 5));
        await tester.pump(const Duration(milliseconds: 16));
        await gesture.up();
        await tester.pump(const Duration(milliseconds: 16));
      }

      // Verify widget remained responsive
      expect(find.byType(CustomPaint), findsOneWidget);

      // Verify events were handled using predicate
      verify(() => mockScrollingBloc.add(any(
            that: predicate((event) => event is ScrollingEvent),
          ))).called(greaterThan(0));
    });

    testWidgets('ScrollingView handles state changes correctly',
        (WidgetTester tester) async {
      final stateController = StreamController<ScrollingState>.broadcast();
      when(() => mockScrollingBloc.stream)
          .thenAnswer((_) => stateController.stream);
      mockScrollingBloc.emitState(ScrollingState.initial(
          matrix: testMatrix,
          content: testContent,
          size: testSize,
          diagramRect: testDiagramRect));

      await tester.pumpWidget(createWidgetUnderTest());

      // Verify initial state
      expect(find.byType(CustomPaint), findsOneWidget);

      // Add a new state to the stream
      stateController.add(ScrollingState.idle(
          matrix: testMatrix,
          diagramRect: testDiagramRect,
          content: testContent,
          size: testSize));
      await tester.pump();

      // Verify that the widget is rebuilt with the new state
      expect(find.byType(CustomPaint), findsOneWidget);

      // Clean up
      stateController.close();
    });

    testWidgets('ScrollingView handles rapid state changes without errors',
        (WidgetTester tester) async {
      // Setup stream
      final streamController = StreamController<ScrollingState>.broadcast();
      when(() => mockScrollingBloc.stream)
          .thenAnswer((_) => streamController.stream);
      mockScrollingBloc.emitState(ScrollingState.initial(
          matrix: testMatrix,
          content: testContent,
          size: testSize,
          diagramRect: testDiagramRect));

      await tester.pumpWidget(createWidgetUnderTest());

      // Define a series of states
      final states = [
        ScrollingState.idle(
            matrix: testMatrix,
            diagramRect: testDiagramRect,
            content: testContent,
            size: testSize),
        ScrollingState.animatingInitialToIdle(
            oldMatrix: testMatrix,
            matrix: testMatrix,
            diagramRect: testDiagramRect,
            content: testContent,
            size: testSize),
        ScrollingState.scrolling(
            matrix: testMatrix,
            diagramRect: testDiagramRect,
            content: testContent,
            translationUpdater: MockValueUpdater<Offset>(),
            scaleUpdater: MockValueUpdater<double>(),
            size: testSize,
            squaredDistance: 0.0,
            eventDateTime: DateTime.now()),
      ];

      // Add states rapidly to the stream
      for (final state in states) {
        streamController.add(state);
        await tester.pump(const Duration(milliseconds: 10));
      }

      // Allow time for the widget to process all states
      await tester.pumpAndSettle();

      // Verify that the CustomPaint widget is rendered
      expect(find.byType(CustomPaint), findsOneWidget);

      streamController.close();
    });

    testWidgets(
        'ScrollingView shouldTranslate, shouldScale, shouldRotate properties are respected',
        (WidgetTester tester) async {
      // Test with shouldTranslate = false
      mockScrollingBloc =
          MockScrollingBloc(); // Re-initialize to reset call counts
      mockScrollingBloc.emitState(ScrollingState.initial(
          matrix: testMatrix,
          content: testContent,
          size: testSize,
          diagramRect: testDiagramRect));

      await tester.pumpWidget(
        MaterialApp(
          home: RepositoryProvider<DiagramContentRepository>(
            create: (context) => mockDiagramContentRepository,
            child: BlocProvider<ScrollingBloc>(
              create: (context) => mockScrollingBloc,
              child: const ScrollingView(
                shouldTranslate: false,
                shouldScale: true,
                shouldRotate: true,
                clipChild: true,
              ),
            ),
          ),
        ),
      );

      // Find the ScrollingView and simulate a scale start gesture
      final gesture = await tester.startGesture(Offset.zero);
      await tester.pump();
      await gesture.moveBy(const Offset(10, 10));
      await tester.pump();
      await gesture.up();
      await tester.pump();

      // Verify that the ScrollingBloc did not receive the continueScale event
      verifyNever(() => mockScrollingBloc.add(any(
            that: predicate((event) =>
                event is ScrollingEvent &&
                event.maybeMap(
                  continueScale: (_) => true,
                  orElse: () => false,
                )),
          )));

      // Test with shouldScale = false
      mockScrollingBloc =
          MockScrollingBloc(); // Re-initialize to reset call counts
      mockScrollingBloc.emitState(ScrollingState.initial(
          matrix: testMatrix,
          content: testContent,
          size: testSize,
          diagramRect: testDiagramRect));

      await tester.pumpWidget(
        MaterialApp(
          home: RepositoryProvider<DiagramContentRepository>(
            create: (context) => mockDiagramContentRepository,
            child: BlocProvider<ScrollingBloc>(
              create: (context) => mockScrollingBloc,
              child: const ScrollingView(
                shouldTranslate: true,
                shouldScale: false,
                shouldRotate: true,
                clipChild: true,
              ),
            ),
          ),
        ),
      );

      // Find the ScrollingView and simulate a scale start gesture
      final gesture2 = await tester.startGesture(Offset.zero);
      await tester.pump();
      await gesture2.moveBy(const Offset(10, 10));
      await tester.pump();
      await gesture2.up();
      await tester.pump();

      // Verify that the ScrollingBloc did not receive the continueScale event
      verifyNever(() => mockScrollingBloc.add(any(
            that: predicate((event) =>
                event is ScrollingEvent &&
                event.maybeMap(
                  continueScale: (_) => true,
                  orElse: () => false,
                )),
          )));

      // Test with shouldRotate = false
      mockScrollingBloc =
          MockScrollingBloc(); // Re-initialize to reset call counts
      mockScrollingBloc.emitState(ScrollingState.initial(
          matrix: testMatrix,
          content: testContent,
          size: testSize,
          diagramRect: testDiagramRect));

      await tester.pumpWidget(
        MaterialApp(
          home: RepositoryProvider<DiagramContentRepository>(
            create: (context) => mockDiagramContentRepository,
            child: BlocProvider<ScrollingBloc>(
              create: (context) => mockScrollingBloc,
              child: const ScrollingView(
                shouldTranslate: true,
                shouldScale: true,
                shouldRotate: false,
                clipChild: true,
              ),
            ),
          ),
        ),
      );

      // Find the ScrollingView and simulate a scale start gesture
      final gesture3 = await tester.startGesture(Offset.zero);
      await tester.pump();
      await gesture3.moveBy(const Offset(10, 10));
      await tester.pump();
      await gesture3.up();
      await tester.pump();

      // Verify that the ScrollingBloc did receive the continueScale event
      verify(() => mockScrollingBloc.add(any(
            that: predicate((event) =>
                event is ScrollingEvent &&
                event.maybeMap(
                  continueScale: (_) => true,
                  orElse: () => false,
                )),
          )));
    });
  });
}
