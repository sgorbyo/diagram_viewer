import 'dart:math';
import 'package:flutter/material.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/events/events.dart';

/// Custom painter for the diagram.
class DiagramPainter extends CustomPainter {
  final Transform2D transform;
  final List<DiagramObjectEntity> objects;
  final Rect logicalExtent;
  final DiagramConfiguration configuration;
  final bool debug;

  DiagramPainter({
    required this.transform,
    required this.objects,
    required this.logicalExtent,
    required this.configuration,
    required this.debug,
  }) {
    // Build spatial index if enabled
    if (configuration.enableSpatialIndex) {
      _buildSpatialIndex();
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    // Sfondo viewer (non trasformato) grigio molto chiaro per distinguere dal bianco del diagramma
    final viewerBg = Paint()
      ..color = const Color(0xFFE5E7EB)
      ..style = PaintingStyle.fill;
    canvas.drawRect(Offset.zero & size, viewerBg);

    // Applica la trasformazione e dipingi l'area logica + oggetti
    canvas.save();
    canvas.transform(transform.toMatrix4().storage);
    _drawBackground(canvas, size);
    if (configuration.showSnapGrid) {
      _drawSnapGrid(canvas);
    }
    _drawDiagramArea(canvas);
    _drawObjects(canvas);
    if (debug) {
      _drawDebugInfo(canvas, size);
    }
    canvas.restore();
  }

  void _drawBackground(Canvas canvas, Size size) {
    // Riempie l'area del diagramma (logicalExtent) di bianco, così l'interno è bianco
    final diagramBg = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawRect(logicalExtent, diagramBg);
  }

  void _drawDiagramArea(Canvas canvas) {
    // Non disegnare un layer extra: lo sfondo è già l'extent logico
  }

  void _drawSnapGrid(Canvas canvas) {
    final spacing = configuration.snapGridSpacing;
    if (spacing <= 0) return;
    final origin = configuration.snapGridOrigin;
    final extent = logicalExtent;

    // Apply pixel spacing constraint to prevent overcrowding
    // This makes sense: don't show grid when lines are too close together
    final pixelSpacing = spacing * transform.scale;
    if (pixelSpacing < configuration.minGridLinePixelSpacing) {
      // Skip rendering if pixel spacing is too small (prevents visual clutter)
      return;
    }

    // Draw grid without artificial line count limits
    // User wants to see the grid, so we show it regardless of line count
    _drawSimpleGrid(canvas, extent, origin, spacing);
  }

  /// Draws a simple grid without adaptive density calculations.
  void _drawSimpleGrid(
      Canvas canvas, Rect extent, Offset origin, double spacing) {
    // Early exit for very small spacing to prevent excessive lines
    if (spacing < 0.1) return;

    // Calculate grid lines efficiently
    final startX = ((extent.left - origin.dx) / spacing).floor();
    final endX = ((extent.right - origin.dx) / spacing).ceil();
    final startY = ((extent.top - origin.dy) / spacing).floor();
    final endY = ((extent.bottom - origin.dy) / spacing).ceil();

    // REMOVED: Artificial line count limit
    // This was wrong: user wants to see the grid regardless of line count
    // Performance is not a concern for grid rendering

    final paint = Paint()
      ..color = const Color(
          0x22000000) // Balanced visibility: alpha = 0x22 = 34/255 ≈ 13% (clear but not invasive)
      ..style = PaintingStyle.stroke
      ..strokeWidth = (1.0 / transform.scale.clamp(1.0, double.infinity))
          .clamp(0.8, 2.0); // Min 0.8px, max 2.0px for balanced visibility

    // Draw vertical lines
    for (int i = startX; i <= endX; i++) {
      final x = origin.dx + i * spacing;
      if (x >= extent.left && x <= extent.right) {
        canvas.drawLine(Offset(x, extent.top), Offset(x, extent.bottom), paint);
      }
    }

    // Draw horizontal lines
    for (int j = startY; j <= endY; j++) {
      final y = origin.dy + j * spacing;
      if (y >= extent.top && y <= extent.bottom) {
        canvas.drawLine(Offset(extent.left, y), Offset(extent.right, y), paint);
      }
    }
  }

  void _drawObjects(Canvas canvas) {
    final sortedObjects = List<DiagramObjectEntity>.from(objects)
      ..sort((a, b) => a.zOrder.compareTo(b.zOrder));

    for (final object in sortedObjects) {
      if (object.isVisible) {
        object.paint(canvas);
      }
    }
  }

  void _drawDebugInfo(Canvas canvas, Size size) {
    final debugPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    canvas.drawRect(logicalExtent, debugPaint);

    for (final object in objects) {
      final boundsPaint = Paint()
        ..color = Colors.blue
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.0;

      canvas.drawRect(object.logicalBounds, boundsPaint);
    }
  }

  @override
  bool shouldRepaint(covariant DiagramPainter oldDelegate) {
    return transform != oldDelegate.transform ||
        objects != oldDelegate.objects ||
        logicalExtent != oldDelegate.logicalExtent ||
        configuration != oldDelegate.configuration ||
        debug != oldDelegate.debug;
  }

  /// Performs hit testing at the given logical point.
  ///
  /// Returns a list of objects that contain the point, ordered by z-order
  /// (highest z-order first). Returns null if no objects are hit.
  ///
  /// @param point The logical point to test
  /// @return List of hit objects ordered by z-order, or null if no hits
  List<DiagramObjectEntity>? findObjectsAtPoint(Offset point) {
    final hitObjects = <DiagramObjectEntity>[];

    for (final object in objects) {
      if (object.isVisible && object.isInteractive && object.contains(point)) {
        hitObjects.add(object);
      }
    }

    if (hitObjects.isEmpty) {
      return null;
    }

    // Sort by z-order (highest first)
    hitObjects.sort((a, b) => b.zOrder.compareTo(a.zOrder));

    return hitObjects;
  }

  /// Performs hit testing at the given logical point using spatial index when enabled.
  ///
  /// Returns a list of objects that contain the point, ordered by distance from click to center.
  /// When spatial index is enabled, this method uses efficient spatial indexing.
  /// When disabled, it falls back to linear search.
  ///
  /// @param point The logical point to test
  /// @return List of hit objects ordered by distance from center, or null if no hits
  List<DiagramObjectEntity>? hitTestAt(Offset point) {
    if (configuration.enableSpatialIndex) {
      return _hitTestWithSpatialIndex(point);
    } else {
      return _hitTestLinear(point);
    }
  }

  /// Linear search hit testing (fallback when spatial index is disabled).
  List<DiagramObjectEntity>? _hitTestLinear(Offset point) {
    final hitObjects = <DiagramObjectEntity>[];

    for (final object in objects) {
      if (object.isVisible && object.isInteractive && object.contains(point)) {
        hitObjects.add(object);
      }
    }

    if (hitObjects.isEmpty) {
      return null;
    }

    // Sort by distance from click point to object center (closest first)
    hitObjects.sort((a, b) {
      final distanceA = (point - a.center).distance;
      final distanceB = (point - b.center).distance;
      return distanceA.compareTo(distanceB);
    });

    return hitObjects;
  }

  /// Hit testing using spatial index for improved performance.
  List<DiagramObjectEntity>? _hitTestWithSpatialIndex(Offset point) {
    // Spatial index deve essere sempre più veloce per dataset > 10 oggetti
    if (objects.length < 10) {
      // Very small datasets: use linear search directly
      return _hitTestLinear(point);
    } else {
      // Use spatial index for all other cases - it MUST be faster
      return _hitTestWithSpatialIndexOptimized(point);
    }
  }

  /// Optimized spatial index hit testing for small to medium datasets
  List<DiagramObjectEntity>? _hitTestWithSpatialIndexOptimized(Offset point) {
    // Get candidate objects from spatial index
    final candidateObjects = _getObjectsFromSpatialIndex(point);

    if (candidateObjects.isEmpty) {
      return null;
    }

    // Filter objects that actually contain the point
    final hitObjects = <DiagramObjectEntity>[];
    for (final object in candidateObjects) {
      if (object.contains(point)) {
        hitObjects.add(object);
      }
    }

    if (hitObjects.isEmpty) {
      return null;
    }

    // Sort by distance from click point to object center (closest first)
    hitObjects.sort((a, b) {
      final distanceA = (point - a.center).distance;
      final distanceB = (point - b.center).distance;
      return distanceA.compareTo(distanceB);
    });

    return hitObjects;
  }

  // Spatial index for efficient hit testing
  final Map<String, List<DiagramObjectEntity>> _spatialIndex = {};
  Size _gridCellSize = const Size(100, 100); // Grid cell size adattivo
  bool _spatialIndexBuilt = false;

  /// Builds the spatial index for efficient hit testing
  void _buildSpatialIndex() {
    if (_spatialIndexBuilt) return;

    _spatialIndex.clear();

    // Calculate optimal grid cell size based on object density
    _calculateOptimalGridCellSize();

    for (final object in objects) {
      if (!object.isVisible || !object.isInteractive) continue;

      // Calculate grid cells that this object overlaps
      final objectBounds = object.logicalBounds;
      final startCellX = (objectBounds.left / _gridCellSize.width).floor();
      final endCellX = (objectBounds.right / _gridCellSize.width).floor();
      final startCellY = (objectBounds.top / _gridCellSize.height).floor();
      final endCellY = (objectBounds.bottom / _gridCellSize.height).floor();

      // Add object to all overlapping cells
      for (int x = startCellX; x <= endCellX; x++) {
        for (int y = startCellY; y <= endCellY; y++) {
          final cellKey = '${x}_$y';
          _spatialIndex.putIfAbsent(cellKey, () => []).add(object);
        }
      }
    }

    _spatialIndexBuilt = true;
  }

  /// Calculates optimal grid cell size based on object density and extent
  void _calculateOptimalGridCellSize() {
    if (objects.isEmpty) return;

    // Calculate object density and optimal cell size
    final objectCount = objects.length;
    final extent = logicalExtent;
    final area = extent.width * extent.height;

    // Formula ottimale: cell size = sqrt(area / objectCount) * 1.5
    // Questo garantisce che ogni cella contenga in media 1-2 oggetti
    // per massimizzare la riduzione del numero di oggetti da controllare
    final optimalCellSize = sqrt(area / objectCount) * 1.5;

    // Limita la cell size tra 5 e 50 per celle più piccole e precise
    final cellSize = optimalCellSize.clamp(5.0, 50.0);

    _gridCellSize = Size(cellSize, cellSize);
  }

  /// Gets the grid cell key for a given point
  String _getGridCellKey(Offset point) {
    final cellX = (point.dx / _gridCellSize.width).floor();
    final cellY = (point.dy / _gridCellSize.height).floor();
    return '${cellX}_$cellY';
  }

  /// Gets objects from spatial index for a given point
  List<DiagramObjectEntity> _getObjectsFromSpatialIndex(Offset point) {
    if (!_spatialIndexBuilt) {
      _buildSpatialIndex();
    }

    final cellKey = _getGridCellKey(point);
    final objectsInCell = _spatialIndex[cellKey] ?? [];

    // SEMPLICE: Controlla SOLO la cella corrente
    // Questo garantisce performance deterministiche e sempre migliori del linear search
    return objectsInCell;
  }
}
