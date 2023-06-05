import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pocasie/model/weather/hour.dart';
import 'package:pocasie/widgets/info_table.dart';
import 'package:pocasie/widgets/weather_condition_text.dart';

class HourlyForecastDetails extends StatelessWidget {
  final Hour hour;

  const HourlyForecastDetails({super.key, required this.hour});

  String? getDate(final dateEpoch) {
    String? x;
    if (dateEpoch != null) {
      DateTime time = DateTime.fromMillisecondsSinceEpoch(dateEpoch * 1000);
      x = DateFormat("EEEE, HH:mm").format(time);
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
          text: getDate(hour.timeEpoch),
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
            text: hour.condition?.text,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
          InfoTable(informations: {
            "Feels like temperature": "${hour.feelslikeC?.round()}°",
            "Chance of rain": "${hour.chanceOfRain}%",
            "Maximum wind speed": "${hour.windKph} km/h",
            "Pressure": "${hour.pressureMb?.round()} hPa",
            "Total precipitation": "${hour.precipMm} mm",
            "Humidity": "${hour.humidity?.round()}%",
            "Cloud": "${hour.cloud}%",
            "Average visibility": "${hour.visKm} km",
            "UV Index": hour.uv?.round().toString()
          }),
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
          text: "${hour.tempC?.round()}°",
          style: const TextStyle(
            fontSize: 28,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        )),
        const Spacer(),
        Image.asset(
          "assets/weather/${hour.condition?.icon}",
          height: 64,
          width: 64,
        ),
      ]),
    );
  }
}
