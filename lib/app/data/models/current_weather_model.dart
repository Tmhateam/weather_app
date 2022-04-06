import 'package:json_annotation/json_annotation.dart';

part 'current_weather_model.g.dart';

@JsonSerializable()
class VMCurrentWeather {
  VMCoord? coord;
  List<VMWeather>? weather;
  String? base;
  VMMain? main;
  int? visibility;
  VMWind? wind;
  VMCloud? clouds;
  int? dt;
  VMSys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  VMCurrentWeather(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  factory VMCurrentWeather.fromJson(Map<String, dynamic> json) => _$VMCurrentWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$VMCurrentWeatherToJson(this);
}

@JsonSerializable()
class VMCoord {
  double? lon;
  double? lat;

  VMCoord({this.lon, this.lat});

  factory VMCoord.fromJson(Map<String, dynamic> json) => _$VMCoordFromJson(json);

  Map<String, dynamic> toJson() => _$VMCoordToJson(this);
}

@JsonSerializable()
class VMWeather {
  int? id;
  String? main;
  String? description;
  String? icon;

  VMWeather({this.id, this.main, this.description, this.icon});

  factory VMWeather.fromJson(Map<String, dynamic> json) => _$VMWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$VMWeatherToJson(this);
}

@JsonSerializable()
class VMMain {
  double? temp;
  double? feels_like;
  double? temp_min;
  double? temp_max;
  double? pressure;
  double? humidity;
  double? sea_level;
  double? grnd_level;

  VMMain(
      {this.temp,
      this.feels_like,
      this.temp_min,
      this.temp_max,
      this.pressure,
      this.humidity,
      this.sea_level,
      this.grnd_level});

  factory VMMain.fromJson(Map<String, dynamic> json) => _$VMMainFromJson(json);

  Map<String, dynamic> toJson() => _$VMMainToJson(this);
}

@JsonSerializable()
class VMWind {
  double? speed;
  double? deg;
  double? gust;

  VMWind({this.speed, this.deg, this.gust});

  factory VMWind.fromJson(Map<String, dynamic> json) => _$VMWindFromJson(json);

  Map<String, dynamic> toJson() => _$VMWindToJson(this);
}

@JsonSerializable()
class VMCloud {
  int? all;

  VMCloud({this.all});

  factory VMCloud.fromJson(Map<String, dynamic> json) => _$VMCloudFromJson(json);

  Map<String, dynamic> toJson() => _$VMCloudToJson(this);
}

@JsonSerializable()
class VMSys {
  String? country;
  int? sunrise;
  int? sunset;

  VMSys({this.country, this.sunrise, this.sunset});

  factory VMSys.fromJson(Map<String, dynamic> json) => _$VMSysFromJson(json);

  Map<String, dynamic> toJson() => _$VMSysToJson(this);
}
