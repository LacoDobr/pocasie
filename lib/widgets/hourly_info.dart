import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pocasie/model/weather/hour.dart';

class HourlyInfo extends StatelessWidget {
  final List<Hour> hours;

  const HourlyInfo({super.key, required this.hours});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      today(),
      hourlyList(),
    ]);
  }

  Widget today() {
    return RichText(
        text: const TextSpan(
      text: "Today",
      style: TextStyle(
        fontSize: 20,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
    ));
  }

  Widget hourlyList() {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(120, 227, 227, 227),
      ),
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hours.length > 24 ? 24 : hours.length,
        itemBuilder: (context, index) {
          return Container(
            width: 82,
            margin: const EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 180, 238, 255),
                  Color.fromARGB(255, 227, 247, 253)
                ])),
            child: HourlyDetails(
                timeEpoch: hours[index].timeEpoch,
                icon: hours[index].condition?.icon,
                temp: hours[index].tempC?.round(),
                chanceOfRain: hours[index].chanceOfRain),
          );
        },
      ),
    );
  }
}

class HourlyDetails extends StatelessWidget {
  int? timeEpoch;
  String? icon;
  int? temp;
  int? chanceOfRain;
  HourlyDetails({
    super.key,
    required this.timeEpoch,
    required this.icon,
    required this.temp,
    required this.chanceOfRain,
  });

  String? getTime(final timeEpoch) {
    String? x;
    if (timeEpoch != null) {
      DateTime time = DateTime.fromMillisecondsSinceEpoch(timeEpoch * 1000);
      x = DateFormat.Hm().format(time);
    }
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Container(
        margin: const EdgeInsets.only(top: 10),
        child: RichText(
            text: TextSpan(
          text: getTime(timeEpoch),
          style: const TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        )),
      ),
      Container(
          margin: const EdgeInsets.all(10),
          child: Image.asset("assets/weather/$icon", height: 50, width: 50)),
      Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Text("$temp°"),
      ),
      Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Icon(
            Icons.water_drop,
            size: 17,
            color: Color.fromARGB(255, 0, 72, 255),
          ),
          RichText(
              text: TextSpan(
            text: "$chanceOfRain%",
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 72, 255),
            ),
          )),
        ]),
      ),
    ]);
  }
}
