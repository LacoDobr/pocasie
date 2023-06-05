import 'package:flutter/material.dart';
import 'package:pocasie/model/weather/current.dart';
import 'package:pocasie/widgets/weather_condition_text.dart';

class CurrentWeather extends StatelessWidget {
  final Current currentWeather;

  const CurrentWeather({super.key, required this.currentWeather});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      temperature(),
      WeatherConditionText(
          text: currentWeather.condition?.text,
          color: const Color.fromARGB(255, 106, 106, 106)),
      details(),
    ]);
  }

  Widget temperature() {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Image.asset(
          "assets/weather/${currentWeather.condition?.icon}",
          scale: 0.6,
          height: 110,
          width: 110,
        ),
        Container(
          height: 70,
          width: 3,
          color: const Color.fromARGB(74, 108, 108, 108),
        ),
        RichText(
            text: TextSpan(
          text: "${currentWeather.tempC?.round()}°",
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 90,
              color: Color.fromARGB(255, 0, 0, 0)),
        )),
      ]),
    ]);
  }

  Widget details() {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        wind(),
        cloud(),
        humidity(),
      ]),
    );
  }

  Widget wind() {
    return Column(children: [
      Container(
        height: 60,
        width: 60,
        margin: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          color: const Color.fromARGB(120, 227, 227, 227),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Image.asset(
          "assets/icons/wind.png",
          scale: 3,
        ),
      ),
      RichText(
          text: TextSpan(
        text: "${currentWeather.windKph?.round()} km/h",
        style: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      )),
    ]);
  }

  Widget cloud() {
    return Column(children: [
      Container(
        height: 60,
        width: 60,
        margin: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          color: const Color.fromARGB(120, 227, 227, 227),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Image.asset(
          "assets/icons/cloud.png",
          scale: 3,
        ),
      ),
      RichText(
          text: TextSpan(
        text: "${currentWeather.cloud} %",
        style: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      )),
    ]);
  }

  Widget humidity() {
    return Column(children: [
      Container(
        height: 60,
        width: 60,
        margin: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          color: const Color.fromARGB(120, 227, 227, 227),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Image.asset(
          "assets/icons/humidity.png",
          scale: 3,
        ),
      ),
      RichText(
          text: TextSpan(
        text: "${currentWeather.humidity} %",
        style: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      )),
    ]);
  }
}
