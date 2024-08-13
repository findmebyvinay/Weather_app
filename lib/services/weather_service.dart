import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../models/weather_models.dart';
import 'package:http/http.dart' as http ;

class WeatherService{
  static const BASE_URL='https://api.openweathermap.org/data/2.5/weather';
  final String ApiKey;
  WeatherService(this.ApiKey);

  Future<Weather>getWeather(String cityName) async{
    final response= await http.get(Uri.parse('$BASE_URL?q=$cityName&appid=$ApiKey&units=metric'));
    if(response.statusCode==200){
      return Weather.fromJson(jsonDecode(response.body) );
    }
    else{
      throw Exception('faild to load');
    }
  }

  Future<String>getCurrentCity()async{
    LocationPermission permission=  await Geolocator.checkPermission();
    if(permission==LocationPermission.denied){
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition(
      // ignore: deprecated_member_use
      desiredAccuracy: LocationAccuracy.high
    );

    List<Placemark> placemakrs= await placemarkFromCoordinates(position.latitude, position.longitude);
     String ? city=placemakrs[0].locality;


     return city??"";
  }
}