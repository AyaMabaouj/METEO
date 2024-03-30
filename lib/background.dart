import 'package:flutter/material.dart';

class Background {
  static AssetImage getBackgroundImage(DateTime time) {
    if (_isNight(time)) {
      return AssetImage('assets/night.png');
    } else {
      return AssetImage('assets/day.png');
    }
  }

  static bool _isNight(DateTime time) {
    int hour = time.hour;
    return hour < 6 || hour >= 18; // Supposons que la nuit soit de 18h à 6h
  }
}