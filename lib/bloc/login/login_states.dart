import 'package:equatable/equatable.dart';

enum LoginStatus{initial,loading,success,error}


class LoginStates extends Equatable{

  final String email;
  final String password;
  final String message;
  final LoginStatus loginStatus;

  const LoginStates({
    this.email='',
    this.password='',
    this.message='',
    this.loginStatus=LoginStatus.initial
});

  LoginStates copyWith({String? email,String? password, String? message, LoginStatus? loginStatus}){
    return LoginStates(
      email: email??this.email,
      password: password?? this.password,
      message: message??this.message,
      loginStatus: loginStatus??this.loginStatus
    );
  }


  @override
  List<Object?> get props => [email,password,message,loginStatus];

}