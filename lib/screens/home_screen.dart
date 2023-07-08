import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iot_project/components/sensor_container.dart';
import 'package:iot_project/controllers/weather_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherController weatherController = Get.put(WeatherController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      weatherController.getRain();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: const Text(
          "Agri-Connect",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SensorContainer(
                      value: "35 °C",
                      type: "Temperature",
                      isLoading: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SensorContainer(
                      value: "40",
                      type: "Humidity",
                      isLoading: false,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SensorContainer(
                      value: "${weatherController.rain}%",
                      type: "Chance of\n\t\t\t\t\tRain",
                      isLoading: weatherController.isLoading.value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SensorContainer(
                      value: "40",
                      type: "Soil Moisture",
                      isLoading: false,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
