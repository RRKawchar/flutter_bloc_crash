import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_demo_main/bloc/imagePicker/image_picker_events.dart';
import 'package:flutter_bloc_demo_main/bloc/imagePicker/image_picker_state.dart';
import 'package:flutter_bloc_demo_main/utils/image_picker_utils.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvents,ImagePickerState>{
  ImagePickerBloc():super(const ImagePickerState()){
    on<CameraPickerEvents>(_cameraPicker);
    on<GalleryPickerEvents>(_galleryPicker);
  }

  void _cameraPicker(ImagePickerEvents event, Emitter<ImagePickerState> emit)async{
     XFile? file=await ImagePickerUtils.pickImageFromCamera();
     emit(state.copyWith(cameraFile: file));
  }

  void _galleryPicker(ImagePickerEvents event, Emitter<ImagePickerState> emit)async{
    XFile? file=await ImagePickerUtils.pickImageFromGallery();
    emit(state.copyWith(galleryFile: file));
  }
}