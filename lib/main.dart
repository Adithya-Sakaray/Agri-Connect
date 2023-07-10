import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iot_project/ThemeData.dart';
import 'package:iot_project/screens/bottom_nav_bar.dart';
import 'firebase_options.dart';

void main() async {

  // final WeatherController weatherController = Get.put(WeatherController());
  // weatherController.getRain();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AgriConnect',
      theme: AppTheme.darkThemeData,
      home:  BottomNavBar(),
    );
  }
}

