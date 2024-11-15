import 'package:bs_teknology/views/bottomnavigation/home/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'doctor/doctor.dart';

class Bottomnavigation extends StatefulWidget {
  final int index;
  const Bottomnavigation({super.key, required this.index});

  @override
  BottomnavigationState createState() => BottomnavigationState();
}

class BottomnavigationState extends State<Bottomnavigation> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.index;
  }
  static const List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    Doctorlist(),
    Text(
      'Task'
    ),
    Text(
      'Menu',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 243, 240, 240),
        body: PopScope(
          canPop: false,
          child: SafeArea(
            child: Center(
              child: _widgetOptions.elementAt(_currentIndex),
            ),
          ),
        ),
        bottomNavigationBar: SalomonBottomBar(
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.home, size: 35),
              title: const Text("Home"),
              selectedColor: const Color.fromRGBO(113, 114, 222, 1),
            ),

            SalomonBottomBarItem(
              icon: const Icon(Icons.person_outlined, size: 35),
              title: const Text("Doctors"),
              selectedColor: const Color.fromRGBO(113, 114, 222, 1),
            ),

            SalomonBottomBarItem(
              icon: const Icon(Icons.calendar_month_outlined, size: 35),
              title: const Text("Task"),
              selectedColor: const Color.fromRGBO(113, 114, 222, 1),
            ),

            SalomonBottomBarItem(
              icon: const Icon(Icons.person_search_outlined, size: 35),
              title: const Text("Menu"),
              selectedColor: const Color.fromRGBO(113, 114, 222, 1),
            ),
          ],
        ),
    );
  }
}