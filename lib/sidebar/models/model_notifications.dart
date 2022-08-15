// To parse this JSON data, do
//
//     final modelNotifications = modelNotificationsFromMap(jsonString);

import 'dart:convert';

ModelNotifications modelNotificationsFromMap(String str) =>
    ModelNotifications.fromMap(json.decode(str));

String modelNotificationsToMap(ModelNotifications data) =>
    json.encode(data.toMap());

class ModelNotifications {
  ModelNotifications({
    this.data,
  });

  List<NotificationData>? data;

  factory ModelNotifications.fromMap(Map<String, dynamic> json) =>
      ModelNotifications(
        data: json["data"] == null
            ? null
            : List<NotificationData>.from(
                json["data"].map((x) => NotificationData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class NotificationData {
  NotificationData({
    this.id,
    this.title,
    this.description,
    this.createdDate,
    this.notificationFor,
    this.notificationCreatedBy,
  });

  int? id;
  String? title;
  String? description;
  DateTime? createdDate;
  String? notificationFor;
  String? notificationCreatedBy;

  factory NotificationData.fromMap(Map<String, dynamic> json) =>
      NotificationData(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
        notificationFor:
            json["notificationFor"] == null ? null : json["notificationFor"],
        notificationCreatedBy: json["notificationCreatedBy"] == null
            ? null
            : json["notificationCreatedBy"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "createdDate":
            createdDate == null ? null : createdDate?.toIso8601String(),
        "notificationFor": notificationFor == null ? null : notificationFor,
        "notificationCreatedBy":
            notificationCreatedBy == null ? null : notificationCreatedBy,
      };
}
