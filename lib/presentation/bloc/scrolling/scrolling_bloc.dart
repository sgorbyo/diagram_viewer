// ignore_for_file: unused_local_variable

import 'dart:math';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:diagram_viewer/tools/scrolling_geometry_tools.dart';
import '../../../diagram_content_repository.dart';
import 'package:diagram_viewer/tools/scrolling_matrix4.dart';
import '../../../diagram_object_entity.dart';

part 'scrolling_event.dart';
part 'scrolling_state.dart';
part 'scrolling_dynamic_params.dart';
part 'scrolling_bloc.freezed.dart';

class ScrollingBloc extends Bloc<ScrollingEvent, ScrollingState> {
  static const double minDiagramSizeSide = 512.0;
  static const Size minDiagramSize =
      Size(minDiagramSizeSide, minDiagramSizeSide);
  static const double minimumScale = 0.02;
  static const double maximumScale = 10;
  static const double minDynamicScale = 0.01;
  static const double maxDynamicScale = 11;
  static const double translationDynamicDelta = 50.0;
  static double dynamicBorderWidth = 150.0;
  static const double respectBorder = 25.0;
  static const int epsilon = 7;
  static const double friction = 1333.0;
  static const double squaredFriction = friction * friction;
  static const double twiceFriction = 2 * friction;
  static const double minSquaredDistanceForAnimating = 9.0;

  bool shouldTranslate = true;
  bool shouldScale = true;
  bool shouldRotate = false;
  late final StreamSubscription<List<DiagramObjectEntity>> listSubscription;
  final DiagramContentRepository contentRepository;

  ScrollingBloc({
    required this.contentRepository,
  }) : super(ScrollingState.initial(
          matrix: Matrix4.identity(),
        )) {
    listSubscription = contentRepository.stream.listen(
        (List<DiagramObjectEntity> list) =>
            add(ScrollingEvent.contentChanged(list: list)));

    on<ScrollingEvent>((event, emit) async {
      event.map(
        startScale: (startScale) async => _startScale(startScale, emit),
        continueScale: (continueScale) async =>
            _continueScale(continueScale, emit),
        endScale: (endScale) async => _endScale(endScale, emit),
        viewportChanged: (viewportChanged) async =>
            _viewportChanged(viewportChanged, emit),
        contentChanged: (contentChanged) async =>
            _contentChanged(contentChanged, emit),
        initialToIdleAnimationEnd: (initialToIdleAnimationEnd) async =>
            _initialToIdleAnimationEnd(initialToIdleAnimationEnd, emit),
        outOfBoundsToIdleAnimationEnd: (outOfBoundsToIdleAnimationEnd) async =>
            _outOfBoundsAnimationEnd(outOfBoundsToIdleAnimationEnd, emit),
        inertialAnimationEnd: (inertialAnimationEnd) =>
            _inertialAnimationEnd(inertialAnimationEnd, emit),
        scrollingAnimationEnd: (scrollingAnimationEnd) {},
        inertialAnimationStop: (inertialAnimationStop) {},
        restartScale: (restartScale) async => _restartScale(restartScale, emit),
      );
    });
  }

  Future<void> _startScale(
    _StartScale event,
    Emitter<ScrollingState> emit,
  ) async {
    await state.maybeMap(
      idle: (idle) async {
        emit(ScrollingState.scrolling(
          matrix: idle.matrix,
          content: idle.content,
          diagramRect: idle.diagramRect,
          translationUpdater: ValueUpdater(
            onUpdate: (oldVal, newVal) => newVal - (oldVal ?? Offset.zero),
          )..value = event.details.focalPoint,
          scaleUpdater: ValueUpdater(
            onUpdate: (oldVal, newVal) => newVal / (oldVal ?? 1),
          )..value = 1.0,
          size: idle.size,
          eventDateTime: DateTime.now(),
          squaredDistance: 0,
        ));
      },
      animatingInertialScrolling: (animatingInertialScrolling) async {
        emit(ScrollingState.stoppingAnimation(
          content: animatingInertialScrolling.content,
          size: animatingInertialScrolling.size,
          diagramRect: animatingInertialScrolling.diagramRect,
          details: event.details,
        ));
      },
      animatingFromOutOfBounds: (animatingFromOutOfBounds) async {
        emit(ScrollingState.stoppingAnimation(
          content: animatingFromOutOfBounds.content,
          size: animatingFromOutOfBounds.size,
          diagramRect: animatingFromOutOfBounds.diagramRect,
          details: event.details,
        ));
      },
      orElse: () async => _unexpectedEvent(event, state),
    );
  }

