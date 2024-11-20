import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/switch/switch_bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/switch/switch_event.dart';
import 'package:flutter_bloc_demo_main/bloc/switch/switch_state.dart';

class SwitchScreen extends StatelessWidget {
  const SwitchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Notification"),
                BlocBuilder<SwitchBloc, SwitchState>(
                  /// This line when others widget will change this widget will be hot change
                    buildWhen: (previous,current)=>previous.isSwitch !=current.isSwitch,
                    builder: (context, state) {
                      print("Notification");
                  return Switch(
                      value: state.isSwitch,
                      onChanged: (newValue) {
                        print(newValue);
                        context
                            .read<SwitchBloc>()
                            .add(EnableOrDisableNotification());
                      });
                }),
              ],
            ),
            SizedBox(height: 30),
            BlocBuilder<SwitchBloc, SwitchState>(builder: (context, state) {
              return Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(state.slider),
                ),
              );
            }),
            SizedBox(height: 50),
            BlocBuilder<SwitchBloc, SwitchState>(builder: (context, state) {
              return Slider(
                  value: state.slider,
                  onChanged: (newValue) {
                    print(newValue);
                    context.read<SwitchBloc>().add(SliderEvents(slider: newValue));
                  });
            }),
          ],
        ),
      ),
    );
  }
}
