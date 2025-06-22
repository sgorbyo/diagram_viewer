import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:diagram_viewer/presentation/bloc/scrolling/scrolling_bloc.dart';

import 'package:diagram_viewer/diagram_object_entity.dart';

class ScrollingView extends StatefulWidget {
  final bool shouldTranslate;
  final bool shouldScale;
  final bool shouldRotate;
  final bool clipChild;
  final Color backgroundColor;
  final Color outsideColor;

  const ScrollingView({
    Key? key,
    required this.shouldTranslate,
    required this.shouldScale,
    required this.shouldRotate,
    required this.clipChild,
    required this.backgroundColor,
    required this.outsideColor,
  }) : super(key: key);

  @override
  State<ScrollingView> createState() => _ScrollingViewState();
}

class _ScrollingViewState extends State<ScrollingView>
    with TickerProviderStateMixin {
  AnimationController? _controller;
  Animation<Matrix4Transform>? _animation;
  CurvedAnimation? _curvedAnimation;
  Matrix4? matrix;
  Matrix4? _oldMatrix;

  void _animateMatrixInitialToIdle({
    required Matrix4 mEnd,
    required ScrollingBloc bloc,
  }) async {
    _controller?.dispose();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _curvedAnimation = CurvedAnimation(
      parent: _controller!,
      curve: Curves.elasticOut,
    );

    _animation = Matrix4TransformTween(
            begin: Matrix4Transform.from(Matrix4.identity()),
            end: Matrix4Transform.from(mEnd))
        .animate(_curvedAnimation!)
      ..addListener(() {
        setState(() {
          matrix = _animation!.value.matrix4;
        });
      });
    await _controller?.forward();

    bloc.add(const ScrollingEvent.initialToIdleAnimationEnd());
  }

  void _animateOutOfBoundsToIdle({
    required Matrix4 mBegin,
    required Matrix4 mEnd,
    required ScrollingBloc bloc,
  }) async {
    _controller?.dispose();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _curvedAnimation = CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeIn,
    );

    _animation = Matrix4TransformTween(
            begin: Matrix4Transform.from(mBegin),
            end: Matrix4Transform.from(mEnd))
        .animate(_curvedAnimation!)
      ..addListener(() {
        setState(() {
          matrix = _animation!.value.matrix4;
        });
      });
    await _controller?.forward();
    _controller = null;

    bloc.add(const ScrollingEvent.outOfBoundsToIdleAnimationEnd());
  }

  void _animateMatrixScrolling({
    required Matrix4 mBegin,
    required Matrix4 mEnd,
    required ScrollingBloc bloc,
  }) async {
    // debugPrint("Begin = $mBegin");
    // debugPrint("End = $mEnd");
    _controller?.dispose();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 50));
    _curvedAnimation = CurvedAnimation(
      parent: _controller!,
      curve: Curves.linear,
    );

    _animation = Matrix4TransformTween(
            begin: Matrix4Transform.from(mBegin),
            end: Matrix4Transform.from(mEnd))
        .animate(_curvedAnimation!)
      ..addListener(() {
        setState(() {
          matrix = _animation!.value.matrix4;
        });
      });
    await _controller?.forward();
    _controller = null;
  }

  void _animateInertialScrolling({
    required Matrix4 mBegin,
    required Matrix4 mEnd,
    required int milliseconds,
    required ScrollingBloc bloc,
  }) async {
    _controller?.dispose();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: milliseconds));
    _curvedAnimation = CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeOutQuad,
    );

    _animation = Matrix4TransformTween(
            begin: Matrix4Transform.from(mBegin),
            end: Matrix4Transform.from(mEnd))
        .animate(_curvedAnimation!)
      ..addListener(() {
        setState(() {
          matrix = _animation!.value.matrix4;
        });
      });
    await _controller?.forward();
    _controller = null;

    bloc.add(ScrollingEvent.inertialAnimationEnd(reachedMatrix: mEnd));
  }

  void _stopInertialScrolling({
    required ScaleStartDetails details,
    required ScrollingBloc bloc,
  }) async {
    Matrix4 matrix = _animation!.value.matrix4;
    _controller?.stop();
    _controller?.dispose();
    _controller = null;

    bloc.add(ScrollingEvent.restartScale(
      details: details,
      matrix: matrix,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScrollingBloc, ScrollingState>(
        listenWhen: (previous, current) => previous.maybeMap(
              initial: (_) => current.maybeMap(
                animatingInitialToIdle: (_) => true,
                orElse: () => false,
              ),
              scrolling: (extScrolling) => current.maybeMap(
                scrolling: (_) {
                  _oldMatrix = extScrolling.matrix;
                  return true;
                },
                animatingFromOutOfBounds: (_) => true,
                animatingInertialScrolling: (_) => true,
                orElse: () => false,
              ),
              animatingInertialScrolling: (_) => current.maybeMap(
                animatingFromOutOfBounds: (_) => true,
                stoppingAnimation: (_) => true,
                orElse: () => false,
              ),
              animatingFromOutOfBounds: (_) => current.maybeMap(
                stoppingAnimation: (_) => true,
                orElse: () => false,
              ),
              orElse: () => false,
            ),
        listener: (context, blocState) {
          blocState.maybeMap(
            animatingInitialToIdle: (animatingInitialToIdle) =>
                _animateMatrixInitialToIdle(
                    mEnd: animatingInitialToIdle.matrix,
                    bloc: context.read<ScrollingBloc>()),
            scrolling: (scrolling) => _animateMatrixScrolling(
              mBegin: _oldMatrix!,
              mEnd: scrolling.matrix,
              bloc: context.read<ScrollingBloc>(),
            ),
            animatingFromOutOfBounds: (animatingFromOutOfBounds) =>
                _animateOutOfBoundsToIdle(
                    mBegin: animatingFromOutOfBounds.oldMatrix,
                    mEnd: animatingFromOutOfBounds.matrix,
                    bloc: context.read<ScrollingBloc>()),
            animatingInertialScrolling: (animatingInertialScrolling) =>
                _animateInertialScrolling(
              mBegin: animatingInertialScrolling.oldMatrix,
              mEnd: animatingInertialScrolling.matrix,
              milliseconds:
                  animatingInertialScrolling.animationTimeInMilliseconds,
              bloc: context.read<ScrollingBloc>(),
            ),
            stoppingAnimation: (stoppingAnimation) => _stopInertialScrolling(
              details: stoppingAnimation.details,
              bloc: context.read<ScrollingBloc>(),
            ),
            orElse: () => {},
          );
        },
        builder: (context, blocState) {
          return blocState.maybeMap(
            initial: (_) => const Center(
              child: CircularProgressIndicator(),
            ),
            idle: (idle) => contentAndBackgroundWidget(
              idle.matrix,
              idle.diagramRect,
              idle.content,
            ),
            animatingInitialToIdle: (animatingInitialToIdle) =>
                contentAndBackgroundWidget(
              matrix!,
              animatingInitialToIdle.diagramRect,
              animatingInitialToIdle.content,
            ),
            animatingFromOutOfBounds: (animatingFromOutOfBounds) =>
                contentAndBackgroundWidget(
              matrix!,
              animatingFromOutOfBounds.diagramRect,
              animatingFromOutOfBounds.content,
            ),
            animatingInertialScrolling: (animatingInertialScrolling) =>
                contentAndBackgroundWidget(
              matrix!,
              animatingInertialScrolling.diagramRect,
              animatingInertialScrolling.content,
            ),
            scrolling: (scrolling) => contentAndBackgroundWidget(
              matrix!,
              scrolling.diagramRect,
              scrolling.content,
            ),
            orElse: () => Container(),
          );
        });
  }

  CustomPaint contentAndBackgroundWidget(
    Matrix4 matrix,
    Rect diagramRect,
    List<DiagramObjectEntity> contentList,
  ) =>
      CustomPaint(
          painter: DiagramBackgroundPainter(
            matrix: matrix,
            diagramRect: diagramRect,
            backgroundColor: widget.backgroundColor,
            outsideColor: widget.outsideColor,
          ),
          foregroundPainter: DiagramContentPainter(
            matrix: matrix,
            diagramRect: diagramRect,
            objects: contentList,
          ),
          child: Container());
}

class DiagramBackgroundPainter extends CustomPainter {
  Paint diagramBackgroundPaint = Paint();
  Paint diagramOutsidePaint = Paint();
  final Matrix4 matrix;
  final Rect diagramRect;
  final Color backgroundColor;
  final Color outsideColor;

  DiagramBackgroundPainter({
    required this.matrix,
    required this.diagramRect,
    this.backgroundColor = const Color.fromRGBO(250, 250, 250, 1.0),
    this.outsideColor = const Color.fromRGBO(128, 128, 128, 1.0),
  });

  @override
  void paint(Canvas canvas, Size size) {
    diagramBackgroundPaint.color = backgroundColor;
    diagramOutsidePaint.color = outsideColor;
    Path outside = Path();
    outside.addRect(Rect.fromLTRB(0.0, 0.0, size.width, size.height));
    canvas.drawPath(outside, diagramOutsidePaint);

    Path limits = Path();
    limits.addRect(Rect.fromLTWH(diagramRect.left, diagramRect.top,
        diagramRect.width, diagramRect.height));
    canvas.save();
    canvas.transform(matrix.storage);
    canvas.drawPath(limits, diagramBackgroundPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class DiagramContentPainter extends CustomPainter {
  final Matrix4 matrix;
  final Rect diagramRect;
  final List<DiagramObjectEntity> objects;

  DiagramContentPainter({
    required this.matrix,
    required this.diagramRect,
    required this.objects,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.transform(matrix.storage);
    for (var element in objects) {
      element.printOnCanvas(canvas: canvas);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
