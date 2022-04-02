// To parse this JSON data, do
//
//     final businessType = businessTypeFromJson(jsonString);

import 'dart:convert';

List<BusinessType> businessTypeFromJson(String str) => List<BusinessType>.from(
    json.decode(str).map((x) => BusinessType.fromJson(x)));

String businessTypeToJson(List<BusinessType> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BusinessType {
  BusinessType({
    required this.name,
    required this.isActive,
    required this.isBySystem,
    required this.id,
  });

  String? name;
  bool? isActive;
  bool? isBySystem;
  int? id;

  factory BusinessType.fromJson(Map<String, dynamic> json) => BusinessType(
        name: json["name"] == null ? null : json["name"],
        isActive: json["isActive"] == null ? null : json["isActive"],
        isBySystem: json["isBySystem"] == null ? null : json["isBySystem"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "isActive": isActive == null ? null : isActive,
        "isBySystem": isBySystem == null ? null : isBySystem,
        "id": id == null ? null : id,
      };
}
