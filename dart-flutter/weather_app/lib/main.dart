import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "BMI APP",
        theme: ThemeData(
            primarySwatch: Colors.blue,
            hintColor: Colors.amber,
            fontFamily: 'Georgia'),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Weather App"),
            backgroundColor: Colors.blue,
          ),
          body: const Center(child: WeatherUi()),
        ));
  }
}

class WeatherUi extends StatefulWidget {
  const WeatherUi({super.key});

  @override
  State<WeatherUi> createState() => _WeatherUi();
}

class _WeatherUi extends State<WeatherUi> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text("Cloudy", style: TextStyle(fontSize: 30)),
        const SizedBox(height: 20),
        const Text("Temperature -15 c", style: TextStyle(fontSize: 30)),
        const SizedBox(height: 20),
        const Text("Windspeed: 2 m/s", style: TextStyle(fontSize: 30)),
        const SizedBox(height: 20),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: Colors.green,
            ),
            onPressed: () {},
            child: const Text("Get Weather")),
      ],
    );
  }
}
