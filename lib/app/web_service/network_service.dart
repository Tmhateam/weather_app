import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:weather/app/data/models/current_weather_model.dart';

class NetworkService {
  static final NetworkService _networkService = NetworkService._internal();
  Dio? _dio;

  factory NetworkService() {
    return _networkService;
  }

  Dio _initDio() {
    BaseOptions baseOptions = new BaseOptions(
      connectTimeout: 25000,
      receiveTimeout: 25000,
      responseType: ResponseType.json,
    );

    Dio dio = new Dio(baseOptions);

    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
        responseBody: true,
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        request: true,
      ));
    }

    return dio;
  }

  NetworkService._internal() {
    _dio = _initDio();
  }

  Future<VMCurrentWeather> apiGetCurrentWeather({required double lat, required double lon}) async {
    var body = {
      "lat": lat,
      "lon": lon,
      "appId": "34c9997efd0f86bd53a3e427dab24049",
      "units": "metric",
      "lang": "fa",
    };

    var response = await _dio!.get(
      "https://api.openweathermap.org/data/2.5/weather",
      queryParameters: body,
    );

    if (response.statusCode == 200) {
      VMCurrentWeather data = VMCurrentWeather.fromJson(response.data);
      return data;
    } else {
      print("Something's wrong!!!");
      return VMCurrentWeather();
    }
  }

  Future<dynamic> apiLogin({required String email, required String password}) async {
    var body = {"email": email, "password": password};
    var jsonBody = json.encode(body);
    var response = await _dio!.post("https://reqres.in/api/login", data: jsonBody);

    return response.data;
  }
}
