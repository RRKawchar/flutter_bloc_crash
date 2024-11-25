import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/login/login_bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/login/login_events.dart';
import 'package:flutter_bloc_demo_main/bloc/login/login_states.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late LoginBloc _loginBloc;

  final emailFocusNode=FocusNode();
  final passwordFocusNode=FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBloc=LoginBloc();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=>_loginBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login Example"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             BlocBuilder<LoginBloc,LoginStates>(
                buildWhen: (current,previous)=>current.email !=previous.email,
                 builder: (context,state){
               return TextFormField(
                 decoration: InputDecoration(
                   hintText: "Email",
                   border: OutlineInputBorder(),
                 ),
                 focusNode: emailFocusNode,
                 keyboardType: TextInputType.emailAddress,
                 onChanged: (value){
                   context.read<LoginBloc>().add(EmailChanged(email:value));
                 },
                 onFieldSubmitted: (val){

                 },
               );
             }),

              SizedBox(
                  height: 20
              ),

              BlocBuilder<LoginBloc,LoginStates>(
                  buildWhen: (current,previous)=>current.password !=previous.password,
                  builder: (context,state){
                    return  TextFormField(
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(),
                      ),
                      focusNode: passwordFocusNode,
                      keyboardType: TextInputType.visiblePassword,
                      onChanged: (value){
                        context.read<LoginBloc>().add(PasswordChanged(password: value));
                      },
                      onFieldSubmitted: (val){},
                    );
                  }),


              SizedBox(
                  height: 20
              ),

             BlocListener<LoginBloc,LoginStates>(
                 listener: (context,state){
                if(state.loginStatus==LoginStatus.error){
                  ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(
                       SnackBar(content: Text(state.message.toString()))
                  );
                }

                if(state.loginStatus==LoginStatus.loading){
                  ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(
                      const SnackBar(content: Text("Submitting...")
                  ));
                }

                if(state.loginStatus==LoginStatus.success){
                  ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(
                      const SnackBar(content: Text("Login successfully!")
                      ));
                }
             },
               child:  BlocBuilder<LoginBloc,LoginStates>(
                   buildWhen: (current,previous)=>false,
                   builder: (context,state){
                     return  ElevatedButton(onPressed: (){
                       context.read<LoginBloc>().add(LoginApi());
                     }, child: Text("Login"));
                   }),
             )

            ],
          ),
        ),
      ),
    );
  }
}
