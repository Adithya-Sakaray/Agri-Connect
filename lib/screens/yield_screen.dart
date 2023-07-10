import "package:flutter/material.dart";
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class YieldScreen extends StatefulWidget {
  YieldScreen({super.key});

  @override
  State<YieldScreen> createState() => _YieldScreenState();
}

class _YieldScreenState extends State<YieldScreen> {
  String yieldContent =
  '''Using our app is simple. Just capture images of your crops throughout the growing season, ensuring to cover different areas of your field. Our ML model will process the images and provide you with real-time predictions of the expected yield. This information is invaluable for planning and decision-making, allowing you to optimize resources, anticipate market demands, and maximize profitability.

Our yield predictions are based on extensive research, historical data, and robust algorithms that take into account various factors influencing crop productivity. By harnessing the power of image processing, our app provides you with accurate and actionable insights, empowering you to make informed decisions about irrigation, fertilization, pest management, and harvest planning.''';

  File? image;

  late var imgName = "No image selected";

  clear(){
    setState(() {
      image = null;
      imgName = "No image selected";
    });
  }

  Future pickImage1() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemporary = File(image.path);
    setState(() {
      this.image = imageTemporary;
      imgName = image.name;
    });
    print(imgName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                  child: GestureDetector(
                    onTap: pickImage1,
                    child: Container(
                      height: 70,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Icon(
                        Icons.cloud_upload,
                        size: 40,
                      ),
                    ),
                  ),
                ),
                Text(
                  "How does yield prediction work?",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 15,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset("lib/images/yield.png", width: 300)),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    yieldContent,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
