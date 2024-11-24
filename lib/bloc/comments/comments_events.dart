
import 'package:equatable/equatable.dart';

abstract class CommentsEvents extends Equatable{
  const CommentsEvents();
  @override
  List<Object?> get props => [];


}


class CommentFetchEvent extends CommentsEvents{}

class SearchItem extends CommentsEvents{
  final String stSearch;
  const SearchItem(this.stSearch);

}