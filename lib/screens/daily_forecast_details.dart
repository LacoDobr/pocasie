import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pocasie/model/weather/forecastday.dart';
import 'package:pocasie/widgets/hourly_forecast.dart';
import 'package:pocasie/widgets/info_table.dart';
import 'package:pocasie/widgets/weather_condition_text.dart';

class DailyForecastDetails extends StatelessWidget {
  final Forecastday forecastday;

  const DailyForecastDetails({super.key, required this.forecastday});

  String? getDate(final dateEpoch) {
    String? x;
    if (dateEpoch != null) {
      DateTime time = DateTime.fromMillisecondsSinceEpoch(dateEpoch * 1000);
      x = DateFormat("EEEE, d. MMMM yyy").format(time);
    }
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 180, 238, 255),
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: RichText(
            text: TextSpan(
          text: getDate(forecastday.dateEpoch),
          style: const TextStyle(
            fontSize: 22,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        )),
      ),
      body: SafeArea(
        child: Column(children: [
          temperature(),
          WeatherConditionText(
              text: forecastday.day?.condition?.text,
              color: const Color.fromARGB(255, 0, 0, 0)),
          InfoTable(informations: {
            "Maximum wind speed":
                "${forecastday.day?.maxwindKph?.round()} km/h",
            "Total precipitation": "${forecastday.day?.totalprecipMm} mm",
            "Average visibility": "${forecastday.day?.avgvisKm} km",
            "Humidity": "${forecastday.day?.avghumidity?.round()}%",
            "UV Index": forecastday.day?.uv?.round().toString()
          }),
          HourlyForecast(hours: forecastday.hours!).hourlyList(),
        ]),
      ),
    );
  }

  Widget temperature() {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Row(children: [
        const Icon(
          Icons.thermostat,
          size: 35,
        ),
        RichText(
            text: TextSpan(
          text:
              "${forecastday.day?.maxtempC?.round()}°/${forecastday.day?.mintempC?.round()}°",
          style: const TextStyle(
            fontSize: 28,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        )),
        const Spacer(),
        Image.asset(
          "assets/weather/${forecastday.day?.condition?.icon}",
          height: 64,
          width: 64,
        ),
      ]),
    );
  }
}
