// To parse this JSON data, do
//
//     final modelWeather = modelWeatherFromJson(jsonString);

import 'dart:convert';

List<ModelWeather> modelWeatherFromJson(String str) => List<ModelWeather>.from(
    json.decode(str).map((x) => ModelWeather.fromJson(x)));

String modelWeatherToJson(List<ModelWeather> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelWeather {
  ModelWeather({
    this.date,
    this.temperatureC,
    this.temperatureF,
    this.summary,
  });

  DateTime? date;
  int? temperatureC;
  int? temperatureF;
  String? summary;

  factory ModelWeather.fromJson(Map<String, dynamic> json) => ModelWeather(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        temperatureC:
            json["temperatureC"] == null ? null : json["temperatureC"],
        temperatureF:
            json["temperatureF"] == null ? null : json["temperatureF"],
        summary: json["summary"] == null ? null : json["summary"],
      );

  Map<String, dynamic> toJson() => {
        "date": date == null ? null : date!.toIso8601String(),
        "temperatureC": temperatureC == null ? null : temperatureC,
        "temperatureF": temperatureF == null ? null : temperatureF,
        "summary": summary == null ? null : summary,
      };
}
