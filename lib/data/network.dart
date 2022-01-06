import 'package:http/http.dart' as http;
import 'dart:convert';

class Network{

final String url;
final String url2;
final String url3;
  Network(this.url, this.url2, this.url3);

  Future<dynamic> getJsonData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
  }
    Future<dynamic> getAirData() async {
    http.Response response = await http.get(Uri.parse(url2));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
  }
    Future<dynamic> getWeeklyData() async {
    http.Response response = await http.get(Uri.parse(url3));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
  }
}
