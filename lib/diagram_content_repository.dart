import 'dart:ui';

import 'package:diagram_viewer/diagram_object_entity.dart';

abstract class DiagramContentRepository {
  late final Stream<List<DiagramObjectEntity>> stream;

  void restart();
}
