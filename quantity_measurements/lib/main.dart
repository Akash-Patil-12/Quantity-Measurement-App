import 'package:flutter/material.dart';
import 'package:quantity_measurements/screens/home.dart';
import 'package:quantity_measurements/screens/length.dart';
import 'package:quantity_measurements/screens/tempreture.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quantity Measurement',
      // home: Home(),
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/length': (context) => Length(),
        '/tempreture': (context) => Tempreture()
      },
    );
  }
}
