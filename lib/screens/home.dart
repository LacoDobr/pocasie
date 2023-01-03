import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocasie/controller/global.dart';
import 'package:pocasie/widgets/current_weather.dart';
import 'package:pocasie/widgets/header.dart';

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
            : ListView(
                scrollDirection: Axis.vertical,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Header(),
                  CurrentWeather(
                    currentWeather:
                        globalController.getWeatherData().getCurrentWeather(),
                  ),
                ],
              )),
      ),
    );
  }
}
