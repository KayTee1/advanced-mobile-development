import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class DeviceApiScreen extends StatefulWidget {
  const DeviceApiScreen({Key? key}) : super(key: key);

  @override
  _DeviceApiScreenState createState() => _DeviceApiScreenState();
}

class _DeviceApiScreenState extends State<DeviceApiScreen> {
  double xSensorValue = 0;
  double ySensorValue = 0;
  double zSensorValue = 0;

  double latitude = 0;
  double longitude = 0;

  void startLocation() async {
    if (await Permission.location.request().isGranted) {
      Location location = Location();

      location.onLocationChanged.listen((event) {
        setState(() {
          latitude = event.latitude!;
          longitude = event.longitude!;
        });
      });
    }
  }

  void startSensors() {
    accelerometerEventStream().listen((event) {
      setState(() {
        xSensorValue = event.x;
        ySensorValue = event.y;
        zSensorValue = event.z;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Device API tests"),
      ),
      body: Column(
        children: [
          Text('Lat: $latitude', style: const TextStyle(fontSize: 40)),
          Text('Lng: $longitude', style: const TextStyle(fontSize: 40)),
          ElevatedButton(
            onPressed: startLocation,
            child: const Text("Start location"),
          ),
          Text('x: + $xSensorValue', style: const TextStyle(fontSize: 40)),
          Text('y: + $ySensorValue', style: const TextStyle(fontSize: 40)),
          Text('z: + $zSensorValue', style: const TextStyle(fontSize: 40)),
          ElevatedButton(
            onPressed: startSensors,
            child: const Text("Start sensors"),
          ),
        ],
      ),
    );
  }
}
