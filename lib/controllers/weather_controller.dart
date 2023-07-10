import 'dart:async';
import 'package:get/get.dart';
import '../services/weather_service.dart';

class WeatherController extends GetxController {
  var rain = "0".obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getRain();
    super.onInit();
  }

  FutureOr<void> getRain() async {
    try {
      isLoading.value = true;
      rain.value = await WeatherService.getRain();
    } finally {
      isLoading.value = false;
    }
  }
}
