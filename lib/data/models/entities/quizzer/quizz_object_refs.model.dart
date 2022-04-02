import 'dart:convert';

import 'package:Cinepolis/data/models/entities/dynamic/evidences.model.dart';

ObjectRefs objectRefsFromJson(String str) =>
    ObjectRefs.fromJson(json.decode(str));

String objectRefsToJson(ObjectRefs data) => json.encode(data.toJson());

class ObjectRefs {
  ObjectRefs(
      {required this.id,
      required this.referenceSelectedOptionId,
      required this.referenceSelectedOptions,
      required this.value,
      required this.observations,
      required this.files,
      required this.latitude,
      required this.longitude,
      required this.branchId});

  int id;
  int referenceSelectedOptionId;
  List<dynamic> referenceSelectedOptions;
  // ignore: unnecessary_question_mark
  dynamic? value;
  String? observations;
  List<dynamic> files;
  double? latitude;
  double? longitude;
  int? branchId;

  factory ObjectRefs.fromVoid() => ObjectRefs(
      id: 0,
      referenceSelectedOptionId: 0,
      referenceSelectedOptions: [],
      value: '',
      observations: '',
      files: [],
      latitude: 0,
      longitude: 0,
      branchId: 0);

  factory ObjectRefs.fromJson(Map<String, dynamic> json) => ObjectRefs(
        id: json["id"],
        referenceSelectedOptionId: json["referenceSelectedOptionId"],
        referenceSelectedOptions: List<dynamic>.from(
            json["ReferenceSelectedOptions"]
                .map((x) => ReferenceSelectedOption.fromJson(x))),
        value: json["value"],
        observations: json["observations"],
        files:
            List<dynamic>.from(json["files"].map((x) => Evidences.fromJson(x))),
        latitude: json["latitude"],
        longitude: json["longitude"],
        branchId: json["branchId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "referenceSelectedOptionId": referenceSelectedOptionId,
        "ReferenceSelectedOptions":
            List<dynamic>.from(referenceSelectedOptions.map((x) => x.toJson())),
        "value": value,
        "observations": observations,
        "files": List<dynamic>.from(files.map((x) => x.toJson())),
        "latitude": latitude,
        "longitude": longitude,
        "branchId": branchId,
      };
}

class ReferenceSelectedOption {
  ReferenceSelectedOption({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory ReferenceSelectedOption.fromJson(Map<String, dynamic> json) =>
      ReferenceSelectedOption(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

// To parse this JSON data, do
//
//     final responseObjectRefs = responseObjectRefsFromJson(jsonString);

ResponseObjectRefs responseObjectRefsFromJson(String str) =>
    ResponseObjectRefs.fromJson(json.decode(str));

String responseObjectRefsToJson(ResponseObjectRefs data) =>
    json.encode(data.toJson());

class ResponseObjectRefs {
  ResponseObjectRefs({
    required this.userCampaignId,
    required this.isCompleted,
    required this.id,
  });

  int userCampaignId;
  bool isCompleted;
  int id;

  factory ResponseObjectRefs.fromVoid() =>
      ResponseObjectRefs(userCampaignId: 0, isCompleted: false, id: 0);

  factory ResponseObjectRefs.fromJson(Map<String, dynamic> json) =>
      ResponseObjectRefs(
        userCampaignId: json["userCampaignId"],
        isCompleted: json["isCompleted"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "userCampaignId": userCampaignId,
        "isCompleted": isCompleted,
        "id": id,
      };
}
