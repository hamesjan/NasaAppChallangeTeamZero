// To parse this JSON data, do
//
//     final enviroData = enviroDataFromJson(jsonString);

import 'dart:convert';

EnviroData enviroDataFromJson(String str) => EnviroData.fromJson(json.decode(str));

String enviroDataToJson(EnviroData data) => json.encode(data.toJson());

class EnviroData {
  EnviroData({
    this.lat,
    this.lon,
    this.temp,
    this.windSpeed,
    this.humidity,
    this.uvi,
    this.pressure,
    this.clouds,
    this.aqi,
    this.forecast,
  });

  double lat;
  double lon;
  double temp;
  double windSpeed;
  int humidity;
  double uvi;
  int pressure;
  int clouds;
  String aqi;
  String forecast;

  factory EnviroData.fromJson(Map<String, dynamic> json) => EnviroData(
    lat: json["lat"].toDouble(),
    lon: json["lon"].toDouble(),
    temp: json["temp"].toDouble(),
    windSpeed: json["wind_speed"].toDouble(),
    humidity: json["humidity"],
    uvi: json["uvi"].toDouble(),
    pressure: json["pressure"],
    clouds: json["clouds"],
    aqi: json["aqi"],
    forecast: json["forecast"],
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lon": lon,
    "temp": temp,
    "wind_speed": windSpeed,
    "humidity": humidity,
    "uvi": uvi,
    "pressure": pressure,
    "clouds": clouds,
    "aqi": aqi,
    "forecast": forecast,
  };
}
