import 'package:covid_19_mobile_app/screens/main/main_screen.dart';
import 'package:covid_19_mobile_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid App',
      theme: ThemeData(
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Colors.black
        ),
        fontFamily: 'DarkerGrotesque',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        ),
        scaffoldBackgroundColor: const Color.fromRGBO(245, 245, 245, 1),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          selectedLabelStyle:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          unselectedLabelStyle:
              TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          selectedIconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
