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
        child: DiagramViewer(
          controller: controller,
          configuration: const DiagramConfiguration(
            bounceDuration: Duration(milliseconds: 600),
            bounceCurve: Curves.easeOutQuart,
            enableBlocDebugObserver: true,
          ),
        ),
      ),
    );
  }
}
