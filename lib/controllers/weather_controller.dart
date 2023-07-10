import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../services/weather_service.dart';

class WeatherController extends GetxController {

  
  
  var rain = "0".obs;
  var isLoading = false.obs;
  var temperature = "0".obs;
  var humidity = "0".obs;
  var isRaining = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getRain();
    getData();
    super.onInit();
  }

  FutureOr<void> getRain() async {
    try {
      isLoading.value = true;
      rain.value = await WeatherService.getRain();
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  getData() async {
    isLoading.value = true;
    var data = await FirebaseFirestore.instance
        .collection("sensor_data").doc("sensor_data")
        .get();
    var data1 = data.data();
    temperature.value = data1!['temperature'].toString();
    humidity.value = data1['humidity'].toString();
    if (data1['rain_sensor'] == 1) {
      isRaining.value = false;
    } else {
      isRaining.value = true;
    }
    print(temperature.value);
    print(humidity.value);
    print(isRaining.value);
    print(data1);
    isLoading.value = false;
    } 
}

  
