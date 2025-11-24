import 'package:flutter_bloc/flutter_bloc.dart';

/// A simple Cubit that manages an on/off (bool) state.
class ToggleCubit extends Cubit<bool> {
  ToggleCubit() : super(false);

  // Flip the current state: false -> true, true -> false
  void toggle() => emit(!state);
}
