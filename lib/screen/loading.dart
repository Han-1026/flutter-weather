import 'package:flutter/material.dart';
import 'package:weather_project/data/geolocator.dart';
import 'package:weather_project/data/network.dart';
import 'package:weather_project/screen/home_screen.dart';


const apiKey = '528cf92d52d35cfda7036c2c62cd9103';
const cnt = '8';
const part = 'current,hourly,minutely,alerts';

class location extends StatefulWidget {

  @override
  _locationState createState() => _locationState();
}

class _locationState extends State<location> {
   
   String lat1 = '';
   String lon2 = '';

  @override
  void initState(){
    super.initState();
    getLocation();
  }


void getLocation() async{ 
    MyLocation mylocation = MyLocation();
    await mylocation.getMyCurrentLocation();
    lat1 = mylocation.lat; // 위도
    lon2 = mylocation.lon; //경도
    
    Network network = Network(
      'https://api.openweathermap.org/data/2.5/weather'
            '?lat=${mylocation.lat}&lon=${mylocation.lon}&appid=$apiKey&units=metric',
      'https://api.openweathermap.org/data/2.5/air_pollution'
            '?lat=${mylocation.lat}&lon=${mylocation.lon}&appid=$apiKey',
       'https://api.openweathermap.org/data/2.5/onecall'
             '?lat=${mylocation.lat}&lon=${mylocation.lon}&exclude=$part&appid=$apiKey&units=metric');
     // 'https://api.openweathermap.org/data/2.5/onecall?lat=37.633053333333336&lon=127.05211666666666&exclude=current,hourly,minutely&appid=528cf92d52d35cfda7036c2c62cd9103&units=metric');

    var weatherData = await network.getJsonData();
    print(weatherData);

    var airData = await network.getAirData();
    print(airData);

    var weeklyData = await network.getWeeklyData();
    print(weeklyData);
  Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomeScreen(
        parseWeatherData: weatherData,
        parseAirData: airData,
        parseWeeklyData: weeklyData,
      );
    }));
}

  @override
  Widget build(BuildContext context) {
    return Theme(
          data: ThemeData(dialogBackgroundColor: Colors.black), 
          child: AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)
            ),
            content: SizedBox(
              height: 200,
              child: Center(
                
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    height: 50.0,
                    width: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                      strokeWidth: 5.0
                    ),
                  ),
               SizedBox(height:20.0,),
               Text(
                 'loading...',
                 style: TextStyle(fontSize: 24, height: 1.5, color:Colors.white),
               )
                ],
                ),
              )
             
            ),
          ),
          );
  }
}
