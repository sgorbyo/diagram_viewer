import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:vector_math/vector_math_64.dart';

import '../cerchio_repository.dart';
// import 'package:flutter/material.dart';

part 'main_event.dart';
part 'main_state.dart';
part 'main_bloc.freezed.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final CerchioRepository repository;

  MainBloc({required this.repository}) : super(const MainState.idle()) {
    Logger logger = Logger();

    on<MainEvent>((event, emit) async {
      await event.map(
        startMoving: (startMoving) async {
          await state.maybeMap(
            idle: (moving) async {
              emit(MainState.moving(id: startMoving.id));
            },
            orElse: () async {
              logger.e("Issues in startMoving!");
            },
          );
        },
        continueMoving: (continueMoving) async {
          await state.maybeMap(
            moving: (moving) async {
              repository.moveCerchioBy(
                  cerchioId: moving.id, deltaVector: continueMoving.delta);
            },
            orElse: () async {
              logger.e("Issues in continueMoving!");
            },
          );
        },
        endMoving: (endMoving) async {
          state.maybeMap(
            moving: (moving) async {
              emit(const MainState.idle());
            },
            orElse: () async {
              logger.e("Issues in endMoving!");
            },
          );
        },
      );
    });
  }
}
