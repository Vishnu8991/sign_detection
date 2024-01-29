import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_detection/controller/img_controller.dart';

void main(){
  runApp(MaterialApp(home: TextDisplayScreen(),));
}

class TextDisplayScreen extends StatelessWidget {
  final UploadController _controller = Get.put(UploadController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        backgroundColor: Colors.black,
        title: Text('Image Upload'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              height: 300,
              color: Colors.black,
              child: Obx(() {
                return _controller.image == null
                    ? Icon(
                        Icons.add_a_photo,
                        size: 150,
                        color: Colors.white,
                      )
                    : Image.file(
                        _controller.image!,
                      );
              }),
            ),
            SizedBox(height: 50),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              height: 90,
              width: 210,
              child: Obx(() {
                return _controller.prediction.isNotEmpty
                    ? Text(
                        '${_controller.prediction}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Text(
                        'Prediction will appear here',
                        style: TextStyle(color: Colors.white),
                      );
              }),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _controller.selectImage(),
                  child: Text('Select Image', style: TextStyle(color: Colors.black)),
                ),
                SizedBox(width: 25),
                ElevatedButton(
                  onPressed: () async {
                    await _controller.uploadImage();
                  },
                  child: Text('Upload Image'),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
