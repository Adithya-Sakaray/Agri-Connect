import 'package:flutter/material.dart';
import 'package:iot_project/screens/soil_screen.dart';
import 'soil_screen.dart';
import 'home_screen.dart';
import 'yield_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {


  int selectedIndex = 0;
  void setIndex(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  final List <Widget> pages = [
    HomeScreen(),
    SoilScreen(),
    YieldScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: setIndex,
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white70,
        items:  [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.waves),
            label: "Soil",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grass),
            label: "Yield",
          ),
        ],
      ),

      body: pages[selectedIndex],
    );
  }
}