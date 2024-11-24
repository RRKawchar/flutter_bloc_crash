import 'package:flutter_bloc_demo_main/model/favorite_model.dart';

class FavoriteRepository{

  Future<List<FavoriteModel>> fetchItem()async{
    await Future.delayed(const Duration(seconds: 3));
    return List.of(_generateList(10));

  }


  List<FavoriteModel> _generateList(int length){
    return List.generate(length, (index)=>FavoriteModel(id: index.toString(), value: 'Items $index'));
  }


}