import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/imagePicker/image_picker_bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/switch/switch_bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/todo/todo_bloc.dart';
import 'package:flutter_bloc_demo_main/ui/counter/counter_screen.dart';
import 'package:flutter_bloc_demo_main/ui/favorite/favorite_screen.dart';
import 'package:flutter_bloc_demo_main/ui/imagePicker/image_picker_screen.dart';
import 'package:flutter_bloc_demo_main/ui/switch/switch_screen.dart';
import 'package:flutter_bloc_demo_main/ui/todo/todo_screen.dart';
import 'package:flutter_bloc_demo_main/utils/image_picker_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(_)=> CounterBloc()),
        BlocProvider(create:(_)=> SwitchBloc()),
        BlocProvider(create:(_)=> ImagePickerBloc()),
        BlocProvider(create:(_)=> TodoBloc()),
      ],

      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
         themeMode: ThemeMode.dark,
          theme: ThemeData(
            brightness: Brightness.dark,
            useMaterial3: true,
          ),
          home: FavoriteScreen()
      ),
    );
  }
}
