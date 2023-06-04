import 'dart:async';

import 'package:diagram_viewer/diagram_viewer_event/diagram_viewer_event.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector4;
import 'cerchio_repository.dart';
import 'package:diagram_viewer/diagram_viewer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(title: 'Scrolling Viewer Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title}) {
    cerchioRepository = CerchioRepository();
    diagramViewer = DiagramViewer(
      diagramContentRepository: cerchioRepository,
      clientAcceptsDrag: clientAcceptsDrag,
    );
    listSubscription = diagramViewer.stream.listen((DiagramViewerEvent event) {
      event.maybeMap(
        continueDrag: (continueDrag) {
          String? id = cerchioRepository.cerchioAtOffset(
              vector: continueDrag.coordinates);
          if (id != null) {
            cerchioRepository.moveCerchioBy(
                cerchioId: id, deltaVector: continueDrag.delta);
          }
        },
        orElse: () {},
      );
    });
  }
  final String title;
  late final CerchioRepository cerchioRepository;
  late final StreamSubscription<DiagramViewerEvent> listSubscription;
  late final DiagramViewer diagramViewer;
  @override
  State<MyHomePage> createState() => _MyHomePageState();

  bool clientAcceptsDrag({required Vector4 logicalVector}) =>
      cerchioRepository.cerchioAtOffset(vector: logicalVector) != null;
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: widget.diagramViewer,
      ),
    );
  }
}
