import 'package:flutter/material.dart';
import 'package:iot_project/components/SensorContainer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(child: Column(
          children: [
            
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right:15, left: 30, top: 40),
                  child: SensorContainer(value: "35 °C", type: "Temperature"),
                ),
                Padding(
              padding: const EdgeInsets.only(right:30, left: 15, top: 40),
              child: SensorContainer(value: "40", type: "Humidity",),
            ),
              ],
            ),
          ],
        ),)
      ),
    );
  }
}