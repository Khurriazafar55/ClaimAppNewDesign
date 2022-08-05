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
