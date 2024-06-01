import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_models.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/service/weather_service.dart';

// ignore: must_be_immutable
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? cityName;

  String enter = '';

  void getWeather(String cityName, context) async {
    WeatherService weatherService = WeatherService();
    WeatherModels? weatherModels = await weatherService.getWeather(cityName);
      Provider.of<WeatherProvider>(context, listen: false).weatherModels =
        weatherModels;
      if(weatherModels!=null){
        Navigator.pop(context);
      }
      else{
        setState(() {
          enter='No matching location found 😢' ;
        });
    }
  }

  int hourNew = int.parse(DateTime.now().hour.toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hourNew >= 12
          ? const Color(0XFF29B2DD)
          : const Color(
              0XFF254659), //AssetImage('assets/images/gif/woman_day.gif')
      body: ListView(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  width: 50,
                  height: 50,
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    weight: 50,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 1000,
            child: Column(children: [
              const Spacer(
                flex: 1,
              ),
              const Image(image: AssetImage('assets/images/gif/woman_day.gif')),
              Text(enter,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value) {
                      cityName = value;
                    },
                    onSubmitted: (value) {

                      if(value==''){
                        setState(() {
                          enter='Enter Your City Name 😢' ;
                        });
                      }else{
                        getWeather(value, context);
                      }


                    },
                    decoration: InputDecoration(
                        hintText: 'Enter city name',
                        hintStyle: const TextStyle(color: Colors.white),
                        label: const Text(
                          'City name',
                          style: TextStyle(color: Colors.white),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            getWeather(cityName!, context);

                            if(cityName==''||cityName==null){
                              setState(() {
                                enter='Enter Your City Name 😢' ;
                              });
                            }else{
                              getWeather(cityName!, context);
                            }

                          },
                          icon: const Icon(Icons.search),
                        ),
                        border: OutlineInputBorder(
                          gapPadding: 5,
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    if(cityName==''||cityName==null){
                      setState(() {
                        enter='Enter Your City Name 😢' ;
                      });
                    }else{
                      getWeather(cityName!, context);
                    }
                  },
                  child: const Text('Search City',style: TextStyle(color: Colors.white),)),
              const Spacer(
                flex: 5,
              ),
            ]),
          )
        ],
      ),
    );
  }
}
