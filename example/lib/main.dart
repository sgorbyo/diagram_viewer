import 'dart:async';

import 'package:diagram_viewer/diagram_viewer_event/diagram_viewer_event.dart';
import 'package:example/bloc/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector4;
import 'cerchio_repository.dart';
import 'package:diagram_viewer/diagram_viewer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      home: HomePage(title: 'Scrolling Viewer Demo Home Page'),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;
  final CerchioRepository cerchioRepository = CerchioRepository();
  late final StreamSubscription<DiagramViewerEvent> listSubscription;
  late final DiagramViewer diagramViewer;
  late final MainBloc mainBloc;

  HomePage({super.key, required this.title}) {
    diagramViewer = DiagramViewer(
      diagramContentRepository: cerchioRepository,
      clientAcceptsDrag: clientAcceptsDrag,
    );
    mainBloc = MainBloc(repository: cerchioRepository);
    listSubscription = diagramViewer.stream.listen((DiagramViewerEvent event) {
      event.map(
        startDrag: (startDrag) {
          String? id = startDrag.piggyback["ObjectAtPoint"];
          assert(id != null);
          mainBloc.add(MainEvent.startMoving(id: id!));
        },
        continueDrag: (continueDrag) {
          mainBloc.add(MainEvent.continueMoving(delta: continueDrag.delta));
        },
        endDrag: (endDrag) {
          mainBloc.add(const MainEvent.endMoving());
        },
      );
    });
  }

  dynamic clientAcceptsDrag({required Vector4 logicalVector}) =>
      cerchioRepository.cerchioAtOffset(vector: logicalVector) != null
          ? {
              "ObjectAtPoint":
                  cerchioRepository.cerchioAtOffset(vector: logicalVector)
            }
          : null;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => mainBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: diagramViewer,
        ),
      ),
    );
  }
}
