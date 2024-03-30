import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:meteo/res/images/imagesAssets.dart';
import 'package:meteo/weatherHelper.dart';

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

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String _apiKey = '89a13c80b0f6f047367c74bbfe6228a0';
  String _cityName = '';
  String _weatherDescription = '';
  double _temperature = 0.0;
  int _humidity = 0;
  int _clouds = 0;
  double _windSpeed = 0.0;
  String _errorMessage = '';
  String _weatherImagePath = '';

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  void _getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      setState(() {
        _errorMessage = 'Erreur: L\'utilisateur a refusé l\'accès à la localisation.';
      });
      return;
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _errorMessage = 'Erreur: L\'utilisateur a définitivement refusé l\'accès à la localisation. Veuillez aller dans les paramètres de l\'application pour autoriser l\'accès à la localisation.';
      });
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      fetchWeatherData(position.latitude, position.longitude);
    } catch (e) {
      print('Erreur lors de la récupération de la position : $e');
      setState(() {
        _errorMessage = 'Erreur: Impossible de récupérer la position. Vérifiez les autorisations de localisation.';
      });
    }
  }

  void fetchWeatherData(double latitude, double longitude) async {
    final Uri url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$_apiKey&units=metric');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        _cityName = jsonData['name'];
        _weatherDescription = jsonData['weather'][0]['description'];
        _temperature = jsonData['main']['temp'];
        _humidity = jsonData['main']['humidity'];
        _windSpeed = jsonData['wind']['speed'];
        _clouds = jsonData['clouds']['all'];

        _errorMessage = '';

        // Utilisation de WeatherHelper pour obtenir le chemin d'accès à l'image
        _weatherImagePath = WeatherHelper().getWeatherImage(_weatherDescription);
      });
    } else {
      final errorMessage = json.decode(response.body)['message'];
      setState(() {
        _errorMessage = 'Erreur: $errorMessage';
      });
    }
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        'Home',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.blue,
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center, // Centre le contenu horizontalement
                              children: [
                                // Widget pour l'image
                                Image.asset(
                                  'assets/images/pin.png',
                                  width: 20, // Modifier la largeur selon vos besoins
                                  height: 20, // Modifier la hauteur selon vos besoins
                                ),
                                SizedBox(width: 10),
                                // Widget pour le texte
                                Row(
                                  children: [
                                    Text(
                                      '$_cityName',
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                                    ),
                                    // Autres widgets que vous souhaitez placer à côté du texte
                                  ],
                                ),
                              ],
                            ),
                          ),
              SizedBox(height: 20),
              // Affichage de la description météorologique et de la température
            
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    // Affichage de l'image météorologique
              _weatherImagePath.isNotEmpty
                  ? Image.asset(
                      _weatherImagePath,
                      width: 100,
                      height: 100,
                    )
                  : SizedBox(height: 100),

                  // Température à droite
                  Text(
                    '$_temperature °',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
              // Description météorologique à gauche
                  Text(
                    '$_weatherDescription',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(height: 20),
                   // Affichage de l'humidité et de la vitesse du vent sur la même ligne
                 
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 30.0),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                'assets/images/humidity.png',
                                width: 30,
                                height: 30,
                              ),
                              SizedBox(height: 10),
                              Text(
                                '$_humidity%',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              ),
                              Text(
                                'Humidity',
                                style: TextStyle(fontSize: 14, color: Color.fromARGB(176, 251, 251, 251)),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                'assets/images/windspeed.png',
                                width: 30,
                                height: 30,
                              ),
                              SizedBox(height: 10),
                              Text(
                                '$_windSpeed km/h',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              ),
                              Text(
                                'Wind Speed',
                                style: TextStyle(fontSize: 14, color: Color.fromARGB(176, 251, 251, 251)),
                              ),
                             
                            ],
                          ),
                           Column(
                            children: [
                              Image.asset(
                                'assets/images/lightrain.png',
                                width: 30,
                                height: 30,
                              ),
                              SizedBox(height: 10),
                              Text(
                                '$_clouds%',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              ),
                              Text(
                                'Chance of Rain',
                                style: TextStyle(fontSize: 14, color: Color.fromARGB(176, 251, 251, 251)),
                              ),
                             
                            ],
                          ),
                        ],
                                           ),
                     ),
        
            ],
          ),
        ),
       
      ],
    ),
  );
}

}