// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

ModelAllClaim getSubwaysFromJson(String str) =>
    ModelAllClaim.fromJson(json.decode(str));

String getSubwaysToJson(ModelAllClaim data) => json.encode(data.toJson());

class ModelAllClaim {
  ModelAllClaim({
    this.data,
  });
  List<ClaimsData>? data;
  factory ModelAllClaim.fromJson(Map<String, dynamic> json) => ModelAllClaim(
        data: List<ClaimsData>.from(
            json["Data"].map((x) => ClaimsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ClaimsData {
  int? id;
  String? main_Contact_Phone_Number;
  String? claim_ID;
  ClaimsData({
    this.id,
    this.main_Contact_Phone_Number,
    this.claim_ID,
  });
  factory ClaimsData.fromJson(Map<String, dynamic> json) => ClaimsData(
        id: json["id"],
        main_Contact_Phone_Number: json["main_Contact_Phone_Number"],
        claim_ID: json["claim_ID"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "main_Contact_Phone_Number": main_Contact_Phone_Number,
        "claim_ID": claim_ID,
      };
}
