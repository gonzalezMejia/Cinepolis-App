// To parse this JSON data, do
//
//     final rostisserieDetail = rostisserieDetailFromJson(jsonString);

import 'dart:convert';

List<RostisserieList> rostisserieDetailFromJson(String str) =>
    List<RostisserieList>.from(
        json.decode(str).map((x) => RostisserieList.fromJson(x)));

String rostisserieDetailToJson(List<RostisserieList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RostisserieList {
  RostisserieList({
    required this.branchId,
    this.rostisserieBalanceProducts,
    this.rostisserieBalanceDocuments,
    this.rostisserieBalanceCash,
    required this.date,
    required this.id,
  });

  int? branchId;
  dynamic rostisserieBalanceProducts;
  dynamic rostisserieBalanceDocuments;
  dynamic rostisserieBalanceCash;
  DateTime? date;
  int? id;

  factory RostisserieList.fromVoid() =>
      RostisserieList(branchId: 0, date: DateTime(0), id: 0);

  factory RostisserieList.fromJson(Map<String, dynamic> json) =>
      RostisserieList(
        branchId: json["branchId"] == null ? null : json["branchId"],
        rostisserieBalanceProducts: json["rostisserieBalanceProducts"],
        rostisserieBalanceDocuments: json["rostisserieBalanceDocuments"],
        rostisserieBalanceCash: json["rostisserieBalanceCash"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "branchId": branchId == null ? null : branchId,
        "rostisserieBalanceProducts": rostisserieBalanceProducts,
        "rostisserieBalanceDocuments": rostisserieBalanceDocuments,
        "rostisserieBalanceCash": rostisserieBalanceCash,
        "date": date == null ? null : date!.toIso8601String(),
        "id": id == null ? null : id,
      };
}
