import 'package:flutter/material.dart';
import 'package:meteo/screen/weatherScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App for Visually Impaired',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white, // Fond blanc
      ),
      home: WeatherScreen(),
    );
  }
}

