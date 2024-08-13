import 'package:flutter/material.dart';
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
     // backgroundColor: Colors.grey,
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
          Icon(Icons.location_on,size: 20,),
        Text(_weather?.cityName??'Loading City'),
                 const SizedBox(height: 10,),
                Text('${_weather?.temperature.round()}''🌡️C')
        ],
        ),
      ),
    );
  }
}