  Future<void> _restartScale(
    _RestartScale event,
    Emitter<ScrollingState> emit,
  ) async {
    await state.maybeMap(
      stoppingAnimation: (stoppingAnimation) async {
        emit(ScrollingState.scrolling(
          matrix: event.matrix,
          content: stoppingAnimation.content,
          diagramRect: stoppingAnimation.diagramRect,
          translationUpdater: ValueUpdater(
            onUpdate: (oldVal, newVal) => newVal - (oldVal ?? Offset.zero),
          )..value = event.details.focalPoint,
          scaleUpdater: ValueUpdater(
            onUpdate: (oldVal, newVal) => newVal / (oldVal ?? 1),
          )..value = 1.0,
          size: stoppingAnimation.size,
          eventDateTime: DateTime.now(),
          squaredDistance: 0,
        ));
      },
      orElse: () async => _unexpectedEvent(event, state),
    );
  }

  Future<void> _continueScale(
    _ContinueScale event,
    Emitter<ScrollingState> emit,
  ) async {
    await state.maybeMap(
      scrolling: (scrolling) async {
        Matrix4 stateMatrix = scrolling.matrix.clone();
        if (shouldTranslate) {
          Offset translationDelta =
              scrolling.translationUpdater.update(event.details.focalPoint);
          Matrix4 translationDeltaMatrix = _translate(translationDelta);
          stateMatrix = translationDeltaMatrix * stateMatrix;
        }
        // I use scaled to avoid having inertial animation if the event was
        // related only to a scale change.
        bool scaled = false;
        if (shouldScale) {
          // Todo Inserire un controllo che rimuova l'additionalFocalPoint e
          // tutto l'adjustment se stiamo cercando di diminuire lo zoom
          // di un diagramma che è già al minimo.

          double scaleDelta =
              scrolling.scaleUpdater.update(event.details.scale);
          if (scaleDelta.toPrecision(3) != 1.0.toPrecision(3)) {
            double minScale = _scaleToFit(
              contentRect: scrolling.diagramRect,
              viewSize: scrolling.size,
            );
            Offset? additionalFocalPoint = event.additionalFocalPoint;
            if (scaleDelta > 1 ||
                stateMatrix.zoom.toPrecision(3) > minScale.toPrecision(3)) {
              Matrix4 scaleDeltaMatrix =
                  _scale(scaleDelta, additionalFocalPoint!);
              debugPrint(
                  "scaleDelta = $scaleDelta, minScale = $minScale, StateMatrix.zoom = ${stateMatrix.zoom}");
              stateMatrix = scaleDeltaMatrix * stateMatrix;
              scaled = true;
            }
          }
        }
        stateMatrix = _adjustMatrix(
          matrix: stateMatrix,
          logicalContentRect: scrolling.diagramRect,
          viewPortSize: scrolling.size,
          dynamic: true,
        );
        emit(
          ScrollingState.scrolling(
            matrix: stateMatrix,
            size: scrolling.size,
            translationUpdater: scrolling.translationUpdater,
            scaleUpdater: scrolling.scaleUpdater,
            content: scrolling.content,
            diagramRect: scrolling.diagramRect,
            eventDateTime: DateTime.now(),
            squaredDistance: scaled
                ? 0.0
                : (stateMatrix.offset - scrolling.matrix.offset)
                    .distanceSquared,
          ),
        );
      },
      stoppingAnimation: (stoppingAnimation) async {},
      orElse: () async => _unexpectedEvent(event, state),
    );
  }

  Matrix4 capMatrix({
    required Matrix4 matrix,
    required Rect diagramRect,
    required Size size,
    required bool dynamic,
  }) {
    Offset minOffset = _minOffset(
      scale: matrix.zoom,
      contentRect: diagramRect,
      dynamic: dynamic,
    );

    if (matrix.x > minOffset.dx) {
      matrix.x = minOffset.dx;
    }
    if (matrix.y > minOffset.dy) {
      matrix.y = minOffset.dy;
    }

    Offset maxOffset = _maxOffset(
      scale: matrix.zoom,
      contentRect: diagramRect,
      viewportSize: size,
      dynamic: dynamic,
    );

    // Check lower right corner

    if (matrix.x < -maxOffset.dx) {
      matrix.x = -maxOffset.dx;
    }

    // matrix = _hardOffsetAdjust(
    //     contentRect: diagramRect, viewSize: size, unfilteredMatrix: matrix);

    return matrix;
  }

