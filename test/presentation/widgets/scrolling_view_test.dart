// filepath: /Users/danilo/StudioProjects/diagram_viewer/test/presentation/widgets/scrolling_view_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:diagram_viewer/presentation/bloc/scrolling/scrolling_bloc.dart';
import 'package:diagram_viewer/presentation/widgets/scrolling_view.dart';
import 'package:diagram_viewer/diagram_object_entity.dart';

// Mock classes for testing
class MockScrollingBloc extends MockBloc<ScrollingEvent, ScrollingState>
    implements ScrollingBloc {}

class TestDiagramObject extends Fake implements DiagramObjectEntity {
  final Rect _rect;

  TestDiagramObject({Rect? rect})
      : _rect = rect ?? const Rect.fromLTWH(0, 0, 100, 100);

  @override
  Rect enclosingRect() => _rect;

  @override
  void printOnCanvas({required Canvas canvas}) {}

  @override
  List<Object?> get props => [_rect];

  @override
  bool? get stringify => true;
}

// Helper methods for common state creation
ScrollingState createIdleState() {
  return ScrollingState.idle(
    matrix: Matrix4.identity(),
    content: [TestDiagramObject()],
    size: const Size(800, 600),
    diagramRect: const Rect.fromLTWH(0, 0, 100, 100),
  );
}

ScrollingState createAnimatingInitialToIdleState() {
  return ScrollingState.animatingInitialToIdle(
    oldMatrix: Matrix4.identity(),
    matrix: Matrix4.identity()..scale(2.0),
    content: [TestDiagramObject()],
    size: const Size(800, 600),
    diagramRect: const Rect.fromLTWH(0, 0, 100, 100),
  );
}

ScrollingState createScrollingState() {
  return ScrollingState.scrolling(
    matrix: Matrix4.identity()..translate(50.0, 50.0),
    content: [TestDiagramObject()],
    translationUpdater: ValueUpdater<Offset>(
      onUpdate: (oldVal, newVal) => newVal - (oldVal ?? Offset.zero),
    )..value = const Offset(50, 50),
    scaleUpdater: ValueUpdater<double>(
      onUpdate: (oldVal, newVal) => newVal / (oldVal ?? 1),
    )..value = 1.0,
    size: const Size(800, 600),
    diagramRect: const Rect.fromLTWH(0, 0, 100, 100),
    squaredDistance: 0,
    eventDateTime: DateTime.now(),
  );
}

ScrollingState createAnimatingFromOutOfBoundsState() {
  return ScrollingState.animatingFromOutOfBounds(
    oldMatrix: Matrix4.identity()..translate(200.0, 200.0),
    matrix: Matrix4.identity()..translate(100.0, 100.0),
    content: [TestDiagramObject()],
    size: const Size(800, 600),
    diagramRect: const Rect.fromLTWH(0, 0, 100, 100),
  );
}

ScrollingState createAnimatingInertialScrollingState() {
  return ScrollingState.animatingInertialScrolling(
    oldMatrix: Matrix4.identity()..translate(50.0, 50.0),
    matrix: Matrix4.identity()..translate(100.0, 100.0),
    animationTimeInMilliseconds: 300,
    content: [TestDiagramObject()],
    size: const Size(800, 600),
    diagramRect: const Rect.fromLTWH(0, 0, 100, 100),
  );
}

ScrollingState createStoppingAnimationState() {
  return ScrollingState.stoppingAnimation(
    content: [TestDiagramObject()],
    size: const Size(800, 600),
    diagramRect: const Rect.fromLTWH(0, 0, 100, 100),
    details: ScaleStartDetails(focalPoint: const Offset(400, 300)),
  );
}

