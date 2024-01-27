import 'package:flutter/material.dart';
import 'package:device_interfaces/Screens/DeviceApiScreen.dart';

void main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Device API tests',
      initialRoute: '/',
      home: const DeviceApiScreen(),
      routes: {
        '/device': (context) => const DeviceApiScreen(),
      },
    );
  }
}
