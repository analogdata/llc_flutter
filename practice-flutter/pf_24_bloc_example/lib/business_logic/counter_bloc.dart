import 'package:flutter_bloc/flutter_bloc.dart';

// Simple Bloc event: we only support incrementing the counter.
abstract class CounterEvent {}

class CounterIncrementPressed extends CounterEvent {}

// Bloc: takes CounterEvent as input and exposes an int as state.
class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    // on<CounterEvent> tells Bloc how to react to each event type.
    on<CounterIncrementPressed>((event, emit) {
      // emit() sends a new state to all listeners.
      emit(state + 1);
    });
  }
}
