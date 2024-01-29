import 'package:get/get.dart';
import 'package:sign_detection/service/text_service.dart';

class ImageDisplayController extends GetxController {
  final ImageService _imageService = ImageService();
  var imagesData = [].obs;

  Future<void> fetchImages(String text) async {
    try {
      var data = await _imageService.fetchImages(text);
      if (data.isNotEmpty) {
        imagesData.value = data;
      }
    } catch (e) {
      print(e);
    }
  }
}