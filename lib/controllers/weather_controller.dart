import 'dart:async';

import 'package:flutter/material.dart';
import "package:get/get.dart";

import '../services/weather_service.dart';

class WeatherController extends GetxController {

  var rain = "0".obs;

  void getRain() async {
    rain = await WeatherService.getRain();
  }
}