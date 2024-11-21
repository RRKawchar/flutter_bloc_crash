import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/todo/todo_events.dart';
import 'package:flutter_bloc_demo_main/bloc/todo/todo_state.dart';

class TodoBloc extends Bloc<TodoEvents,TodoState>{
  final List<String> todoList=[];
  TodoBloc():super(const TodoState()){
    on<AddTodoEvent>(_addTodoEvent);
    on<RemoveTodoEvent>(_removeTodoEvent);
  }


  void _addTodoEvent(AddTodoEvent event,Emitter<TodoState> emit){
    todoList.add(event.task);
    emit(state.copyWith(todoList: List.from(todoList)));
  }
  void _removeTodoEvent(RemoveTodoEvent event,Emitter<TodoState> emit){
    todoList.remove(event.task);
    emit(state.copyWith(todoList: List.from(todoList)));
  }




}