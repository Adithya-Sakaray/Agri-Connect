import "package:flutter/material.dart";
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:iot_project/screens/soil_recommendation_screen.dart';

class SoilScreen extends StatefulWidget {
  SoilScreen({super.key});

  @override
  State<SoilScreen> createState() => _SoilScreenState();
}

class _SoilScreenState extends State<SoilScreen> {
  String soilContent =
      '''Simply capture an image of the soil in your farm using the app's camera feature, and our ML model will analyze the image to determine the soil type. You'll receive instant results, along with a list of crops that thrive in that specific soil type. Our recommendations are based on extensive research, historical data, and expert knowledge, ensuring that you make informed decisions about which crops to grow for optimal yield and success.

By using our app, you'll benefit from improved crop selection, enhanced resource management, and increased profitability. Say goodbye to guesswork and hello to data-driven farming practices. Start maximizing your farm's potential by aligning crops with the most suitable soil types.''';

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
    Navigator.push(context, MaterialPageRoute(builder: (context) => SoilRecommendationScreen(imageName: imgName, imagePath: File(image.path),)));
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
                  "How Soil detection works?",
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
                    child: Image.asset("lib/images/soil.png", width: 300)),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    soilContent,
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
