// To parse this JSON data, do
//
//     final modelLogin = modelLoginFromMap(jsonString);

import 'dart:convert';

ModelLogin modelLoginFromMap(String str) =>
    ModelLogin.fromMap(json.decode(str));

String modelLoginToMap(ModelLogin data) => json.encode(data.toMap());

class ModelLogin {
  ModelLogin({
    this.message,
    this.isSuccess,
    this.role,
    this.errors,
    this.expireDate,
  });

  String? message;
  bool? isSuccess;
  String? role;
  dynamic errors;
  DateTime? expireDate;

  factory ModelLogin.fromMap(Map<String, dynamic> json) => ModelLogin(
        message: json["message"] == null ? null : json["message"],
        isSuccess: json["isSuccess"] == null ? null : json["isSuccess"],
        role: json["role"] == null ? null : json["role"],
        errors: json["errors"],
        expireDate: json["expireDate"] == null
            ? null
            : DateTime.parse(json["expireDate"]),
      );

  Map<String, dynamic> toMap() => {
        "message": message == null ? null : message,
        "isSuccess": isSuccess == null ? null : isSuccess,
        "role": role == null ? null : role,
        "errors": errors,
        "expireDate": expireDate == null ? null : expireDate?.toIso8601String(),
      };
}
