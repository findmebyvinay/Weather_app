import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/services/weather_service.dart';

import '../models/weather_models.dart';

class Weatherpage extends StatefulWidget {
  const Weatherpage({super.key});

  @override
  State<Weatherpage> createState() => _WeatherpageState();
}

class _WeatherpageState extends State<Weatherpage> {
  final _WeatherService =WeatherService('49e89efecf95f700002aabad2f7f9b60');
   Weather ? _weather;


    String getWeatherCondition(String mainCondition){
      switch(mainCondition.toLowerCase()){
        case 'cloud':
        case'mist':
        case 'smoke':
        case 'haze':
        case'dust':
        return 'lib/assets/cloudy_sunny.json';
        case'rain':
        case'shower rain':
        case 'drizzle':
        return 'lib/assets/rainy.json';
        case'snow':
        return 'lib/assets/snow.json';
        case'clear':
        return'lib/assets/sunny.json';
        default:
        return 'lib/assets/sunny.json';


      }
    }
   _fetchWeather()async{

    String cityName= await _WeatherService.getCurrentCity();
    try{
    final weather = await _WeatherService.getWeather(cityName);
    setState(() {
      _weather = weather;
    });
    }
    catch (e){
        print(e);
    }
   }
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchWeather();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.green[100],
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Todays Weather⛅',
          style: TextStyle(
            fontSize: 35,
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold
          ),),
          const SizedBox(height: 20,),
          Icon(Icons.location_on,size: 30,),
        Text(_weather?.cityName??'Loading City'),
                 const SizedBox(height: 10,),
                 Lottie.asset(getWeatherCondition('${_weather?.mainCondition}')),
                Text('${_weather?.mainCondition}'),
                Text('${_weather?.temperature.round()}''🌡️C')
        ],
        ),
      ),
    );
  }
}