void main() {
  late MockScrollingBloc mockBloc;

  setUp(() {
    mockBloc = MockScrollingBloc();
  });

  group('ScrollingView Widget - Initialization Tests', () {
    testWidgets('should show CircularProgressIndicator when in initial state',
        (WidgetTester tester) async {
      // Arrange
      when(() => mockBloc.state).thenReturn(
        ScrollingState.initial(matrix: Matrix4.identity()),
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ScrollingBloc>.value(
            value: mockBloc,
            child: const ScrollingView(
              shouldTranslate: true,
              shouldScale: true,
              shouldRotate: false,
              clipChild: true,
            ),
          ),
        ),
      );

      // Assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should render content with idle state',
        (WidgetTester tester) async {
      // Arrange
      when(() => mockBloc.state).thenReturn(createIdleState());

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ScrollingBloc>.value(
            value: mockBloc,
            child: const ScrollingView(
              shouldTranslate: true,
              shouldScale: true,
              shouldRotate: false,
              clipChild: true,
            ),
          ),
        ),
      );

      // Assert
      expect(find.byType(CustomPaint), findsNWidgets(1));
    });
  });

  group('ScrollingView Widget - State Transitions Tests', () {
    testWidgets(
        'should trigger animation when state changes from initial to animatingInitialToIdle',
        (WidgetTester tester) async {
      // Arrange
      final states = [
        ScrollingState.initial(matrix: Matrix4.identity()),
        createAnimatingInitialToIdleState(),
      ];

      whenListen(
        mockBloc,
        Stream.fromIterable(states),
        initialState: states.first,
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ScrollingBloc>.value(
            value: mockBloc,
            child: const ScrollingView(
              shouldTranslate: true,
              shouldScale: true,
              shouldRotate: false,
              clipChild: true,
            ),
          ),
        ),
      );

      // Initial state
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      // Transition should happen
      await tester.pump();

      // Animation should be in progress
      expect(find.byType(CustomPaint), findsOneWidget);

      // Let the animation complete
      await tester.pump(const Duration(milliseconds: 1000));

      // Verify event is emitted after animation
      verify(() =>
              mockBloc.add(const ScrollingEvent.initialToIdleAnimationEnd()))
          .called(1);
    });

    testWidgets('should handle outOfBoundsToIdle animation',
        (WidgetTester tester) async {
      // Arrange
      final states = [
        createIdleState(),
        createAnimatingFromOutOfBoundsState(),
      ];

      whenListen(
        mockBloc,
        Stream.fromIterable(states),
        initialState: states.first,
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ScrollingBloc>.value(
            value: mockBloc,
            child: const ScrollingView(
              shouldTranslate: true,
              shouldScale: true,
              shouldRotate: false,
              clipChild: true,
            ),
          ),
        ),
      );

      // Initial state
      expect(find.byType(CustomPaint), findsOneWidget);

      // Trigger state transition
      await tester.pump();

      // Animation should be in progress
      expect(find.byType(CustomPaint), findsOneWidget);

      // Let the animation complete
      await tester.pump(const Duration(milliseconds: 300));

      // Verify event is emitted after animation
      verify(() => mockBloc
          .add(const ScrollingEvent.outOfBoundsToIdleAnimationEnd())).called(1);
    });

    testWidgets('should handle inertial scrolling animation',
        (WidgetTester tester) async {
      // Arrange
      final states = [
        createIdleState(),
        createAnimatingInertialScrollingState(),
      ];

      whenListen(
        mockBloc,
        Stream.fromIterable(states),
        initialState: states.first,
      );

      final targetMatrix = Matrix4.identity()..translate(100.0, 100.0);

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ScrollingBloc>.value(
            value: mockBloc,
            child: const ScrollingView(
              shouldTranslate: true,
              shouldScale: true,
              shouldRotate: false,
              clipChild: true,
            ),
          ),
        ),
      );

      // Initial state
      expect(find.byType(CustomPaint), findsOneWidget);

      // Trigger state transition
      await tester.pump();

      // Animation should be in progress
      expect(find.byType(CustomPaint), findsOneWidget);

      // Let the animation complete
      await tester.pump(const Duration(milliseconds: 300));

      // Verify event is emitted after animation
      verify(() => mockBloc.add(any(that: isA<ScrollingEvent>()))).called(1);
    });

    testWidgets('should handle stopping animation',
        (WidgetTester tester) async {
      // Arrange
      when(() => mockBloc.state)
          .thenReturn(createAnimatingInertialScrollingState());

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ScrollingBloc>.value(
            value: mockBloc,
            child: const ScrollingView(
              shouldTranslate: true,
              shouldScale: true,
              shouldRotate: false,
              clipChild: true,
            ),
          ),
        ),
      );

      // Initial animation state
      expect(find.byType(CustomPaint), findsOneWidget);

      // Trigger stoppingAnimation state
      when(() => mockBloc.state).thenReturn(createStoppingAnimationState());
      whenListen(
        mockBloc,
        Stream.value(createStoppingAnimationState()),
        initialState: createAnimatingInertialScrollingState(),
      );

      await tester.pump();

      // Animation should be stopped
      verify(() => mockBloc.add(any(that: isA<ScrollingEvent>()))).called(1);
    });
  });

  group('ScrollingView Widget - CustomPainter Tests', () {
    testWidgets('DiagramBackgroundPainter should render background',
        (WidgetTester tester) async {
      // Arrange
      when(() => mockBloc.state).thenReturn(createIdleState());

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ScrollingBloc>.value(
            value: mockBloc,
            child: const ScrollingView(
              shouldTranslate: true,
              shouldScale: true,
              shouldRotate: false,
              clipChild: true,
            ),
          ),
        ),
      );

      // Find the CustomPaint widget
      final customPaint = tester.widget<CustomPaint>(find.byType(CustomPaint));

      // Assert that painter is of correct type
      expect(customPaint.painter, isA<DiagramBackgroundPainter>());
      expect(customPaint.foregroundPainter, isA<DiagramContentPainter>());
    });
  });

  group('ScrollingView Widget - Animation Controller Management', () {
    testWidgets('should dispose animation controller when widget is disposed',
        (WidgetTester tester) async {
      // Arrange
      when(() => mockBloc.state)
          .thenReturn(createAnimatingInitialToIdleState());

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ScrollingBloc>.value(
            value: mockBloc,
            child: const ScrollingView(
              shouldTranslate: true,
              shouldScale: true,
              shouldRotate: false,
              clipChild: true,
            ),
          ),
        ),
      );

      // Dispose widget
      await tester.pumpWidget(Container());

      // No exceptions should be thrown when widget is disposed
    });
  });

  group('ScrollingView Widget - Matrix Transformation Tests', () {
    testWidgets('should apply matrix transformations correctly',
        (WidgetTester tester) async {
      // Arrange
      final scaledMatrix = Matrix4.identity()..scale(2.0);
      when(() => mockBloc.state).thenReturn(
        ScrollingState.idle(
          matrix: scaledMatrix,
          content: [TestDiagramObject()],
          size: const Size(800, 600),
          diagramRect: const Rect.fromLTWH(0, 0, 100, 100),
        ),
      );

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider<ScrollingBloc>.value(
            value: mockBloc,
            child: const ScrollingView(
              shouldTranslate: true,
              shouldScale: true,
              shouldRotate: false,
              clipChild: true,
            ),
          ),
        ),
      );

      // Find the CustomPaint widget
      final customPaint = tester.widget<CustomPaint>(find.byType(CustomPaint));
      final backgroundPainter = customPaint.painter as DiagramBackgroundPainter;

      // Assert that the correct transformation matrix is used
      expect(backgroundPainter.matrix, equals(scaledMatrix));
    });
  });
}
