import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/models/weather_models.dart';
import 'package:weather_app/pages/weatherpage.dart';
import 'package:weather_app/services/weather_service.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  
     @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.greenAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Icon(Icons.sunny,size:60,
              color: Colors.yellowAccent,),
            ),
            const SizedBox(height: 20,),
             
             Lottie.asset('lib/assets/home.json'),
        
             ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Weatherpage()));
             },
              child:Text('Check weather before you travel !'))
        
        
          ],
        ),
      )
    );
     }}