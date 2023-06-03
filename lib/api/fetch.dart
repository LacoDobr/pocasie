import 'dart:convert';
import 'dart:io';
import 'package:pocasie/model/weather/weather.dart';
import 'package:http/http.dart' as http;

class FetchWeatherAPI {
  Weather? weatherData;

  Future<Weather> processData(lat, lon) async {
    weatherData = Weather.fromJson(<String, dynamic>{});
    try {
      var response = await http.get(Uri.parse(getUrlWeatherapi(lat, lon)));
      var jsonString;
      if (response.statusCode == 200) {
        jsonString = jsonDecode(response.body);
        weatherData = Weather.fromJson(jsonString);
      } else {
        weatherData!.setErrorInfo(response.statusCode.toString());
      }

      response = await http.get(Uri.parse(getUrlOpenweather(lat, lon)));
      if (response.statusCode == 200) {
        jsonString = jsonDecode(response.body);
        weatherData!.specifyValues(jsonString);
      } else {
        weatherData!.setErrorInfo(response.statusCode.toString());
      }
    } on SocketException {
      weatherData!.setErrorInfo('No Internet connection');
    }
    return weatherData!;
  }

  String getUrlWeatherapi(var lat, var lon) {
    const weatherapiKey = "7d24513118294942b30155505223112";

    String url =
        "http://api.weatherapi.com/v1/forecast.json?key=$weatherapiKey&q=$lat,$lon&days=7&aqi=no&alerts=no";
    return url;
  }

  String getUrlOpenweather(var lat, var lon) {
    const openweatherKey = "fab1811edc9019264b12d0a6b80cfc0b";

    String url =
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$openweatherKey&units=metric";
    return url;
  }
}
