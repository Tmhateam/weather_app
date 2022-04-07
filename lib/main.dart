import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/app/data/helpers/brain.dart';
import 'package:weather/app/web_service/network_service.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  Brain.networkService = NetworkService();

  final prefs = await SharedPreferences.getInstance();

  final String? theme = prefs.getString('THEME');

  if (theme == "DARK") {
    Brain.theme = "dark";
  } else {
    Brain.theme = "light";
  }

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: Brain.theme == "dark" ? ThemeData.dark() : ThemeData.light(),
    ),
  );
}
