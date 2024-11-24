import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_demo_main/model/comment_model.dart';
import 'package:flutter_bloc_demo_main/utils/enums.dart';

class CommentStates extends Equatable {
  final CommentStatus commentStatus;
  final List<CommentModel> commentList;
  final List<CommentModel> tempCommentList;
  final String message;

  const CommentStates({
     this.commentStatus=CommentStatus.loading,
     this.commentList=const<CommentModel>[],
     this.tempCommentList=const<CommentModel>[],
     this.message='',
  });

  CommentStates copyWith({CommentStatus? commentStatus, List<CommentModel>? commentList,List<CommentModel>? tempCommentList,String? message}){
    return CommentStates(
       commentStatus: commentStatus??this.commentStatus,
       commentList: commentList??this.commentList,
       tempCommentList: commentList??this.tempCommentList,
       message: message??this.message,
    );
}

  @override
  List<Object?> get props => [commentStatus,commentList,tempCommentList,message];
}
