import 'package:geolocator/geolocator.dart';

class MyLocation{
   String lat = '';
   String lon = '';
   
  Future<void> getMyCurrentLocation() async{
    try {
      Position position =  await Geolocator.
      getCurrentPosition(desiredAccuracy: LocationAccuracy.best,forceAndroidLocationManager: true);
      lat = '${position.latitude}';
      lon = '${position.longitude}';
      print('${position.latitude}');
      print('${position.longitude}');
    }catch(e){
      print('There was a problem with the internet connection.');
    }
  }
}
