import 'package:flutter/material.dart';

class SensorContainer extends StatelessWidget {
  
  final value;
  final type;
  SensorContainer({super.key, required this.value, required this.type});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(20)
        ),
        child: Center(
          child: Column(children: [
            SizedBox(height: 35,),
            Text("$value", textAlign: TextAlign.center,style: TextStyle(fontSize: 40, ),),
            SizedBox(height: 5,),
            Text(type, style: TextStyle(fontSize: 20),)
          ]),
        ),
    );
  }
}