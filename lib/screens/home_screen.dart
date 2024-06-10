import 'package:covid_19_mobile_app/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: const Column(
          children: [
            Text('Welcome back,',
            textAlign: TextAlign.left,
            style: TextStyle(
            
            ),),
            HomeCard(),
            HomeCard(),
            HomeCard(),
            HomeCard(),
          ],
        ));
  }
}
