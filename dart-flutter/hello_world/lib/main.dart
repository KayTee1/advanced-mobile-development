import 'package:flutter/material.dart';

class Person {
  String name;
  int age;
  double? weight;
  double? height;

  Person(this.name, this.age, {this.weight, this.height});

  Person.verySmallPerson(this.name, this.age) : height = 50.0;

  double? get bmi => weight != null && height != null
      ? weight! / ((height! / 100) * (height! / 100))
      : null;

  String get getName => name;
  int get getAge => age;
  double? get getWeight => weight;
  double? get getHeight => height;

  @override
  String toString() {
    return 'Name: $name, Age: $age, Weight: $weight kg, Height: $height cm, BMI: $bmi';
  }
}

class Student extends Person {
  int id;
  double creditPoints;

  Student(String name, int age,
      {double? weight,
      double? height,
      required this.id,
      required this.creditPoints})
      : super(name, age, weight: weight, height: height);

  @override
  String toString() {
    return '${super.toString()}, Student ID: $id, Credit Points: $creditPoints';
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var person = Person('John', 30, weight: 75.0, height: 180.0);
    var student = Student('Alice', 22,
        weight: 65.0, height: 170.0, id: 123, creditPoints: 120.5);

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Person Info: ${person.toString()}'),
              const SizedBox(height: 20),
              Text('Student Info: ${student.toString()}'),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}
