import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather/app/data/models/current_weather_model.dart';

class HomeController extends GetxController {
  final currentWeather = VMCurrentWeather().obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    waitForLocation();
  }

  @override
  void onClose() {}

  updateCurrentWeather({required VMCurrentWeather currentWeather}) {
    this.currentWeather.update((val) {
      this.currentWeather.value = currentWeather;
    });
  }

  Future<Position?> getLocationData() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  waitForLocation() async {
    await getLocationData().then((value) {
      startGetWeather(lat: value?.latitude ?? 0.0, lon: value?.longitude ?? 0.0);
    });
  }

  startGetWeather({required double lat, required double lon}) async {
    var response = await Dio().get(
      "https://api.openweathermap.org/data/2.5/weather",
      queryParameters: {
        "lat": 37.530671,
        "lon": 49.563382,
        "appId": "34c9997efd0f86bd53a3e427dab24049",
        "units": "metric",
        "lang": "fa",
      },
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));

      VMCurrentWeather data = VMCurrentWeather.fromJson(response.data);

      print((data.main ?? VMMain()).temp);

      updateCurrentWeather(currentWeather: data);
    } else {
      print("Something's wrong!!!");
    }
  }
}
