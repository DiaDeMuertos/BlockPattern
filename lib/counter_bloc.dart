import 'package:bloc/bloc.dart';
import 'package:block_pattern/counter_event.dart';
import 'package:block_pattern/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  void onIncrement() {
    dispatch(IncrementEvent());
  }

  void onDecrement() {
    dispatch(DecrementEvent());
  }

  @override
  CounterState get initialState => CounterState.initial();

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is IncrementEvent) {
      yield CounterState(counter: currentState.counter + 1);
    } else if (event is DecrementEvent) {
      yield CounterState(
          counter: currentState.counter - 1 < 0 ? 0 : currentState.counter - 1);
    }
  }
}
