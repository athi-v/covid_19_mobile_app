import 'package:covid_19_mobile_app/widgets/home_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List homeData = [
    {
      'title': 'Test Conducted',
      'icon': Icons.science_rounded,
      'value': '14525445'
    },
    {'title': 'Recovered', 'icon': Icons.favorite, 'value': '15445'},
    {'title': 'Positive Cases', 'icon': Icons.group_add, 'value': '1455'},
    {'title': 'Deaths', 'icon': Icons.church, 'value': '125'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Dashboard',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                width: double.infinity,
                height: 200,
                child: Image(
                  image: AssetImage(
                    'assets/images/covid_poster.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              ...homeData.map((data) => (HomeCard(
                    title: data['title'],
                    icon: data['icon'],
                    value: data['value'],
                  ))),
            ],
          ),
        ));
  }
}
