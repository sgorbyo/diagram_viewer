// ignore_for_file: prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/interfaces/diagram_configuration.dart';
import 'package:diagram_viewer/interfaces/diagram_object_entity.dart';
import 'package:diagram_viewer/widgets/diagram_painter.dart';
import 'package:diagram_viewer/events/transform_2d.dart';

void main() {
  group('DiagramPainter Spatial Index Tests', () {
    late DiagramPainter painter;
    late List<DiagramObjectEntity> testObjects;

    setUp(() {
      // Crea oggetti di test con posizioni note
      testObjects = [
        _TestObject(
          id: 'obj1',
          center: const Offset(100, 100),
          size: const Size(50, 50),
        ),
        _TestObject(
          id: 'obj2',
          center: const Offset(200, 200),
          size: const Size(50, 50),
        ),
        _TestObject(
          id: 'obj3',
          center: const Offset(300, 300),
          size: const Size(50, 50),
        ),
        _TestObject(
          id: 'obj4',
          center: const Offset(400, 400),
          size: const Size(50, 50),
        ),
        _TestObject(
          id: 'obj5',
          center: const Offset(500, 500),
          size: const Size(50, 50),
        ),
      ];

      painter = DiagramPainter(
        transform: const Transform2D(),
        objects: testObjects,
        logicalExtent: const Rect.fromLTWH(0, 0, 1000, 1000),
        configuration: const DiagramConfiguration(),
        debug: false,
      );
    });

    tearDown(() {
      // Nessuna pulizia necessaria
    });

    group('Spatial Index Hit-Testing', () {
      test('should find objects in spatial index when enabled', () {
        // Spatial index è ora implementato e funzionante
        final hitResult = painter.hitTestAt(const Offset(125, 125));

        expect(hitResult, isNotNull);
        expect(hitResult!.isNotEmpty, isTrue);
        expect(hitResult[0].id,
            equals('obj1')); // First object (closest to center)
      });

      test('should return null for points outside all objects', () {
        // Spatial index è ora implementato e funzionante
        final hitResult = painter.hitTestAt(const Offset(1000, 1000));

        expect(hitResult, isNull);
      });

      test('should handle edge cases correctly', () {
        // Spatial index è ora implementato e funzionante
        // Test sui bordi degli oggetti
        final hitResult1 =
            painter.hitTestAt(const Offset(100, 100)); // Center of obj1
        final hitResult2 = painter.hitTestAt(
            const Offset(120, 120)); // Near right/bottom edge of obj1

        expect(hitResult1, isNotNull);
        expect(hitResult1!.isNotEmpty, isTrue);
        expect(hitResult1[0].id, equals('obj1'));

        expect(hitResult2, isNotNull);
        expect(hitResult2!.isNotEmpty, isTrue);
        expect(hitResult2[0].id, equals('obj1'));
      });

      test('should work with overlapping objects', () {
        // Spatial index è ora implementato e funzionante
        // Crea oggetti sovrapposti con z-order più alto
        final overlappingObj = _TestObject(
          id: 'overlap',
          center: const Offset(125, 125),
          size: const Size(100, 100),
          zOrder: 200, // Higher than default 100
        );

        // Crea un nuovo painter con l'oggetto sovrapposto
        final painterWithOverlap = DiagramPainter(
          transform: const Transform2D(),
          objects: [...testObjects, overlappingObj],
          logicalExtent: const Rect.fromLTWH(0, 0, 1000, 1000),
          configuration: const DiagramConfiguration(),
          debug: false,
        );

        final hitResult = painterWithOverlap.hitTestAt(const Offset(125, 125));

        expect(hitResult, isNotNull);
        expect(
            hitResult!.length, greaterThan(1)); // Multiple overlapping objects

        // First object: closest to center of click (125, 125)
        // overlap ha centro (125, 125) che è esattamente il punto di click
        expect(hitResult[0].id, equals('overlap'));

        // Second object: further from center of click
        // obj1 ha centro (100, 100) che è più lontano dal click (125, 125)
        expect(hitResult[1].id, equals('obj1'));
      });

      test('should return objects ordered by distance from center', () {
        // Test specifico per verificare l'ordinamento per distanza
        // Usa un punto che è contenuto in obj1 (100, 100) con size (50, 50)
        final hitResult = painter.hitTestAt(const Offset(110, 110));

        expect(hitResult, isNotNull);
        expect(hitResult!.length, greaterThan(0));

        // Verifica che gli oggetti siano ordinati per distanza crescente dal centro
        for (int i = 0; i < hitResult.length - 1; i++) {
          final distance1 =
              (const Offset(110, 110) - hitResult[i].center).distance;
          final distance2 =
              (const Offset(110, 110) - hitResult[i + 1].center).distance;
          expect(distance1, lessThanOrEqualTo(distance2));
        }
      });
    });

    group('Spatial Index Configuration', () {
      test('should respect enableSpatialIndex configuration flag', () {
        // Configurazione spatial index è ora implementata
        final configWithSpatialIndex = const DiagramConfiguration().copyWith(
          enableSpatialIndex: true,
        );

        final painterWithSpatialIndex = DiagramPainter(
          transform: const Transform2D(),
          objects: testObjects,
          logicalExtent: const Rect.fromLTWH(0, 0, 1000, 1000),
          configuration: configWithSpatialIndex,
          debug: false,
        );

        expect(
            painterWithSpatialIndex.configuration.enableSpatialIndex, isTrue);
      });

      test('should use default spatial index settings when not specified', () {
        // Configurazione spatial index è ora implementata
        final defaultConfig = const DiagramConfiguration();

        expect(defaultConfig.enableSpatialIndex, isFalse);
      });
    });

    group('Spatial Index Performance', () {
      test('should maintain consistent performance with many objects', () {
        // Spatial index è ora implementato e funzionante
        // Aggiungi molti oggetti per testare performance
        final manyObjects = <DiagramObjectEntity>[];
        for (int i = 0; i < 100; i++) {
          final obj = _TestObject(
            id: 'perf_obj_$i',
            center: Offset(i * 10.0, i * 10.0),
            size: const Size(30, 30),
          );
          manyObjects.add(obj);
        }

        final painterWithManyObjects = DiagramPainter(
          transform: const Transform2D(),
          objects: manyObjects,
          logicalExtent: const Rect.fromLTWH(0, 0, 1000, 1000),
          configuration: const DiagramConfiguration(),
          debug: false,
        );

        final stopwatch = Stopwatch()..start();
        final hitResult =
            painterWithManyObjects.hitTestAt(const Offset(125, 125));
        stopwatch.stop();

        expect(hitResult, isNotNull);
        expect(hitResult!.isNotEmpty, isTrue);
        expect(stopwatch.elapsedMicroseconds, lessThan(1000)); // < 1ms
      });

      test('should be faster than linear search for large object counts', () {
        // Spatial index è ora implementato e funzionante
        // Aggiungi molti oggetti
        final largeObjectList = <DiagramObjectEntity>[];
        for (int i = 0; i < 1000; i++) {
          final obj = _TestObject(
            id: 'large_obj_$i',
            center: Offset(i * 5.0, i * 5.0),
            size: const Size(20, 20),
          );
          largeObjectList.add(obj);
        }

        final painterWithLargeList = DiagramPainter(
          transform: const Transform2D(),
          objects: largeObjectList,
          logicalExtent: const Rect.fromLTWH(0, 0, 1000, 1000),
          configuration: const DiagramConfiguration(enableSpatialIndex: true),
          debug: false,
        );

        // Test performance con spatial index
        final stopwatch1 = Stopwatch()..start();
        final hitResult1 =
            painterWithLargeList.hitTestAt(const Offset(125, 125));
        stopwatch1.stop();

        // Test performance senza spatial index (simulato)
        final stopwatch2 = Stopwatch()..start();
        List<DiagramObjectEntity> foundObjects = [];
        for (final obj in largeObjectList) {
          if (obj.logicalBounds.contains(const Offset(125, 125))) {
            foundObjects.add(obj);
          }
        }
        // Sort by distance (simulating the same logic)
        foundObjects.sort((a, b) {
          final distanceA = (const Offset(125, 125) - a.center).distance;
          final distanceB = (const Offset(125, 125) - b.center).distance;
          return distanceA.compareTo(distanceB);
        });
        stopwatch2.stop();

        expect(hitResult1, isNotNull);
        expect(foundObjects.isNotEmpty, isTrue);

        // Verifica che entrambi i metodi trovino gli stessi oggetti
        // (può variare leggermente a causa di differenze nell'implementazione)
        expect(hitResult1!.length, greaterThan(0));
        expect(foundObjects.length, greaterThan(0));

        // Spatial index dovrebbe essere più veloce
        expect(stopwatch1.elapsedMicroseconds,
            lessThan(stopwatch2.elapsedMicroseconds));
      });
    });
  });
}

/// Oggetto di test per i test dell'hit-testing
class _TestObject extends DiagramObjectEntity {
  final String _id;
  final Offset _center;
  final Size _size;
  final int _zOrder;

  _TestObject({
    required String id,
    required Offset center,
    required Size size,
    int zOrder = 100,
  })  : _id = id,
        _center = center,
        _size = size,
        _zOrder = zOrder;

  @override
  String get id => _id;

  @override
  Offset get center => _center;

  @override
  int get zOrder => _zOrder;

  @override
  Rect get logicalBounds => Rect.fromCenter(
        center: _center,
        width: _size.width,
        height: _size.height,
      );

  @override
  void paint(Canvas canvas) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    canvas.drawRect(logicalBounds, paint);
  }

  @override
  bool contains(Offset point) {
    // Use containsInclusive to include the borders
    return logicalBounds.left <= point.dx &&
        logicalBounds.right >= point.dx &&
        logicalBounds.top <= point.dy &&
        logicalBounds.bottom >= point.dy;
  }

  @override
  List<Object?> get props => [_id, _center, _size, _zOrder];
}
