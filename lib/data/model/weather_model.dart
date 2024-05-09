// To parse this JSON data, do
//
//     final weatherModel = weatherModelFromJson(jsonString);

// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

WeatherModel weatherModelFromJson(String str) =>
    WeatherModel.fromJson(json.decode(str) as Map<String, dynamic>);

String weatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
  WeatherModel({
    required this.location,
    required this.current,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        location: Location.fromJson(json['location'] as Map<String, dynamic>),
        current: Current.fromJson(json['current'] as Map<String, dynamic>),
      );
  Location location;
  Current current;

  Map<String, dynamic> toJson() => {
        'location': location.toJson(),
        'current': current.toJson(),
      };
}

class Current {
  Current({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        lastUpdatedEpoch: json['last_updated_epoch'] as int,
        lastUpdated: json['last_updated'] as String,
        tempC: json['temp_c']?.toDouble() as double,
        tempF: json['temp_f']?.toDouble() as double,
        isDay: json['is_day'] as int,
        condition:
            Condition.fromJson(json['condition'] as Map<String, dynamic>),
        windMph: json['wind_mph']?.toDouble() as double,
        windKph: json['wind_kph']?.toDouble() as double,
        windDegree: json['wind_degree'] as int,
        windDir: json['wind_dir'] as String,
        pressureMb: json['pressure_mb'] as int,
        pressureIn: json['pressure_in']?.toDouble() as double,
        precipMm: json['precip_mm'] as int,
        precipIn: json['precip_in'] as int,
        humidity: json['humidity'] as int,
        cloud: json['cloud'] as int,
        feelslikeC: json['feelslike_c']?.toDouble() as double,
        feelslikeF: json['feelslike_f'] as int,
        visKm: json['vis_km'] as int,
        visMiles: json['vis_miles'] as int,
        uv: json['uv'] as int,
        gustMph: json['gust_mph'] as int,
        gustKph: json['gust_kph']?.toDouble() as double,
      );
  int lastUpdatedEpoch;
  String lastUpdated;
  double tempC;
  double tempF;
  int isDay;
  Condition condition;
  double windMph;
  double windKph;
  int windDegree;
  String windDir;
  int pressureMb;
  double pressureIn;
  int precipMm;
  int precipIn;
  int humidity;
  int cloud;
  double feelslikeC;
  int feelslikeF;
  int visKm;
  int visMiles;
  int uv;
  int gustMph;
  double gustKph;

  Map<String, dynamic> toJson() => {
        'last_updated_epoch': lastUpdatedEpoch,
        'last_updated': lastUpdated,
        'temp_c': tempC,
        'temp_f': tempF,
        'is_day': isDay,
        'condition': condition.toJson(),
        'wind_mph': windMph,
        'wind_kph': windKph,
        'wind_degree': windDegree,
        'wind_dir': windDir,
        'pressure_mb': pressureMb,
        'pressure_in': pressureIn,
        'precip_mm': precipMm,
        'precip_in': precipIn,
        'humidity': humidity,
        'cloud': cloud,
        'feelslike_c': feelslikeC,
        'feelslike_f': feelslikeF,
        'vis_km': visKm,
        'vis_miles': visMiles,
        'uv': uv,
        'gust_mph': gustMph,
        'gust_kph': gustKph,
      };
}

class Condition {
  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json['text'] as String,
        icon: json['icon'] as String,
        code: json['code'] as int,
      );
  String text;
  String icon;
  int code;

  Map<String, dynamic> toJson() => {
        'text': text,
        'icon': icon,
        'code': code,
      };
}

class Location {
  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json['name'] as String,
        region: json['region'] as String,
        country: json['country'] as String,
        lat: json['lat']?.toDouble() as double,
        lon: json['lon']?.toDouble() as double,
        tzId: json['tz_id'] as String,
        localtimeEpoch: json['localtime_epoch'] as int,
        localtime: json['localtime'] as String,
      );
  String name;
  String region;
  String country;
  double lat;
  double lon;
  String tzId;
  int localtimeEpoch;
  String localtime;

  Map<String, dynamic> toJson() => {
        'name': name,
        'region': region,
        'country': country,
        'lat': lat,
        'lon': lon,
        'tz_id': tzId,
        'localtime_epoch': localtimeEpoch,
        'localtime': localtime,
      };
}
