import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_demo_main/model/favorite_model.dart';


enum ListStatus{ loading,success,failure}

class FavoriteStates extends Equatable{

 final List<FavoriteModel> favoriteList;
 final List<FavoriteModel> tempFavoriteList;
 final ListStatus listStatus;

  const FavoriteStates({
     this.favoriteList=const [],
     this.tempFavoriteList=const [],
    this.listStatus=ListStatus.loading,
  });


  FavoriteStates copyWith({List<FavoriteModel>? favoriteList,List<FavoriteModel>? tempFavoriteList,ListStatus? listStatus}){
    return FavoriteStates(
      favoriteList: favoriteList?? this.favoriteList,
      tempFavoriteList: tempFavoriteList?? this.tempFavoriteList,
      listStatus: listStatus?? this.listStatus
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [favoriteList,tempFavoriteList,listStatus];

}