import 'package:flutter/material.dart';
import 'package:weather_app/Screens/ForecastScreen.dart';
import 'package:weather_app/Screens/MainScreen.dart';
import 'package:weather_app/Screens/SettingsScreen.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      initialRoute: '/',
      home: const MainScreen(),
      routes: {
        '/settings': (context) => const SettingsScreen(),
        '/forecast': (context) => const ForecastScreen(),
      },
    );
  }
}
