import 'package:flutter/material.dart';
import 'controllers/example_diagram_controller.dart';
import 'package:diagram_viewer/diagram_viewer.dart';

void main() {
  runApp(const MyApp());
}

/// Example app demonstrating the use of the diagram_viewer package
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diagram Viewer Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Diagram Viewer Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final ExampleDiagramController controller;
  DiagramConfiguration _config = const DiagramConfiguration(
    bounceDuration: Duration(milliseconds: 600),
    bounceCurve: Curves.easeOutQuart,
    enableBlocDebugObserver: false,
    snapGridEnabled: false,
    snapGridSpacing: 16,
    snapGridOrigin: Offset.zero,
    showSnapGrid: false,
    enableInertialScrolling: true,
    inertialFriction: 0.98, // slower decay → inertia more visible
    inertialMinStartVelocity:
        200.0, // lower threshold to start inertia more often
    inertialMinStopVelocity: 30.0, // allow longer glide
    inertialMaxDuration: Duration(milliseconds: 1200),
  );

  @override
  void initState() {
    super.initState();
    controller = ExampleDiagramController();
    controller.updateConfiguration(_config);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diagram Viewer Example'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // Test the redraw mechanism
              controller.sendRedrawCommand();
            },
            tooltip: 'Test Redraw',
          ),
        ],
      ),
      body: SizedBox.expand(
        child: Row(
          children: [
            // Simple in-app DnD source panel (palette)
            Container(
              key: const ValueKey('example_palette'),
              width: 220,
              color: Colors.black.withValues(alpha: 0.04),
              child: ListView(
                padding: const EdgeInsets.all(12),
                children: [
                  const Text(
                    'Palette (drag into viewer):',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  const _DraggableItem(payload: {
                    'type': 'circle',
                    'radius': 40.0,
                    'color': 0xFF2196F3
                  }),
                  const SizedBox(height: 8),
                  const _DraggableItem(payload: {
                    'type': 'circle',
                    'radius': 60.0,
                    'color': 0xFFE91E63
                  }),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 8),
                  const Text(
                    'Snap Grid',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  _SnapGridControls(
                    initial: _config,
                    controller: controller,
                    onChanged: (cfg) {
                      setState(() {
                        _config = cfg;
                      });
                      controller.updateConfiguration(cfg);
                    },
                    onToggleDemoConnections: (v) {
                      controller.setDemoConnectionsEnabled(v);
                    },
                  ),
                ],
              ),
            ),
            const VerticalDivider(width: 1),
            Expanded(
              child: Container(
                color: Colors.grey.withValues(alpha: 0.06),
                child: DiagramViewer(
                  controller: controller,
                  configuration: _config,
                  debug: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SnapGridControls extends StatefulWidget {
  final DiagramConfiguration initial;
  final ExampleDiagramController controller;
  final ValueChanged<DiagramConfiguration> onChanged;
  final ValueChanged<bool> onToggleDemoConnections;
  const _SnapGridControls(
      {required this.initial,
      required this.controller,
      required this.onChanged,
      required this.onToggleDemoConnections});

  @override
  State<_SnapGridControls> createState() => _SnapGridControlsState();
}

class _SnapGridControlsState extends State<_SnapGridControls> {
  late bool enabled;
  late bool showGrid;
  late double spacing;
  late double originX;
  late double originY;
  bool demoConnections = false;

  @override
  void initState() {
    super.initState();
    enabled = widget.initial.snapGridEnabled;
    showGrid = widget.initial.showSnapGrid;
    spacing = widget.initial.snapGridSpacing;
    originX = widget.initial.snapGridOrigin.dx;
    originY = widget.initial.snapGridOrigin.dy;
  }

  void _emit() {
    widget.onChanged(
      DiagramConfiguration(
        bounceDuration: widget.initial.bounceDuration,
        bounceCurve: widget.initial.bounceCurve,
        maxZoom: widget.initial.maxZoom,
        minZoom: widget.initial.minZoom,
        overscrollPixels: widget.initial.overscrollPixels,
        autoScrollInterval: widget.initial.autoScrollInterval,
        autoScrollAcceleration: widget.initial.autoScrollAcceleration,
        enableTranslation: widget.initial.enableTranslation,
        enableScale: widget.initial.enableScale,
        enableRotation: widget.initial.enableRotation,
        clipContent: widget.initial.clipContent,
        enableInertialScrolling: widget.initial.enableInertialScrolling,
        inertialFriction: widget.initial.inertialFriction,
        enableKeyboardShortcuts: widget.initial.enableKeyboardShortcuts,
        enableAccessibility: widget.initial.enableAccessibility,
        enableBlocDebugObserver: widget.initial.enableBlocDebugObserver,
        snapGridEnabled: enabled,
        snapGridSpacing: spacing,
        snapGridOrigin: Offset(originX, originY),
        showSnapGrid: showGrid,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Enable snap-to-grid'),
          value: enabled,
          onChanged: (v) {
            setState(() => enabled = v);
            _emit();
          },
        ),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Show grid overlay'),
          value: showGrid,
          onChanged: (v) {
            setState(() => showGrid = v);
            _emit();
          },
        ),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Demo: show connections'),
          value: demoConnections,
          onChanged: (v) {
            setState(() => demoConnections = v);
            widget.onToggleDemoConnections(v);
          },
        ),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Select'),
          subtitle: const Text('Enable selection mode'),
          value: widget.controller.isSelectionModeEnabled,
          onChanged: (v) {
            widget.controller.setSelectionMode(v);
            setState(() {}); // Trigger rebuild to update UI
          },
        ),
        const SizedBox(height: 8),
        Text('Spacing: ${spacing.toStringAsFixed(1)}'),
        Slider(
          value: spacing,
          min: 2,
          max: 64,
          divisions: 62,
          label: spacing.toStringAsFixed(1),
          onChanged: (v) {
            setState(() => spacing = v);
            _emit();
          },
        ),
        const SizedBox(height: 8),
        const Text('Origin (logical)'),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'X',
                  isDense: true,
                ),
                initialValue: originX.toStringAsFixed(1),
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                onChanged: (s) {
                  final v = double.tryParse(s);
                  if (v != null) {
                    setState(() => originX = v);
                    _emit();
                  }
                },
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Y',
                  isDense: true,
                ),
                initialValue: originY.toStringAsFixed(1),
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                onChanged: (s) {
                  final v = double.tryParse(s);
                  if (v != null) {
                    setState(() => originY = v);
                    _emit();
                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _DraggableItem extends StatelessWidget {
  final Map<String, dynamic> payload;
  const _DraggableItem({required this.payload});

  @override
  Widget build(BuildContext context) {
    final color = Color(payload['color'] as int);
    final data = {
      ...payload,
      'feedbackOffsetX': 0.0,
      'feedbackOffsetY': 0.0,
      'feedbackW': 16.0,
      'feedbackH': 16.0,
    };
    final GlobalKey childKey = GlobalKey();
    return Draggable<Map<String, dynamic>>(
      data: data,
      // Usa la strategia standard di Flutter (ancorata al punto di contatto)
      dragAnchorStrategy: pointerDragAnchorStrategy,
      feedback: Opacity(
        opacity: 0.8,
        child: Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.2),
            shape: BoxShape.circle,
            border: Border.all(color: color.withValues(alpha: 0.7)),
          ),
        ),
      ),
      // offset zero: feedback centrato come il ghost
      feedbackOffset: Offset.zero,
      child: KeyedSubtree(key: childKey, child: _preview(color)),
    );
  }

  Widget _preview(Color color) {
    // Pulsante quadrato e più stretto per ridurre la distanza percepita del ghost
    return SizedBox(
      width: 80,
      height: 80,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.10),
          border: Border.all(color: color.withValues(alpha: 0.6)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(child: Text('Circle')),
      ),
    );
  }
}
