import 'dart:convert';
import 'package:http/http.dart' as http;

class ImageService {
  Future<List<Map<String, dynamic>>> fetchImages(String text) async {
    String apiUrl = "http://10.0.2.2:8000/api/images/";

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {'input': text.trim()},
      );

      if (response.statusCode == 200) {
        List<dynamic> responseData = json.decode(response.body);
        return List<Map<String, dynamic>>.from(responseData);
      } else {
        return [];
      }
    } catch (error) {
      return [];
    }
  }
}
