// To parse this JSON data, do
//
//     final modelGetContact = modelGetContactFromMap(jsonString);

import 'dart:convert';

ModelGetContact modelGetContactFromMap(String str) =>
    ModelGetContact.fromMap(json.decode(str));

String modelGetContactToMap(ModelGetContact data) => json.encode(data.toMap());

class ModelGetContact {
  ModelGetContact({
    this.data,
  });

  List<DataContact>? data;

  factory ModelGetContact.fromMap(Map<String, dynamic> json) => ModelGetContact(
        data: json["data"] == null
            ? null
            : List<DataContact>.from(
                json["data"].map((x) => DataContact.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class DataContact {
  DataContact({
    this.name,
    this.lastName,
    this.inspectorId,
    this.phoneNo,
    this.position,
    this.company,
    this.companYPhoneNo,
    this.companYEmail,
    this.streetAddress,
    this.city,
    this.state,
    this.postalCode,
    this.dob,
    this.xactwarEId,
    this.xactwarEAddress,
    this.stories,
    this.pitch,
    this.haaGCertified,
    this.sundayStartTime,
    this.sundayEndTime,
    this.mondayStartTime,
    this.mondayEndTime,
    this.tuesdayStartTime,
    this.tuesdayEndTime,
    this.wednesdayStartTime,
    this.wednesdayEndTime,
    this.thursdayStartTime,
    this.thursdayEndTime,
    this.fridayStartTime,
    this.fridayEndTime,
    this.saturdayStartTime,
    this.saturdayEndTime,
    this.haiLClaims,
    this.firEClaims,
    this.flooDClaims,
    this.wateRClaims,
    this.winDClaims,
    this.commerciaLClaims,
    this.vandalisMClaims,
    this.structuraLClaims,
    this.thefTClaims,
    this.otheRRelevantExperience,
    this.description,
    this.joiningDate,
    this.userZips,
    this.role,
  });

  String? name;
  String? lastName;
  dynamic inspectorId;
  String? phoneNo;
  dynamic position;
  String? company;
  String? companYPhoneNo;
  String? companYEmail;
  String? streetAddress;
  String? city;
  String? state;
  String? postalCode;
  DateTime? dob;
  dynamic xactwarEId;
  dynamic xactwarEAddress;
  String? stories;
  dynamic pitch;
  dynamic haaGCertified;
  dynamic sundayStartTime;
  dynamic sundayEndTime;
  dynamic mondayStartTime;
  dynamic mondayEndTime;
  dynamic tuesdayStartTime;
  dynamic tuesdayEndTime;
  dynamic wednesdayStartTime;
  dynamic wednesdayEndTime;
  dynamic thursdayStartTime;
  dynamic thursdayEndTime;
  dynamic fridayStartTime;
  dynamic fridayEndTime;
  dynamic saturdayStartTime;
  dynamic saturdayEndTime;
  int? haiLClaims;
  int? firEClaims;
  int? flooDClaims;
  int? wateRClaims;
  int? winDClaims;
  int? commerciaLClaims;
  int? vandalisMClaims;
  int? structuraLClaims;
  int? thefTClaims;
  dynamic otheRRelevantExperience;
  String? description;
  DateTime? joiningDate;
  dynamic userZips;
  String? role;

  factory DataContact.fromMap(Map<String, dynamic> json) => DataContact(
        name: json["name"] == null ? null : json["name"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        inspectorId: json["inspectorID"],
        phoneNo: json["phoneNo"] == null ? null : json["phoneNo"],
        position: json["position"],
        company: json["company"] == null ? null : json["company"],
        companYPhoneNo:
            json["companY_PHONE_NO"] == null ? null : json["companY_PHONE_NO"],
        companYEmail:
            json["companY_EMAIL"] == null ? null : json["companY_EMAIL"],
        streetAddress:
            json["streetAddress"] == null ? null : json["streetAddress"],
        city: json["city"] == null ? null : json["city"],
        state: json["state"] == null ? null : json["state"],
        postalCode: json["postalCode"] == null ? null : json["postalCode"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        xactwarEId: json["xactwarE_ID"],
        xactwarEAddress: json["xactwarE_ADDRESS"],
        stories: json["stories"] == null ? null : json["stories"],
        pitch: json["pitch"],
        haaGCertified: json["haaG_CERTIFIED"],
        sundayStartTime: json["sundayStartTime"],
        sundayEndTime: json["sundayEndTime"],
        mondayStartTime: json["mondayStartTime"],
        mondayEndTime: json["mondayEndTime"],
        tuesdayStartTime: json["tuesdayStartTime"],
        tuesdayEndTime: json["tuesdayEndTime"],
        wednesdayStartTime: json["wednesdayStartTime"],
        wednesdayEndTime: json["wednesdayEndTime"],
        thursdayStartTime: json["thursdayStartTime"],
        thursdayEndTime: json["thursdayEndTime"],
        fridayStartTime: json["fridayStartTime"],
        fridayEndTime: json["fridayEndTime"],
        saturdayStartTime: json["saturdayStartTime"],
        saturdayEndTime: json["saturdayEndTime"],
        haiLClaims: json["haiL_CLAIMS"] == null ? null : json["haiL_CLAIMS"],
        firEClaims: json["firE_CLAIMS"] == null ? null : json["firE_CLAIMS"],
        flooDClaims: json["flooD_CLAIMS"] == null ? null : json["flooD_CLAIMS"],
        wateRClaims: json["wateR_CLAIMS"] == null ? null : json["wateR_CLAIMS"],
        winDClaims: json["winD_CLAIMS"] == null ? null : json["winD_CLAIMS"],
        commerciaLClaims: json["commerciaL_CLAIMS"] == null
            ? null
            : json["commerciaL_CLAIMS"],
        vandalisMClaims:
            json["vandalisM_CLAIMS"] == null ? null : json["vandalisM_CLAIMS"],
        structuraLClaims: json["structuraL_CLAIMS"] == null
            ? null
            : json["structuraL_CLAIMS"],
        thefTClaims: json["thefT_CLAIMS"] == null ? null : json["thefT_CLAIMS"],
        otheRRelevantExperience: json["otheR_RELEVANT_EXPERIENCE"],
        description: json["description"] == null ? null : json["description"],
        joiningDate: json["joiningDate"] == null
            ? null
            : DateTime.parse(json["joiningDate"]),
        userZips: json["userZips"],
        role: json["role"] == null ? null : json["role"],
      );

  Map<String, dynamic> toMap() => {
        "name": name == null ? null : name,
        "lastName": lastName == null ? null : lastName,
        "inspectorID": inspectorId,
        "phoneNo": phoneNo == null ? null : phoneNo,
        "position": position,
        "company": company == null ? null : company,
        "companY_PHONE_NO": companYPhoneNo == null ? null : companYPhoneNo,
        "companY_EMAIL": companYEmail == null ? null : companYEmail,
        "streetAddress": streetAddress == null ? null : streetAddress,
        "city": city == null ? null : city,
        "state": state == null ? null : state,
        "postalCode": postalCode == null ? null : postalCode,
        "dob": dob == null ? null : dob?.toIso8601String(),
        "xactwarE_ID": xactwarEId,
        "xactwarE_ADDRESS": xactwarEAddress,
        "stories": stories == null ? null : stories,
        "pitch": pitch,
        "haaG_CERTIFIED": haaGCertified,
        "sundayStartTime": sundayStartTime,
        "sundayEndTime": sundayEndTime,
        "mondayStartTime": mondayStartTime,
        "mondayEndTime": mondayEndTime,
        "tuesdayStartTime": tuesdayStartTime,
        "tuesdayEndTime": tuesdayEndTime,
        "wednesdayStartTime": wednesdayStartTime,
        "wednesdayEndTime": wednesdayEndTime,
        "thursdayStartTime": thursdayStartTime,
        "thursdayEndTime": thursdayEndTime,
        "fridayStartTime": fridayStartTime,
        "fridayEndTime": fridayEndTime,
        "saturdayStartTime": saturdayStartTime,
        "saturdayEndTime": saturdayEndTime,
        "haiL_CLAIMS": haiLClaims == null ? null : haiLClaims,
        "firE_CLAIMS": firEClaims == null ? null : firEClaims,
        "flooD_CLAIMS": flooDClaims == null ? null : flooDClaims,
        "wateR_CLAIMS": wateRClaims == null ? null : wateRClaims,
        "winD_CLAIMS": winDClaims == null ? null : winDClaims,
        "commerciaL_CLAIMS": commerciaLClaims == null ? null : commerciaLClaims,
        "vandalisM_CLAIMS": vandalisMClaims == null ? null : vandalisMClaims,
        "structuraL_CLAIMS": structuraLClaims == null ? null : structuraLClaims,
        "thefT_CLAIMS": thefTClaims == null ? null : thefTClaims,
        "otheR_RELEVANT_EXPERIENCE": otheRRelevantExperience,
        "description": description == null ? null : description,
        "joiningDate":
            joiningDate == null ? null : joiningDate?.toIso8601String(),
        "userZips": userZips,
        "role": role == null ? null : role,
      };
}
