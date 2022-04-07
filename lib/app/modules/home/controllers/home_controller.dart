import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/app/data/helpers/brain.dart';
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
    startApiLogin();
  }

  @override
  void onClose() {}

  updateCurrentWeather({required VMCurrentWeather currentWeather}) {
    this.currentWeather.update((val) {
      this.currentWeather.value = currentWeather;
    });
  }

  updateTheme() async {
    final prefs = await SharedPreferences.getInstance();

    if (Get.isDarkMode) {
      Get.changeTheme(ThemeData.light());
      await prefs.setString('THEME', 'LIGHT');
    } else {
      Get.changeTheme(ThemeData.dark());
      await prefs.setString('THEME', 'DARK');
    }

    update();
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
    await Brain.networkService.apiGetCurrentWeather(lat: lat, lon: lon).then((value) {
      updateCurrentWeather(currentWeather: value);
    });
  }

  startApiLogin() async {
    await Brain.networkService.apiLogin(email: "eve.holt@reqres.in", password: "cityslicka");
  }
}
