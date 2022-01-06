import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class Model {
  Widget getWeatherIcon(int condition) {
    if (condition < 300) {
      return SvgPicture.asset(
        'svg/climacon-colud_lightning.svg',
        color: Colors.yellow[700],
      );
    } else if (condition < 600) {
      return SvgPicture.asset(
        'svg/climacon-cloud_rain.svg',
        color: Colors.blue[400],
      );
    }else if (condition == 600) {
      return SvgPicture.asset(
        'svg/climacon-cloud_snow_alt.svg',
        color: Colors.white,
      );
    }else if (condition == 800) {
      return SvgPicture.asset(
        'svg/climacon-sun.svg',
        color: Colors.yellow[700],
      );
    } else if (condition <= 804) {
      return SvgPicture.asset(
        'svg/climacon-cloud_sun.svg',
        color: Colors.blue[400],
      );
    } else if (condition == 803) {
      return SvgPicture.asset(
        'svg/climacon-cloud_moon.svg',
        color: Colors.indigo[300],
      );
    }
    return(getWeatherIcon(condition));
    
  }

  Widget getAirIcon(int index) {
    
     if (index == 1) {
      return Image.asset(
        'assets/images/good.png',
        width: 37.0,
        height: 35.0,
      );
    } else if (index == 2) {
      return Image.asset(
        'assets/images/fair.png',
        width: 37.0,
        height: 35.0,
      );
    } else if (index == 3) {
      return Image.asset(
        'assets/images/moderate.png',
        width: 37.0,
        height: 35.0,
      );
    } else if (index == 4) {
      return Image.asset(
        'assets/images/poor.png',
        width: 37.0,
        height: 35.0,
      );
    } else if (index == 5) {
      return Image.asset(
        'assets/images/bad.png',
        width: 37.0,
        height: 35.0,
      );
    }
    return(getAirIcon(index));
  }

  Widget getAirCondition(int index) {
    if (index == 1) {
      return Text(
        '"매우좋음"',
        style: TextStyle(
          color: Colors.indigo,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (index == 2) {
      return Text(
        '"좋음"',
        style: TextStyle(
          color: Colors.indigo,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (index == 3) {
      return Text(
        '"보통"',
        style: TextStyle(
          color: Colors.blue[400],
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (index == 4) {
      return Text(
        '"나쁨"',
        style: TextStyle(
          color: Colors.red[400],
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (index == 5) {
      return Text(
        '"매우나쁨"',
        style: TextStyle(
          color: Colors.red[900],
          fontWeight: FontWeight.bold,
        ),
      );
    }
    return(getAirCondition(index));
  }

  Widget backgroundimage(int condition) {
    if (condition < 300) {
      return Image.asset(
              'assets/images/sunny.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            );
    } else if (condition < 600) {
      return Image.asset(
              'assets/images/rainy.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            );
    } else if (condition == 800) {
      return Image.asset(
              'assets/images/sunny.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            );
    } else if (condition <= 804) {
      return Image.asset(
              'assets/images/cloudy.jpeg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            );
    }

    return(backgroundimage(condition));
  }

   Widget getWeekIcon(int wcondition) {
    if (wcondition < 300) {
      return SvgPicture.asset(
        'svg/climacon-colud_lightning.svg',
        color: Colors.yellow[700],
         width: 37.0,
        height: 35.0,
      );
    } else if (wcondition < 600) {
      return SvgPicture.asset(
        'svg/climacon-cloud_rain.svg',
        color: Colors.blue[400],
         width: 37.0,
        height: 35.0,
      );
    }else if (wcondition == 600) {
      return SvgPicture.asset(
        'svg/climacon-cloud_snow_alt.svg',
        color: Colors.white,
         width: 37.0,
        height: 35.0,
      );
    }else if (wcondition == 800) {
      return SvgPicture.asset(
        'svg/climacon-sun.svg',
        color: Colors.yellow[700],
         width: 37.0,
        height: 35.0,
      );
    } else if (wcondition <= 804) {
      return SvgPicture.asset(
        'svg/climacon-cloud_sun.svg',
        color: Colors.blue[400],
         width: 37.0,
        height: 35.0,
      );
    } else if (wcondition == 803) {
      return SvgPicture.asset(
        'svg/climacon-cloud_moon.svg',
        color: Colors.indigo[300],
         width: 37.0,
        height: 35.0,
      );
    }
    return(getWeekIcon(wcondition));
    
  }

}
