// To parse this JSON data, do
//
//     final modelAllDropdown = modelAllDropdownFromJson(jsonString);

import 'dart:convert';

ModelAllDropdown modelAllDropdownFromJson(String str) =>
    ModelAllDropdown.fromJson(json.decode(str));

String modelAllDropdownToJson(ModelAllDropdown data) =>
    json.encode(data.toJson());

class ModelAllDropdown {
  ModelAllDropdown({
    this.data,
    required this.status,
    required this.message,
  });

  List<DataAllDropDown>? data;
  int status;
  String message;

  factory ModelAllDropdown.fromJson(Map<String, dynamic> json) =>
      ModelAllDropdown(
        status: 200,
        message: "",
        data: json["data"] == null
            ? null
            : List<DataAllDropDown>.from(
                json["data"].map((x) => DataAllDropDown.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DataAllDropDown {
  DataAllDropDown({
    this.id,
    this.key,
    this.value,
    this.dropDown,
    this.isActive,
    this.createdBy,
    this.createdDate,
  });

  int? id;
  String? key;
  String? value;
  String? dropDown;
  bool? isActive;
  String? createdBy;
  DateTime? createdDate;

  factory DataAllDropDown.fromString(String json) => DataAllDropDown(
        id: jsonDecode(json)["id"] == null ? null : jsonDecode(json)["id"],
        key: jsonDecode(json)["key"] == null ? null : jsonDecode(json)["key"],
        value: jsonDecode(json)["value"] == null
            ? null
            : jsonDecode(json)["value"],
        dropDown: jsonDecode(json)["dropDown"] == null
            ? null
            : jsonDecode(json)["dropDown"],
        isActive: jsonDecode(json)["isActive"] == null
            ? null
            : jsonDecode(json)["isActive"],
        createdBy: jsonDecode(json)["createdBy"] == null
            ? null
            : jsonDecode(json)["createdBy"],
        createdDate: jsonDecode(json)["createdDate"] == null
            ? null
            : DateTime.parse(jsonDecode(json)["createdDate"]),
      );

  factory DataAllDropDown.fromJson(Map<String, dynamic> json) =>
      DataAllDropDown(
        id: json["id"] == null ? null : json["id"],
        key: json["key"] == null ? null : json["key"],
        value: json["value"] == null ? "" : json["value"],
        dropDown: json["dropDown"] == null ? null : json["dropDown"],
        isActive: json["isActive"] == null ? null : json["isActive"],
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "key": key == null ? null : key,
        "value": value == null ? null : value,
        "dropDown": dropDown == null ? null : dropDown,
        "isActive": isActive == null ? null : isActive,
        "createdBy": createdBy == null ? null : createdBy,
        "createdDate":
            createdDate == null ? null : createdDate?.toIso8601String(),
      };
}
