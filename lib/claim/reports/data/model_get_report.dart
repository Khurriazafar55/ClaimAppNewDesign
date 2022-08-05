/*
// To parse this JSON data, do
//
//     final modelGetReport = modelGetReportFromMap(jsonString);

import 'dart:convert';

ModelGetReport modelGetReportFromMap(String str) =>
    ModelGetReport.fromMap(json.decode(str));

String modelGetReportToMap(ModelGetReport data) => json.encode(data.toMap());


//siat
class ModelGetReport {
  ModelGetReport({
    this.dataReport,
  });

  DataReport? dataReport;

  factory ModelGetReport.fromMap(Map<String, dynamic> json) => ModelGetReport(
        dataReport:
            json["data"] == null ? null : DataReport.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": dataReport == null ? null : dataReport?.toMap(),
      };
}

class DataReport {
  DataReport({
    this.claimReportModel,
    this.claim,
    this.assignedClaim,
    this.roofTypeList,
    this.roofStyleList,
    this.edgeMetalList,
    this.causeofLossList,
    this.dwellingList,
    this.dwellingMaterialList,
    this.dwellingTypeList,
    this.garageMaterialList,
    this.pitchList,
    this.reportFormats,
    this.exportReportId,
    this.cauofloss,
  });

  ClaimReportModel? claimReportModel;
  Claim? claim;
  AssignedClaim? assignedClaim;
  List<CauseofLossListElement>? roofTypeList;
  List<CauseofLossListElement>? roofStyleList;
  List<CauseofLossListElement>? edgeMetalList;
  List<CauseofLossListElement>? causeofLossList;
  List<CauseofLossListElement>? dwellingList;
  List<CauseofLossListElement>? dwellingMaterialList;
  List<CauseofLossListElement>? dwellingTypeList;
  List<CauseofLossListElement>? garageMaterialList;
  List<CauseofLossListElement>? pitchList;
  List<dynamic>? reportFormats;
  int? exportReportId;
  List<int>? cauofloss;

  factory DataReport.fromMap(Map<String, dynamic> json) => DataReport(
        claimReportModel: json["claimReportModel"] == null
            ? null
            : ClaimReportModel.fromMap(json["claimReportModel"]),
        claim: json["claim"] == null ? null : Claim.fromMap(json["claim"]),
        assignedClaim: json["assignedClaim"] == null
            ? null
            : AssignedClaim.fromMap(json["assignedClaim"]),
        roofTypeList: json["roof_Type_List"] == null
            ? null
            : List<CauseofLossListElement>.from(json["roof_Type_List"]
                .map((x) => CauseofLossListElement.fromMap(x))),
        roofStyleList: json["roof_Style_List"] == null
            ? null
            : List<CauseofLossListElement>.from(json["roof_Style_List"]
                .map((x) => CauseofLossListElement.fromMap(x))),
        edgeMetalList: json["edgeMetal_List"] == null
            ? null
            : List<CauseofLossListElement>.from(json["edgeMetal_List"]
                .map((x) => CauseofLossListElement.fromMap(x))),
        causeofLossList: json["causeofLoss_List"] == null
            ? null
            : List<CauseofLossListElement>.from(json["causeofLoss_List"]
                .map((x) => CauseofLossListElement.fromMap(x))),
        dwellingList: json["dwelling_List"] == null
            ? null
            : List<CauseofLossListElement>.from(json["dwelling_List"]
                .map((x) => CauseofLossListElement.fromMap(x))),
        dwellingMaterialList: json["dwellingMaterial_List"] == null
            ? null
            : List<CauseofLossListElement>.from(json["dwellingMaterial_List"]
                .map((x) => CauseofLossListElement.fromMap(x))),
        dwellingTypeList: json["dwellingType_List"] == null
            ? null
            : List<CauseofLossListElement>.from(json["dwellingType_List"]
                .map((x) => CauseofLossListElement.fromMap(x))),
        garageMaterialList: json["garageMaterial_List"] == null
            ? null
            : List<CauseofLossListElement>.from(json["garageMaterial_List"]
                .map((x) => CauseofLossListElement.fromMap(x))),
        pitchList: json["pitch_List"] == null
            ? null
            : List<CauseofLossListElement>.from(json["pitch_List"]
                .map((x) => CauseofLossListElement.fromMap(x))),
        reportFormats: json["reportFormats"] == null
            ? null
            : List<dynamic>.from(json["reportFormats"].map((x) => x)),
        exportReportId:
            json["exportReportID"] == null ? null : json["exportReportID"],
        cauofloss: json["cauofloss"] == null
            ? null
            : List<int>.from(json["cauofloss"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "claimReportModel":
            claimReportModel == null ? null : claimReportModel?.toMap(),
        "claim": claim == null ? null : claim?.toMap(),
        "assignedClaim": assignedClaim == null ? null : assignedClaim?.toMap(),
        "roof_Type_List": roofTypeList == null
            ? null
            : List<dynamic>.from(roofTypeList!.map((x) => x.toMap())),
        "roof_Style_List": roofStyleList == null
            ? null
            : List<dynamic>.from(roofStyleList!.map((x) => x.toMap())),
        "edgeMetal_List": edgeMetalList == null
            ? null
            : List<dynamic>.from(edgeMetalList!.map((x) => x.toMap())),
        "causeofLoss_List": causeofLossList == null
            ? null
            : List<dynamic>.from(causeofLossList!.map((x) => x.toMap())),
        "dwelling_List": dwellingList == null
            ? null
            : List<dynamic>.from(dwellingList!.map((x) => x.toMap())),
        "dwellingMaterial_List": dwellingMaterialList == null
            ? null
            : List<dynamic>.from(dwellingMaterialList!.map((x) => x.toMap())),
        "dwellingType_List": dwellingTypeList == null
            ? null
            : List<dynamic>.from(dwellingTypeList!.map((x) => x.toMap())),
        "garageMaterial_List": garageMaterialList == null
            ? null
            : List<dynamic>.from(garageMaterialList!.map((x) => x.toMap())),
        "pitch_List": pitchList == null
            ? null
            : List<dynamic>.from(pitchList!.map((x) => x.toMap())),
        "reportFormats": reportFormats == null
            ? null
            : List<dynamic>.from(reportFormats!.map((x) => x)),
        "exportReportID": exportReportId == null ? null : exportReportId,
        "cauofloss": cauofloss == null
            ? null
            : List<dynamic>.from(cauofloss!.map((x) => x)),
      };
}

class AssignedClaim {
  AssignedClaim({
    this.id,
    this.userId,
    this.claimId,
    this.date,
    this.isActive,
    this.createdBy,
    this.createdDate,
  });

  int? id;
  String? userId;
  int? claimId;
  DateTime? date;
  bool? isActive;
  String? createdBy;
  DateTime? createdDate;

  factory AssignedClaim.fromMap(Map<String, dynamic> json) => AssignedClaim(
        id: json["id"] == null ? null : json["id"],
        userId: json["userId"] == null ? null : json["userId"],
        claimId: json["claimId"] == null ? null : json["claimId"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        isActive: json["isActive"] == null ? null : json["isActive"],
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "userId": userId == null ? null : userId,
        "claimId": claimId == null ? null : claimId,
        "date": date == null ? null : date?.toIso8601String(),
        "isActive": isActive == null ? null : isActive,
        "createdBy": createdBy == null ? null : createdBy,
        "createdDate":
            createdDate == null ? null : createdDate?.toIso8601String(),
      };
}

class CauseofLossListElement {
  CauseofLossListElement({
    this.disabled,
    this.group,
    this.selected,
    this.text,
    this.value,
  });

  bool? disabled;
  dynamic group;
  bool? selected;
  String? text;
  String? value;

  factory CauseofLossListElement.fromMap(Map<String, dynamic> json) =>
      CauseofLossListElement(
        disabled: json["disabled"] == null ? null : json["disabled"],
        group: json["group"],
        selected: json["selected"] == null ? null : json["selected"],
        text: json["text"] == null ? null : json["text"],
        value: json["value"] == null ? null : json["value"],
      );

  Map<String, dynamic> toMap() => {
        "disabled": disabled == null ? null : disabled,
        "group": group,
        "selected": selected == null ? null : selected,
        "text": text == null ? null : text,
        "value": value == null ? null : value,
      };
}

class Claim {
  Claim({
    this.id,
    this.mainContactPhoneNumber,
    this.claimId,
    this.serviceType,
    this.policyHolderName,
    this.adjusterName,
    this.policyHolderEmail,
    this.adjusterEmail,
    this.policyHolderPhoneNumber,
    this.adjusterPhoneNumber,
    this.carrierName,
    this.isCarrierOther,
    this.isCarrierOtherValue,
    this.isDamageType,
    this.isDamageTypeValue,
    this.isDamageLocation,
    this.isDamageLocationValue,
    this.catastropheEvent,
    this.reInspection,
    this.address,
    this.city,
    this.independentAdjuster,
    this.state,
    this.zipCode,
    this.device,
    this.note,
    this.remarks,
    this.pitch,
    this.stories,
    this.inspectionDate,
    this.inspectionTime,
    this.photoSubmissionType,
    this.scopeSubmissionType,
    this.reportSubmissionType,
    this.measurementSubmissionType,
    this.additionalFileSubmission,
    this.additionalInformation,
    this.formType,
    this.map,
    this.claimStatus,
    this.measureassistNone,
    this.measureassistRoof,
    this.measureassistElevation,
    this.isActive,
    this.createdBy,
    this.createdDate,
  });

  int? id;
  String? mainContactPhoneNumber;
  String? claimId;
  dynamic serviceType;
  String? policyHolderName;
  String? adjusterName;
  String? policyHolderEmail;
  String? adjusterEmail;
  String? policyHolderPhoneNumber;
  String? adjusterPhoneNumber;
  CarrierName? carrierName;
  int? isCarrierOther;
  String? isCarrierOtherValue;
  bool? isDamageType;
  String? isDamageTypeValue;
  bool? isDamageLocation;
  String? isDamageLocationValue;
  CarrierName? catastropheEvent;
  CarrierName? reInspection;
  String? address;
  String? city;
  CarrierName? independentAdjuster;
  CarrierName? state;
  String? zipCode;
  String? device;
  String? note;
  String? remarks;
  CarrierName? pitch;
  int? stories;
  DateTime? inspectionDate;
  DateTime? inspectionTime;
  CarrierName? photoSubmissionType;
  CarrierName? scopeSubmissionType;
  CarrierName? reportSubmissionType;
  CarrierName? measurementSubmissionType;
  String? additionalFileSubmission;
  String? additionalInformation;
  String? formType;
  String? map;
  String? claimStatus;
  bool? measureassistNone;
  bool? measureassistRoof;
  bool? measureassistElevation;
  bool? isActive;
  String? createdBy;
  DateTime? createdDate;

  factory Claim.fromMap(Map<String, dynamic> json) => Claim(
        id: json["id"] == null ? null : json["id"],
        mainContactPhoneNumber: json["main_Contact_Phone_Number"] == null
            ? null
            : json["main_Contact_Phone_Number"],
        claimId: json["claim_ID"] == null ? null : json["claim_ID"],
        serviceType: json["service_Type"],
        policyHolderName: json["policy_Holder_Name"] == null
            ? null
            : json["policy_Holder_Name"],
        adjusterName:
            json["adjuster_Name"] == null ? null : json["adjuster_Name"],
        policyHolderEmail: json["policy_Holder_Email"] == null
            ? null
            : json["policy_Holder_Email"],
        adjusterEmail:
            json["adjuster_Email"] == null ? null : json["adjuster_Email"],
        policyHolderPhoneNumber: json["policy_Holder_Phone_Number"] == null
            ? null
            : json["policy_Holder_Phone_Number"],
        adjusterPhoneNumber: json["adjuster_Phone_Number"] == null
            ? null
            : json["adjuster_Phone_Number"],
        carrierName: json["carrier_Name"] == null
            ? null
            : CarrierName.fromMap(json["carrier_Name"]),
        isCarrierOther:
            json["isCarrierOther"] == null ? null : json["isCarrierOther"],
        isCarrierOtherValue: json["isCarrierOtherValue"] == null
            ? null
            : json["isCarrierOtherValue"],
        isDamageType:
            json["isDamageType"] == null ? null : json["isDamageType"],
        isDamageTypeValue: json["isDamageTypeValue"] == null
            ? null
            : json["isDamageTypeValue"],
        isDamageLocation:
            json["isDamageLocation"] == null ? null : json["isDamageLocation"],
        isDamageLocationValue: json["isDamageLocationValue"] == null
            ? null
            : json["isDamageLocationValue"],
        catastropheEvent: json["catastrophe_Event"] == null
            ? null
            : CarrierName.fromMap(json["catastrophe_Event"]),
        reInspection: json["re_Inspection"] == null
            ? null
            : CarrierName.fromMap(json["re_Inspection"]),
        address: json["address"] == null ? null : json["address"],
        city: json["city"] == null ? null : json["city"],
        independentAdjuster: json["independent_Adjuster"] == null
            ? null
            : CarrierName.fromMap(json["independent_Adjuster"]),
        state:
            json["state"] == null ? null : CarrierName.fromMap(json["state"]),
        zipCode: json["zip_Code"] == null ? null : json["zip_Code"],
        device: json["device"] == null ? null : json["device"],
        note: json["note"] == null ? null : json["note"],
        remarks: json["remarks"] == null ? null : json["remarks"],
        pitch:
            json["pitch"] == null ? null : CarrierName.fromMap(json["pitch"]),
        stories: json["stories"] == null ? null : json["stories"],
        inspectionDate: json["inspection_Date"] == null
            ? null
            : DateTime.parse(json["inspection_Date"]),
        inspectionTime: json["inspection_Time"] == null
            ? null
            : DateTime.parse(json["inspection_Time"]),
        photoSubmissionType: json["photo_Submission_Type"] == null
            ? null
            : CarrierName.fromMap(json["photo_Submission_Type"]),
        scopeSubmissionType: json["scope_Submission_Type"] == null
            ? null
            : CarrierName.fromMap(json["scope_Submission_Type"]),
        reportSubmissionType: json["report_Submission_Type"] == null
            ? null
            : CarrierName.fromMap(json["report_Submission_Type"]),
        measurementSubmissionType: json["measurement_Submission_Type"] == null
            ? null
            : CarrierName.fromMap(json["measurement_Submission_Type"]),
        additionalFileSubmission: json["additional_File_Submission"] == null
            ? null
            : json["additional_File_Submission"],
        additionalInformation: json["additional_Information"] == null
            ? null
            : json["additional_Information"],
        formType: json["form_Type"] == null ? null : json["form_Type"],
        map: json["map"] == null ? null : json["map"],
        claimStatus: json["claim_Status"] == null ? null : json["claim_Status"],
        measureassistNone: json["measureassistNone"] == null
            ? null
            : json["measureassistNone"],
        measureassistRoof: json["measureassistRoof"] == null
            ? null
            : json["measureassistRoof"],
        measureassistElevation: json["measureassistElevation"] == null
            ? null
            : json["measureassistElevation"],
        isActive: json["isActive"] == null ? null : json["isActive"],
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "main_Contact_Phone_Number":
            mainContactPhoneNumber == null ? null : mainContactPhoneNumber,
        "claim_ID": claimId == null ? null : claimId,
        "service_Type": serviceType,
        "policy_Holder_Name":
            policyHolderName == null ? null : policyHolderName,
        "adjuster_Name": adjusterName == null ? null : adjusterName,
        "policy_Holder_Email":
            policyHolderEmail == null ? null : policyHolderEmail,
        "adjuster_Email": adjusterEmail == null ? null : adjusterEmail,
        "policy_Holder_Phone_Number":
            policyHolderPhoneNumber == null ? null : policyHolderPhoneNumber,
        "adjuster_Phone_Number":
            adjusterPhoneNumber == null ? null : adjusterPhoneNumber,
        "carrier_Name": carrierName == null ? null : carrierName?.toMap(),
        "isCarrierOther": isCarrierOther == null ? null : isCarrierOther,
        "isCarrierOtherValue":
            isCarrierOtherValue == null ? null : isCarrierOtherValue,
        "isDamageType": isDamageType == null ? null : isDamageType,
        "isDamageTypeValue":
            isDamageTypeValue == null ? null : isDamageTypeValue,
        "isDamageLocation": isDamageLocation == null ? null : isDamageLocation,
        "isDamageLocationValue":
            isDamageLocationValue == null ? null : isDamageLocationValue,
        "catastrophe_Event":
            catastropheEvent == null ? null : catastropheEvent?.toMap(),
        "re_Inspection": reInspection == null ? null : reInspection?.toMap(),
        "address": address == null ? null : address,
        "city": city == null ? null : city,
        "independent_Adjuster":
            independentAdjuster == null ? null : independentAdjuster?.toMap(),
        "state": state == null ? null : state?.toMap(),
        "zip_Code": zipCode == null ? null : zipCode,
        "device": device == null ? null : device,
        "note": note == null ? null : note,
        "remarks": remarks == null ? null : remarks,
        "pitch": pitch == null ? null : pitch?.toMap(),
        "stories": stories == null ? null : stories,
        "inspection_Date":
            inspectionDate == null ? null : inspectionDate?.toIso8601String(),
        "inspection_Time":
            inspectionTime == null ? null : inspectionTime?.toIso8601String(),
        "photo_Submission_Type":
            photoSubmissionType == null ? null : photoSubmissionType?.toMap(),
        "scope_Submission_Type":
            scopeSubmissionType == null ? null : scopeSubmissionType?.toMap(),
        "report_Submission_Type":
            reportSubmissionType == null ? null : reportSubmissionType?.toMap(),
        "measurement_Submission_Type": measurementSubmissionType == null
            ? null
            : measurementSubmissionType?.toMap(),
        "additional_File_Submission":
            additionalFileSubmission == null ? null : additionalFileSubmission,
        "additional_Information":
            additionalInformation == null ? null : additionalInformation,
        "form_Type": formType == null ? null : formType,
        "map": map == null ? null : map,
        "claim_Status": claimStatus == null ? null : claimStatus,
        "measureassistNone":
            measureassistNone == null ? null : measureassistNone,
        "measureassistRoof":
            measureassistRoof == null ? null : measureassistRoof,
        "measureassistElevation":
            measureassistElevation == null ? null : measureassistElevation,
        "isActive": isActive == null ? null : isActive,
        "createdBy": createdBy == null ? null : createdBy,
        "createdDate":
            createdDate == null ? null : createdDate?.toIso8601String(),
      };
}

class CarrierName {
  CarrierName({
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

  factory CarrierName.fromMap(Map<String, dynamic> json) => CarrierName(
        id: json["id"] == null ? null : json["id"],
        key: json["key"] == null ? null : json["key"],
        value: json["value"] == null ? null : json["value"],
        dropDown: json["dropDown"] == null ? null : json["dropDown"],
        isActive: json["isActive"] == null ? null : json["isActive"],
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
      );

  Map<String, dynamic> toMap() => {
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

class ClaimReportModel {
  ClaimReportModel({
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
  CarrierName? roofStyleType;
  int? layer;
  CarrierName? edgeMetalType;
  CarrierName? pitchType;
  bool? homeowner;
  dynamic homeName;
  bool? mortagee;
  bool? differentClaimant;
  bool? contractor;
  bool? noneWerePresento;
  bool? isFeltPresentCheck;
  int? whattype;
  bool? isIceWaterShieldPresent;
  dynamic contractorsName;
  dynamic mortgageeName;
  String? differentClaimantName;
  DateTime? inspectionDate;
  DateTime? inspectionTime;
  DateTime? dateofLoss;
  CarrierName? dwelling;
  CarrierName? dwellingMaterial;
  CarrierName? dwellingType;
  int? stories;
  int? garage;
  String? note;
  String? remarks;
  bool? attached;
  CarrierName? garageMaterial;
  String? roofInformation;
  String? roofSumary;
  String? roofComponents;
  String? forontElevationSumary;
  String? leftElevationSumary;
  String? backElevationSumary;
  String? rightElevationSumary;
  String? interiorSumary;
  dynamic publicNotes;
  dynamic privateNotes;
  dynamic workProformed;
  String? reportStatus;
  bool? isActive;
  String? createdBy;
  DateTime? createdDate;

  factory ClaimReportModel.fromMap(Map<String, dynamic> json) =>
      ClaimReportModel(
        id: json["id"] == null ? null : json["id"],
        claimId: json["claimId"] == null ? null : json["claimId"],
        inspectorId: json["inspectorID"] == null ? null : json["inspectorID"],
        assignId: json["assignId"] == null ? null : json["assignId"],
        claimPersonName:
            json["claimPersonName"] == null ? null : json["claimPersonName"],
        roofType: json["roof_Type"],
        roofAge: json["roofAge"] == null ? null : json["roofAge"],
        roofStyleType: json["roofStyle_Type"] == null
            ? null
            : CarrierName.fromMap(json["roofStyle_Type"]),
        layer: json["layer"] == null ? null : json["layer"],
        edgeMetalType: json["edgeMetal_Type"] == null
            ? null
            : CarrierName.fromMap(json["edgeMetal_Type"]),
        pitchType: json["pitch_Type"] == null
            ? null
            : CarrierName.fromMap(json["pitch_Type"]),
        homeowner: json["homeowner"] == null ? null : json["homeowner"],
        homeName: json["homeName"],
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
        contractorsName: json["contractorsName"],
        mortgageeName: json["mortgageeName"],
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
        dwelling: json["dwelling"] == null
            ? null
            : CarrierName.fromMap(json["dwelling"]),
        dwellingMaterial: json["dwellingMaterial"] == null
            ? null
            : CarrierName.fromMap(json["dwellingMaterial"]),
        dwellingType: json["dwellingType"] == null
            ? null
            : CarrierName.fromMap(json["dwellingType"]),
        stories: json["stories"] == null ? null : json["stories"],
        garage: json["garage"] == null ? null : json["garage"],
        note: json["note"] == null ? null : json["note"],
        remarks: json["remarks"] == null ? null : json["remarks"],
        attached: json["attached"] == null ? null : json["attached"],
        garageMaterial: json["garageMaterial"] == null
            ? null
            : CarrierName.fromMap(json["garageMaterial"]),
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
        publicNotes: json["publicNotes"],
        privateNotes: json["privateNotes"],
        workProformed: json["workProformed"],
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
        "roofStyle_Type": roofStyleType == null ? null : roofStyleType?.toMap(),
        "layer": layer == null ? null : layer,
        "edgeMetal_Type": edgeMetalType == null ? null : edgeMetalType?.toMap(),
        "pitch_Type": pitchType == null ? null : pitchType?.toMap(),
        "homeowner": homeowner == null ? null : homeowner,
        "homeName": homeName,
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
        "contractorsName": contractorsName,
        "mortgageeName": mortgageeName,
        "differentClaimantName":
            differentClaimantName == null ? null : differentClaimantName,
        "inspection_Date":
            inspectionDate == null ? null : inspectionDate?.toIso8601String(),
        "inspection_Time":
            inspectionTime == null ? null : inspectionTime?.toIso8601String(),
        "dateofLoss": dateofLoss == null ? null : dateofLoss?.toIso8601String(),
        "dwelling": dwelling == null ? null : dwelling?.toMap(),
        "dwellingMaterial":
            dwellingMaterial == null ? null : dwellingMaterial?.toMap(),
        "dwellingType": dwellingType == null ? null : dwellingType?.toMap(),
        "stories": stories == null ? null : stories,
        "garage": garage == null ? null : garage,
        "note": note == null ? null : note,
        "remarks": remarks == null ? null : remarks,
        "attached": attached == null ? null : attached,
        "garageMaterial":
            garageMaterial == null ? null : garageMaterial?.toMap(),
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
        "publicNotes": publicNotes,
        "privateNotes": privateNotes,
        "workProformed": workProformed,
        "reportStatus": reportStatus == null ? null : reportStatus,
        "isActive": isActive == null ? null : isActive,
        "createdBy": createdBy == null ? null : createdBy,
        "createdDate":
            createdDate == null ? null : createdDate?.toIso8601String(),
      };
}
*/
