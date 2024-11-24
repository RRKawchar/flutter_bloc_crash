import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_demo_main/model/favorite_model.dart';

abstract class FavoriteEvents extends Equatable{
const FavoriteEvents();
  @override
  List<Object> get props => [];

}



class FetchFavoriteList extends FavoriteEvents{

}

class FavoriteAddEvents extends FavoriteEvents{
final FavoriteModel item;
const FavoriteAddEvents({required this.item});
}

class SelectedItemEvents extends FavoriteEvents{
  final FavoriteModel item;
  const SelectedItemEvents({required this.item});
}


class UnselectedItemEvent extends FavoriteEvents{
  final FavoriteModel item;
  const UnselectedItemEvent({required this.item});
}

class DeleteItemEvent extends FavoriteEvents{
}