/*
// To parse this JSON data, do
//
//     final modelDoReport = modelDoReportFromMap(jsonString);

import 'dart:convert';

ModelDoReport modelDoReportFromMap(String str) =>
    ModelDoReport.fromMap(json.decode(str));

String modelDoReportToMap(ModelDoReport data) => json.encode(data.toMap());

class ModelDoReport {
  ModelDoReport({
    this.data,
  });

  DataDoReport? data;

  factory ModelDoReport.fromMap(Map<String, dynamic> json) => ModelDoReport(
        data: json["data"] == null ? null : DataDoReport.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data == null ? null : data?.toMap(),
      };
}

class DataDoReport {
  DataDoReport({
    this.id,
    this.claimId,
    this.inspectorId,
    this.assignId,
    this.claimPersonName,
    this.roofType,
    this.roofAge,
    this.roofStyleType,
    this.layer,
    this.edgeMetalType,
    this.pitchType,
    this.homeowner,
    this.homeName,
    this.mortagee,
    this.differentClaimant,
    this.contractor,
    this.noneWerePresento,
    this.isFeltPresentCheck,
    this.whattype,
    this.isIceWaterShieldPresent,
    this.contractorsName,
    this.mortgageeName,
    this.differentClaimantName,
    this.inspectionDate,
    this.inspectionTime,
    this.dateofLoss,
    this.dwelling,
    this.dwellingMaterial,
    this.dwellingType,
    this.stories,
    this.garage,
    this.note,
    this.remarks,
    this.attached,
    this.garageMaterial,
    this.roofInformation,
    this.roofSumary,
    this.roofComponents,
    this.forontElevationSumary,
    this.leftElevationSumary,
    this.backElevationSumary,
    this.rightElevationSumary,
    this.interiorSumary,
    this.publicNotes,
    this.privateNotes,
    this.workProformed,
    this.reportStatus,
    this.isActive,
    this.createdBy,
    this.createdDate,
  });

  int? id;
  int? claimId;
  String? inspectorId;
  int? assignId;
  String? claimPersonName;
  dynamic roofType;
  int? roofAge;
  dynamic roofStyleType;
  int? layer;
  dynamic edgeMetalType;
  dynamic pitchType;
  bool? homeowner;
  String? homeName;
  bool? mortagee;
  bool? differentClaimant;
  bool? contractor;
  bool? noneWerePresento;
  bool? isFeltPresentCheck;
  int? whattype;
  bool? isIceWaterShieldPresent;
  String? contractorsName;
  String? mortgageeName;
  String? differentClaimantName;
  DateTime? inspectionDate;
  DateTime? inspectionTime;
  DateTime? dateofLoss;
  dynamic dwelling;
  dynamic dwellingMaterial;
  dynamic dwellingType;
  int? stories;
  int? garage;
  String? note;
  String? remarks;
  bool? attached;
  dynamic garageMaterial;
  String? roofInformation;
  String? roofSumary;
  String? roofComponents;
  String? forontElevationSumary;
  String? leftElevationSumary;
  String? backElevationSumary;
  String? rightElevationSumary;
  String? interiorSumary;
  String? publicNotes;
  String? privateNotes;
  String? workProformed;
  String? reportStatus;
  bool? isActive;
  String? createdBy;
  DateTime? createdDate;

  factory DataDoReport.fromMap(Map<String, dynamic> json) => DataDoReport(
        id: json["id"] == null ? null : json["id"],
        claimId: json["claimId"] == null ? null : json["claimId"],
        inspectorId: json["inspectorID"] == null ? null : json["inspectorID"],
        assignId: json["assignId"] == null ? null : json["assignId"],
        claimPersonName:
            json["claimPersonName"] == null ? null : json["claimPersonName"],
        roofType: json["roof_Type"],
        roofAge: json["roofAge"] == null ? null : json["roofAge"],
        roofStyleType: json["roofStyle_Type"],
        layer: json["layer"] == null ? null : json["layer"],
        edgeMetalType: json["edgeMetal_Type"],
        pitchType: json["pitch_Type"],
        homeowner: json["homeowner"] == null ? null : json["homeowner"],
        homeName: json["homeName"] == null ? null : json["homeName"],
        mortagee: json["mortagee"] == null ? null : json["mortagee"],
        differentClaimant: json["differentClaimant"] == null
            ? null
            : json["differentClaimant"],
        contractor: json["contractor"] == null ? null : json["contractor"],
        noneWerePresento:
            json["noneWerePresento"] == null ? null : json["noneWerePresento"],
        isFeltPresentCheck: json["isFeltPresentCheck"] == null
            ? null
            : json["isFeltPresentCheck"],
        whattype: json["whattype"] == null ? null : json["whattype"],
        isIceWaterShieldPresent: json["isIceWaterShieldPresent"] == null
            ? null
            : json["isIceWaterShieldPresent"],
        contractorsName:
            json["contractorsName"] == null ? null : json["contractorsName"],
        mortgageeName:
            json["mortgageeName"] == null ? null : json["mortgageeName"],
        differentClaimantName: json["differentClaimantName"] == null
            ? null
            : json["differentClaimantName"],
        inspectionDate: json["inspection_Date"] == null
            ? null
            : DateTime.parse(json["inspection_Date"]),
        inspectionTime: json["inspection_Time"] == null
            ? null
            : DateTime.parse(json["inspection_Time"]),
        dateofLoss: json["dateofLoss"] == null
            ? null
            : DateTime.parse(json["dateofLoss"]),
        dwelling: json["dwelling"],
        dwellingMaterial: json["dwellingMaterial"],
        dwellingType: json["dwellingType"],
        stories: json["stories"] == null ? null : json["stories"],
        garage: json["garage"] == null ? null : json["garage"],
        note: json["note"] == null ? null : json["note"],
        remarks: json["remarks"] == null ? null : json["remarks"],
        attached: json["attached"] == null ? null : json["attached"],
        garageMaterial: json["garageMaterial"],
        roofInformation:
            json["roofInformation"] == null ? null : json["roofInformation"],
        roofSumary: json["roofSumary"] == null ? null : json["roofSumary"],
        roofComponents:
            json["roofComponents"] == null ? null : json["roofComponents"],
        forontElevationSumary: json["forontElevationSumary"] == null
            ? null
            : json["forontElevationSumary"],
        leftElevationSumary: json["leftElevationSumary"] == null
            ? null
            : json["leftElevationSumary"],
        backElevationSumary: json["backElevationSumary"] == null
            ? null
            : json["backElevationSumary"],
        rightElevationSumary: json["rightElevationSumary"] == null
            ? null
            : json["rightElevationSumary"],
        interiorSumary:
            json["interiorSumary"] == null ? null : json["interiorSumary"],
        publicNotes: json["publicNotes"] == null ? null : json["publicNotes"],
        privateNotes:
            json["privateNotes"] == null ? null : json["privateNotes"],
        workProformed:
            json["workProformed"] == null ? null : json["workProformed"],
        reportStatus:
            json["reportStatus"] == null ? null : json["reportStatus"],
        isActive: json["isActive"] == null ? null : json["isActive"],
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "claimId": claimId == null ? null : claimId,
        "inspectorID": inspectorId == null ? null : inspectorId,
        "assignId": assignId == null ? null : assignId,
        "claimPersonName": claimPersonName == null ? null : claimPersonName,
        "roof_Type": roofType,
        "roofAge": roofAge == null ? null : roofAge,
        "roofStyle_Type": roofStyleType,
        "layer": layer == null ? null : layer,
        "edgeMetal_Type": edgeMetalType,
        "pitch_Type": pitchType,
        "homeowner": homeowner == null ? null : homeowner,
        "homeName": homeName == null ? null : homeName,
        "mortagee": mortagee == null ? null : mortagee,
        "differentClaimant":
            differentClaimant == null ? null : differentClaimant,
        "contractor": contractor == null ? null : contractor,
        "noneWerePresento": noneWerePresento == null ? null : noneWerePresento,
        "isFeltPresentCheck":
            isFeltPresentCheck == null ? null : isFeltPresentCheck,
        "whattype": whattype == null ? null : whattype,
        "isIceWaterShieldPresent":
            isIceWaterShieldPresent == null ? null : isIceWaterShieldPresent,
        "contractorsName": contractorsName == null ? null : contractorsName,
        "mortgageeName": mortgageeName == null ? null : mortgageeName,
        "differentClaimantName":
            differentClaimantName == null ? null : differentClaimantName,
        "inspection_Date":
            inspectionDate == null ? null : inspectionDate?.toIso8601String(),
        "inspection_Time":
            inspectionTime == null ? null : inspectionTime?.toIso8601String(),
        "dateofLoss": dateofLoss == null ? null : dateofLoss?.toIso8601String(),
        "dwelling": dwelling,
        "dwellingMaterial": dwellingMaterial,
        "dwellingType": dwellingType,
        "stories": stories == null ? null : stories,
        "garage": garage == null ? null : garage,
        "note": note == null ? null : note,
        "remarks": remarks == null ? null : remarks,
        "attached": attached == null ? null : attached,
        "garageMaterial": garageMaterial,
        "roofInformation": roofInformation == null ? null : roofInformation,
        "roofSumary": roofSumary == null ? null : roofSumary,
        "roofComponents": roofComponents == null ? null : roofComponents,
        "forontElevationSumary":
            forontElevationSumary == null ? null : forontElevationSumary,
        "leftElevationSumary":
            leftElevationSumary == null ? null : leftElevationSumary,
        "backElevationSumary":
            backElevationSumary == null ? null : backElevationSumary,
        "rightElevationSumary":
            rightElevationSumary == null ? null : rightElevationSumary,
        "interiorSumary": interiorSumary == null ? null : interiorSumary,
        "publicNotes": publicNotes == null ? null : publicNotes,
        "privateNotes": privateNotes == null ? null : privateNotes,
        "workProformed": workProformed == null ? null : workProformed,
        "reportStatus": reportStatus == null ? null : reportStatus,
        "isActive": isActive == null ? null : isActive,
        "createdBy": createdBy == null ? null : createdBy,
        "createdDate":
            createdDate == null ? null : createdDate?.toIso8601String(),
      };
}
*/
