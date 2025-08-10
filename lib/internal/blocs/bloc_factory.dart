import 'package:flutter/material.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/internal/blocs/blocs.dart';

/// Factory interface for creating BLoCs
/// This enables dependency injection and testing
abstract class BlocFactory {
  TransformBloc createTransformBloc(
    DiagramConfiguration config,
    Rect diagramRect,
    Size viewportSize,
  );

  ZoomBloc createZoomBloc(
    DiagramConfiguration config,
    Rect diagramRect,
    Size viewportSize,
  );

  PanBloc createPanBloc(
    DiagramConfiguration config,
    Rect diagramRect,
    Size viewportSize,
  );

  EventManagementBloc createEventManagementBloc();
}

/// Default production implementation
class DefaultBlocFactory implements BlocFactory {
  const DefaultBlocFactory();

  @override
  TransformBloc createTransformBloc(
    DiagramConfiguration config,
    Rect diagramRect,
    Size viewportSize,
  ) {
    return TransformBloc(
      configuration: config,
      diagramRect: diagramRect,
      viewportSize: viewportSize,
    );
  }

  @override
  ZoomBloc createZoomBloc(
    DiagramConfiguration config,
    Rect diagramRect,
    Size viewportSize,
  ) {
    return ZoomBloc(
      configuration: config,
      diagramRect: diagramRect,
      viewportSize: viewportSize,
    );
  }

  @override
  PanBloc createPanBloc(
    DiagramConfiguration config,
    Rect diagramRect,
    Size viewportSize,
  ) {
    return PanBloc(
      configuration: config,
      diagramRect: diagramRect,
      viewportSize: viewportSize,
    );
  }

  @override
  EventManagementBloc createEventManagementBloc() {
    return EventManagementBloc();
  }
}

/// Mock factory for testing
class MockBlocFactory implements BlocFactory {
  final TransformBloc? _transformBloc;
  final ZoomBloc? _zoomBloc;
  final PanBloc? _panBloc;
  final EventManagementBloc? _eventManagementBloc;

  const MockBlocFactory({
    TransformBloc? transformBloc,
    ZoomBloc? zoomBloc,
    PanBloc? panBloc,
    EventManagementBloc? eventManagementBloc,
  })  : _transformBloc = transformBloc,
        _zoomBloc = zoomBloc,
        _panBloc = panBloc,
        _eventManagementBloc = eventManagementBloc;

  @override
  TransformBloc createTransformBloc(
    DiagramConfiguration config,
    Rect diagramRect,
    Size viewportSize,
  ) {
    return _transformBloc ??
        TransformBloc(
          configuration: config,
          diagramRect: diagramRect,
          viewportSize: viewportSize,
        );
  }

  @override
  ZoomBloc createZoomBloc(
    DiagramConfiguration config,
    Rect diagramRect,
    Size viewportSize,
  ) {
    return _zoomBloc ??
        ZoomBloc(
          configuration: config,
          diagramRect: diagramRect,
          viewportSize: viewportSize,
        );
  }

  @override
  PanBloc createPanBloc(
    DiagramConfiguration config,
    Rect diagramRect,
    Size viewportSize,
  ) {
    return _panBloc ??
        PanBloc(
          configuration: config,
          diagramRect: diagramRect,
          viewportSize: viewportSize,
        );
  }

  @override
  EventManagementBloc createEventManagementBloc() {
    return _eventManagementBloc ?? EventManagementBloc();
  }
}