  Future<void> _endScale(
    _EndScale event,
    Emitter<ScrollingState> emit,
  ) async {
    state.maybeMap(
        scrolling: (scrolling) {
          // target matrix è la matrice al termine dello scrolling aggiustata
          // perché rimanga all'interno dell'area statica del diagramma
          Matrix4 targetMatrix = _adjustMatrix(
            matrix: scrolling.matrix,
            logicalContentRect: scrolling.diagramRect,
            viewPortSize: scrolling.size,
            dynamic: false,
          );

          // se la distanza tra le matrici di dove mi trovo ora e quella
          // aggiustata è maggiore di un certo delta (significa che
          // mi trovo con almeno uno dei bordi dinamici visibile).
          // Oppure se la matrice comporta un cambiamento di scala allora
          // provvedo ad emettere un'animazione da OutOfBounds.
          if (distanceTranslationBetweenMatrices(
                      scrolling.matrix, targetMatrix) >
                  10 ||
              distanceScaleBetweenMatrices(scrolling.matrix, targetMatrix) >
                  0.1) {
            emit(ScrollingState.animatingFromOutOfBounds(
              oldMatrix: scrolling.matrix,
              matrix: targetMatrix,
              size: scrolling.size,
              content: scrolling.content,
              diagramRect: scrolling.diagramRect,
            ));
          } else {
            if (DateTime.now()
                        .difference(scrolling.eventDateTime)
                        .inMilliseconds <=
                    300 &&
                scrolling.squaredDistance > minSquaredDistanceForAnimating &&
                event.details.velocity.pixelsPerSecond.distance > 1) {
              debugPrint("Dentro If");
              Duration duration = Duration(
                  milliseconds: 1000 *
                      event.details.velocity.pixelsPerSecond.distance ~/
                      friction);

              double distance =
                  event.details.velocity.pixelsPerSecond.distanceSquared /
                      twiceFriction;
              debugPrint(
                  "Velocità pixel/secondo: ${event.details.velocity.pixelsPerSecond.distance}, tempo ms = ${duration.inMilliseconds}, spazio pixel = $distance ");
              Offset deltaOffset = Offset(
                pow(event.details.velocity.pixelsPerSecond.dx, 2) /
                    twiceFriction *
                    event.details.velocity.pixelsPerSecond.dx.sign,
                pow(event.details.velocity.pixelsPerSecond.dy, 2) /
                    twiceFriction *
                    event.details.velocity.pixelsPerSecond.dy.sign,
              );
              debugPrint("Delta calcolato = $deltaOffset");
              // appoggioMatrix
              Matrix4 appoggioMatrix = targetMatrix.clone();
              appoggioMatrix.x += deltaOffset.dx;
              appoggioMatrix.y += deltaOffset.dy;

              Matrix4 destinationMatrix = _adjustMatrix(
                matrix: appoggioMatrix,
                logicalContentRect: scrolling.diagramRect,
                viewPortSize: scrolling.size,
                dynamic: true,
              );
              Offset destOffset = destinationMatrix.offset;
              Offset originOffset = scrolling.matrix.offset;
              double newDistance = (destOffset - originOffset).distance;
              double oldDistance = deltaOffset.distance;
              debugPrint(
                  "tempo Prima di aggiustato = ${duration.inMilliseconds}");
              int adjustedTimePeriodInMilliseconds = duration.inMilliseconds *
                  (destinationMatrix.offset - scrolling.matrix.offset)
                      .distance ~/
                  deltaOffset.distance;
              if (adjustedTimePeriodInMilliseconds == 0) {
                adjustedTimePeriodInMilliseconds = 100;
              }
              debugPrint(
                  "tempo aggiustato = $adjustedTimePeriodInMilliseconds");
              emit(ScrollingState.animatingInertialScrolling(
                oldMatrix: scrolling.matrix,
                matrix: destinationMatrix,
                animationTimeInMilliseconds: adjustedTimePeriodInMilliseconds,
                content: scrolling.content,
                size: scrolling.size,
                diagramRect: scrolling.diagramRect,
              ));
            } else {
              debugPrint("Fuori If");
              emit(ScrollingState.idle(
                matrix: targetMatrix,
                content: scrolling.content,
                size: scrolling.size,
                diagramRect: scrolling.diagramRect,
              ));
            }
          }
        },
        orElse: () {});
  }

