import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/page/searsh_page.dart';

import '../models/weather_models.dart';
import '../provider/weather_provider.dart';
import '../widgets/custom_location.dart';
import '../widgets/hour_weather.dart';
import '../widgets/image_text.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModels models = Provider.of<WeatherProvider>(context).weatherModels!;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: ListView(
        children: [Column(
          children: [
            const SizedBox(height: 10,),
            GestureDetector(
              onTap: (){

                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const SearchPage();
                  },
                ));
              },
              child: Row(
                children: [
                  const Image(
                    image: AssetImage('assets/images/icons/frame.png'),
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomLocation(models.name),
                ],
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 20,),
                Image(
                  image: AssetImage(models.getImage()),
                  width: 200,
                  height: 200,
                ),
                Text(
                  '${models.avgtemp_c.toInt()}º',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 60,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  models.text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Max.: ${models.maxtemp_c.toInt()}º                   Min.: ${models.mintemp_c.toInt()}º',
                  style: const TextStyle(
                      color: Colors.white,fontSize: 17, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 40,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Colors.black38,
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  ImageText('assets/images/icons/rain.png',
                      '${models.totalprecip_mm}%'),
                  const Spacer(
                    flex: 3,
                  ),
                  ImageText('assets/images/icons/temperature.png',
                      '${models.avgtemp_c}%'),
                  const Spacer(
                    flex: 3,
                  ),
                  ImageText('assets/images/icons/wind_speed.png',
                      '${models.gust_kph}km/h'),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              // height: 160,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Colors.black38,
              ),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text(
                        'Today',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      Text(
                        'Mar,10',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: models.hour.length,

                      itemBuilder: (context, index) {
                        return HourWeather(
                            '${models.hour[index]['temp_c']}',
                            DateTime.parse(models.hour[index]['time']),
                            models.hour[index]['condition']['text'].toString()
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        ]
      ),
    );
  }
}
