import 'package:flutter/material.dart';

class InfoTable extends StatelessWidget {
  final Map<String, String?> informations;

  const InfoTable({super.key, required this.informations});

  @override
  Widget build(BuildContext context) {
    List<String> keys = informations.keys.toList();
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color.fromARGB(120, 227, 227, 227),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: informations.length,
          itemBuilder: (context, index) {
            return customRow(keys[index], informations[keys[index]]);
          }),
    );
  }

  Widget customRow(String? text1, String? text2) {
    return Row(children: [
      RichText(
          text: TextSpan(
        text: text1,
        style: const TextStyle(
          fontSize: 20,
          color: Color.fromARGB(255, 122, 122, 122),
        ),
      )),
      const Spacer(),
      RichText(
          text: TextSpan(
        text: text2,
        style: const TextStyle(
          fontSize: 20,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      )),
    ]);
  }
}
