import 'package:meteo/res/images/imagesAssets.dart';

class WeatherHelper {
  String getWeatherImage(String weatherDescription) {
    switch (weatherDescription.toLowerCase()) {
      case 'rain':
        return ImageAssets.nightRain;
      case 'clear sky':
        return ImageAssets.clear;
      case 'sun':
        return ImageAssets.assetsSunny;
      case 'heavy rain':
        return ImageAssets.heavyRain;
      case 'thunderstorm':
        return ImageAssets.thunder;
      case 'windy':
        return ImageAssets.wind;
      case 'windy with waves':
        return ImageAssets.windWave;
      case 'rainy sun':
        return ImageAssets.sunRaint;
      case 'sun with slow rain':
        return ImageAssets.sunSlowRain;
      case 'sun with heavy rain':
        return ImageAssets.sunHeavyRain;
      case 'rainbow':
        return ImageAssets.rainbow;
      case 'moon':
        return ImageAssets.moon;
      case 'night rain with stars':
        return ImageAssets.nightStarRain;
      case 'night thunderstorm':
        return ImageAssets.nightThunder;
      case 'clear night with stars':
        return ImageAssets.starClear;
      case 'umbrella':
        return ImageAssets.umbrella;
      case 'cloud':
        return ImageAssets.assetsCloud;
      case 'cloudy':
        return ImageAssets.assetsCloudy;
      case 'fog':
        return ImageAssets.assetsFog;
      case 'heavy cloudy':
        return ImageAssets.assetsHeavycloudy;
      case 'heavy rain':
        return ImageAssets.assetsHeavyrain;
      case 'humidity':
        return ImageAssets.assetsHumidity;
      case 'light drizzle':
        return ImageAssets.assetsLightdrizzle;
      case 'light rain':
        return ImageAssets.assetsLightrain;
      case 'light rain shower':
        return ImageAssets.assetsLightrainshower;
      case 'moderate or heavy rain shower':
        return ImageAssets.assetsModerateorheavyrainshower;
      case 'moderate or heavy rain with thunder':
        return ImageAssets.assetsModerateorheavyrainwiththunder;
      case 'moderate rain':
        return ImageAssets.assetsModeraterain;
      case 'moderate rain at times':
        return ImageAssets.assetsModeraterainattimes;
      case 'overcast':
        return ImageAssets.assetsOvercast;
      case 'partly cloudy':
        return ImageAssets.assetsPartlycloudy;
      case 'patchy light drizzle':
        return ImageAssets.assetsPatchylightdrizzle;
      case 'patchy light rain':
        return ImageAssets.assetsPatchylightrain;
      case 'patchy light rain with thunder':
        return ImageAssets.assetsPatchylightrainwiththunder;
      case 'patchy rain possible':
        return ImageAssets.assetsPatchyrainpossible;
      case 'sunny':
        return ImageAssets.assetsSunny;
      case 'thundery outbreaks possible':
        return ImageAssets.assetsThunderyoutbreakspossible;
      case 'wind speed':
        return ImageAssets.assetsWindspeed;
      case 'snow':
        return ImageAssets.snow;
      default:
        return '';
    }
  }
}
