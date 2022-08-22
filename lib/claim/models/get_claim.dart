// // To parse this JSON data, do
// //
// //     final modelGetClaim = modelGetClaimFromMap(jsonString);

// import 'dart:convert';

// import 'package:claim_core/claim/models/carrier_name.dart';

// ModelGetClaim getAllAirportsFromJson(String str) => ModelGetClaim.fromJson(json.decode(str));

// String getAllAirportsToJson(ModelGetClaim data) => json.encode(data.toJson());

// class ModelGetClaim {
//   ModelGetClaim({
//     this.data,
//     this.message,
//     this.status,
//   });

//   List<DataSingleClaim>? data;
//   String? message;
//   int? status;

//    factory DataSingleClaim.fromJson(Map<String, dynamic> json) => DataSingleClaim(
//         success: json["success"],
//         message: json["message"],
//         data: List<DataSingleClaim>.from(json["Data"].map((x) => DataSingleClaim.fromJson(x))),
       
//     );

//     Map<String, dynamic> toJson() => {
//         "success": success,
//         "message": message,
//         "Data": List<dynamic>.from(data.map((x) => x.toJson())),
        
//     };

// }

// class DataSingleClaim {
//   DataSingleClaim({
//     this.id,
//     this.mainContactPhoneNumber,
//     this.claimId,
//     this.serviceType,
//     this.policyHolderName,
//     this.adjusterName,
//     this.policyHolderEmail,
//     this.adjusterEmail,
//     this.policyHolderPhoneNumber,
//     this.adjusterPhoneNumber,
//     this.carrierName,
//     this.isCarrierOther,
//     this.isCarrierOtherValue,
//     this.isDamageType,
//     this.isDamageTypeValue,
//     this.isDamageLocation,
//     this.isDamageLocationValue,
//     this.catastropheEvent,
//     this.reInspection,
//     this.address,
//     this.city,
//     this.independentAdjuster,
//     this.state,
//     this.zipCode,
//     this.device,
//     this.note,
//     this.remarks,
//     this.pitch,
//     this.stories,
//     this.inspectionDate,
//     this.inspectionTime,
//     this.photoSubmissionType,
//     this.scopeSubmissionType,
//     this.reportSubmissionType,
//     this.measurementSubmissionType,
//     this.additionalFileSubmission,
//     this.additionalInformation,
//     this.formType,
//     this.map,
//     this.claimStatus,
//     this.measureassistNone,
//     this.measureassistRoof,
//     this.measureassistElevation,
//     this.isActive,
//     this.createdBy,
//     this.createdDate,
//   });

//   int? id;
//   String? mainContactPhoneNumber;
//   String? claimId;
//   ServiceType? serviceType;
//   String? policyHolderName;
//   String? adjusterName;
//   String? policyHolderEmail;
//   String? adjusterEmail;
//   String? policyHolderPhoneNumber;
//   String? adjusterPhoneNumber;
//   CarrierName? carrierName;
//   int? isCarrierOther;
//   String? isCarrierOtherValue;
//   bool? isDamageType;
//   String? isDamageTypeValue;
//   bool? isDamageLocation;
//   String? isDamageLocationValue;
//   CarrierName? catastropheEvent;
//   CarrierName? reInspection;
//   String? address;
//   String? city;
//   CarrierName? independentAdjuster;
//   CarrierName? state;
//   String? zipCode;
//   String? device;
//   String? note;
//   String? remarks;
//   CarrierName? pitch;
//   int? stories;
//   DateTime? inspectionDate;
//   DateTime? inspectionTime;
//   CarrierName? photoSubmissionType;
//   CarrierName? scopeSubmissionType;
//   CarrierName? reportSubmissionType;
//   CarrierName? measurementSubmissionType;
//   String? additionalFileSubmission;
//   String? additionalInformation;
//   String? formType;
//   String? map;
//   String? claimStatus;
//   bool? measureassistNone;
//   bool? measureassistRoof;
//   bool? measureassistElevation;
//   bool? isActive;
//   String? createdBy;
//   DateTime? createdDate;

