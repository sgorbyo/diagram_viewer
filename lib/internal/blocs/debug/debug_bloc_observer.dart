import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import '../event_management/event_management_bloc.dart';
import '../transform/transform_bloc.dart';

/// Debug-only BlocObserver for tracing transitions.
class DebugBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      // Suppress noisy logs for high-frequency blocs
      if (bloc is EventManagementBloc || bloc is TransformBloc) {
        return;
      }
      debugPrint(
          '${bloc.runtimeType} ${transition.currentState.runtimeType} (${transition.event.runtimeType}) -> ${transition.nextState.runtimeType}');
    }
  }
}
