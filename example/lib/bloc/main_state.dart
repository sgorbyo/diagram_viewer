part of 'main_bloc.dart';

@freezed
class MainState with _$MainState {
  const factory MainState.idle() = _MainIdle;
  const factory MainState.moving({required String id}) = _MainMoving;
}