//   factory DataSingleClaim.fromJson(Map<String, dynamic> json) => DataSingleClaim(
//         id: json["id"],
//         mainContactPhoneNumber: json["main_Contact_Phone_Number"],
          
//         claimId: json["claim_ID"],
//         serviceType: json["service_Type"],
//             ? null
//             : ServiceType.fromMap(json["service_Type"]),
//         policyHolderName: json["policy_Holder_Name"] == null
//             ? null
//             : json["policy_Holder_Name"],
//         adjusterName:
//             json["adjuster_Name"] == null ? null : json["adjuster_Name"],
//         policyHolderEmail: json["policy_Holder_Email"] == null
//             ? null
//             : json["policy_Holder_Email"],
//         adjusterEmail:
//             json["adjuster_Email"] == null ? null : json["adjuster_Email"],
//         policyHolderPhoneNumber: json["policy_Holder_Phone_Number"] == null
//             ? null
//             : json["policy_Holder_Phone_Number"],
//         adjusterPhoneNumber: json["adjuster_Phone_Number"] == null
//             ? null
//             : json["adjuster_Phone_Number"],
//         carrierName: json["carrier_Name"],
         
//         isCarrierOther:
//             json["isCarrierOther"],
       
          
          
//         isDamageType:
//             json["isDamageType"],
//         isDamageTypeValue: json["isDamageTypeValue"] == null
//             ? null
//             : json["isDamageTypeValue"],
//         isDamageLocation:
//             json["isDamageLocation"] == null ? null : json["isDamageLocation"],
//         isDamageLocationValue: json["isDamageLocationValue"] == null
//             ? null
//             : json["isDamageLocationValue"],
//         catastropheEvent: json["catastrophe_Event"] == null
//             ? null
//             : CarrierName.fromMap(json["catastrophe_Event"]),
//         reInspection: json["re_Inspection"] == null
//             ? null
//             : CarrierName.fromMap(json["re_Inspection"]),
//         address: json["address"] == null ? null : json["address"],
//         city: json["city"] == null ? null : json["city"],
//         independentAdjuster: json["independent_Adjuster"] == null
//             ? null
//             : CarrierName.fromMap(json["independent_Adjuster"]),
//         state:
//             json["state"] == null ? null : CarrierName.fromMap(json["state"]),
//         zipCode: json["zip_Code"] == null ? null : json["zip_Code"],
//         device: json["device"] == null ? null : json["device"],
//         note: json["note"] == null ? null : json["note"],
//         remarks: json["remarks"] == null ? null : json["remarks"],
//         pitch:
//             json["pitch"] == null ? null : CarrierName.fromMap(json["pitch"]),
//         stories: json["stories"] == null ? null : json["stories"],
//         inspectionDate: json["inspection_Date"] == null
//             ? null
//             : DateTime.parse(json["inspection_Date"]),
//         inspectionTime: json["inspection_Time"] == null
//             ? null
//             : DateTime.parse(json["inspection_Time"]),
//         photoSubmissionType: json["photo_Submission_Type"] == null
//             ? null
//             : CarrierName.fromMap(json["photo_Submission_Type"]),
//         scopeSubmissionType: json["scope_Submission_Type"] == null
//             ? null
//             : CarrierName.fromMap(json["scope_Submission_Type"]),
//         reportSubmissionType: json["report_Submission_Type"] == null
//             ? null
//             : CarrierName.fromMap(json["report_Submission_Type"]),
//         measurementSubmissionType: json["measurement_Submission_Type"] == null
//             ? null
//             : CarrierName.fromMap(json["measurement_Submission_Type"]),
//         additionalFileSubmission: json["additional_File_Submission"] == null
//             ? null
//             : json["additional_File_Submission"],
//         additionalInformation: json["additional_Information"] == null
//             ? null
//             : json["additional_Information"],
//         formType: json["form_Type"] == null ? null : json["form_Type"],
//         map: json["map"] == null ? null : json["map"],
//         claimStatus: json["claim_Status"] == null ? null : json["claim_Status"],
//         measureassistNone: json["measureassistNone"] == null
//             ? null
//             : json["measureassistNone"],
//         measureassistRoof: json["measureassistRoof"] == null
//             ? null
//             : json["measureassistRoof"],
//         measureassistElevation: json["measureassistElevation"] == null
//             ? null
//             : json["measureassistElevation"],
//         isActive: json["isActive"] == null ? null : json["isActive"],
//         createdBy: json["createdBy"] == null ? null : json["createdBy"],
//         createdDate: json["createdDate"] == null
//             ? null
//             : DateTime.parse(json["createdDate"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id == null ? null : id,
//         "main_Contact_Phone_Number":
//             mainContactPhoneNumber == null ? null : mainContactPhoneNumber,
//         "claim_ID": claimId == null ? null : claimId,
//         "service_Type": serviceType == null ? null : serviceType?.toMap(),
//         "policy_Holder_Name":
//             policyHolderName == null ? null : policyHolderName,
//         "adjuster_Name": adjusterName == null ? null : adjusterName,
//         "policy_Holder_Email":
//             policyHolderEmail == null ? null : policyHolderEmail,
//         "adjuster_Email": adjusterEmail == null ? null : adjusterEmail,
//         "policy_Holder_Phone_Number":
//             policyHolderPhoneNumber == null ? null : policyHolderPhoneNumber,
//         "adjuster_Phone_Number":
//             adjusterPhoneNumber == null ? null : adjusterPhoneNumber,
//         "carrier_Name": carrierName == null ? null : carrierName?.toMap(),
//         "isCarrierOther": isCarrierOther == null ? null : isCarrierOther,
//         "isCarrierOtherValue":
//             isCarrierOtherValue == null ? null : isCarrierOtherValue,
//         "isDamageType": isDamageType == null ? null : isDamageType,
//         "isDamageTypeValue":
//             isDamageTypeValue == null ? null : isDamageTypeValue,
//         "isDamageLocation": isDamageLocation == null ? null : isDamageLocation,
//         "isDamageLocationValue":
//             isDamageLocationValue == null ? null : isDamageLocationValue,
//         "catastrophe_Event":
//             catastropheEvent == null ? null : catastropheEvent?.toMap(),
//         "re_Inspection": reInspection == null ? null : reInspection?.toMap(),
//         "address": address == null ? null : address,
//         "city": city == null ? null : city,
//         "independent_Adjuster":
//             independentAdjuster == null ? null : independentAdjuster?.toMap(),
//         "state": state == null ? null : state?.toMap(),
//         "zip_Code": zipCode == null ? null : zipCode,
//         "device": device == null ? null : device,
//         "note": note == null ? null : note,
//         "remarks": remarks == null ? null : remarks,
//         "pitch": pitch == null ? null : pitch?.toMap(),
//         "stories": stories == null ? null : stories,
//         "inspection_Date":
//             inspectionDate == null ? null : inspectionDate?.toIso8601String(),
//         "inspection_Time":
//             inspectionTime == null ? null : inspectionTime?.toIso8601String(),
//         "photo_Submission_Type":
//             photoSubmissionType == null ? null : photoSubmissionType?.toMap(),
//         "scope_Submission_Type":
//             scopeSubmissionType == null ? null : scopeSubmissionType?.toMap(),
//         "report_Submission_Type":
//             reportSubmissionType == null ? null : reportSubmissionType?.toMap(),
//         "measurement_Submission_Type": measurementSubmissionType == null
//             ? null
//             : measurementSubmissionType?.toMap(),
//         "additional_File_Submission":
//             additionalFileSubmission == null ? null : additionalFileSubmission,
//         "additional_Information":
//             additionalInformation == null ? null : additionalInformation,
//         "form_Type": formType == null ? null : formType,
//         "map": map == null ? null : map,
//         "claim_Status": claimStatus == null ? null : claimStatus,
//         "measureassistNone":
//             measureassistNone == null ? null : measureassistNone,
//         "measureassistRoof":
//             measureassistRoof == null ? null : measureassistRoof,
//         "measureassistElevation":
//             measureassistElevation == null ? null : measureassistElevation,
//         "isActive": isActive == null ? null : isActive,
//         "createdBy": createdBy == null ? null : createdBy,
//         "createdDate":
//             createdDate == null ? null : createdDate?.toIso8601String(),
//       };
// }

