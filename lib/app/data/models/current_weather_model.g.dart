// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VMCurrentWeather _$VMCurrentWeatherFromJson(Map<String, dynamic> json) =>
    VMCurrentWeather(
      coord: json['coord'] == null
          ? null
          : VMCoord.fromJson(json['coord'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => VMWeather.fromJson(e as Map<String, dynamic>))
          .toList(),
      base: json['base'] as String?,
      main: json['main'] == null
          ? null
          : VMMain.fromJson(json['main'] as Map<String, dynamic>),
      visibility: json['visibility'] as int?,
      wind: json['wind'] == null
          ? null
          : VMWind.fromJson(json['wind'] as Map<String, dynamic>),
      clouds: json['clouds'] == null
          ? null
          : VMCloud.fromJson(json['clouds'] as Map<String, dynamic>),
      dt: json['dt'] as int?,
      sys: json['sys'] == null
          ? null
          : VMSys.fromJson(json['sys'] as Map<String, dynamic>),
      timezone: json['timezone'] as int?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      cod: json['cod'] as int?,
    );

Map<String, dynamic> _$VMCurrentWeatherToJson(VMCurrentWeather instance) =>
    <String, dynamic>{
      'coord': instance.coord,
      'weather': instance.weather,
      'base': instance.base,
      'main': instance.main,
      'visibility': instance.visibility,
      'wind': instance.wind,
      'clouds': instance.clouds,
      'dt': instance.dt,
      'sys': instance.sys,
      'timezone': instance.timezone,
      'id': instance.id,
      'name': instance.name,
      'cod': instance.cod,
    };

VMCoord _$VMCoordFromJson(Map<String, dynamic> json) => VMCoord(
      lon: (json['lon'] as num?)?.toDouble(),
      lat: (json['lat'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$VMCoordToJson(VMCoord instance) => <String, dynamic>{
      'lon': instance.lon,
      'lat': instance.lat,
    };

VMWeather _$VMWeatherFromJson(Map<String, dynamic> json) => VMWeather(
      id: json['id'] as int?,
      main: json['main'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$VMWeatherToJson(VMWeather instance) => <String, dynamic>{
      'id': instance.id,
      'main': instance.main,
      'description': instance.description,
      'icon': instance.icon,
    };

VMMain _$VMMainFromJson(Map<String, dynamic> json) => VMMain(
      temp: (json['temp'] as num?)?.toDouble(),
      feels_like: (json['feels_like'] as num?)?.toDouble(),
      temp_min: (json['temp_min'] as num?)?.toDouble(),
      temp_max: (json['temp_max'] as num?)?.toDouble(),
      pressure: (json['pressure'] as num?)?.toDouble(),
      humidity: (json['humidity'] as num?)?.toDouble(),
      sea_level: (json['sea_level'] as num?)?.toDouble(),
      grnd_level: (json['grnd_level'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$VMMainToJson(VMMain instance) => <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feels_like,
      'temp_min': instance.temp_min,
      'temp_max': instance.temp_max,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'sea_level': instance.sea_level,
      'grnd_level': instance.grnd_level,
    };

VMWind _$VMWindFromJson(Map<String, dynamic> json) => VMWind(
      speed: (json['speed'] as num?)?.toDouble(),
      deg: (json['deg'] as num?)?.toDouble(),
      gust: (json['gust'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$VMWindToJson(VMWind instance) => <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
      'gust': instance.gust,
    };

VMCloud _$VMCloudFromJson(Map<String, dynamic> json) => VMCloud(
      all: json['all'] as int?,
    );

Map<String, dynamic> _$VMCloudToJson(VMCloud instance) => <String, dynamic>{
      'all': instance.all,
    };

VMSys _$VMSysFromJson(Map<String, dynamic> json) => VMSys(
      country: json['country'] as String?,
      sunrise: json['sunrise'] as int?,
      sunset: json['sunset'] as int?,
    );

Map<String, dynamic> _$VMSysToJson(VMSys instance) => <String, dynamic>{
      'country': instance.country,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };
