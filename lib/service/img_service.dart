import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class UploadService {
  Future<Map<String, dynamic>> uploadImage(File imageFile) async {
    var apiUrl = Uri.parse('http://10.0.2.2:8000/api/hand-tracking/upload/');
    var request = http.MultipartRequest('POST', apiUrl);
    var image = await http.MultipartFile.fromPath('file', imageFile.path);
    request.files.add(image);

    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData =
            json.decode(await response.stream.bytesToString());
        return responseData;
      } else {
        print('Failed to upload image. Status code: ${response.statusCode}');
        return {}; 
      }
    } catch (e) {
      print('Error uploading image: $e');
      return {}; 
    }
  }
}
