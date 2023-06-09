library diagram_viewer;

import 'dart:async';

import 'package:diagram_viewer/diagram_content_repository.dart';
import 'package:diagram_viewer/diagram_viewer_event/diagram_viewer_event.dart';
import 'package:diagram_viewer/tools/scrolling_matrix4.dart';
import 'package:flutter/material.dart';
import 'package:diagram_viewer/presentation/bloc/scrolling/scrolling_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diagram_viewer/presentation/widgets/scrolling_view.dart';
import 'package:logger/logger.dart';
import 'package:vector_math/vector_math_64.dart';

/// A [Function] called by [DiagramViewer] when a Drag operation starts and
/// which returns a [bool] indicating whether the client will or not manage the
/// whole Start, Continue and End Scale process, or it should be managed by
/// [DiagramViewer].
///
/// For example: during the Drag of a diagram object the [DiagramViewer] will
/// not scroll leaving the Client free to move the touched object.
typedef ClientAcceptsDrag = dynamic Function({required Vector4 logicalVector});

class DiagramViewer extends StatefulWidget {
  DiagramViewer({
    Key? key,
    this.shouldTranslate = true,
    this.shouldScale = true,
    this.shouldRotate = false,
    this.clipChild = true,
    this.clientAcceptsDrag,
    required this.diagramContentRepository,
  }) : super(key: key) {
    contentView = ScrollingView(
      shouldTranslate: shouldTranslate,
      shouldScale: shouldScale,
      shouldRotate: shouldRotate,
      clipChild: clipChild,
    );
    stream = _controller.stream;
  }

  final StreamController<DiagramViewerEvent> _controller =
      StreamController<DiagramViewerEvent>();

  late final Stream<DiagramViewerEvent> stream;

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
  late final ScrollingView contentView;

  final ClientAcceptsDrag? clientAcceptsDrag;

  @override
  State<DiagramViewer> createState() => _DiagramViewerState();
}

class _DiagramViewerState extends State<DiagramViewer> {
  //---------------------------Temporary variables------------------------------

  /// Runtime property used to separate drag from scroll events.
  bool mouseDown = false;

  /// Runtime property used to temporary store the coordinates detected by the
  /// [Listener].
  Offset clickLocalPosition = Offset.zero;

  var logger = Logger();

  /// Runtime property used to detect if a drag operation is being managed
  /// by the client and then should generate special related events.
  // bool draggingOutside = false;

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
                mouseDown = true;
                clickLocalPosition = signal.localPosition;
              },
              onPointerUp: (signal) {
                mouseDown = false;
                clickLocalPosition = Offset.zero;
              },
              behavior: HitTestBehavior.translucent,
              child: GestureDetector(
                onDoubleTapDown: (signal) async => logger.d("$signal"),
                onScaleStart: (ScaleStartDetails details) async {
                  ScrollingState state = context.read<ScrollingBloc>().state;
                  await state.maybeMap(
                    idle: (idle) async {
                      if (mouseDown && widget.clientAcceptsDrag != null) {
                        Vector4 clickPos = localFocalPointToLogicalVector(
                          localFocalPoint: details.localFocalPoint,
                          matrix: context.read<ScrollingBloc>().state.matrix,
                        );
                        dynamic clientResponse =
                            widget.clientAcceptsDrag!(logicalVector: clickPos);

                        if (clientResponse != null) {
                          context
                              .read<ScrollingBloc>()
                              .add(ScrollingEvent.startExternalDragOperation(
                                piggyback: clientResponse,
                              ));

                          sendEvent(
                            DiagramViewerEvent.startDrag(
                              coordinates: clickPos,
                              piggyback: clientResponse,
                            ),
                          );
                        } else {
                          context
                              .read<ScrollingBloc>()
                              .add(ScrollingEvent.startScale(details: details));
                        }
                      } else {
                        context
                            .read<ScrollingBloc>()
                            .add(ScrollingEvent.startScale(details: details));
                      }
                    },
                    orElse: () async {
                      context
                          .read<ScrollingBloc>()
                          .add(ScrollingEvent.startScale(details: details));
                    },
                  );
                },
                onScaleUpdate: (ScaleUpdateDetails details) async {
                  ScrollingState state = context.read<ScrollingBloc>().state;
                  await state.maybeMap(
                    externalOperation: (externalOperation) async {
                      Vector4 clickPos = localFocalPointToLogicalVector(
                        localFocalPoint: details.localFocalPoint,
                        matrix: context.read<ScrollingBloc>().state.matrix,
                      );
                      Vector4 delta = localDeltaToLogicalVector(
                        localDelta: details.focalPointDelta,
                        matrix: context.read<ScrollingBloc>().state.matrix,
                      );
                      context
                          .read<ScrollingBloc>()
                          .add(ScrollingEvent.continueExternalDragOperation(
                            piggyback: externalOperation.piggyback,
                            localFocalPoint: details.localFocalPoint.vector4(),
                            localDelta: details.focalPointDelta.vector4(),
                          ));

                      sendEvent(
                        DiagramViewerEvent.continueDrag(
                          coordinates: clickPos,
                          delta: delta,
                          piggyback: externalOperation.piggyback,
                        ),
                      );
                    },
                    orElse: () async {
                      context.read<ScrollingBloc>().add(
                            ScrollingEvent.continueScale(
                              details: details,
                              additionalFocalPoint: details.localFocalPoint,
                            ),
                          );
                    },
                  );
                },
                onScaleEnd: (ScaleEndDetails details) async {
                  ScrollingState state = context.read<ScrollingBloc>().state;
                  await state.maybeMap(
                    externalOperation: (externalOperation) async {
                      context
                          .read<ScrollingBloc>()
                          .add(const ScrollingEvent.endExternalDragOperation());

                      sendEvent(
                        const DiagramViewerEvent.endDrag(),
                      );
                    },
                    orElse: () async {
                      context
                          .read<ScrollingBloc>()
                          .add(ScrollingEvent.endScale(details: details));
                    },
                  );
                },
                child: widget.contentView,
              ),
            );
          })),
    );
  }

  Vector4 localFocalPointToLogicalVector({
    required Offset localFocalPoint,
    required Matrix4 matrix,
  }) {
    Matrix4 myMatrix = Matrix4.inverted(matrix);
    Vector4 clickPos = localFocalPoint.vector4();
    myMatrix.transform(clickPos);
    return clickPos;
  }

  Vector4 localDeltaToLogicalVector({
    required Offset localDelta,
    required Matrix4 matrix,
  }) {
    Vector4 clickPos = localDelta.vector4();

    clickPos =
        Vector4(clickPos.x / matrix.zoom, clickPos.y / matrix.zoom, 0, 1);

    return clickPos;
  }

  @override
  void dispose() {
    widget._controller.close();
    super.dispose();
  }

  void sendEvent(DiagramViewerEvent event) =>
      widget._controller.sink.add(event);
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint(
        '${bloc.runtimeType} ${transition.currentState.runtimeType} (${transition.event.runtimeType})-> ${transition.nextState.runtimeType} ');
  }
}
