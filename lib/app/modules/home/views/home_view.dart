import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/current_weather_model.dart';
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
          body: Obx(() {
            return Container(
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${(controller.currentWeather.value.main ?? VMMain()).temp ?? 0}"),
                  Text(
                      "${(controller.currentWeather.value.weather ?? []).isNotEmpty ? controller.currentWeather.value.weather!.first.description : ""}"),
                  SizedBox(
                    height: 24.0,
                  ),
                  SizedBox(
                    width: 160.0,
                    height: 50.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.blue,
                      child: InkWell(
                        onTap: () {
                          controller.updateTheme();
                        },
                        child: Center(
                          child: Text("Change theme"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        );
      },
    );
  }
}
