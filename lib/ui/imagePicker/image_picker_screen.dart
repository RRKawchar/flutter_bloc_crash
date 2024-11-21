import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/imagePicker/image_picker_bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/imagePicker/image_picker_events.dart';
import 'package:flutter_bloc_demo_main/bloc/imagePicker/image_picker_state.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker Example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Center(
           child: BlocBuilder<ImagePickerBloc,ImagePickerState>(builder: (context,state){
             return state.cameraFile==null? InkWell(
               onTap: (){
                 context.read<ImagePickerBloc>().add(CameraPickerEvents());
               },
               child: Column(
                 children: [
                   CircleAvatar(
                     child: Icon(Icons.camera),
                   ),
                   Text("Camera")
                 ],
               ),
             ):
             Container(
               child: Image.file(File(state.cameraFile!.path.toString())),
             );
           }),
         ),
          SizedBox(height: 30),
          Center(
            child: BlocBuilder<ImagePickerBloc,ImagePickerState>(builder: (context,state){
              return state.galleryFile==null? InkWell(
                onTap: (){
                  context.read<ImagePickerBloc>().add(GalleryPickerEvents());
                  state.cameraFile==null;
                },
                child: Column(
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.image),
                    ),
                    Text("Gallery")
                  ],
                ),
              ):
              Container(
                child: Image.file(File(state.galleryFile!.path.toString())),
              );
            }),
          )
        ],
      ),
    );
  }
}
