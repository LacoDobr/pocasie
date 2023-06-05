import 'package:pocasie/model/weather/hour.dart';
import 'current.dart';
import 'forecast.dart';

class Weather {
  Current? current;
  Forecast? forecast;
  String? errorInfo;

  Weather({this.current, this.forecast});

  Current getCurrentWeather() {
    return current!;
  }

  List<Hour> getHourlyInfo() {
    return forecast!.forecastday!.first.hours!;
  }

  Forecast getForecast() {
    return forecast!;
  }

  String? getErrorInfo() {
    return errorInfo;
  }

  double getCurrentPressure() {
    double pressure = 870;
    if (current?.pressureMb != null) {
      pressure = current!.pressureMb!;
    }
    return pressure;
  }

  double getCurrentUV() {
    double uv = 0;
    if (current?.uv != null) {
      uv = current!.uv!;
    }
    return uv;
  }

  void setErrorInfo(String errorInfo) {
    this.errorInfo = errorInfo;
  }

  void specifyValues(Map<String, dynamic> json) {
    current!.specifyValues(
      json['main'] ?? <String, dynamic>{},
      json['wind'] ?? <String, dynamic>{},
      json['clouds'] ?? <String, dynamic>{},
      json['weather'] == null
          ? <String, dynamic>{}
          : (json['weather'][0] ?? <String, dynamic>{}),
    );
  }

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        current: json['current'] == null
            ? Current.fromJson(<String, dynamic>{})
            : Current.fromJson(json['current'] as Map<String, dynamic>),
        forecast: json['forecast'] == null
            ? Forecast.fromJson(<String, dynamic>{})
            : Forecast.fromJson(json['forecast'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'current': current?.toJson(),
        'forecast': forecast?.toJson(),
      };
}
