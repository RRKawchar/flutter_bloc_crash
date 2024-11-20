import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/counter/counter_event.dart';
import 'package:flutter_bloc_demo_main/bloc/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent,CounterState>{
  CounterBloc():super(const CounterState()){
    on<IncrementCounter>(_increment);
    on<DecrementCounter>(_decrement);
  }

  void _increment(IncrementCounter even,Emitter<CounterState> emit){
     emit(state.copyWith(counter: state.counter+1));
  }

  void _decrement(DecrementCounter even,Emitter<CounterState> emit){
    emit(state.copyWith(counter: state.counter-1));
  }
}