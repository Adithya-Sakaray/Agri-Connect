import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SensorContainer extends StatefulWidget {
  final value;
  final type;
  final RxBool isLoading;

  SensorContainer(
      {super.key,
      required this.value,
      required this.type,
      required this.isLoading});

  @override
  State<SensorContainer> createState() => _SensorContainerState();
}

class _SensorContainerState extends State<SensorContainer> {
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
            height: 35,
          ),
          Obx(() {
            if (widget.isLoading.value) {
              return const CircularProgressIndicator();
            } else {
              return Text("${widget.value}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 40,
                  ));
            }
          }),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.type,
            style: TextStyle(fontSize: 20),
          )
        ]),
      ),
    );
  }
}
