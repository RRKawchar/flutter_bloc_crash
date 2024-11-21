import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/todo/todo_bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/todo/todo_events.dart';
import 'package:flutter_bloc_demo_main/bloc/todo/todo_state.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Todo Example"),
        ),
        body: BlocBuilder<TodoBloc,TodoState>(builder: (context,states){

          if(states.todoList.isEmpty){
            return const Center(child: Text("List Not Found"),);
          }else if(states.todoList.isNotEmpty){

            return ListView.builder(
                itemCount: states.todoList.length,
                itemBuilder: (context,index){
                  return ListTile(
                    title: Text(states.todoList[index]),
                    trailing: IconButton(onPressed: (){
                      context.read<TodoBloc>().add( RemoveTodoEvent(task:states.todoList[index]));
                    }, icon: const Icon(Icons.delete))
                  );
                });
          }else{
            return const SizedBox();
          }


        },),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          for(int i=0; i<5; i++){
            context.read<TodoBloc>().add( AddTodoEvent(task: 'Task :${i+1}'));
          }


        },child: const Icon(Icons.add),
      ),
    );
  }
}
