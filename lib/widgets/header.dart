import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';
import 'package:pocasie/controller/global.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  String city = "--";

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    getCity(globalController.getLattitude().value,
        globalController.getLongitude().value);
    super.initState();
  }

  getCity(latitude, longitude) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(latitude, longitude);
    Placemark place = placemark[0];

    setState(() {
      if (place.locality == "") {
        city = place.subLocality!;
      } else {
        city = place.locality!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Text(
          city,
          style: const TextStyle(fontSize: 40, height: 2),
        ),
      ),
    ]);
  }
}
