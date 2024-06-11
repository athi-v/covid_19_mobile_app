import 'dart:convert';
import 'package:http/http.dart' as http;

const String baseUrl = 'https://disease.sh/v3/covid-19';

Future<Map<String, dynamic>> apiWorldwide() async {
  const String url = '$baseUrl/all';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception("Failed to load data");
  }
}
