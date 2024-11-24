import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/favorite/favorite_bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/favorite/favorite_events.dart';
import 'package:flutter_bloc_demo_main/bloc/favorite/favorite_states.dart';
import 'package:flutter_bloc_demo_main/model/favorite_model.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<FavoriteBloc>().add(FetchFavoriteList());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Screen"),
        actions: [
         BlocBuilder<FavoriteBloc,FavoriteStates>(builder: (context,states){
           return Visibility(
             visible: states.tempFavoriteList.isNotEmpty?true:false,
             child: IconButton(onPressed: (){
                context.read<FavoriteBloc>().add(DeleteItemEvent());
             }, icon: Icon(Icons.delete,color: Colors.red,)),
           );
         })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<FavoriteBloc,FavoriteStates>(
            builder: (context,states){
              switch(states.listStatus){
                case ListStatus.loading:
                  return Center(child: CircularProgressIndicator(),);

                case ListStatus.failure:
                  return Center(child: Text("something went wrong"),);

                case ListStatus.success:
                  return ListView.builder(
                      itemCount: states.favoriteList.length,
                      itemBuilder: (context,index){
                      final item=states.favoriteList[index];
                      return Card(
                        child: ListTile(
                          leading: Checkbox(
                              value: states.tempFavoriteList.contains(item)?false:true,
                              onChanged: (val){
                                if(val!){
                                  context.read<FavoriteBloc>().add(SelectedItemEvents(item: item));
                                }else{
                                  context.read<FavoriteBloc>().add(UnselectedItemEvent(item: item));
                                }
                              },
                          ),
                          title: Text(item.value.toString()),
                          trailing: IconButton(onPressed: (){

                            FavoriteModel favoriteModel=FavoriteModel(id: item.id, value: item.value,
                            isFavorite: item.isFavorite?false:true,

                            );
                            context.read<FavoriteBloc>().add(FavoriteAddEvents(item: favoriteModel));
                          }, icon: Icon(
                             item.isFavorite ? Icons.favorite : Icons.favorite_outline
                          )),
                        ),
                      );
                  });
              }
            }
        ),
      ),
    );
  }
}
