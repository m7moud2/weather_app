import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/weather_models.dart';

class WeatherProvider extends ChangeNotifier{

   WeatherModels? _weatherModels;


  set weatherModels(WeatherModels? value) {
    _weatherModels = value;
    notifyListeners();
  }

  WeatherModels? get weatherModels => _weatherModels;
}