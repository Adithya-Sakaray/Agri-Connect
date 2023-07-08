import "package:get/get.dart";

import '../services/weather_service.dart';

class WeatherController extends GetxController {

  var rain = "0".obs;
  RxBool isLoading = false.obs;

  void getRain() async{
    try {
      isLoading.value = true;
      rain.value = await WeatherService.getRain();
    }
    finally {
      isLoading.value = false;
    }
    
  }
}