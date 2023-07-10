import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iot_project/controllers/weather_controller.dart';
import 'package:weather_icons/weather_icons.dart';

class RainContainer extends StatefulWidget {
  final value;
  

  RainContainer(
      {super.key,
      required this.value});

  @override
  State<RainContainer> createState() => _RainContainerState();
}

class _RainContainerState extends State<RainContainer> {
  WeatherController weatherController = Get.put(WeatherController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Obx(() {
            if (weatherController.isLoading.value) {
              return const CircularProgressIndicator();
            } else {
              return widget.value? BoxedIcon(WeatherIcons.rain, size: 70,):BoxedIcon(WeatherIcons.day_sunny, size: 70,);
            }
          }),
        ]),
      ),
    );
  }
}
