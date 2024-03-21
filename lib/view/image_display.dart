import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_detection/controller/text_controller.dart';

  void main(){
    runApp(MaterialApp(home: ImageDisplayScreen(),));
  }


class ImageDisplayScreen extends StatelessWidget {
  final ImageDisplayController controller = Get.put(ImageDisplayController());

  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Text Upload'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    isDense: true,
                    hintStyle: TextStyle(
                      color: Colors.grey[700],
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.bold,
                    ),
                    hintText: 'Enter text',
                    fillColor: Colors.green,
                  ),
                ),
              ),
              SizedBox(height: 25),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue[800]),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 30),
                  ),
                ),
                onPressed: () {
                  controller.fetchImages(_textController.text);
                },
                child: Text('Display'),
              ),
              SizedBox(height: 25),
              Obx(() => Container(
                    color: Colors.black,
                    width: double.infinity,
                    height: 180,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.imagesData.length,
                      itemBuilder: (context, index) {
                        //get.to()
                        return Container(
                          color: Colors.black,
                          height: 10,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Image.memory(
                                      base64Decode(controller.imagesData[index]['image_data']),
                                      height: 90,
                                    ),
                                  ),
                                  SizedBox(height: 25),
                                  Text(
                                    '${controller.imagesData[index]['character']}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
