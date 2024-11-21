import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerState extends Equatable{

  final XFile? cameraFile;
  final XFile? galleryFile;
  const ImagePickerState({this.cameraFile, this.galleryFile,});

  ImagePickerState copyWith({XFile? cameraFile,XFile? galleryFile,}){
    return ImagePickerState(
        cameraFile: cameraFile??this.cameraFile,
        galleryFile: galleryFile??this.galleryFile,
    );
}

  @override
  List<Object?> get props => [cameraFile,galleryFile];

}