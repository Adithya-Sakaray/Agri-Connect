import 'package:flutter/material.dart';

class SensorContainer extends StatelessWidget {
  final value;
  final type;
  final isLoading;

  Widget buildLoading() {
    if (isLoading){
      return CircularProgressIndicator();
    } else {
      return Text("$value",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
            ),
          );
    }
    
  }
  SensorContainer(
      {super.key,
      required this.value,
      required this.type,
      required this.isLoading});
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
          SizedBox(
            height: 35,
          ),
          buildLoading(),

          SizedBox(
            height: 5,
          ),
          Text(
            type,
            style: TextStyle(fontSize: 20),
          )
        ]),
      ),
    );
  }
}
