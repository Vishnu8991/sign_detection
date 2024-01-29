import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_detection/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign_detection/view/image_display.dart';
import 'package:sign_detection/view/learning/learning.dart';
import 'package:sign_detection/view/text_display.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),

      backgroundColor: MyColors.kblueColor,
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
            ),
            child: Column(
              children: [
                SizedBox(height: 30),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  title: Text(
                    'Sign Language Detection',
                    style: GoogleFonts.robotoSlab(fontWeight: FontWeight.bold, fontSize: 25, letterSpacing: 1.1),
                  ),
                  subtitle: Text(
                    "Hi there!!",
                    style: GoogleFonts.openSans(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(height: 550,
                padding: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: MyColors.kblueColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
                ),
                child:

                Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 5),
                                color: Theme.of(context).primaryColor.withOpacity(.4),
                                spreadRadius: 2,
                                blurRadius: 5,
                              )
                            ],
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () => Get.to(TextDisplayScreen()),
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    // color: ,
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    CupertinoIcons.photo_fill_on_rectangle_fill,
                                    size: 70,
                                    // color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Upload",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 21, letterSpacing: 1.1),
                              )
                            ],
                          ),
                          height: 150,
                          width: 150,
                        ),

                        SizedBox(width: 30),


                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 5),
                                color: Theme.of(context).primaryColor.withOpacity(.4),
                                spreadRadius: 2,
                                blurRadius: 5,
                              )
                            ],
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () => Get.to(ImageDisplayScreen()),
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    // color: ,
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.app_registration,
                                    size: 70,
                                    // color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Text",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 21, letterSpacing: 1.1),
                              )
                            ],
                          ),
                          height: 150,
                          width: 150,
                        )
                      ],
                    ),
                    SizedBox(height: 40),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 5),
                            color: Theme.of(context).primaryColor.withOpacity(.4),
                            spreadRadius: 2,
                            blurRadius: 5,
                          )
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pushReplacement(context, (MaterialPageRoute(builder: (context)=> AslButton1()))),
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                // color: ,
                                  shape: BoxShape.circle),
                              child: Icon(
                                Icons.pan_tool_alt_sharp,
                                size: 70,
                                // color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Learning",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 21, letterSpacing: 1.1),
                          )
                        ],
                      ),
                      height: 150,
                      width: 150,
                    )
                  ],
                )
            ),
          ),
        ],
      ),
    );
  }

}