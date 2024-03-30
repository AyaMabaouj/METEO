import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  static const _temperatureKey = 'temperature';
  static const _humidityKey = 'humidity';
  static const _windSpeedKey = 'windSpeed';
  static const _cloudsKey = 'clouds';

  static Future<void> cacheWeatherData(Map<String, dynamic> data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(_temperatureKey, data['main']['temp']);
    prefs.setInt(_humidityKey, data['main']['humidity']);
    prefs.setDouble(_windSpeedKey, data['wind']['speed']);
    prefs.setInt(_cloudsKey, data['clouds']['all']);
  }

  static Future<double?> getCachedTemperature() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_temperatureKey);
  }

  static Future<int?> getCachedHumidity() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_humidityKey);
  }
   static Future<double?> getCachedWindSpeed() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_windSpeedKey);
  }

  static Future<int?> getCachedClouds() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_cloudsKey);
  }
}
