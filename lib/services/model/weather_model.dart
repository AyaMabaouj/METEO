class WeatherModel {
  final String cityName;
  final String weatherDescription;
  final double temperature;
  final int humidity;
  final double windSpeed;
  final int clouds;

  WeatherModel({
    required this.cityName,
    required this.weatherDescription,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.clouds,
  });
}
