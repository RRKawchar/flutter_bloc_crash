import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/counter/counter_event.dart';
import 'package:flutter_bloc_demo_main/bloc/counter/counter_state.dart';
import 'package:flutter_bloc_demo_main/ui/comments/comments_screen.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  late CounterBloc _counterBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _counterBloc=CounterBloc();
  }
 @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _counterBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_)=> _counterBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Counter Example"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>CommentsScreen()));
                },
                child: const Text(
                  "Next",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
              return Text(
                state.counter.toString(),
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocBuilder<CounterBloc, CounterState>(
                    buildWhen: (current,previous)=>false,
                    builder: (context, state) {
                  return ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(IncrementCounter());
                      },
                      child: const Text("Increment"));
                }),

                BlocBuilder<CounterBloc, CounterState>(
                    buildWhen: (current,previous)=>false,
                    builder: (context, state) {
                      return ElevatedButton(
                          onPressed: () {
                            context.read<CounterBloc>().add(DecrementCounter());
                          },
                          child: const Text("Decrement"));
                    }),


              ],
            ),
          ],
        ),
      ),
    );
  }
}
