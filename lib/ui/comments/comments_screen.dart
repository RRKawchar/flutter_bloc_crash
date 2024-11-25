import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/comments/comments_bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/comments/comments_events.dart';
import 'package:flutter_bloc_demo_main/bloc/comments/comments_states.dart';
import 'package:flutter_bloc_demo_main/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/counter/counter_state.dart';
import 'package:flutter_bloc_demo_main/utils/enums.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<CommentBloc>().add(CommentFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Example"),
      ),
       body: BlocBuilder<CommentBloc,CommentStates>(
           builder: (context,states){
            return Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Search by email",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (filterQuery){
                      context.read<CommentBloc>().add(SearchItem(filterQuery));
                      print("I am checking temp list: ${states.tempCommentList}");
                  },
                ),

                Expanded(
                  child: ListView.builder(
                      itemCount:states.tempCommentList.length,
                      itemBuilder: (context,index){
                        if(states.tempCommentList.isNotEmpty){

                          final temList=states.tempCommentList[index];
                          print("I am checking temp email: ${states.tempCommentList[index].email}");
                          return Card(
                            child: ListTile(
                              title: Text(temList.email??""),
                              subtitle: Text(temList.body??""),
                            ),
                          );
                        }

                  }),
                ),
              ],
            );
       }),
    );
  }
}
