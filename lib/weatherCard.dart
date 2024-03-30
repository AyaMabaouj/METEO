import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final String cityName;
  final String weatherDescription;
  final double temperature;
  final int humidity;
  final double windSpeed;

  const WeatherCard({
    required this.cityName,
    required this.weatherDescription,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Ville: $cityName',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Description: $weatherDescription',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Température: $temperature°C',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Humidité: $humidity%',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              'Vitesse du vent: $windSpeed m/s',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
