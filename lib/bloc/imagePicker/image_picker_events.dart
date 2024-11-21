import 'package:equatable/equatable.dart';

abstract class ImagePickerEvents extends Equatable{
  const ImagePickerEvents();

  @override
  List<Object?> get props => [];


}


class CameraPickerEvents extends ImagePickerEvents{}
class GalleryPickerEvents extends ImagePickerEvents{}