import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/comments/comments_events.dart';
import 'package:flutter_bloc_demo_main/bloc/comments/comments_states.dart';
import 'package:flutter_bloc_demo_main/model/comment_model.dart';
import 'package:flutter_bloc_demo_main/repository/comment_repository.dart';
import 'package:flutter_bloc_demo_main/utils/enums.dart';

class CommentBloc extends Bloc<CommentsEvents,CommentStates>{
  final CommentRepository commentRepository=CommentRepository();

  List<CommentModel> tempCommentList=[];

  CommentBloc():super(const CommentStates()){
    on<CommentFetchEvent>(fetchComment);
    on<SearchItem>(_filterCommentByEmail);
  }


  void _filterCommentByEmail(SearchItem event,Emitter<CommentStates> emit){
   
    tempCommentList=state.commentList.where((element)=>element.id.toString()==event.stSearch.toString()).toList();
      emit(state.copyWith(tempCommentList: tempCommentList));

  }


  void fetchComment(CommentFetchEvent event,Emitter<CommentStates> emit)async{

    await commentRepository.fetchComment().then((value){
      emit(state.copyWith(
          commentStatus: CommentStatus.success,
          message: 'success',
          commentList: value
      ));
    }).onError((error,stackTrace){
      print("error in fetchComment method : $error");
      print("StackTrace in fetchComment method : $stackTrace");
      emit(state.copyWith(commentStatus: CommentStatus.failure,message: error.toString()));
    });

  }
}