  Future<void> _initialToIdleAnimationEnd(
    _InitialToIdleAnimationEnd event,
    Emitter<ScrollingState> emit,
  ) async {
    state.maybeMap(
        animatingInitialToIdle: (animatingInitialToIdle) {
          emit(
            ScrollingState.idle(
              matrix: animatingInitialToIdle.matrix,
              content: animatingInitialToIdle.content,
              size: animatingInitialToIdle.size,
              diagramRect: animatingInitialToIdle.diagramRect,
            ),
          );
        },
        orElse: () async => _unexpectedEvent(event, state));
  }

  Future<void> _outOfBoundsAnimationEnd(
    _OutOfBoundsToIdleAnimationEnd event,
    Emitter<ScrollingState> emit,
  ) async {
    state.maybeMap(
        animatingFromOutOfBounds: (animatingFromOutOfBounds) {
          emit(
            ScrollingState.idle(
              matrix: animatingFromOutOfBounds.matrix,
              content: animatingFromOutOfBounds.content,
              size: animatingFromOutOfBounds.size,
              diagramRect: animatingFromOutOfBounds.diagramRect,
            ),
          );
        },
        stoppingAnimation: (_) async {},
        orElse: () async => _unexpectedEvent(event, state));
  }

  Future<void> _inertialAnimationEnd(
    _InertialAnimationEnd event,
    Emitter<ScrollingState> emit,
  ) async {
    state.maybeMap(
        animatingInertialScrolling: (animatingInertialScrolling) {
          Matrix4 targetMatrix = _adjustMatrix(
            matrix: event.reachedMatrix,
            logicalContentRect: animatingInertialScrolling.diagramRect,
            viewPortSize: animatingInertialScrolling.size,
            dynamic: false,
          );
          if (distanceTranslationBetweenMatrices(
                      event.reachedMatrix, targetMatrix) >
                  10 ||
              distanceScaleBetweenMatrices(event.reachedMatrix, targetMatrix) >
                  0.1) {
            emit(
              ScrollingState.animatingFromOutOfBounds(
                oldMatrix: event.reachedMatrix,
                matrix: targetMatrix,
                content: animatingInertialScrolling.content,
                size: animatingInertialScrolling.size,
                diagramRect: animatingInertialScrolling.diagramRect,
              ),
            );
          } else {
            emit(
              ScrollingState.idle(
                matrix: animatingInertialScrolling.matrix,
                content: animatingInertialScrolling.content,
                size: animatingInertialScrolling.size,
                diagramRect: animatingInertialScrolling.diagramRect,
              ),
            );
          }
        },
        stoppingAnimation: (_) async {},
        orElse: () async => _unexpectedEvent(event, state));
  }

  Future<void> _contentChanged(
    _ContentChanged event,
    Emitter<ScrollingState> emit,
  ) async {
    state.maybeMap(
        initial: (initial) async {
          if (initial.size != null) {
            Rect contentRect = getDiagramRectFromContent(event.list);
            Matrix4 matrix = _zoomToFit(
              contentRect: contentRect,
              viewSize: initial.size!,
              matrix: initial.matrix,
            );
            emit(ScrollingState.animatingInitialToIdle(
              matrix: matrix,
              oldMatrix: initial.matrix,
              content: event.list,
              size: initial.size!,
              diagramRect: contentRect,
            ));
          } else {
            emit(ScrollingState.initial(
              matrix: initial.matrix,
              content: event.list,
              diagramRect: getDiagramRectFromContent(event.list),
            ));
          }
        },
        idle: (idle) async {
          Rect contentRect = getDiagramRectFromContent(idle.content);
          Matrix4 matrix = _adjustMatrix(
            matrix: idle.matrix,
            logicalContentRect: contentRect,
            viewPortSize: idle.size,
            dynamic: false,
          );

          emit(ScrollingState.idle(
            matrix: idle.matrix,
            content: event.list,
            size: idle.size,
            diagramRect: getDiagramRectFromContent(event.list),
          ));
        },
        orElse: () async {});
  }

