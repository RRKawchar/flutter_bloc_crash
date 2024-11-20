import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/switch/switch_bloc.dart';
import 'package:flutter_bloc_demo_main/ui/counter/counter_screen.dart';
import 'package:flutter_bloc_demo_main/ui/switch/switch_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: BlocProvider(
        create: (context) => SwitchBloc(),
        child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: SwitchScreen()
        ),
      ),
    );
  }
}
