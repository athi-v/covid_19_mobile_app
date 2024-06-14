import 'dart:async';
import 'package:covid_19_mobile_app/screens/main/main_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const MainScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
      
             Text(
              'Byte Data',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
            ),
             SizedBox(
              height: 10,
            ),
             SizedBox(
              height: 10,
            ),
             CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
