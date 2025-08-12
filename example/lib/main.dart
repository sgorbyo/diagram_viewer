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

  @override
  void initState() {
    super.initState();
    controller = ExampleDiagramController();
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
                children: const [
                  Text(
                    'Palette (drag into viewer):',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 8),
                  _DraggableItem(payload: {
                    'type': 'circle',
                    'radius': 40.0,
                    'color': 0xFF2196F3
                  }),
                  SizedBox(height: 8),
                  _DraggableItem(payload: {
                    'type': 'circle',
                    'radius': 60.0,
                    'color': 0xFFE91E63
                  }),
                ],
              ),
            ),
            const VerticalDivider(width: 1),
            Expanded(
              child: Container(
                color: Colors.grey.withValues(alpha: 0.06),
                child: DiagramViewer(
                  controller: controller,
                  configuration: const DiagramConfiguration(
                    bounceDuration: Duration(milliseconds: 600),
                    bounceCurve: Curves.easeOutQuart,
                    enableBlocDebugObserver: true,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
