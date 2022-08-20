// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ModelWeather {
  String date;
  int temperatureC;
  int temperatureF;
  String summary;
  ModelWeather({
    required this.date,
    required this.temperatureC,
    required this.temperatureF,
    required this.summary,
  });

  ModelWeather copyWith({
    String? date,
    int? temperatureC,
    int? temperatureF,
    String? summary,
  }) {
    return ModelWeather(
      date: date ?? this.date,
      temperatureC: temperatureC ?? this.temperatureC,
      temperatureF: temperatureF ?? this.temperatureF,
      summary: summary ?? this.summary,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'temperatureC': temperatureC,
      'temperatureF': temperatureF,
      'summary': summary,
    };
  }

  factory ModelWeather.fromMap(Map<String, dynamic> map) {
    return ModelWeather(
      date: map['date'] as String,
      temperatureC: map['temperatureC'] as int,
      temperatureF: map['temperatureF'] as int,
      summary: map['summary'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelWeather.fromJson(String source) =>
      ModelWeather.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ModelWeather(date: $date, temperatureC: $temperatureC, temperatureF: $temperatureF, summary: $summary)';
  }

  @override
  bool operator ==(covariant ModelWeather other) {
    if (identical(this, other)) return true;

    return other.date == date &&
        other.temperatureC == temperatureC &&
        other.temperatureF == temperatureF &&
        other.summary == summary;
  }

  @override
  int get hashCode {
    return date.hashCode ^
        temperatureC.hashCode ^
        temperatureF.hashCode ^
        summary.hashCode;
  }
}
