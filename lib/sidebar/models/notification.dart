import 'dart:convert';

ModelNotifications getSubwaysFromJson(String str) =>
    ModelNotifications.fromJson(json.decode(str));

String getSubwaysToJson(ModelNotifications data) => json.encode(data.toJson());

class ModelNotifications {
  ModelNotifications({
    this.data,
  });
  List<NotificationData>? data;
  factory ModelNotifications.fromJson(Map<String, dynamic> json) =>
      ModelNotifications(
        data: List<NotificationData>.from(
            json["Data"].map((x) => NotificationData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Data": List<dynamic>.from(data!.map((x) => x.toJson())),
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

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      NotificationData(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        createdDate: DateTime.parse(json["createdDate"]),
        notificationFor: json[" notificationFor"],
        notificationCreatedBy: json["notificationCreatedBy"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "notificationFor": notificationFor,
        "notificationCreatedBy": notificationCreatedBy,
      };
}
