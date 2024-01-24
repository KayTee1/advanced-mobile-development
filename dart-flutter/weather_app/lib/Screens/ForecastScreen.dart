import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/Secrets.dart';

class ForecastScreen extends StatefulWidget {
  const ForecastScreen({Key? key}) : super(key: key);

  @override
  _ForecastScreenState createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  List<Map<String, dynamic>> forecastData = [];
  TextEditingController cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchForecastData("Tampere"); // Provide a default city
  }

  Future<void> fetchForecastData(String cityName) async {
    String baseApiUrl =
        "https://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=${Secrets.apiKey}&units=metric";
    Uri uri = Uri.parse(baseApiUrl);

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      var forecast = json.decode(response.body);
      setState(() {
        forecastData = (forecast["list"] as List<dynamic>)
            .map((item) => {
                  'time': item['dt_txt'],
                  'temperature': item['main']['temp'],
                  'description': item['weather'][0]['description'],
                })
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forecast Screen'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: cityController,
              decoration: const InputDecoration(
                labelText: 'Enter City Name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              fetchForecastData(cityController.text);
            },
            child: const Text("Get Forecast"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: forecastData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    'Time: ${forecastData[index]['time']}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  subtitle: Text(
                    'Temperature: ${forecastData[index]['temperature']}°C\n'
                    'Description: ${forecastData[index]['description']}',
                    style: const TextStyle(fontSize: 14),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
