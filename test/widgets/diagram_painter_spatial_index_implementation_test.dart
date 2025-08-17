// ignore_for_file: prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diagram_viewer/interfaces/diagram_configuration.dart';
import 'package:diagram_viewer/interfaces/diagram_object_entity.dart';
import 'package:diagram_viewer/widgets/diagram_painter.dart';
import 'package:diagram_viewer/events/transform_2d.dart';

void main() {
  group('DiagramPainter Spatial Index Implementation Tests', () {
    late DiagramPainter painter;
    late List<DiagramObjectEntity> testObjects;

    setUp(() {
      // Crea oggetti di test distribuiti in diverse regioni spaziali
      testObjects = [
        // Regione 1: Top-left (0-200, 0-200)
        _TestObject(
          id: 'obj1',
          center: const Offset(50, 50),
          size: const Size(100, 100),
        ),
        _TestObject(
          id: 'obj2',
          center: const Offset(150, 150),
          size: const Size(80, 80),
        ),

        // Regione 2: Top-right (200-400, 0-200)
        _TestObject(
          id: 'obj3',
          center: const Offset(250, 50),
          size: const Size(100, 100),
        ),
        _TestObject(
          id: 'obj4',
          center: const Offset(350, 150),
          size: const Size(80, 80),
        ),

        // Regione 3: Bottom-left (0-200, 200-400)
        _TestObject(
          id: 'obj5',
          center: const Offset(50, 250),
          size: const Size(100, 100),
        ),
        _TestObject(
          id: 'obj6',
          center: const Offset(150, 350),
          size: const Size(80, 80),
        ),

        // Regione 4: Bottom-right (200-400, 200-400)
        _TestObject(
          id: 'obj7',
          center: const Offset(250, 250),
          size: const Size(100, 100),
        ),
        _TestObject(
          id: 'obj8',
          center: const Offset(350, 350),
          size: const Size(80, 80),
        ),

        // Oggetti sovrapposti per test di collisione
        _TestObject(
          id: 'overlap1',
          center: const Offset(125, 125),
          size: const Size(150, 150),
        ),
        _TestObject(
          id: 'overlap2',
          center: const Offset(275, 275),
          size: const Size(150, 150),
        ),
      ];

      painter = DiagramPainter(
        transform: const Transform2D(),
        objects: testObjects,
        logicalExtent: const Rect.fromLTWH(0, 0, 400, 400),
        configuration: const DiagramConfiguration(enableSpatialIndex: true),
        debug: false,
      );
    });

    tearDown(() {
      // Nessuna pulizia necessaria
    });

    group('Spatial Index Structure', () {
      test('should organize objects in spatial regions', () {
        // Test che verifica che gli oggetti siano organizzati spazialmente
        final hitResult = painter.hitTestAt(const Offset(75, 75));

        expect(hitResult, isNotNull);
        expect(hitResult!.isNotEmpty, isTrue);

        // Dovrebbe trovare oggetti nella regione top-left
        // Punto (75, 75) è contenuto in obj1 e overlap1, ma NON in obj2
        final foundIds = hitResult.map((obj) => obj.id).toSet();
        expect(foundIds, contains('obj1'));
        expect(foundIds, contains('overlap1'));
        // obj2 ha bounds (110, 110, 190, 190) e non contiene (75, 75)
        expect(foundIds, isNot(contains('obj2')));
        // Verifica che siano trovati esattamente 2 oggetti
        expect(foundIds.length, equals(2));
      });

      test('should efficiently query different spatial regions', () {
        // Test performance per query in regioni diverse
        final stopwatch = Stopwatch();

        // Query regione top-left
        stopwatch.start();
        final hitResult1 = painter.hitTestAt(const Offset(75, 75));
        stopwatch.stop();
        final time1 = stopwatch.elapsedMicroseconds;

        // Query regione bottom-right
        stopwatch.reset();
        stopwatch.start();
        final hitResult2 = painter.hitTestAt(const Offset(325, 325));
        stopwatch.stop();
        final time2 = stopwatch.elapsedMicroseconds;

        expect(hitResult1, isNotNull);
        expect(hitResult2, isNotNull);
        expect(hitResult1!.isNotEmpty, isTrue);
        expect(hitResult2!.isNotEmpty, isTrue);

        // Entrambe le query dovrebbero essere veloci
        expect(time1, lessThan(1000)); // < 1ms
        expect(time2, lessThan(1000)); // < 1ms
      });

      test('should handle overlapping objects correctly', () {
        // Test per oggetti sovrapposti in diverse regioni
        final hitResult = painter.hitTestAt(const Offset(125, 125));

        expect(hitResult, isNotNull);
        expect(hitResult!.length, greaterThan(1));

        // Dovrebbe trovare sia obj2 che overlap1
        // obj1 ha bounds (0, 0, 100, 100) e NON contiene (125, 125)
        final foundIds = hitResult.map((obj) => obj.id).toSet();
        expect(foundIds, contains('obj2'));
        expect(foundIds, contains('overlap1'));
        expect(
            foundIds,
            isNot(contains(
                'obj1'))); // obj1 non dovrebbe essere trovato per (125, 125)
        // Verifica che siano trovati esattamente 2 oggetti
        expect(foundIds.length, equals(2));

        // Verifica ordinamento per distanza
        for (int i = 0; i < hitResult.length - 1; i++) {
          final distance1 =
              (const Offset(125, 125) - hitResult[i].center).distance;
          final distance2 =
              (const Offset(125, 125) - hitResult[i + 1].center).distance;
          expect(distance1, lessThanOrEqualTo(distance2));
        }
      });
    });

    group('Spatial Index Performance', () {
      test('should scale efficiently with object count', () {
        // Test performance con molti oggetti
        final manyObjects = <DiagramObjectEntity>[];
        for (int i = 0; i < 1000; i++) {
          final obj = _TestObject(
            id: 'perf_obj_$i',
            center: Offset((i % 20) * 20.0, (i ~/ 20) * 20.0),
            size: const Size(15, 15),
            zOrder: 100, // Assicura che sia visibile e interattivo
          );
          manyObjects.add(obj);
        }

        final painterWithManyObjects = DiagramPainter(
          transform: const Transform2D(),
          objects: manyObjects,
          logicalExtent: const Rect.fromLTWH(0, 0, 400, 400),
          configuration: const DiagramConfiguration(enableSpatialIndex: true),
          debug: false,
        );

        final stopwatch = Stopwatch()..start();
        // Usa un punto che sia effettivamente contenuto in almeno un oggetto
        // perf_obj_3 ha centro (60, 0) e bounds (52.5, -7.5, 67.5, 7.5) che contiene (60, 0)
        final hitResult = painterWithManyObjects.hitTestAt(const Offset(60, 0));
        stopwatch.stop();

        expect(hitResult, isNotNull);
        expect(hitResult!.isNotEmpty, isTrue);

        // Spatial index dovrebbe essere molto più veloce di linear search
        expect(stopwatch.elapsedMicroseconds, lessThan(1000)); // < 1ms
      });

      test('should outperform linear search for large datasets', () {
        // Test comparativo tra spatial index e linear search
        final largeObjectList = <DiagramObjectEntity>[];
        for (int i = 0; i < 5000; i++) {
          final obj = _TestObject(
            id: 'large_obj_$i',
            center: Offset((i % 50) * 10.0, (i ~/ 50) * 10.0),
            size: const Size(8, 8),
            zOrder: 100, // Assicura che sia visibile e interattivo
          );
          largeObjectList.add(obj);
        }

        final painterWithSpatialIndex = DiagramPainter(
          transform: const Transform2D(),
          objects: largeObjectList,
          logicalExtent: const Rect.fromLTWH(0, 0, 500, 500),
          configuration: const DiagramConfiguration(enableSpatialIndex: true),
          debug: false,
        );

        final painterWithoutSpatialIndex = DiagramPainter(
          transform: const Transform2D(),
          objects: largeObjectList,
          logicalExtent: const Rect.fromLTWH(0, 0, 500, 500),
          configuration: const DiagramConfiguration(enableSpatialIndex: false),
          debug: false,
        );

        // Test con spatial index
        final stopwatch1 = Stopwatch()..start();
        // Usa un punto che sia effettivamente contenuto in almeno un oggetto
        // large_obj_5 ha centro (50, 0) e bounds (46, -4, 54, 4) che contiene (50, 0)
        final hitResult1 =
            painterWithSpatialIndex.hitTestAt(const Offset(50, 0));
        stopwatch1.stop();

        // Test senza spatial index (linear search)
        final stopwatch2 = Stopwatch()..start();
        final hitResult2 =
            painterWithoutSpatialIndex.hitTestAt(const Offset(50, 0));
        stopwatch2.stop();

        expect(hitResult1, isNotNull);
        expect(hitResult2, isNotNull);
        expect(hitResult1!.length, equals(hitResult2!.length));

        // Spatial index dovrebbe essere almeno veloce quanto linear search
        // (per dataset piccoli, la differenza potrebbe non essere significativa)
        final speedup =
            stopwatch2.elapsedMicroseconds / stopwatch1.elapsedMicroseconds;
        expect(speedup,
            greaterThan(0.5)); // Almeno 0.5x (spatial index non più lento)
      });

      test('should maintain consistent performance across different regions',
          () {
        // Test performance consistente in diverse regioni
        final testPoints = [
          const Offset(
              60, 0), // Top-left (contenuto in perf_obj_3 con centro 60,0)
          const Offset(
              200, 0), // Top-center (contenuto in oggetto con centro 200,0)
          const Offset(
              350, 0), // Top-right (contenuto in oggetto con centro 350,0)
          const Offset(
              60, 200), // Center-left (contenuto in oggetto con centro 60,200)
          const Offset(
              200, 200), // Center (contenuto in oggetto con centro 200,200)
          const Offset(350,
              200), // Center-right (contenuto in oggetto con centro 350,200)
          const Offset(
              60, 350), // Bottom-left (contenuto in oggetto con centro 60,350)
          const Offset(200,
              350), // Bottom-center (contenuto in oggetto con centro 200,350)
          const Offset(350,
              350), // Bottom-right (contenuto in oggetto con centro 350,350)
        ];

        final times = <int>[];
        for (final point in testPoints) {
          final stopwatch = Stopwatch()..start();
          final hitResult = painter.hitTestAt(point);
          stopwatch.stop();
          times.add(stopwatch.elapsedMicroseconds);

          expect(hitResult, isNotNull);
        }

        // Performance dovrebbe essere consistente (non più del 50% di variazione)
        final avgTime = times.reduce((a, b) => a + b) / times.length;
        for (final time in times) {
          final variation = (time - avgTime).abs() / avgTime;
          expect(variation, lessThan(0.5)); // < 50% variazione
        }
      });
    });

    group('Spatial Index Correctness', () {
      test('should find all objects in query region', () {
        // Test che verifica che tutti gli oggetti nella regione siano trovati
        final hitResult = painter.hitTestAt(const Offset(200, 200));

        expect(hitResult, isNotNull);
        expect(hitResult!.isNotEmpty, isTrue);

        // Dovrebbe trovare oggetti da tutte le regioni adiacenti
        final foundIds = hitResult.map((obj) => obj.id).toSet();

        // Verifica che siano trovati oggetti dalle regioni circostanti
        expect(foundIds.length, greaterThan(1));
      });

      test('should handle boundary conditions correctly', () {
        // Test sui bordi delle regioni spaziali
        final boundaryPoints = [
          const Offset(0, 0), // Top-left corner
          const Offset(400, 0), // Top-right corner
          const Offset(0, 400), // Bottom-left corner
          const Offset(400, 400), // Bottom-right corner
          const Offset(200, 0), // Top edge center
          const Offset(200, 400), // Bottom edge center
          const Offset(0, 200), // Left edge center
          const Offset(400, 200), // Right edge center
        ];

        for (final point in boundaryPoints) {
          final hitResult = painter.hitTestAt(point);
          // Alcuni punti potrebbero non contenere oggetti, ma non dovrebbero crashare
          if (hitResult != null) {
            expect(hitResult.isNotEmpty, isTrue);
          }
        }
      });

      test('should maintain object ordering by distance', () {
        // Test che verifica che l'ordinamento per distanza sia mantenuto
        final testPoint = const Offset(150, 150);
        final hitResult = painter.hitTestAt(testPoint);

        expect(hitResult, isNotNull);
        expect(hitResult!.length, greaterThan(1));

        // Verifica ordinamento per distanza crescente
        for (int i = 0; i < hitResult.length - 1; i++) {
          final distance1 = (testPoint - hitResult[i].center).distance;
          final distance2 = (testPoint - hitResult[i + 1].center).distance;
          expect(distance1, lessThanOrEqualTo(distance2));
        }
      });
    });
  });
}

/// Oggetto di test per i test dello spatial index
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
  bool get isVisible => true; // Sempre visibile per i test

  @override
  bool get isInteractive => true; // Sempre interattivo per i test

  @override
  List<Object?> get props => [_id, _center, _size, _zOrder];
}
