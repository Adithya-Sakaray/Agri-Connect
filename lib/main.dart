import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iot_project/ThemeData.dart';
import 'package:iot_project/controllers/weather_controller.dart';
import 'package:iot_project/screens/bottom_nav_bar.dart';
import 'package:iot_project/screens/home_screen.dart';

void main() async {

  // final WeatherController weatherController = Get.put(WeatherController());
  // weatherController.getRain();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.darkThemeData,
      home:  BottomNavBar(),
    );
  }
}