// class ServiceType {
//   ServiceType({
//     this.id,
//     this.serviceName,
//     this.price,
//     this.team,
//     this.createdBy,
//     this.appUsersCreated,
//     this.createdDate,
//     this.modifiedBy,
//     this.appUsersModified,
//     this.modifiedDate,
//     this.isActive,
//   });

//   int? id;
//   String? serviceName;
//   int? price;
//   Team? team;
//   String? createdBy;
//   dynamic appUsersCreated;
//   DateTime? createdDate;
//   dynamic modifiedBy;
//   dynamic appUsersModified;
//   DateTime? modifiedDate;
//   bool? isActive;

//   factory ServiceType.fromMap(Map<String, dynamic> json) => ServiceType(
//         id: json["id"] == null ? null : json["id"],
//         serviceName: json["service_name"] == null ? null : json["service_name"],
//         price: json["price"] == null ? null : json["price"],
//         team: json["team"] == null ? null : Team.fromMap(json["team"]),
//         createdBy: json["createdBy"] == null ? null : json["createdBy"],
//         appUsersCreated: json["app_Users_Created"],
//         createdDate: json["createdDate"] == null
//             ? null
//             : DateTime.parse(json["createdDate"]),
//         modifiedBy: json["modifiedBy"],
//         appUsersModified: json["app_Users_Modified"],
//         modifiedDate: json["modifiedDate"] == null
//             ? null
//             : DateTime.parse(json["modifiedDate"]),
//         isActive: json["is_Active"] == null ? null : json["is_Active"],
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id == null ? null : id,
//         "service_name": serviceName == null ? null : serviceName,
//         "price": price == null ? null : price,
//         "team": team == null ? null : team?.toMap(),
//         "createdBy": createdBy == null ? null : createdBy,
//         "app_Users_Created": appUsersCreated,
//         "createdDate":
//             createdDate == null ? null : createdDate?.toIso8601String(),
//         "modifiedBy": modifiedBy,
//         "app_Users_Modified": appUsersModified,
//         "modifiedDate":
//             modifiedDate == null ? null : modifiedDate?.toIso8601String(),
//         "is_Active": isActive == null ? null : isActive,
//       };
// }

// class Team {
//   Team({
//     this.id,
//     this.teamName,
//     this.teamDescription,
//     this.isActive,
//     this.createdBy,
//     this.createdDate,
//   });

//   int? id;
//   String? teamName;
//   String? teamDescription;
//   bool? isActive;
//   String? createdBy;
//   DateTime? createdDate;

//   factory Team.fromMap(Map<String, dynamic> json) => Team(
//         id: json["id"] == null ? null : json["id"],
//         teamName: json["teamName"] == null ? null : json["teamName"],
//         teamDescription:
//             json["teamDescription"] == null ? null : json["teamDescription"],
//         isActive: json["isActive"] == null ? null : json["isActive"],
//         createdBy: json["createdBy"] == null ? null : json["createdBy"],
//         createdDate: json["createdDate"] == null
//             ? null
//             : DateTime.parse(json["createdDate"]),
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id == null ? null : id,
//         "teamName": teamName == null ? null : teamName,
//         "teamDescription": teamDescription == null ? null : teamDescription,
//         "isActive": isActive == null ? null : isActive,
//         "createdBy": createdBy == null ? null : createdBy,
//         "createdDate":
//             createdDate == null ? null : createdDate?.toIso8601String(),
//       };
// }
