import 'dart:convert';
import 'package:pocasie/model/weather/weather.dart';
import 'package:http/http.dart' as http;

class FetchWeatherAPI {
  Weather? weatherData;

  Future<Weather> processData(lat, lon) async {
    var response = await http.get(Uri.parse(url(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherData = Weather.fromJson(jsonString);
    return weatherData!;
  }
}

String url(var lat, var lon) {
  const weatherapi_key = "7d24513118294942b30155505223112";

  String url =
      "http://api.weatherapi.com/v1/forecast.json?key=$weatherapi_key&q=$lat,$lon&days=7&aqi=no&alerts=no";
  return url;
}
