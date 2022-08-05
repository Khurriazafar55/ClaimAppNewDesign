// To parse this JSON data, do
//
//     final modelService = modelServiceFromMap(jsonString);

import 'dart:convert';

ModelService modelServiceFromMap(String str) =>
    ModelService.fromMap(json.decode(str));

String modelServiceToMap(ModelService data) => json.encode(data.toMap());

class ModelService {
  ModelService({
    this.data,
    required this.status,
    required this.message,
  });

  List<DataServiceType>? data;
  int status;
  String message;

  factory ModelService.fromMap(Map<String, dynamic> json) => ModelService(
        status: 200,
        message: "",
        data: json["data"] == null
            ? null
            : List<DataServiceType>.from(
                json["data"].map((x) => DataServiceType.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class DataServiceType {
  DataServiceType({
    this.id,
    this.serviceName,
    this.price,
    this.team,
    this.createdBy,
    this.appUsersCreated,
    this.createdDate,
    this.modifiedBy,
    this.appUsersModified,
    this.modifiedDate,
    this.isActive,
  });

  int? id;
  String? serviceName;
  int? price;
  Team? team;
  String? createdBy;
  dynamic appUsersCreated;
  DateTime? createdDate;
  dynamic modifiedBy;
  dynamic appUsersModified;
  DateTime? modifiedDate;
  bool? isActive;

  factory DataServiceType.fromString(String json) => DataServiceType(
        id: jsonDecode(json)["id"] == null ? null : jsonDecode(json)["id"],
        serviceName: jsonDecode(json)["serviceName"] == null
            ? null
            : jsonDecode(json)["serviceName"],
        price: jsonDecode(json)["price"] == null
            ? null
            : jsonDecode(json)["price"],
        createdBy: jsonDecode(json)["createdBy"] == null
            ? null
            : jsonDecode(json)["createdBy"],
        appUsersCreated: jsonDecode(json)["appUsersCreated"] == null
            ? null
            : jsonDecode(json)["appUsersCreated"],
      );

  factory DataServiceType.fromMap(Map<String, dynamic> json) => DataServiceType(
        id: json["id"] == null ? null : json["id"],
        serviceName: json["service_name"] == null ? null : json["service_name"],
        price: json["price"] == null ? null : json["price"],
        team: json["team"] == null ? null : Team.fromMap(json["team"]),
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        appUsersCreated: json["app_Users_Created"],
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
        modifiedBy: json["modifiedBy"],
        appUsersModified: json["app_Users_Modified"],
        modifiedDate: json["modifiedDate"] == null
            ? null
            : DateTime.parse(json["modifiedDate"]),
        isActive: json["is_Active"] == null ? null : json["is_Active"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "service_name": serviceName == null ? null : serviceName,
        "price": price == null ? null : price,
        "team": team == null ? null : team?.toMap(),
        "createdBy": createdBy == null ? null : createdBy,
        "app_Users_Created": appUsersCreated,
        "createdDate":
            createdDate == null ? null : createdDate?.toIso8601String(),
        "modifiedBy": modifiedBy,
        "app_Users_Modified": appUsersModified,
        "modifiedDate":
            modifiedDate == null ? null : modifiedDate?.toIso8601String(),
        "is_Active": isActive == null ? null : isActive,
      };

  Map<String, dynamic> toMap2() => {
        "id": id == null ? null : id,
        "service_name": serviceName == null ? null : serviceName,
        "price": price == null ? null : price,
        "team": team == null ? null : jsonEncode(team?.toMap()),
        "createdBy": createdBy == null ? null : createdBy,
        "app_Users_Created": appUsersCreated,
        "createdDate":
            createdDate == null ? null : createdDate?.toIso8601String(),
        "modifiedBy": modifiedBy,
        "app_Users_Modified": appUsersModified,
        "modifiedDate":
            modifiedDate == null ? null : modifiedDate?.toIso8601String(),
        "is_Active": isActive == null ? null : isActive,
      };
}

class Team {
  Team({
    this.id,
    this.teamName,
    this.teamDescription,
    this.isActive,
    this.createdBy,
    this.createdDate,
  });

  int? id;
  String? teamName;
  String? teamDescription;
  bool? isActive;
  String? createdBy;
  DateTime? createdDate;

  factory Team.fromMap(Map<String, dynamic> json) => Team(
        id: json["id"] == null ? null : json["id"],
        teamName: json["teamName"] == null ? null : json["teamName"],
        teamDescription:
            json["teamDescription"] == null ? null : json["teamDescription"],
        isActive: json["isActive"] == null ? null : json["isActive"],
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "teamName": teamName == null ? null : teamName,
        "teamDescription": teamDescription == null ? null : teamDescription,
        "isActive": isActive == null ? null : isActive,
        "createdBy": createdBy == null ? null : createdBy,
        "createdDate":
            createdDate == null ? null : createdDate?.toIso8601String(),
      };
}
