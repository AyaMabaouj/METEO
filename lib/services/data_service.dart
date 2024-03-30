class DataService {
  static String formatTemperature(double temperature) {
    return '$temperature °C';
  }

  static String formatHumidity(int humidity) {
    return '$humidity%';
  }

  static String formatWindSpeed(double windSpeed) {
    return '$windSpeed km/h';
  }

  static String formatClouds(int clouds) {
    return '$clouds%';
  }
}
