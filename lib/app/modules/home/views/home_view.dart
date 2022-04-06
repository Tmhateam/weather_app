import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/app/data/models/current_weather_model.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Weather App",
            ),
            centerTitle: true,
          ),
          body: Container(
            width: Get.width,
            child: Obx(() {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${(controller.currentWeather.value.main ?? VMMain()).temp}"),
                  Text("${(controller.currentWeather.value.weather ?? []).first.description}"),
                ],
              );
            }),
          ),
        );
      },
    );
  }
}
