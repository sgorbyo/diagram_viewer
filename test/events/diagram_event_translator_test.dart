import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/events/diagram_event_translator.dart';
import 'package:diagram_viewer/events/physical_event.dart';
import 'package:diagram_viewer/events/diagram_event.dart';
import 'package:diagram_viewer/events/transform_2d.dart';
import 'package:diagram_viewer/events/border_proximity.dart';
// Removed unused import
import 'package:diagram_viewer/interfaces/diagram_object_entity.dart';

void main() {
  group('DiagramEventTranslator', () {
    late DiagramEventTranslator translator;
    late Transform2D testTransform;
    late List<DiagramObjectEntity> testObjects;

    setUp(() {
      translator = DiagramEventTranslator();
      testTransform = const Transform2D(
        scale: 1.0,
        translation: Offset.zero,
        rotation: 0.0,
      );
      testObjects = [];
    });

    group('Pointer Event Translation', () {
      test('should generate dragBegin on pointer start', () {
        // Arrange
        const pointerDown = PointerDownEvent(
          pointer: 1,
          position: Offset(100, 100),
          kind: PointerDeviceKind.touch,
        );

        final physicalEvent = PhysicalEvent.pointer(
          eventId: 'test-1',
          logicalPosition: const Offset(100, 100),
          screenPosition: const Offset(100, 100),
          transformSnapshot: testTransform,
          hitList: testObjects,
          borderProximity: BorderProximity.none,
          phase: InteractionPhase.start,
          rawEvent: pointerDown,
          delta: null,
          currentViewport: Rect.zero,
          pressedMouseButtons: {},
          pressedKeys: {},
          activeInteraction: null,
        );

        // Act
        final result = translator.translate(physicalEvent);

        // Assert
        expect(result, isNotNull);
        expect(result, isA<DiagramEventUnion>());
        result!.maybeWhen(
          tap: (event) => fail('Expected dragBegin, got tap'),
          doubleTap: (event) => fail('Expected dragBegin, got doubleTap'),
          longPress: (event) => fail('Expected dragBegin, got longPress'),
          scroll: (event) => fail('Expected dragBegin, got scroll'),
          dragBegin: (event) {
            expect(event.eventId, equals('test-1'));
            expect(event.logicalPosition, equals(const Offset(100, 100)));
            expect(event.hitList, equals(testObjects));
            expect(event.isOnObject, isFalse);
            expect(event.fingerCount, equals(1));
            expect(event.mouseButton, isNull);
          },
          orElse: () => fail('Expected dragBegin'),
        );
      });

      test('should generate dragContinue on pointer move with sufficient delta',
          () {
        // Arrange - First, start a drag
        const pointerDown = PointerDownEvent(
          pointer: 1,
          position: Offset(100, 100),
          kind: PointerDeviceKind.touch,
        );

        final startEvent = PhysicalEvent.pointer(
          eventId: 'test-1',
          logicalPosition: const Offset(100, 100),
          screenPosition: const Offset(100, 100),
          transformSnapshot: testTransform,
          hitList: testObjects,
          borderProximity: BorderProximity.none,
          phase: InteractionPhase.start,
          rawEvent: pointerDown,
          delta: null,
          currentViewport: Rect.zero,
          pressedMouseButtons: {},
          pressedKeys: {},
          activeInteraction: null,
        );

        translator.translate(startEvent);

        // Now move the pointer
        const pointerMove = PointerMoveEvent(
          pointer: 1,
          position: Offset(110, 110),
          kind: PointerDeviceKind.touch,
        );

        final moveEvent = PhysicalEvent.pointer(
          eventId: 'test-1',
          logicalPosition: const Offset(110, 110),
          screenPosition: const Offset(110, 110),
          transformSnapshot: testTransform,
          hitList: testObjects,
          borderProximity: BorderProximity.none,
          phase: InteractionPhase.update,
          rawEvent: pointerMove,
          delta: const Offset(10, 10),
          currentViewport: Rect.zero,
          pressedMouseButtons: {},
          pressedKeys: {},
          activeInteraction: null,
        );

        // Act
        final result = translator.translate(moveEvent);

        // Assert
        expect(result, isNotNull);
        result!.maybeWhen(
          tap: (event) => fail('Expected dragContinue, got tap'),
          doubleTap: (event) => fail('Expected dragContinue, got doubleTap'),
          longPress: (event) => fail('Expected dragContinue, got longPress'),
          scroll: (event) => fail('Expected dragContinue, got scroll'),
          dragBegin: (event) => fail('Expected dragContinue, got dragBegin'),
          dragContinue: (event) {
            expect(event.eventId, equals('test-1'));
            expect(event.logicalPosition, equals(const Offset(110, 110)));
            expect(event.delta, equals(const Offset(10, 10)));
            expect(event.totalDelta, equals(const Offset(10, 10)));
            expect(event.duration.inMilliseconds, greaterThanOrEqualTo(0));
          },
          orElse: () => fail('Expected dragContinue'),
        );
      });

      test('should generate dragEnd on pointer end after drag', () async {
        // Arrange - First, start a drag
        const pointerDown = PointerDownEvent(
          pointer: 1,
          position: Offset(100, 100),
          kind: PointerDeviceKind.touch,
        );

        final startEvent = PhysicalEvent.pointer(
          eventId: 'test-1',
          logicalPosition: const Offset(100, 100),
          screenPosition: const Offset(100, 100),
          transformSnapshot: testTransform,
          hitList: testObjects,
          borderProximity: BorderProximity.none,
          phase: InteractionPhase.start,
          rawEvent: pointerDown,
          delta: null,
          currentViewport: Rect.zero,
          pressedMouseButtons: {},
          pressedKeys: {},
          activeInteraction: null,
        );

        translator.translate(startEvent);

        // Add delay to ensure timing
        await Future.delayed(const Duration(milliseconds: 10));

        // Move the pointer
        const pointerMove = PointerMoveEvent(
          pointer: 1,
          position: Offset(110, 110),
          kind: PointerDeviceKind.touch,
        );

        final moveEvent = PhysicalEvent.pointer(
          eventId: 'test-1',
          logicalPosition: const Offset(110, 110),
          screenPosition: const Offset(110, 110),
          transformSnapshot: testTransform,
          hitList: testObjects,
          borderProximity: BorderProximity.none,
          phase: InteractionPhase.update,
          rawEvent: pointerMove,
          delta: const Offset(10, 10),
          currentViewport: Rect.zero,
          pressedMouseButtons: {},
          pressedKeys: {},
          activeInteraction: null,
        );

        translator.translate(moveEvent);

        // Add delay to ensure timing
        await Future.delayed(const Duration(milliseconds: 10));

        // Now end the pointer
        const pointerUp = PointerUpEvent(
          pointer: 1,
          position: Offset(110, 110),
          kind: PointerDeviceKind.touch,
        );

        final endEvent = PhysicalEvent.pointer(
          eventId: 'test-1',
          logicalPosition: const Offset(110, 110),
          screenPosition: const Offset(110, 110),
          transformSnapshot: testTransform,
          hitList: testObjects,
          borderProximity: BorderProximity.none,
          phase: InteractionPhase.end,
          rawEvent: pointerUp,
          delta: null,
          currentViewport: Rect.zero,
          pressedMouseButtons: {},
          pressedKeys: {},
          activeInteraction: null,
        );

        // Act
        final result = translator.translate(endEvent);

        // Assert
        expect(result, isNotNull);
        result!.maybeWhen(
          tap: (event) => fail('Expected dragEnd, got tap'),
          doubleTap: (event) => fail('Expected dragEnd, got doubleTap'),
          longPress: (event) => fail('Expected dragEnd, got longPress'),
          scroll: (event) => fail('Expected dragEnd, got scroll'),
          dragBegin: (event) => fail('Expected dragEnd, got dragBegin'),
          dragContinue: (event) => fail('Expected dragEnd, got dragContinue'),
          dragEnd: (event) {
            expect(event.eventId, equals('test-1'));
            expect(event.logicalPosition, equals(const Offset(110, 110)));
            expect(event.totalDelta, equals(const Offset(10, 10)));
            expect(event.totalDuration.inMilliseconds, greaterThan(0));
            expect(event.wasCancelled, isFalse);
          },
          orElse: () => fail('Expected dragEnd'),
        );
      });

      test('should generate tap on pointer end without sufficient movement',
          () async {
        // Arrange - Start a pointer event
        const pointerDown = PointerDownEvent(
          pointer: 1,
          position: Offset(100, 100),
          kind: PointerDeviceKind.touch,
        );

        final startEvent = PhysicalEvent.pointer(
          eventId: 'test-1',
          logicalPosition: const Offset(100, 100),
          screenPosition: const Offset(100, 100),
          transformSnapshot: testTransform,
          hitList: testObjects,
          borderProximity: BorderProximity.none,
          phase: InteractionPhase.start,
          rawEvent: pointerDown,
          delta: null,
          currentViewport: Rect.zero,
          pressedMouseButtons: {},
          pressedKeys: {},
          activeInteraction: null,
        );

        translator.translate(startEvent);

        // Add a small delay to simulate real timing
        await Future.delayed(const Duration(milliseconds: 10));

        // End the pointer without significant movement
        const pointerUp = PointerUpEvent(
          pointer: 1,
          position: Offset(
              100.5, 100.5), // Very minimal movement (distance = 0.707 < 1.0)
          kind: PointerDeviceKind.touch,
        );

        final endEvent = PhysicalEvent.pointer(
          eventId: 'test-1',
          logicalPosition: const Offset(100.5, 100.5),
          screenPosition: const Offset(100.5, 100.5),
          transformSnapshot: testTransform,
          hitList: testObjects,
          borderProximity: BorderProximity.none,
          phase: InteractionPhase.end,
          rawEvent: pointerUp,
          delta: null,
          currentViewport: Rect.zero,
          pressedMouseButtons: {},
          pressedKeys: {},
          activeInteraction: null,
        );

        // Act
        final result = translator.translate(endEvent);

        // Assert
        expect(result, isNotNull);
        result!.maybeWhen(
          tap: (event) {
            expect(event.eventId, equals('test-1'));
            expect(event.logicalPosition, equals(const Offset(100.5, 100.5)));
            expect(event.hitList, equals(testObjects));
            expect(event.isOnObject, isFalse);
            expect(event.fingerCount, equals(1));
            expect(event.mouseButton, isNull);
            expect(event.pressDuration.inMilliseconds, greaterThan(0));
          },
          orElse: () => fail('Expected tap'),
        );
      });

      test('should handle object interaction correctly', () {
        // Create a mock object
        final mockObject = _MockDiagramObject();
        testObjects.add(mockObject);

        // Arrange - Start pointer on object
        const pointerDown = PointerDownEvent(
          pointer: 1,
          position: Offset(100, 100),
          kind: PointerDeviceKind.touch,
        );

        final startEvent = PhysicalEvent.pointer(
          eventId: 'test-1',
          logicalPosition: const Offset(100, 100),
          screenPosition: const Offset(100, 100),
          transformSnapshot: testTransform,
          hitList: testObjects,
          borderProximity: BorderProximity.none,
          phase: InteractionPhase.start,
          rawEvent: pointerDown,
          delta: null,
          currentViewport: Rect.zero,
          pressedMouseButtons: {},
          pressedKeys: {},
          activeInteraction: null,
        );

        // Act
        final result = translator.translate(startEvent);

        // Assert
        expect(result, isNotNull);
        result!.maybeWhen(
          tap: (event) => fail('Expected dragBegin, got tap'),
          doubleTap: (event) => fail('Expected dragBegin, got doubleTap'),
          longPress: (event) => fail('Expected dragBegin, got longPress'),
          scroll: (event) => fail('Expected dragBegin, got scroll'),
          dragBegin: (event) {
            expect(event.isOnObject, isTrue);
            expect(event.hitList, equals(testObjects));
          },
          orElse: () => fail('Expected dragBegin'),
        );
      });
    });

    group('Scroll Event Translation', () {
      test('should generate scroll event with velocity', () {
        // Arrange
        const scrollEvent = PointerScrollEvent(
          position: Offset(100, 100),
          scrollDelta: Offset(0, -10),
          kind: PointerDeviceKind.mouse,
        );

        // Act
        final result = translator.handleScrollEvent(
          'test-1',
          const Offset(100, 100),
          const Offset(100, 100),
          testTransform,
          testObjects,
          scrollEvent,
        );

        // Assert
        expect(result, isNotNull);
        result!.maybeWhen(
          tap: (event) => fail('Expected scroll, got tap'),
          doubleTap: (event) => fail('Expected scroll, got doubleTap'),
          longPress: (event) => fail('Expected scroll, got longPress'),
          scroll: (event) {
            expect(event.eventId, equals('test-1'));
            expect(
                event.scrollDelta, equals(10.0)); // Changed to absolute value
            expect(event.scrollDirection, equals(const Offset(0, -1)));
            expect(event.isInertial, isFalse);
          },
          orElse: () => fail('Expected scroll'),
        );
      });
    });

    group('Event State Management', () {
      test('should maintain state across event phases', () {
        // Arrange - Start event
        const pointerDown = PointerDownEvent(
          pointer: 1,
          position: Offset(100, 100),
          kind: PointerDeviceKind.touch,
        );

        final startEvent = PhysicalEvent.pointer(
          eventId: 'test-1',
          logicalPosition: const Offset(100, 100),
          screenPosition: const Offset(100, 100),
          transformSnapshot: testTransform,
          hitList: testObjects,
          borderProximity: BorderProximity.none,
          phase: InteractionPhase.start,
          rawEvent: pointerDown,
          delta: null,
          currentViewport: Rect.zero,
          pressedMouseButtons: {},
          pressedKeys: {},
          activeInteraction: null,
        );

        // Act - Start
        final startResult = translator.translate(startEvent);
        expect(startResult, isNotNull);

        // Move event
        const pointerMove = PointerMoveEvent(
          pointer: 1,
          position: Offset(110, 110),
          kind: PointerDeviceKind.touch,
        );

        final moveEvent = PhysicalEvent.pointer(
          eventId: 'test-1',
          logicalPosition: const Offset(110, 110),
          screenPosition: const Offset(110, 110),
          transformSnapshot: testTransform,
          hitList: testObjects,
          borderProximity: BorderProximity.none,
          phase: InteractionPhase.update,
          rawEvent: pointerMove,
          delta: const Offset(10, 10),
          currentViewport: Rect.zero,
          pressedMouseButtons: {},
          pressedKeys: {},
          activeInteraction: null,
        );

        // Act - Move
        final moveResult = translator.translate(moveEvent);
        expect(moveResult, isNotNull);

        // End event
        const pointerUp = PointerUpEvent(
          pointer: 1,
          position: Offset(110, 110),
          kind: PointerDeviceKind.touch,
        );

        final endEvent = PhysicalEvent.pointer(
          eventId: 'test-1',
          logicalPosition: const Offset(110, 110),
          screenPosition: const Offset(110, 110),
          transformSnapshot: testTransform,
          hitList: testObjects,
          borderProximity: BorderProximity.none,
          phase: InteractionPhase.end,
          rawEvent: pointerUp,
          delta: null,
          currentViewport: Rect.zero,
          pressedMouseButtons: {},
          pressedKeys: {},
          activeInteraction: null,
        );

        // Act - End
        final endResult = translator.translate(endEvent);
        expect(endResult, isNotNull);

        // Assert - Verify all phases were handled correctly
        startResult!.maybeWhen(
          dragBegin: (event) => expect(event.eventId, equals('test-1')),
          orElse: () => fail('Expected dragBegin'),
        );

        moveResult!.maybeWhen(
          dragContinue: (event) => expect(event.eventId, equals('test-1')),
          orElse: () => fail('Expected dragContinue'),
        );

        endResult!.maybeWhen(
          dragEnd: (event) => expect(event.eventId, equals('test-1')),
          orElse: () => fail('Expected dragEnd'),
        );
      });

      test('should handle multiple concurrent events', () {
        // Arrange - Start first event
        const pointer1Down = PointerDownEvent(
          pointer: 1,
          position: Offset(100, 100),
          kind: PointerDeviceKind.touch,
        );

        final event1 = PhysicalEvent.pointer(
          eventId: 'test-1',
          logicalPosition: const Offset(100, 100),
          screenPosition: const Offset(100, 100),
          transformSnapshot: testTransform,
          hitList: testObjects,
          borderProximity: BorderProximity.none,
          phase: InteractionPhase.start,
          rawEvent: pointer1Down,
          delta: null,
          currentViewport: Rect.zero,
          pressedMouseButtons: {},
          pressedKeys: {},
          activeInteraction: null,
        );

        // Act - Start first event
        final result1 = translator.translate(event1);
        expect(result1, isNotNull);

        // Start second event
        const pointer2Down = PointerDownEvent(
          pointer: 2,
          position: Offset(200, 200),
          kind: PointerDeviceKind.touch,
        );

        final event2 = PhysicalEvent.pointer(
          eventId: 'test-2',
          logicalPosition: const Offset(200, 200),
          screenPosition: const Offset(200, 200),
          transformSnapshot: testTransform,
          hitList: testObjects,
          borderProximity: BorderProximity.none,
          phase: InteractionPhase.start,
          rawEvent: pointer2Down,
          delta: null,
          currentViewport: Rect.zero,
          pressedMouseButtons: {},
          pressedKeys: {},
          activeInteraction: null,
        );

        // Act - Start second event
        final result2 = translator.translate(event2);
        expect(result2, isNotNull);

        // Assert - Both events should be handled independently
        expect(result1, isNot(equals(result2)));
      });
    });
  });
}

class _MockDiagramObject implements DiagramObjectEntity {
  @override
  String get id => 'mock-object';

  @override
  Rect get logicalBounds => const Rect.fromLTWH(50, 50, 100, 100);

  @override
  Offset get center => const Offset(100, 100);

  @override
  int get zOrder => 0;

  @override
  bool get isVisible => true;

  @override
  bool get isInteractive => true;

  @override
  bool get isSelected => false;

  @override
  bool contains(Offset point) {
    return logicalBounds.contains(point);
  }

  @override
  void paint(Canvas canvas) {
    // Mock painting implementation
  }

  Rect enclosingRect() => logicalBounds;

  void printOnCanvas({required Canvas canvas}) {
    paint(canvas);
  }

  @override
  List<Object?> get props => [id, logicalBounds, center, zOrder];

  @override
  bool? get stringify => null;
}
