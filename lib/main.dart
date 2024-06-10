import 'package:covid_19_mobile_app/screens/main/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
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
        appBarTheme:
            const AppBarTheme(backgroundColor: Color.fromRGBO(4, 47, 46, 1)),
            scaffoldBackgroundColor: const Color.fromRGBO(245, 245, 245, 1)
      ),
      home: const MainScreen(),
    );
  }
}
