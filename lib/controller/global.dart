import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:pocasie/api/fetch.dart';
import 'package:pocasie/model/weather/weather.dart';

class GlobalController extends GetxController {
  final RxBool isLoading = true.obs;
  final RxDouble lattitude = 0.0.obs;
  final RxDouble longitude = 0.0.obs;

  RxBool getLoading() => isLoading;
  RxDouble getLattitude() => lattitude;
  RxDouble getLongitude() => longitude;

  final weatherData = Weather().obs;

  Weather getWeatherData() {
    return weatherData.value;
  }

  @override
  void onInit() {
    if (isLoading.isTrue) {
      getLocation();
    }
    super.onInit();
  }

  getLocation() async {
    bool isEnabled;
    LocationPermission locationPermission;

    isEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isEnabled) {
      return Future.error("Lokalizacne sluzby su vypnute");
    }

    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Lokalizacne sluzby su zamietnute navzdy");
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();

      if (locationPermission == LocationPermission.denied) {
        return Future.error("Lokalizacne sluzby su zamietnute");
      }
    }

    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      lattitude.value = value.latitude;
      longitude.value = value.longitude;

      return FetchWeatherAPI()
          .processData(value.latitude, value.longitude)
          .then((value) {
        weatherData.value = value;
        isLoading.value = false;
      });
    });
  }
}
