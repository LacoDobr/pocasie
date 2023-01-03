import 'current.dart';
import 'forecast.dart';

class Weather {
  Current? current;
  Forecast? forecast;

  Weather({this.current, this.forecast});

  Current getCurrentWeather() {
    return current!;
  }

  Forecast getForecast() {
    return forecast!;
  }

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        current: json['current'] == null
            ? null
            : Current.fromJson(json['current'] as Map<String, dynamic>),
        forecast: json['forecast'] == null
            ? null
            : Forecast.fromJson(json['forecast'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'current': current?.toJson(),
        'forecast': forecast?.toJson(),
      };
}
