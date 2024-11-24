import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/favorite/favorite_events.dart';
import 'package:flutter_bloc_demo_main/bloc/favorite/favorite_states.dart';
import 'package:flutter_bloc_demo_main/model/favorite_model.dart';
import 'package:flutter_bloc_demo_main/repository/favorite_repository.dart';

class FavoriteBloc extends Bloc<FavoriteEvents, FavoriteStates>{
  List<FavoriteModel> favoriteList=[];
  List<FavoriteModel> tempFavoriteList=[];

  FavoriteRepository favoriteRepository;
  FavoriteBloc(this.favoriteRepository):super(const FavoriteStates()){
    on<FetchFavoriteList>(_fetchFavorite);
    on<FavoriteAddEvents>(_addFavorite);
    on<SelectedItemEvents>(_selectItem);
    on<UnselectedItemEvent>(_unSelectItem);
    on<DeleteItemEvent>(_deleteItem);
  }


  void _fetchFavorite(FetchFavoriteList events,Emitter<FavoriteStates> emit)async{
      favoriteList=await favoriteRepository.fetchItem();
     emit(state.copyWith(favoriteList:List.from(favoriteList) ,listStatus:ListStatus.success));
  }

  void _addFavorite(FavoriteAddEvents events,Emitter<FavoriteStates> emit)async{
   final index=favoriteList.indexWhere((element) =>element.id ==events.item.id);

   if(events.item.isFavorite){
     if(tempFavoriteList.contains(favoriteList[index])){
          tempFavoriteList.remove(favoriteList[index]);
          tempFavoriteList.add(events.item);
     }
   }else{
     if(tempFavoriteList.contains(favoriteList[index])){
       tempFavoriteList.remove(favoriteList[index]);
       tempFavoriteList.add(events.item);
     }
   }

   favoriteList[index]=events.item;
   emit(state.copyWith(favoriteList: List.from(favoriteList),tempFavoriteList: List.from(tempFavoriteList)));
  }
  void _selectItem(SelectedItemEvents events,Emitter<FavoriteStates> emit)async{
    tempFavoriteList.add(events.item);
    emit(state.copyWith(tempFavoriteList: List.from(tempFavoriteList)));
  }

  void _unSelectItem(UnselectedItemEvent events,Emitter<FavoriteStates> emit)async{
    tempFavoriteList.remove(events.item);
    emit(state.copyWith(tempFavoriteList: List.from(tempFavoriteList)));
  }

  void _deleteItem(DeleteItemEvent events,Emitter<FavoriteStates> emit)async{
    for(int i=0; i < tempFavoriteList.length; i++){
      favoriteList.remove(tempFavoriteList[i]);
    }
    tempFavoriteList.clear();
    emit(state.copyWith(
        favoriteList: List.from(favoriteList),
        tempFavoriteList: List.from(favoriteList)));
  }
}