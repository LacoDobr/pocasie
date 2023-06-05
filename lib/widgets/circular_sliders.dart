import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CircularSliders extends StatelessWidget {
  final double pressure;
  final double uv;

  const CircularSliders({super.key, required this.pressure, required this.uv});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      pressureSlider(),
      const Spacer(),
      uvSlider(),
    ]);
  }

  Widget pressureSlider() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          child: RichText(
              text: const TextSpan(
            text: "Pressure",
            style: TextStyle(
              fontSize: 23,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          )),
        ),
        SleekCircularSlider(
          min: 870,
          max: 1085,
          initialValue: pressure,
          appearance: CircularSliderAppearance(
            infoProperties: InfoProperties(
              bottomLabelText: "hPa",
              bottomLabelStyle: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
              mainLabelStyle: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300,
              ),
              modifier: (percentage) => "${percentage.round()}",
            ),
            size: 165,
            customColors: CustomSliderColors(
                trackColor: const Color.fromARGB(64, 0, 174, 255),
                progressBarColors: [
                  const Color.fromARGB(255, 68, 0, 255),
                  const Color.fromARGB(255, 0, 174, 255),
                  const Color.fromARGB(255, 0, 250, 250),
                ]),
          ),
        ),
      ]),
    );
  }

  Widget uvSlider() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          child: RichText(
              text: const TextSpan(
            text: "UV Index",
            style: TextStyle(
              fontSize: 23,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          )),
        ),
        SleekCircularSlider(
          min: 0,
          max: 11,
          initialValue: uv,
          appearance: CircularSliderAppearance(
            infoProperties: InfoProperties(
              mainLabelStyle: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300,
              ),
              modifier: (percentage) => "${percentage.round()}",
            ),
            size: 165,
            customColors: CustomSliderColors(
                trackColor: const Color.fromARGB(64, 0, 174, 255),
                progressBarColors: const [
                  Color.fromARGB(255, 162, 0, 255),
                  Color.fromARGB(255, 255, 30, 0),
                  Color.fromARGB(255, 250, 171, 0),
                  Color.fromARGB(255, 225, 250, 0),
                  Color.fromARGB(255, 0, 250, 0),
                ]),
          ),
        ),
      ]),
    );
  }
}
