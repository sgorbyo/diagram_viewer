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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Diagram Viewer Example'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: DiagramViewer(
          controller: ExampleDiagramController(),
        ),
      ),
    );
  }
}
