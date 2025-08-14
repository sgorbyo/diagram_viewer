import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diagram_viewer/interfaces/interfaces.dart';
import 'package:diagram_viewer/internal/blocs/blocs.dart';
import 'package:diagram_viewer/widgets/diagram_viewer_content.dart';

/// A widget that displays a diagram with interactive capabilities.
///
/// This widget provides a viewport for displaying diagram objects and handles
/// user interactions like pan, zoom, and object manipulation.
class DiagramViewer extends StatefulWidget {
  /// The controller that manages the diagram state and interactions.
  final IDiagramController controller;

  /// Configuration for the diagram viewer.
  final DiagramConfiguration? configuration;

  /// Whether to enable debug mode (shows additional information).
  final bool debug;

  /// Factory for creating BLoCs (enables dependency injection for testing)
  final BlocFactory blocFactory;

  /// Creates a diagram viewer widget.
  const DiagramViewer({
    super.key,
    required this.controller,
    this.configuration,
    this.debug = false,
    this.blocFactory = const DefaultBlocFactory(),
  });

  @override
  State<DiagramViewer> createState() => _DiagramViewerState();
}

/// A testable version of DiagramViewer that exposes BLoCs for testing.
///
/// This widget is designed specifically for testing scenarios where you need
/// to access the internal BLoC states to verify behavior.
class TestableDiagramViewer extends StatefulWidget {
  /// The controller that manages the diagram state and interactions.
  final IDiagramController controller;

  /// Configuration for the diagram viewer.
  final DiagramConfiguration? configuration;

  /// Whether to enable debug mode (shows additional information).
  final bool debug;

  /// Factory for creating BLoCs (enables dependency injection for testing)
  final BlocFactory blocFactory;

  /// Callback to expose BLoCs for testing
  final void Function(
          TransformBloc transformBloc, PanBloc panBloc, ZoomBloc zoomBloc)?
      onBlocsCreated;

  /// Creates a testable diagram viewer widget.
  const TestableDiagramViewer({
    super.key,
    required this.controller,
    this.configuration,
    this.debug = false,
    this.blocFactory = const DefaultBlocFactory(),
    this.onBlocsCreated,
  });

  @override
  State<TestableDiagramViewer> createState() => _TestableDiagramViewerState();
}

class _DiagramViewerState extends State<DiagramViewer> {
  late final FocusNode _focusNode;
  final GlobalKey _contentKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final config = widget.configuration ?? widget.controller.configuration;
    if (config.enableBlocDebugObserver) {
      // Attach debug observer once per app; safe to set repeatedly in debug
      Bloc.observer = DebugBlocObserver();
    }
    final diagramRect = widget.controller.logicalExtent;

    return LayoutBuilder(
      builder: (context, constraints) {
        final contentSize = constraints.biggest;
        return Focus(
          focusNode: _focusNode,
          autofocus: true,
          canRequestFocus: true,
          child: MultiBlocProvider(
            providers: [
              BlocProvider<TransformBloc>(
                create: (context) => widget.blocFactory.createTransformBloc(
                  config,
                  diagramRect,
                  contentSize,
                ),
              ),
              BlocProvider<ZoomBloc>(
                create: (context) => widget.blocFactory.createZoomBloc(
                  config,
                  diagramRect,
                  contentSize,
                ),
              ),
              BlocProvider<PanBloc>(
                create: (context) => widget.blocFactory.createPanBloc(
                  config,
                  diagramRect,
                  contentSize,
                ),
              ),
              BlocProvider<EventManagementBloc>(
                create: (context) =>
                    widget.blocFactory.createEventManagementBloc(),
              ),
            ],
            child: Builder(
              builder: (context) {
                // Configure dependencies after all BLoCs are available
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (context.mounted) {
                    final eventBloc = context.read<EventManagementBloc>();
                    final transformBloc = context.read<TransformBloc>();
                    final renderObject = _contentKey.currentContext
                        ?.findRenderObject() as RenderBox?;
                    final topLeft = renderObject?.localToGlobal(Offset.zero);
                    eventBloc.configureDependencies(
                      transformBloc: transformBloc,
                      configuration: config,
                      viewportSize: contentSize,
                      viewportTopLeft: topLeft,
                    );
                  }
                });

                return DiagramViewerContent(
                  key: _contentKey,
                  controller: widget.controller,
                  configuration: config,
                  debug: widget.debug,
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class _TestableDiagramViewerState extends State<TestableDiagramViewer> {
  late final FocusNode _focusNode;
  final GlobalKey _contentKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final config = widget.configuration ?? widget.controller.configuration;
    if (config.enableBlocDebugObserver) {
      Bloc.observer = DebugBlocObserver();
    }
    final diagramRect = widget.controller.logicalExtent;

    return LayoutBuilder(
      builder: (context, constraints) {
        final contentSize = constraints.biggest;
        return Focus(
          focusNode: _focusNode,
          autofocus: true,
          canRequestFocus: true,
          child: MultiBlocProvider(
            providers: [
              BlocProvider<TransformBloc>(
                create: (context) => widget.blocFactory.createTransformBloc(
                  config,
                  diagramRect,
                  contentSize,
                ),
              ),
              BlocProvider<ZoomBloc>(
                create: (context) => widget.blocFactory.createZoomBloc(
                  config,
                  diagramRect,
                  contentSize,
                ),
              ),
              BlocProvider<PanBloc>(
                create: (context) => widget.blocFactory.createPanBloc(
                  config,
                  diagramRect,
                  contentSize,
                ),
              ),
              BlocProvider<EventManagementBloc>(
                create: (context) =>
                    widget.blocFactory.createEventManagementBloc(),
              ),
            ],
            child: Builder(
              builder: (context) {
                // Configure dependencies after all BLoCs are available
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (context.mounted) {
                    final eventBloc = context.read<EventManagementBloc>();
                    final transformBloc = context.read<TransformBloc>();
                    final panBloc = context.read<PanBloc>();
                    final zoomBloc = context.read<ZoomBloc>();
                    final renderObject = _contentKey.currentContext
                        ?.findRenderObject() as RenderBox?;
                    final topLeft = renderObject?.localToGlobal(Offset.zero);

                    // Expose BLoCs for testing if callback is provided
                    if (widget.onBlocsCreated != null) {
                      widget.onBlocsCreated!(transformBloc, panBloc, zoomBloc);
                    }

                    eventBloc.configureDependencies(
                      transformBloc: transformBloc,
                      configuration: config,
                      viewportSize: contentSize,
                      viewportTopLeft: topLeft,
                    );
                  }
                });

                return DiagramViewerContent(
                  key: _contentKey,
                  controller: widget.controller,
                  configuration: config,
                  debug: widget.debug,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
