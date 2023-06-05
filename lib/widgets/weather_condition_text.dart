import 'package:flutter/material.dart';

class WeatherConditionText extends StatelessWidget {
  final String? text;
  final Color color;

  const WeatherConditionText(
      {super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
      text: "$text",
      style: TextStyle(
        fontSize: 23,
        color: color,
      ),
    ));
  }
}
