import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/switch/switch_event.dart';
import 'package:flutter_bloc_demo_main/bloc/switch/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvents,SwitchState>{
  SwitchBloc():super(const SwitchState()){
    on<EnableOrDisableNotification>(_enableOrDisableNotification);
    on<SliderEvents>(_slider);
  }

  void _enableOrDisableNotification(SwitchEvents events,Emitter<SwitchState> emit){
     emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _slider(SliderEvents events,Emitter<SwitchState> emit){
    emit(state.copyWith(slider: events.slider));
  }

}