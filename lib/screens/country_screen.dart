import 'package:covid_19_mobile_app/services/covid_api.dart';
import 'package:covid_19_mobile_app/utils/format_number.dart';
import 'package:covid_19_mobile_app/widgets/home_card.dart';
import 'package:flutter/material.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  late Future<Map<String, dynamic>> _covidCountrydata;
  late TextEditingController _country;

  @override
  void initState() {
    super.initState();
    _country = TextEditingController();
    _covidCountrydata = Future.value({});
  }

  void _searchCountry() {
    setState(() {
      _covidCountrydata = apiCountriesByDetails(_country.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search Country',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _country,
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    hintText: 'Enter country name: ',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton.icon(
                    onPressed: () {
                      _searchCountry();
                    },
                    label: const Text('Search'),
                    icon: const Icon(Icons.search),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 15)),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      textStyle: MaterialStateProperty.all(const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'DarkerGrotesque')),
                      elevation: MaterialStateProperty.all(1),
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FutureBuilder<Map<String, dynamic>>(
                  future: _covidCountrydata,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return const Text('Error');
                    } else if (snapshot.hasData) {
                      return Column(
                        children: [
                          Column(
                            children: [
                              Image(
                                image: NetworkImage(
                                    snapshot.data!['countryInfo']['flag']),
                                height: 50,
                              ),
                              Text(
                                snapshot.data!['country'],
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          HomeCard(
                              title: 'Recovered',
                              icon: Icons.favorite,
                              value: (formatNumber(snapshot.data!['recovered']))
                                  .toString()),
                          HomeCard(
                              title: 'Positive Cases',
                              icon: Icons.group_add,
                              value: (formatNumber(snapshot.data!['cases']))
                                  .toString()),
                          HomeCard(
                              title: 'Deaths',
                              icon: Icons.church,
                              value: (formatNumber(snapshot.data!['deaths']))
                                  .toString()),
                        ],
                      );
                    } else {
                      return const Text('No data');
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _country.dispose();
    super.dispose();
  }
}