  Future<void> _viewportChanged(
    _ViewportChanged event,
    Emitter<ScrollingState> emit,
  ) async {
    dynamicBorderWidth =
        min(min(event.size.width, event.size.height) / 10.0, 150.0);
    state.maybeMap(
        initial: (initial) async {
          if (initial.content != null) {
            Rect contentRect = initial.diagramRect!;
            Matrix4 matrix = _zoomToFit(
              contentRect: contentRect,
              viewSize: event.size,
              matrix: initial.matrix,
            );
            emit(ScrollingState.animatingInitialToIdle(
              matrix: matrix,
              oldMatrix: initial.matrix,
              content: initial.content!,
              size: event.size,
              diagramRect: initial.diagramRect!,
            ));
          } else {
            emit(ScrollingState.initial(
              matrix: initial.matrix,
              size: event.size,
            ));
          }
        },
        idle: (idle) async {
          Matrix4 matrix = _adjustMatrix(
            matrix: idle.matrix,
            logicalContentRect: idle.diagramRect,
            viewPortSize: event.size,
            dynamic: false,
          );
          emit(ScrollingState.idle(
            matrix: matrix,
            content: idle.content,
            size: event.size,
            diagramRect: idle.diagramRect,
          ));
        },
        orElse: () async {});
  }

  /// Returns a new matrix with the zoom adjusted to the minimum required by
  /// the [viewPortSize]
  Matrix4 _adjustMatrixZoom({
    required Matrix4 matrix,
    required Rect logicalContentRect,
    required Size viewPortSize,
  }) {
    Matrix4 resultMatrix = matrix.clone();

    double minScale = _scaleToFit(
      contentRect: logicalContentRect,
      viewSize: viewPortSize,
    );
    resultMatrix.zoom = max(minScale, matrix.zoom);
    return resultMatrix;
  }

  Matrix4 _adjustOffset({
    required Matrix4 matrix,
    required Rect logicalContentRect,
    required Size viewPortSize,
    required bool dynamic,
  }) {
    Matrix4 resultMatrix = matrix.clone();

    // convert logical Rect to physical Rect
    Rect physicalRect = _logicalToPhysicalRect(
      logicalRect: logicalContentRect,
      zoom: resultMatrix.zoom,
    );

    // Normalize physical Rect
    Rect normalizedRect = _normalizePhysicalRect(
      physicalContentRect: physicalRect,
      viewPortSize: viewPortSize,
    );

    if (dynamic) {
      normalizedRect = normalizedRect.inflate(dynamicBorderWidth);
    }

    // Check horizontal offset coverage
    if (resultMatrix.x.toPrecision(epsilon) >
        -normalizedRect.left.toPrecision(epsilon)) {
      resultMatrix.x = -normalizedRect.left;
    }
    if (resultMatrix.x <
        viewPortSize.width.toPrecision(epsilon) -
            normalizedRect.right.toPrecision(epsilon)) {
      resultMatrix.x = viewPortSize.width - normalizedRect.right;
    }

    // Check vertical offset coverage
    if (resultMatrix.y.toPrecision(epsilon) >
        -normalizedRect.top.toPrecision(epsilon)) {
      resultMatrix.y = -normalizedRect.top;
    }
    if (resultMatrix.y.toPrecision(epsilon) <
        viewPortSize.height.toPrecision(epsilon) -
            normalizedRect.bottom.toPrecision(epsilon)) {
      resultMatrix.y = viewPortSize.height - normalizedRect.bottom;
    }

    return resultMatrix;
  }

  Matrix4 _adjustMatrix({
    required Matrix4 matrix,
    required Rect logicalContentRect,
    required Size viewPortSize,
    required bool dynamic,
  }) {
    Matrix4 resultMatrix = matrix.clone();

    // check zoom assuring we are not under the minimum
    resultMatrix = _adjustMatrixZoom(
      matrix: matrix,
      logicalContentRect: logicalContentRect,
      viewPortSize: viewPortSize,
    );

    return _adjustOffset(
      matrix: resultMatrix,
      logicalContentRect: logicalContentRect,
      viewPortSize: viewPortSize,
      dynamic: dynamic,
    );
  }

