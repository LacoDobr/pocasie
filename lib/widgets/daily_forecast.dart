import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pocasie/model/weather/forecast.dart';

class DailyForecast extends StatelessWidget {
  final Forecast forecast;

  const DailyForecast({super.key, required this.forecast});

  String? getDay(final dateEpoch) {
    String? x;
    if (dateEpoch != null) {
      DateTime time = DateTime.fromMillisecondsSinceEpoch(dateEpoch * 1000);
      x = DateFormat('EEE').format(time);
    }
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color.fromARGB(120, 227, 227, 227),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(children: [
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(left: 10, bottom: 10),
          child: RichText(
              text: const TextSpan(
            text: "Next Days",
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          )),
        ),
        dailyList(),
      ]),
    );
  }

  Widget dailyList() {
    return SizedBox(
        height: 200,
        child: ListView.builder(
          itemCount: forecast.forecastday!.length > 7
              ? 7
              : forecast.forecastday?.length,
          itemBuilder: (context, index) {
            return Column(children: [
              Container(
                height: 1,
                color: const Color.fromARGB(20, 0, 0, 0),
              ),
              Container(
                height: 60,
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 80,
                        child: RichText(
                            text: TextSpan(
                          text: getDay(forecast.forecastday?[index].dateEpoch),
                          style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        )),
                      ),
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.asset(
                            "assets/weather/${forecast.forecastday?[index].day?.condition?.icon}"),
                      ),
                      RichText(
                          text: TextSpan(
                        text:
                            "${forecast.forecastday?[index].day?.maxtempC?.round()}° / ${forecast.forecastday?[index].day?.mintempC?.round()}°",
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      )),
                    ]),
              ),
            ]);
          },
        ));
  }
}
