import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/comments/comments_bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/favorite/favorite_bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/imagePicker/image_picker_bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/switch/switch_bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/todo/todo_bloc.dart';
import 'package:flutter_bloc_demo_main/repository/favorite_repository.dart';
import 'package:flutter_bloc_demo_main/ui/comments/comments_screen.dart';
import 'package:flutter_bloc_demo_main/ui/counter/counter_screen.dart';
import 'package:flutter_bloc_demo_main/ui/favorite/favorite_screen.dart';
import 'package:flutter_bloc_demo_main/ui/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(_)=> SwitchBloc()),
        BlocProvider(create:(_)=> ImagePickerBloc()),
        BlocProvider(create:(_)=> TodoBloc()),
        BlocProvider(create:(_)=> FavoriteBloc(FavoriteRepository())),
        BlocProvider(create:(_)=> CommentBloc()),
      ],

      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
         themeMode: ThemeMode.dark,
          theme: ThemeData(
            brightness: Brightness.dark,
            useMaterial3: true,
          ),
          home: LoginScreen()
      ),
    );
  }
}
