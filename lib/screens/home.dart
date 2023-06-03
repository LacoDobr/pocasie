import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocasie/controller/global.dart';
import 'package:pocasie/widgets/current_weather.dart';
import 'package:pocasie/widgets/daily_forecast.dart';
import 'package:pocasie/widgets/error_alert.dart';
import 'package:pocasie/widgets/header.dart';
import 'package:pocasie/widgets/hourly_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => globalController.getLoading().isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : globalController.getWeatherData().getErrorInfo() != null
                ? Alerts(
                    errorInfo: globalController.getWeatherData().getErrorInfo(),
                  )
                : (ListView(scrollDirection: Axis.vertical, children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Header(),
                    CurrentWeather(
                      currentWeather:
                          globalController.getWeatherData().getCurrentWeather(),
                    ),
                    HourlyInfo(
                      hours: globalController.getWeatherData().getHourlyInfo(),
                    ),
                    DailyForecast(
                      forecast: globalController.getWeatherData().getForecast(),
                    ),
                  ]))),
      ),
    );
  }
}
