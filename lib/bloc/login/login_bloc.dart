import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/login/login_events.dart';
import 'package:flutter_bloc_demo_main/bloc/login/login_states.dart';
import 'package:http/http.dart' as http;

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  LoginBloc() : super(const LoginStates()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginApi>(_login);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginStates> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginStates> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _login(LoginApi event, Emitter<LoginStates> emit) async {
    if (state.email.isEmpty || state.password.isEmpty) {
      emit(state.copyWith(
        loginStatus: LoginStatus.error,
        message: "Email and password cannot be empty",
      ));
      return;
    }

    emit(state.copyWith(
      loginStatus: LoginStatus.loading,
    ));
    Map body = {
      "email": state.email,
      "password": state.password,
    };

    try {
      final response =await http.post(Uri.parse('https://reqres.in/api/login'), body: body);
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(state.copyWith(
          loginStatus: LoginStatus.success,
          message: 'Login Successfully!',
        ));
      } else {
        emit(state.copyWith(
          loginStatus: LoginStatus.error,
          message: data['error'],
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        loginStatus: LoginStatus.error,
        message: e.toString(),
      ));
    }
  }
}
