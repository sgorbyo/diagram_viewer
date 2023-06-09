part of 'main_bloc.dart';

@freezed
class MainEvent with _$MainEvent {
  const factory MainEvent.startMoving({required String id}) =
      _MainEventStartMoving;
  const factory MainEvent.continueMoving({required Vector4 delta}) =
      _MainEventContinueMoving;
  const factory MainEvent.endMoving() = _MainEventEndMoving;
}
