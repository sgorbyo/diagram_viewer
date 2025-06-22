import 'package:bloc_test/bloc_test.dart';
import 'package:diagram_viewer/presentation/bloc/scrolling/scrolling_bloc.dart';
import 'package:diagram_viewer/presentation/widgets/scrolling_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockScrollingBloc extends MockBloc<ScrollingEvent, ScrollingState>
    implements ScrollingBloc {}

class FakeScrollingEvent extends Fake implements ScrollingEvent {}

void main() {
  late MockScrollingBloc mockScrollingBloc;

  setUpAll(() {
    registerFallbackValue(FakeScrollingEvent());
  });

  setUp(() {
    mockScrollingBloc = MockScrollingBloc();
  });

  Widget createTestWidget(Widget child) {
    return MaterialApp(
      home: BlocProvider<ScrollingBloc>.value(
        value: mockScrollingBloc,
        child: child,
      ),
    );
  }

  group('ScrollingView', () {
    testWidgets('renders CircularProgressIndicator when state is initial',
        (WidgetTester tester) async {
      when(() => mockScrollingBloc.state)
          .thenReturn(ScrollingState.initial(matrix: Matrix4.identity()));

      await tester.pumpWidget(createTestWidget(const ScrollingView(
        shouldTranslate: true,
        shouldScale: true,
        shouldRotate: true,
        clipChild: true,
        backgroundColor: Colors.white,
        outsideColor: Colors.grey,
      )));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders CustomPaint when state is not initial',
        (WidgetTester tester) async {
      when(() => mockScrollingBloc.state).thenReturn(
        ScrollingState.idle(
          matrix: Matrix4.identity(),
          content: [],
          size: const Size(200, 200),
          diagramRect: Rect.zero,
        ),
      );

      await tester.pumpWidget(createTestWidget(const ScrollingView(
        shouldTranslate: true,
        shouldScale: true,
        shouldRotate: true,
        clipChild: true,
        backgroundColor: Colors.white,
        outsideColor: Colors.grey,
      )));

      expect(find.byType(CustomPaint), findsNWidgets(2));
    });

    testWidgets('triggers animation and sends end event',
        (WidgetTester tester) async {
      whenListen(
        mockScrollingBloc,
        Stream.fromIterable([
          ScrollingState.initial(matrix: Matrix4.identity()),
          ScrollingState.animatingInitialToIdle(
            oldMatrix: Matrix4.identity(),
            matrix: Matrix4.identity(),
            content: [],
            size: const Size(200, 200),
            diagramRect: Rect.zero,
          ),
        ]),
        initialState: ScrollingState.initial(matrix: Matrix4.identity()),
      );

      await tester.pumpWidget(createTestWidget(const ScrollingView(
        shouldTranslate: true,
        shouldScale: true,
        shouldRotate: true,
        clipChild: true,
        backgroundColor: Colors.white,
        outsideColor: Colors.grey,
      )));

      // Pump for the new state to be processed by the listener
      await tester.pump();
      // Pump and settle for the animation to complete
      await tester.pumpAndSettle();

      verify(() => mockScrollingBloc
          .add(const ScrollingEvent.initialToIdleAnimationEnd())).called(1);
    });
  });
}
