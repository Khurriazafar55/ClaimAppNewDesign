// To parse this JSON data, do
//
//     final modelCamera = modelCameraFromMap(jsonString);

import 'dart:convert';

ModelCamera modelCameraFromMap(String str) =>
    ModelCamera.fromMap(json.decode(str));

String modelCameraToMap(ModelCamera data) => json.encode(data.toMap());

class ModelCamera {
  ModelCamera({
    this.dataCamera,
    required this.message,
    required this.status,
  });

  DataCamera? dataCamera;
  String message;
  int status;

  factory ModelCamera.fromMap(Map<String, dynamic> json) => ModelCamera(
        message: "",
        status: 200,
        dataCamera:
            json["data"] == null ? null : DataCamera.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": dataCamera == null ? null : dataCamera?.toMap(),
      };
}

class DataCamera {
  DataCamera({
    this.id,
    this.damageType,
    this.cameraType,
    this.claimId,
    this.reportId,
    this.macro,
    this.damageName,
    this.structureType,
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
  String? damageType;
  String? cameraType;
  int? claimId;
  int? reportId;
  String? macro;
  String? damageName;
  String? structureType;
  Team? team;
  String? createdBy;
  dynamic appUsersCreated;
  DateTime? createdDate;
  dynamic modifiedBy;
  dynamic appUsersModified;
  DateTime? modifiedDate;
  bool? isActive;

  factory DataCamera.fromMap(Map<String, dynamic> json) => DataCamera(
        id: json["id"] == null ? null : json["id"],
        damageType: json["damageType"] == null ? null : json["damageType"],
        cameraType: json["camera_Type"] == null ? null : json["camera_Type"],
        claimId: json["claimId"] == null ? null : json["claimId"],
        reportId: json["reportId"] == null ? null : json["reportId"],
        macro: json["macro"] == null ? null : json["macro"],
        damageName: json["damage_Name"] == null ? null : json["damage_Name"],
        structureType:
            json["structure_Type"] == null ? null : json["structure_Type"],
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
        "damageType": damageType == null ? null : damageType,
        "camera_Type": cameraType == null ? null : cameraType,
        "claimId": claimId == null ? null : claimId,
        "reportId": reportId == null ? null : reportId,
        "macro": macro == null ? null : macro,
        "damage_Name": damageName == null ? null : damageName,
        "structure_Type": structureType == null ? null : structureType,
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
