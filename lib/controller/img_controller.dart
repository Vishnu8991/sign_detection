import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sign_detection/service/img_service.dart';
import 'dart:io';

class UploadController extends GetxController {
  final picker = ImagePicker();
  Rx<File?> _image = Rx<File?>(null);
  RxString prediction = ''.obs;

  File? get image => _image.value;

  final UploadService _uploadService = UploadService();

  Future<void> selectImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _image.value = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
  }

  Future<void> uploadImage() async {
    if (_image.value != null) {
      try {
        final responseData = await _uploadService.uploadImage(_image.value!);

        if (responseData.isNotEmpty) {
          prediction.value = responseData['index'];
        }
      } catch (e) {
        print('Error uploading image: $e');
      }
    }
  }
}
