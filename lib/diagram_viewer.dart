library diagram_viewer;

import 'package:diagram_viewer/diagram_content_repository.dart';
import 'package:flutter/material.dart';
import 'package:diagram_viewer/presentation/bloc/scrolling/scrolling_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diagram_viewer/presentation/widgets/scrolling_view.dart';

/// A [Function] called by [DiagramViewer] when a Drag operation starts and
/// which returns a [bool] indicating whether the client will or not manage the
/// whole Start, Continue and End Scale process, or it should be managed by
/// [DiagramViewer].
///
/// For example: during the Drag of a diagram object the [DiagramViewer] will
/// not scroll leaving the Client to move the touched object.
typedef ClientDeclaresDrag = bool Function({Matrix4 matrix, Offset offset});

/// A widget that provides interactive diagram viewing capabilities with support
/// for scrolling, zooming, and optionally rotation.
///
/// This widget uses [ScrollingBloc] for state management and handles various gestures
/// for interacting with diagram content. It renders content through a [ScrollingView]
/// and manages content via a [DiagramContentRepository].
///
/// Example usage:
/// ```dart
/// DiagramViewer(
///   diagramContentRepository: myRepository,
///   shouldScale: true,
///   shouldRotate: false,
/// )
/// ```
class DiagramViewer extends StatelessWidget {
  /// Repository that provides and manages diagram content.
  /// This repository is responsible for loading, storing and providing access
  /// to diagram objects and related data.
  final DiagramContentRepository diagramContentRepository;

  /// Whether to detect translation gestures during the event processing.
  ///
  /// Defaults to true.
  ///
  final bool shouldTranslate;

  /// Whether to detect scale gestures during the event processing.
  ///
  /// Defaults to true.
  ///
  final bool shouldScale;

  /// Whether to detect rotation gestures during the event processing.
  ///
  /// Defaults to false.
  ///
  final bool shouldRotate;

  /// Whether [ClipRect] widget should clip [child] widget.
  ///
  /// Defaults to true.
  ///
  final bool clipChild;

  /// The view widget that renders the diagram content.
  /// This is created internally based on the configuration settings.
  final ScrollingView contentView;

  DiagramViewer({
    Key? key,
    this.shouldTranslate = true,
    this.shouldScale = true,
    this.shouldRotate = false,
    this.clipChild = true,
    required this.diagramContentRepository,
  })  : contentView = ScrollingView(
          shouldTranslate: shouldTranslate,
          shouldScale: shouldScale,
          shouldRotate: shouldRotate,
          clipChild: clipChild,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => diagramContentRepository,
      child: BlocProvider(
        create: (context) => ScrollingBloc(
          contentRepository: diagramContentRepository,
        ),
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          {
            context.read<ScrollingBloc>().add(
                  ScrollingEvent.viewportChanged(
                    size: Size(
                      constraints.maxWidth,
                      constraints.maxHeight,
                    ),
                  ),
                );
            return GestureDetector(
              // key: widget._clientKey,
              onScaleStart: (ScaleStartDetails details) {
                debugPrint("Number of touches = ${details.pointerCount}");
                context
                    .read<ScrollingBloc>()
                    .add(ScrollingEvent.startScale(details: details));
              },
              onScaleUpdate: (ScaleUpdateDetails details) {
                Offset? focalPoint;

                RenderObject? renderObject = context.findRenderObject();
                if (renderObject != null) {
                  RenderBox renderBox = renderObject as RenderBox;
                  focalPoint = renderBox.globalToLocal(details.focalPoint);
                }

                context.read<ScrollingBloc>().add(ScrollingEvent.continueScale(
                      details: details,
                      additionalFocalPoint: focalPoint,
                    ));
              },
              onScaleEnd: (ScaleEndDetails details) {
                context
                    .read<ScrollingBloc>()
                    .add(ScrollingEvent.endScale(details: details));
              },
              child: contentView,
            );
          }
        }),
      ),
    );
  }
}

/// A custom [BlocObserver] that logs bloc transitions for debugging purposes.
///
/// This observer prints detailed information about state transitions including
/// the bloc type, current state, event type, and next state.
class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint(
        '${bloc.runtimeType} ${transition.currentState.runtimeType} (${transition.event.runtimeType})-> ${transition.nextState.runtimeType} ');
  }
}
