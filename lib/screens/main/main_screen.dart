import 'package:covid_19_mobile_app/screens/home_screen.dart';
import 'package:covid_19_mobile_app/screens/main/country_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final List<Widget> screen = const [
    HomeScreen(),
     CountryScreen(),
  ];

  void tapIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: screen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.place_outlined), label: 'Country')
        ],
        currentIndex: selectedIndex,
        onTap: tapIndex,
      ),
    );
  }
}
