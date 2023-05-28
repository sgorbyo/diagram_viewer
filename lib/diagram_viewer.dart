library diagram_viewer;

import 'package:diagram_viewer/diagram_content_repository.dart';
import 'package:diagram_viewer/tools/scrolling_matrix4.dart';
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
typedef ClientAcceptsDrag = bool Function({Offset logicalOffset});

class DiagramViewer extends StatefulWidget {
  DiagramViewer({
    Key? key,
    this.shouldTranslate = true,
    this.shouldScale = true,
    this.shouldRotate = false,
    this.clipChild = true,
    this.clientAcceptsDrag,
    required this.diagramContentRepository,
  })  : contentView = ScrollingView(
          shouldTranslate: shouldTranslate,
          shouldScale: shouldScale,
          shouldRotate: shouldRotate,
          clipChild: clipChild,
        ),
        super(key: key);

  /// The repository containing the objects included in the diagram.
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

  /// The widget that visualizes the diagram area
  final ScrollingView contentView;

  final ClientAcceptsDrag? clientAcceptsDrag;

  //---------------------------Temporary variables------------------------------

  /// Runtime property used to separate drag from scroll events.
  bool mouseDown = false;

  /// Runtime property used to temporary store the coordinates detected by the
  /// [Listener].
  Offset clickLocalPosition = Offset.zero;

  /// Runtime property used to detect if a drag operation is being managed
  /// by the client and then should generate special related events.
  bool draggingOutside = false;

  @override
  State<DiagramViewer> createState() => _DiagramViewerState();
}

class _DiagramViewerState extends State<DiagramViewer> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => widget.diagramContentRepository,
      child: BlocProvider(
        create: (context) => ScrollingBloc(
          contentRepository: widget.diagramContentRepository,
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
            return Listener(
              // The Listener is needed because we need to disambiguate drag
              // from pan & scroll events.
              onPointerDown: (signal) {
                widget.mouseDown = true;
                widget.clickLocalPosition = signal.localPosition;
              },
              onPointerUp: (signal) {
                widget.mouseDown = false;
                widget.clickLocalPosition = Offset.zero;
              },
              behavior: HitTestBehavior.translucent,
              child: GestureDetector(
                onDoubleTapDown: (signal) => debugPrint("$signal"),
                onScaleStart: (ScaleStartDetails details) {
                  Matrix4 theMatrix =
                      context.read<ScrollingBloc>().state.matrix;
                  if (widget.mouseDown && widget.clientAcceptsDrag != null) {
                    Offset focalPoint = details.localFocalPoint
                        .translateByOffset(theMatrix.oppositeOffset);
                    focalPoint = focalPoint! / theMatrix.zoom;
                    if (widget.clientAcceptsDrag!(logicalOffset: focalPoint)) {
                      debugPrint("Drag starts at logical point -> $focalPoint");
                      // TODO SUBSTITUTE THE FOLLOWING WITH A PROPER EVENT
                      widget.draggingOutside = true;
                      context
                          .read<ScrollingBloc>()
                          .add(ScrollingEvent.startScale(details: details));
                    } else {
                      debugPrint("ScaleStart -> $details");
                      context
                          .read<ScrollingBloc>()
                          .add(ScrollingEvent.startScale(details: details));
                    }
                  } else {
                    debugPrint("ScaleStart -> $details");
                    context
                        .read<ScrollingBloc>()
                        .add(ScrollingEvent.startScale(details: details));
                  }
                },
                onScaleUpdate: (ScaleUpdateDetails details) {
                  if (widget.draggingOutside) {
                    debugPrint("Dragging -> $details");
                  } else {
                    debugPrint("ScaleUpdate -> $details");
                  }
                  Offset? focalPoint;

                  RenderObject? renderObject = context.findRenderObject();
                  if (renderObject != null) {
                    RenderBox renderBox = renderObject as RenderBox;
                    focalPoint = renderBox.globalToLocal(details.focalPoint);
                  }

                  context
                      .read<ScrollingBloc>()
                      .add(ScrollingEvent.continueScale(
                        details: details,
                        additionalFocalPoint: focalPoint,
                      ));
                },
                onScaleEnd: (ScaleEndDetails details) {
                  if (widget.draggingOutside) {
                    widget.draggingOutside = false;
                    debugPrint("Drag End-> $details");
                  } else {
                    debugPrint("Scale End-> $details");
                  }

                  context
                      .read<ScrollingBloc>()
                      .add(ScrollingEvent.endScale(details: details));
                },
                child: widget.contentView,
              ),
            );
          }
        }),
      ),
    );
  }
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint(
        '${bloc.runtimeType} ${transition.currentState.runtimeType} (${transition.event.runtimeType})-> ${transition.nextState.runtimeType} ');
  }
}
