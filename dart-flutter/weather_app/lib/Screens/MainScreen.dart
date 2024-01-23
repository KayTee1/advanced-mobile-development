import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/Secrets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String cityName = "Tampere";
  String currentWeather = "Loading..";
  double temperature = 0.0;
  double windSpeed = 0.0;

  void fetchWeather() async {
    String baseApiUrl =
        "https://api.openweathermap.org/data/2.5/weather?q=${cityName}&appid=${Secrets.apiKey}&units=metric";
    Uri uri = Uri.parse(baseApiUrl);

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var weatherData = json.decode(response.body);
      setState(() {
        cityName = weatherData["name"];
        currentWeather = weatherData["weather"][0]["description"];
        temperature = weatherData["main"]["temp"];
        windSpeed = weatherData["wind"]["speed"];
      });
    }
  }

  void navigateToSettingsScreen() async {
    final result = await Navigator.pushNamed(context, '/settings');
    if (result != null && result is String) {
      setState(() {
        cityName = result;
      });
      fetchWeather();
    }
  }

  void navigateToForecastScreen() async {
    Navigator.pushNamed(context, '/forecast');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App", style: TextStyle(fontSize: 60)),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(cityName, style: const TextStyle(fontSize: 50)),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(currentWeather, style: const TextStyle(fontSize: 40)),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child:
                  Text("$temperature C", style: const TextStyle(fontSize: 40)),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child:
                  Text("$windSpeed m/s", style: const TextStyle(fontSize: 40)),
            ),
            ElevatedButton(
              onPressed: () {
                fetchWeather();
              },
              child: const Text("Update"),
            ),
            ElevatedButton(
              onPressed: navigateToForecastScreen,
              child: const Text("Forecast"),
            ),
            ElevatedButton(
              onPressed: navigateToSettingsScreen,
              child: const Text("Settings"),
            ),
          ],
        ),
      ),
    );
  }
}
