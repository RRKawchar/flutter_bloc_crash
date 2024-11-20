import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/counter/counter_event.dart';
import 'package:flutter_bloc_demo_main/bloc/counter/counter_state.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           BlocBuilder<CounterBloc,CounterState>(
               builder: (context,state){
              return Text(state.counter.toString(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),);
           }),

           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               ElevatedButton(onPressed: (){
                 context.read<CounterBloc>().add(IncrementCounter());
               }, child: Text("Increment")),
               ElevatedButton(onPressed: (){
                 context.read<CounterBloc>().add(DecrementCounter());
               }, child: Text("Decrement")),
             ],
           ),


        ],
      ),
    );
  }
}
