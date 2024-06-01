import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_models.dart';
import 'package:weather_app/page/no_weather_page.dart';
import 'package:weather_app/page/weather_page.dart';
import 'package:weather_app/provider/weather_provider.dart';


// ignore: must_be_immutable
class HomePage extends StatelessWidget {
   HomePage({super.key});

  int hourNew = int.parse(DateTime.now().hour.toString());


  @override
  Widget build(BuildContext context) {
    WeatherModels? models = Provider.of<WeatherProvider>(context).weatherModels;

    return Scaffold(
        backgroundColor: hourNew>=12?const Color(0XFF29B2DD) : const Color(0XFF254659),
        body: models != null
            ? const WeatherPage()
            :const NoWeatherPage());
  }
}
