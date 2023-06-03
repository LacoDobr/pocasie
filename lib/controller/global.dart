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
    LocationPermission locationPermission =
        await Geolocator.requestPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      isLoading.value = false;
      return weatherData()
          .setErrorInfo('Location services are permanently denied');
    } else if (locationPermission == LocationPermission.denied) {
      isLoading.value = false;
      return weatherData().setErrorInfo('Location services are denied');
    }

    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    lattitude.value = position.latitude;
    longitude.value = position.longitude;

    var value = await FetchWeatherAPI()
        .processData(position.latitude, position.longitude);
    weatherData.value = value;
    isLoading.value = false;
  }
}
