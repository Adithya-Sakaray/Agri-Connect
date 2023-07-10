import 'package:flutter/material.dart';
import 'dart:io';

class YeildPredictionScreen extends StatefulWidget {
  final imageName;
  File imagePath;
  YeildPredictionScreen(
      {super.key, required this.imageName, required this.imagePath});

  @override
  State<YeildPredictionScreen> createState() =>
      _YeildPredictionScreenState();
}

class _YeildPredictionScreenState extends State<YeildPredictionScreen> {
  var area = 0;
  var yield = 0;
  @override
  Widget build(BuildContext context) {
    switch (widget.imageName) {
      case "100.jpg":
        {
          setState(() {
            area = 100;
            yield = 15*area;
            });
        }
        break;
      case "1000.jpg":
        {
         setState(() {
            area = 1000;
            yield = 15*area;
            });
        }
        break;
      case "10000.jpg":
        {
          setState(() {
            area = 10000;
            yield = 15*area;
            });
        }
        break;
      default:
        {
        setState(() {
            area = 100;
            yield = 1500*area;
            });
        }
        break;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Yield Prediction",
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
                "Detected Area: ",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              Text(
                "$area acres",
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
                "Predicted Yield: ",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              Text(
                "$yield Quintals",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
