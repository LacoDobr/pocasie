import 'package:flutter/material.dart';
import 'package:pocasie/model/weather/current.dart';

class CurrentWeather extends StatelessWidget {
  final Current currentWeather;

  const CurrentWeather({super.key, required this.currentWeather});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Temperature(),
        Details(),
      ],
    );
  }

  Widget Temperature() {
    String path;
    if (currentWeather.isDay == 1) {
      path =
          "assets/weather/day/${currentWeather.condition!.icon!.substring(39)}";
    } else {
      path =
          "assets/weather/night/${currentWeather.condition!.icon!.substring(41)}";
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          path,
          scale: 0.6,
        ),
        Container(
          height: 70,
          width: 3,
          color: Color.fromARGB(75, 0, 0, 0),
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
            text: "${currentWeather.tempC!.round().toInt()}°",
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 90,
                color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ]))
      ],
    );
  }

  Widget Details() {
    return Container();
  }
}
