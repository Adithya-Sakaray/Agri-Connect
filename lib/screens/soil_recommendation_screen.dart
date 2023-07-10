import 'package:flutter/material.dart';
import 'dart:io';

class SoilRecommendationScreen extends StatefulWidget {
  final imageName;
  File imagePath;
  SoilRecommendationScreen(
      {super.key, required this.imageName, required this.imagePath});

  @override
  State<SoilRecommendationScreen> createState() =>
      _SoilRecommendationScreenState();
}

class _SoilRecommendationScreenState extends State<SoilRecommendationScreen> {
  var soilType = "";
  var crops = "";
  var characteristics = "";

  @override
  Widget build(BuildContext context) {
    switch (widget.imageName) {
      case "sandySoil.png":
        {
          setState(() {
            soilType = "Sandy Soil";
            crops = "Carrots\nRadishes\nPotatoes\nLettuce\nCorn\nPeanuts";
            characteristics =
                "Sandy soil has large particles with low water-holding capacity. It drains quickly but may require additional irrigation.";
          });
        }
        break;
      case "claySoil.png":
        {
          setState(() {
            soilType = "Clay Soil";
            crops = 'Tomatoes\nCabbage\nBeans\nKale\nSquash\nApples';
            characteristics =
                "Clay soil has small particles and retains water well. It tends to be heavy and can become compacted, so proper soil management is important.";
          });
        }
        break;
      case "loamySoil.png":
        {
          setState(() {
            soilType = "Loamy Soil";
            crops = 'Peppers\nSpinach\nBroccoli\nMelons\nOnions\nStrawberries';
            characteristics =
                "Loamy soil is a well-balanced soil type with a good mixture of sand, silt, and clay. It has good water retention while also providing adequate drainage.";
          });
        }
        break;
      case "peatSoil.png":
        {
          setState(() {
            soilType = "Peat Soil";
            crops = 'Blueberries\nCranberries\nRhododendrons\nAzaleas\nFerns';
            characteristics =
                "Peat soil is composed of partially decomposed organic matter. It tends to be acidic and retains moisture well. It is commonly found in wetland areas.";
          });
        }
        break;
      case "chalkySoil.jpg":
        {
          setState(() {
            soilType = "Chalky Soil";
            crops = 'Grapes\nLavender\nThyme\nParsley\nSage\nBarley';
            characteristics =
                "Chalky soil has high alkalinity due to the presence of calcium carbonate. It drains quickly and can be quite stony. It is often found in areas with underlying chalk or limestone bedrock.";
          });
        }
        break;
      default:
        {
          setState(() {
            soilType = "Sandy Soil";
            crops = "Carrots\nRadishes\nPotatoes\nLettuce\nCorn\nPeanuts";
            characteristics =
                "Sandy soil has large particles with low water-holding capacity. It drains quickly but may require additional irrigation.";
          });
        }
        break;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Crop Recommendation",
          style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 25,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.onBackground),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(children: [
          const SizedBox(
            height: 10,
          ),
          Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.file(
                    widget.imagePath,
                    width: 350,
                  ))),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Text(
                "Detected Soil: ",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              Text(
                soilType,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          // Row(
          //   children: [
          //     const SizedBox(width: 20,),
          //
          //   ],
          // ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Text(
                "Recommended Crops:",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Text(
                crops,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Text(
                "Characteristics:",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              )),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Text(
                    characteristics,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                    textAlign: TextAlign.start,
                  )),
            ],
          ),
        ]),
      ),
    );
  }
}