  Rect _normalizePhysicalRect(
      {required Rect physicalContentRect, required Size viewPortSize}) {
    assert(physicalContentRect.width.toPrecision(epsilon) >=
            viewPortSize.width.toPrecision(epsilon) ||
        physicalContentRect.height.toPrecision(epsilon) >=
            viewPortSize.height.toPrecision(epsilon));

    if (physicalContentRect.width.toPrecision(epsilon) <
        viewPortSize.width.toPrecision(epsilon)) {
      return Rect.fromCenter(
        center: physicalContentRect.center,
        width: viewPortSize.width,
        height: physicalContentRect.height,
      );
    }
    if (physicalContentRect.height.toPrecision(epsilon) <
        viewPortSize.height.toPrecision(epsilon)) {
      return Rect.fromCenter(
        center: physicalContentRect.center,
        width: physicalContentRect.width,
        height: viewPortSize.height,
      );
    }
    return physicalContentRect;
  }

  Rect _logicalToPhysicalRect({
    required Rect logicalRect,
    required double zoom,
  }) =>
      Rect.fromLTRB(
        logicalRect.left * zoom,
        logicalRect.top * zoom,
        logicalRect.right * zoom,
        logicalRect.bottom * zoom,
      );

  Rect _physicalNormalizedRect({
    required Rect logicalContentRect,
    required Size viewPortSize,
    required double zoom,
  }) {
    Rect physicalContentRect = _logicalToPhysicalRect(
      logicalRect: logicalContentRect,
      zoom: zoom,
    );
    Rect physicalNormalizedContentRect = _normalizePhysicalRect(
      physicalContentRect: physicalContentRect,
      viewPortSize: viewPortSize,
    );
    return physicalNormalizedContentRect;
  }

  Matrix4 _zoomToFit({
    required Rect contentRect,
    required Size viewSize,
    required Matrix4 matrix,
  }) {
    double minScale = _scaleToFit(
      contentRect: contentRect,
      viewSize: viewSize,
    );

    Rect result = _physicalNormalizedRect(
      logicalContentRect: contentRect,
      viewPortSize: viewSize,
      zoom: minScale,
    );

    // Sets the matrix offset to the new parameters
    matrix.zoom = minScale;
    matrix.x = -result.left;
    matrix.y = -result.top;

    return matrix;
  }

  /// Returns an adjusted Rect to take in account the possible hardOffset.
  /// The HardOffset, when needed just expands the Rect in the input to
  /// replicate the viewport Sieze.
  Rect viewPortAdjustedContentRect({
    required Rect contentRect,
    required Size viewSize,
  }) {
    double deltaX = viewSize.width - contentRect.width;
    double deltaY = viewSize.height - contentRect.height;

    if (deltaX > 0) {
      return Rect.fromLTWH(
        contentRect.left - deltaX / 2.0,
        contentRect.top,
        contentRect.width + deltaX,
        contentRect.height,
      );
    }

    if (deltaY > 0) {
      return Rect.fromLTWH(
        contentRect.left,
        contentRect.top - deltaY / 2.0,
        contentRect.width,
        contentRect.height + deltaY,
      );
    }

    return contentRect;
  }

  /// Returns the maximum scale at which the [contentRect] will be completely
  /// fit inside the [viewSize].
  static double _scaleToFit({
    required Rect contentRect,
    required Size viewSize,
  }) =>
      min(
        viewSize.width / contentRect.width,
        viewSize.height / contentRect.height,
      );

  /// Computes the size of the minimum [Rect] able to contain all the
  /// diagram content then adds a padding which size is [respectBorder].
  // Keep!
  static Rect getDiagramRectFromContent(List<DiagramObjectEntity> list) =>
      list.isEmpty
          ? Rect.fromCenter(
              center: Offset.zero,
              width: minDiagramSizeSide,
              height: minDiagramSizeSide)
          : adaptDiagramRectToMinimumSize(list
              .fold(
                  list.first.enclosingRect(),
                  (previousValue, element) =>
                      previousValue.expandToInclude(element.enclosingRect()))
              .inflate(respectBorder));

  /// Guarantees that the minimum size of the diagram also when the content is
  /// empty or smaller than the minimum.
  /// Minimum size is a square which side is [minDiagramSizeSide].
  static Rect adaptDiagramRectToMinimumSize(Rect rect) => Rect.fromCenter(
        center: rect.center,
        width: max(rect.size.width, minDiagramSizeSide),
        height: max(rect.size.height, minDiagramSizeSide),
      );

