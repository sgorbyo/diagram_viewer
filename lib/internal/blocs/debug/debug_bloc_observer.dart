import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

/// Debug-only BlocObserver for tracing transitions.
class DebugBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      // ignore: avoid_print
      print(
          '${bloc.runtimeType} ${transition.currentState.runtimeType} (${transition.event.runtimeType}) -> ${transition.nextState.runtimeType}');
    }
  }
}
