// To parse this JSON data, do
//
//     final modelForgotPassword = modelForgotPasswordFromJson(jsonString);

import 'dart:convert';

ModelForgotPassword modelForgotPasswordFromJson(String str) =>
    ModelForgotPassword.fromJson(json.decode(str));

String modelForgotPasswordToJson(ModelForgotPassword data) =>
    json.encode(data.toJson());

class ModelForgotPassword {
  ModelForgotPassword({
    this.type,
    this.title,
    this.status,
    this.traceId,
  });

  String? type;
  String? title;
  int? status;
  String? traceId;

  factory ModelForgotPassword.fromJson(Map<String, dynamic> json) =>
      ModelForgotPassword(
        type: json["type"] == null ? null : json["type"],
        title: json["title"] == null ? null : json["title"],
        status: json["status"] == null ? null : json["status"],
        traceId: json["traceId"] == null ? null : json["traceId"],
      );

  Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "title": title == null ? null : title,
        "status": status == null ? null : status,
        "traceId": traceId == null ? null : traceId,
      };
}
