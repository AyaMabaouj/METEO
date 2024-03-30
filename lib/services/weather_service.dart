import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherService {
  static Future<Map<String, dynamic>> fetchWeather(double latitude, double longitude, String apiKey) async {
    final Uri url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
