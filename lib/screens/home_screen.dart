import 'package:covid_19_mobile_app/services/covid_api.dart';
import 'package:covid_19_mobile_app/utils/format_number.dart';
import 'package:covid_19_mobile_app/widgets/home_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Map<String, dynamic>> _covidWorldData;

  @override
  void initState() {
    super.initState();
    _covidWorldData = apiWorldwide();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
        ),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _covidWorldData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            );
          } else if (snapshot.hasData) {
            final data = snapshot.data!;
            final List homeData = [
              {
                'title': 'Test Conducted',
                'icon': Icons.science_rounded,
                'value': formatNumber(data['tests']).toString(),
              },
              {
                'title': 'Recovered',
                'icon': Icons.favorite,
                'value': formatNumber(data['recovered']).toString()
              },
              {
                'title': 'Positive Cases',
                'icon': Icons.group_add,
                'value': formatNumber(data['cases']).toString()
              },
              {
                'title': 'Deaths',
                'icon': Icons.church,
                'value': formatNumber(data['deaths']).toString()
              },
            ];
            return SingleChildScrollView(
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
                  ...homeData.map(
                    (data) => (HomeCard(
                      title: data['title'],
                      icon: data['icon'],
                      value: data['value'],
                    )),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text(
                'No data available!',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            );
          }
        },
      ),
    );
  }
}
