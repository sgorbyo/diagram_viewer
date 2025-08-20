import 'package:flutter/material.dart';
import 'dart:async';
import 'package:diagram_viewer/diagram_viewer.dart';

/// Demo controller that demonstrates grid overlay thinning optimizations
class GridThinningDemoController implements IDiagramController {
  final _commands = StreamController<DiagramCommand>.broadcast();
  final _events = StreamController<DiagramEventUnion>.broadcast();
  final List<DiagramObjectEntity> _objects = [];

  GridThinningDemoController() {
    _events.stream.listen(_onEvent);
    _setupDemoObjects();
  }

  void _setupDemoObjects() {
    // Add some demo objects to show the grid
    for (int i = 0; i < 5; i++) {
      _objects.add(_DemoObject(
        id: 'demo-$i',
        position: Offset(50.0 * i, 50.0 * i),
        size: 20.0,
      ));
    }
  }

  void _onEvent(DiagramEventUnion event) {
    // Handle events and send commands back
    event.when(
      tap: (event) {
        // Handle tap
      },
      doubleTap: (event) {
        // Handle double tap
      },
      longPress: (event) {
        // Handle long press
      },
      scroll: (event) {
        // Handle scroll
      },
      dragBegin: (event) {
        // Handle drag begin
      },
      dragContinue: (event) {
        // Handle drag continue
      },
      dragEnd: (event) {
        // Handle drag end
      },
      pinchBegin: (event) {
        // Handle pinch begin
      },
      pinchContinue: (event) {
        // Handle pinch continue
      },
      pinchEnd: (event) {
        // Handle pinch end
      },
      dragTargetEnter: (eventId, dataPreview, screenPosition, logicalPosition,
          transformSnapshot, timestamp) {
        // Handle drag target enter
      },
      dragTargetOver: (eventId, dataPreview, screenPosition, logicalPosition,
          transformSnapshot, timestamp, snappedLogicalPosition) {
        // Handle drag target over
      },
      dragTargetLeave: (eventId, transformSnapshot, timestamp) {
        // Handle drag target leave
      },
      dragTargetDrop: (eventId, data, screenPosition, logicalPosition,
          transformSnapshot, timestamp, snappedLogicalPosition) {
        // Handle drag target drop
      },
      // Selection area events: no-op in demo (selection owned by app)
      selectionAreaStart: (eventId, logicalRect, transformSnapshot, timestamp,
          coveredObjectIds) {},
      selectionAreaUpdate: (eventId, logicalRect, transformSnapshot, timestamp,
          coveredObjectIds) {},
      selectionAreaEnd: (eventId, logicalRect, transformSnapshot, timestamp,
          coveredObjectIds) {},
    );
  }

  @override
  Stream<DiagramCommand> get commandStream => _commands.stream;

  @override
  Sink<DiagramEventUnion> get eventsSink => _events.sink;

  @override
  Rect get logicalExtent => const Rect.fromLTWH(-200, -200, 400, 400);

  @override
  DiagramConfiguration get configuration => const DiagramConfiguration(
        showSnapGrid: true,
        snapGridSpacing: 16.0,
        snapGridOrigin: Offset.zero,
        enableAdaptiveGridDensity: true,
        minGridLinePixelSpacing: 8.0,
        maxGridLines: 200,
      );

  @override
  List<DiagramObjectEntity> get objects => _objects;

  @override
  void dispose() {
    _commands.close();
    _events.close();
  }
}

/// Simple demo object for the grid thinning demo
class _DemoObject extends DiagramObjectEntity {
  final String _id;
  final Offset _position;
  final double size;

  _DemoObject({
    required String id,
    required Offset position,
    required this.size,
  })  : _id = id,
        _position = position;

  @override
  String get id => _id;

  @override
  Rect get logicalBounds => Rect.fromCenter(
        center: _position,
        width: size,
        height: size,
      );

  @override
  int get zOrder => 100;

  @override
  void paint(Canvas canvas) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    canvas.drawCircle(_position, size / 2, paint);
  }

  @override
  bool contains(Offset point) {
    return (point - _position).distance <= size / 2;
  }

  @override
  List<Object?> get props => [_id, _position, size];
}

/// Demo widget that shows grid overlay thinning in action
class GridThinningDemo extends StatefulWidget {
  const GridThinningDemo({super.key});

  @override
  State<GridThinningDemo> createState() => _GridThinningDemoState();
}

class _GridThinningDemoState extends State<GridThinningDemo> {
  late GridThinningDemoController _controller;
  bool _showAdaptiveGrid = true;
  double _minPixelSpacing = 8.0;
  int _maxGridLines = 200;

  @override
  void initState() {
    super.initState();
    _controller = GridThinningDemoController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid Overlay Thinning Demo'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Control panel
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey[100],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Grid Thinning Controls',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Checkbox(
                      value: _showAdaptiveGrid,
                      onChanged: (value) {
                        setState(() {
                          _showAdaptiveGrid = value ?? true;
                        });
                      },
                    ),
                    const Text('Enable Adaptive Grid Density'),
                  ],
                ),
                Row(
                  children: [
                    const Text('Min Pixel Spacing: '),
                    Expanded(
                      child: Slider(
                        value: _minPixelSpacing,
                        min: 2.0,
                        max: 20.0,
                        divisions: 18,
                        label: _minPixelSpacing.toStringAsFixed(1),
                        onChanged: (value) {
                          setState(() {
                            _minPixelSpacing = value;
                          });
                        },
                      ),
                    ),
                    Text(_minPixelSpacing.toStringAsFixed(1)),
                  ],
                ),
                Row(
                  children: [
                    const Text('Max Grid Lines: '),
                    Expanded(
                      child: Slider(
                        value: _maxGridLines.toDouble(),
                        min: 50,
                        max: 500,
                        divisions: 45,
                        label: _maxGridLines.toString(),
                        onChanged: (value) {
                          setState(() {
                            _maxGridLines = value.round();
                          });
                        },
                      ),
                    ),
                    Text(_maxGridLines.toString()),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Current Configuration:',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                Text('Adaptive Density: ${_showAdaptiveGrid ? "ON" : "OFF"}'),
                Text(
                    'Min Pixel Spacing: ${_minPixelSpacing.toStringAsFixed(1)}px'),
                Text('Max Grid Lines: $_maxGridLines'),
              ],
            ),
          ),

          // Diagram viewer
          Expanded(
            child: DiagramViewer(
              controller: _controller,
              configuration: DiagramConfiguration(
                showSnapGrid: true,
                snapGridSpacing: 16.0,
                snapGridOrigin: Offset.zero,
                enableAdaptiveGridDensity: _showAdaptiveGrid,
                minGridLinePixelSpacing: _minPixelSpacing,
                maxGridLines: _maxGridLines,
              ),
              debug: true,
            ),
          ),
        ],
      ),
    );
  }
}