  /// Returns the [Rect] occupied by the content ([contentRect]) translated in
  /// physical units using the [scale] parameter. If [dynamic] is [true] then
  /// it add the elastic margin configured as [dynamicBorderWidth].
  static Rect _diagramPhysicalRect({
    required double scale,
    required Rect contentRect,
    required bool dynamic,
  }) =>
      dynamic
          ? _diagramPhysicalRect(
              scale: scale,
              contentRect: contentRect,
              dynamic: false,
            ).inflate(dynamicBorderWidth)
          : Rect.fromLTRB(
              contentRect.left * scale,
              contentRect.top * scale,
              contentRect.right * scale,
              contentRect.bottom * scale,
            );

  /// Returns the minimum offset to be used when panning to avoid to
  /// display an external border.
  ///
  /// If [dynamic] is [true] then
  /// it add the elastic margin configured as [dynamicBorderWidth].
  ///
  /// The scale = -1.-1 is needed just to invert the signs of the upper left
  /// corner and obtain a correct corresponding minimum offset.
  static Offset _minOffset({
    required double scale,
    required Rect contentRect,
    required bool dynamic,
  }) =>
      _diagramPhysicalRect(
        scale: scale,
        contentRect: contentRect,
        dynamic: dynamic,
      ).topLeft.scale(-1, -1);

  /// Returns the maximum static offset to be used when panning to avoid to
  /// display an external border
  static Offset _maxOffset({
    required double scale,
    required Rect contentRect,
    required Size viewportSize,
    required bool dynamic,
  }) =>
      Offset(
          _diagramPhysicalRect(
                scale: scale,
                contentRect: contentRect,
                dynamic: dynamic,
              ).right -
              viewportSize.width,
          _diagramPhysicalRect(
                scale: scale,
                contentRect: contentRect,
                dynamic: dynamic,
              ).bottom -
              viewportSize.height);

  @override
  Future<void> close() {
    listSubscription.cancel();
    return super.close();
  }

  /// Logs in the console any unexpected event received out of the logic of the bloc
  void _unexpectedEvent(ScrollingEvent uEvent, ScrollingState uState) {
    uState.maybeMap(
      animatingFromOutOfBounds: (_) {
        debugPrint(
            "Unexpected Event: $uEvent while in animatingFromOutOfBounds");
      },
      animatingInitialToIdle: (_) {
        debugPrint("Unexpected Event: $uEvent while in animatingInitialToIdle");
      },
      animatingInertialScrolling: (_) {
        debugPrint(
            "Unexpected Event: $uEvent while in animatingInertialScrolling");
      },
      orElse: () {
        assert(false, 'unmanaged event: $uEvent when in state: $state');
      },
    );
  }

  Matrix4 _translate(Offset translation) {
    var dx = translation.dx;
    var dy = translation.dy;

    //  ..[0]  = 1       # x scale
    //  ..[5]  = 1       # y scale
    //  ..[10] = 1       # diagonal "one"
    //  ..[12] = dx      # x translation
    //  ..[13] = dy      # y translation
    //  ..[15] = 1       # diagonal "one"
    return Matrix4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, dx, dy, 0, 1);
  }

  Matrix4 _scale(double scale, Offset focalPoint) {
    var dx = (1 - scale) * focalPoint.dx;
    var dy = (1 - scale) * focalPoint.dy;

    //  ..[0]  = scale   # x scale
    //  ..[5]  = scale   # y scale
    //  ..[10] = 1       # diagonal "one"
    //  ..[12] = dx      # x translation
    //  ..[13] = dy      # y translation
    //  ..[15] = 1       # diagonal "one"
    return Matrix4(scale, 0, 0, 0, 0, scale, 0, 0, 0, 0, 1, 0, dx, dy, 0, 1);
  }
}

typedef OnUpdate<T> = T Function(T? oldValue, T newValue);

class ValueUpdater<T> {
  final OnUpdate<T> onUpdate;
  T? value;

  ValueUpdater({required this.onUpdate});

  T update(T newValue) {
    T updated = onUpdate(value, newValue);
    value = newValue;
    return updated;
  }
}
