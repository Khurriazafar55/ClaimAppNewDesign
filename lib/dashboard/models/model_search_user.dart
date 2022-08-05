// To parse this JSON data, do
//
//     final modelSearchUser = modelSearchUserFromJson(jsonString);

import 'dart:convert';

ModelSearchUser modelSearchUserFromJson(String str) =>
    ModelSearchUser.fromJson(json.decode(str));

String modelSearchUserToJson(ModelSearchUser data) =>
    json.encode(data.toJson());

class ModelSearchUser {
  ModelSearchUser({
    required this.status,
    required this.message,
    this.user,
  });

  int status;
  String message;
  List<User>? user;

  factory ModelSearchUser.fromJson(Map<String, dynamic> json) =>
      ModelSearchUser(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        user: json["user"] == null
            ? null
            : List<User>.from(json["user"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "user": user == null
            ? null
            : List<dynamic>.from(user!.map((x) => x.toJson())),
      };
}

class User {
  User({
    required this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    required this.phoneNumber,
    this.avatar,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  dynamic name;
  dynamic email;
  dynamic emailVerifiedAt;
  String phoneNumber;
  dynamic avatar;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        avatar: json["avatar"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "avatar": avatar,
        "created_at": createdAt == null ? null : createdAt.toString(),
        "updated_at": updatedAt == null ? null : updatedAt.toString(),
      };
}
