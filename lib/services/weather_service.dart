import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class WeatherService {

  static FutureOr<RxString>  getRain() async {

    var accessKey = "3250bd90e72ededad9274ad2dcb08e99";
    var client = http.Client();
    var url = Uri.parse("https://api.openweathermap.org/data/2.5/forecast?lat=44.34&lon=10.99&appid=$accessKey&units=metric");

    var response = await client.get(url);
    if(response.statusCode == 200){
      var raindata = "0".obs;
      var json = response.body;
      var data = jsonDecode(json);
      var rain = data["list"][0]["pop"];
      rain = (rain * 100).round().toString();
      raindata.value = rain;
      return raindata;
    }
    else{
      return "L".obs;
    }
  }
}

