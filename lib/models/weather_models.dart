class WeatherModels {
  String name;
  String localtime;
  double avgtemp_c;
  double maxtemp_c;
  double mintemp_c;
  double totalprecip_mm;
  double avgtemp_f;
  double gust_kph; //الرياح
  DateTime date;
  String mode;
  String text;
  List<dynamic> hour;

  WeatherModels(
      {required this.name,
      required this.localtime,
      required this.avgtemp_c,
      required this.maxtemp_c,
      required this.mintemp_c,
      required this.totalprecip_mm,
      required this.avgtemp_f,
      required this.gust_kph,
      required this.date,
      required this.mode,
      required this.text,
      required this.hour});

  factory WeatherModels.fromJson(dynamic dataJson) {
    var path = dataJson['forecast']['forecastday'][0];
    return WeatherModels(
        name: dataJson['location']['name'],
        localtime: dataJson['location']['localtime'],
        avgtemp_c: path['day']['avgtemp_c'],
        maxtemp_c: path['day']['maxtemp_c'],
        mintemp_c: path['day']['mintemp_c'],
        totalprecip_mm: dataJson['forecast']['forecastday'][0]['day']
            ['totalprecip_mm'],
        avgtemp_f: path['day']['avgtemp_f'],
        gust_kph: dataJson['current']['gust_kph'],
        date: DateTime.parse(path['date']),
        mode: dataJson['current']['condition']['text'],
        text: path['day']['condition']['text'],
        hour: path['hour']);
  }

  String getImage() {
    String? path;
    if (mode == 'Sunny' || mode == 'Clear') {
      path = 'assets/images/6.png';
    } else if (mode == 'Partly cloudy') {
      path = 'assets/images/7.png';
    } else if (mode == 'Cloudy' || mode == 'Overcast') {
      path = 'assets/images/7.png';
    } else if (mode == 'Cloudy' ||
        mode == 'Light freezing rain' ||
        mode == 'Fog' ||
        mode == 'Freezing fog' ||
        mode == 'Overcast'||
        mode=='Mist') {
      path = 'assets/images/8.png';
    } else if (mode == 'Light sleet' ||
        mode == 'Light sleet showers' ||
        mode == 'Light rain shower' ||
        mode == 'Patchy rain possible' ||
        mode == 'Light rain' ||
        mode == 'Patchy light rain' ||
        mode == 'Heavy freezing drizzle' ||
        mode == 'Freezing drizzle' ||
        mode == 'Light drizzle' ||
        mode == 'Patchy light drizzle') {
      path = 'assets/images/2.png';
    } else if (mode == 'Patchy snow possible' ||
        mode == 'Patchy light snow with thunder' ||
        mode == 'Moderate or heavy showers of ice pellets' ||
        mode == 'Light showers of ice pellets' ||
        mode == 'Moderate or heavy snow showers' ||
        mode == 'Light snow showers' ||
        mode == 'Ice pellets' ||
        mode == 'Heavy snow' ||
        mode == 'Patchy heavy snow' ||
        mode == 'Moderate snow' ||
        mode == 'Patchy moderate snow' ||
        mode == 'Light snow' ||
        mode == 'Patchy light snow' ||
        mode == 'Blizzard' ||
        mode == 'Blowing snow' ||
        mode == 'Patchy freezing drizzle possible') {
      path = 'assets/images/4.png';
    } else if (mode == 'Patchy sleet possible' ||
        mode == 'Moderate or heavy sleet') {
      path = 'assets/images/9.png';
    } else if (mode == 'Thundery outbreaks possible') {
      path = 'assets/images/1.png';
    } else if (mode == 'Moderate rain at times' ||
        mode == 'Moderate or heavy rain with thunder' ||
        mode == 'Moderate or heavy sleet showers' ||
        mode == 'Torrential rain shower' ||
        mode == 'Moderate or heavy rain shower' ||
        mode == 'Moderate or heavy freezing rain' ||
        mode == 'Heavy rain' ||
        mode == 'Heavy rain at times' ||
        mode == 'Moderate rain') {
      path = 'assets/images/3.png';
    } else if (mode == 'Patchy light rain with thunder') {
      path = 'assets/images/10.png';
    } else if (mode == 'Moderate or heavy snow with thunder') {
      return path = 'assets/images/14.png';
    }
    else{
      return path ='assets/images/11.png';
    }

    return path;
  }

}
