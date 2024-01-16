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
            title: const Text("BMI Application"),
            backgroundColor: Colors.green,
          ),
          body: Center(child: BmiUI()),
        ));
  }
}

class BmiUI extends StatefulWidget {
  const BmiUI({super.key});

  @override
  State<BmiUI> createState() => _BmiUIState();
}

class _BmiUIState extends State<BmiUI> {
  String weight = '';
  String height = '';
  String bmiResult = '';

  void calculateBMI() {
    if (weight.isNotEmpty && height.isNotEmpty) {
      double weightValue = double.parse(weight);
      double heightValue = double.parse(height);
      double bmi = weightValue / ((heightValue / 100) * (heightValue / 100));

      setState(() {
        bmiResult = "BMI: ${bmi.toStringAsFixed(2)}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text("Weight (kg)"),
        TextField(
          decoration: const InputDecoration(labelText: "Weight (kg)"),
          keyboardType: TextInputType.number,
          onChanged: (value) {
            weight = value;
          },
        ),
        TextField(
          decoration: const InputDecoration(labelText: "Height (cm)"),
          keyboardType: TextInputType.number,
          onChanged: (value) {
            height = value;
          },
        ),
        const SizedBox(height: 20),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: Colors.green,
            ),
            onPressed: calculateBMI,
            child: const Text("Calculate BMI")),
        Text(bmiResult, style: TextStyle(fontSize: 30))
      ],
    );
  }
}
