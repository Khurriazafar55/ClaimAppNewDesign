// To parse this JSON data, do
//
//     final modelProfile = modelProfileFromJson(jsonString);

import 'dart:convert';

ModelProfile modelProfileFromJson(String str) => ModelProfile.fromJson(json.decode(str));

String modelProfileToJson(ModelProfile data) => json.encode(data.toJson());

class ModelProfile {
  ModelProfile({
    this.data,
  });

  Data? data;

  factory ModelProfile.fromJson(Map<String, dynamic> json) => ModelProfile(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : data?.toJson(),
  };
}

class Data {
  Data({
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
  });

  String? name;
  dynamic lastName;
  dynamic inspectorId;
  dynamic phoneNo;
  dynamic position;
  dynamic company;
  dynamic companYPhoneNo;
  dynamic companYEmail;
  String? streetAddress;
  String? city;
  String? state;
  dynamic postalCode;
  DateTime? dob;
  dynamic xactwarEId;
  dynamic xactwarEAddress;
  dynamic stories;
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
  dynamic description;
  DateTime? joiningDate;
  dynamic userZips;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"] == null ? null : json["name"],
    lastName: json["lastName"],
    inspectorId: json["inspectorID"],
    phoneNo: json["phoneNo"],
    position: json["position"],
    company: json["company"],
    companYPhoneNo: json["companY_PHONE_NO"],
    companYEmail: json["companY_EMAIL"],
    streetAddress: json["streetAddress"] == null ? null : json["streetAddress"],
    city: json["city"] == null ? null : json["city"],
    state: json["state"] == null ? null : json["state"],
    postalCode: json["postalCode"],
    dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
    xactwarEId: json["xactwarE_ID"],
    xactwarEAddress: json["xactwarE_ADDRESS"],
    stories: json["stories"],
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
    commerciaLClaims: json["commerciaL_CLAIMS"] == null ? null : json["commerciaL_CLAIMS"],
    vandalisMClaims: json["vandalisM_CLAIMS"] == null ? null : json["vandalisM_CLAIMS"],
    structuraLClaims: json["structuraL_CLAIMS"] == null ? null : json["structuraL_CLAIMS"],
    thefTClaims: json["thefT_CLAIMS"] == null ? null : json["thefT_CLAIMS"],
    otheRRelevantExperience: json["otheR_RELEVANT_EXPERIENCE"],
    description: json["description"],
    joiningDate: json["joiningDate"] == null ? null : DateTime.parse(json["joiningDate"]),
    userZips: json["userZips"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "lastName": lastName,
    "inspectorID": inspectorId,
    "phoneNo": phoneNo,
    "position": position,
    "company": company,
    "companY_PHONE_NO": companYPhoneNo,
    "companY_EMAIL": companYEmail,
    "streetAddress": streetAddress == null ? null : streetAddress,
    "city": city == null ? null : city,
    "state": state == null ? null : state,
    "postalCode": postalCode,
    "dob": dob == null ? null : dob?.toIso8601String(),
    "xactwarE_ID": xactwarEId,
    "xactwarE_ADDRESS": xactwarEAddress,
    "stories": stories,
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
    "description": description,
    "joiningDate": joiningDate == null ? null : joiningDate?.toIso8601String(),
    "userZips": userZips,
  };
}
