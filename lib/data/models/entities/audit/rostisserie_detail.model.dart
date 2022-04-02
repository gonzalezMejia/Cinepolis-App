// To parse this JSON data, do
//
//     final rostisserieDetail = rostisserieDetailFromJson(jsonString);

import 'dart:convert';

RostisserieDetail rostisserieDetailFromJson(String str) =>
    RostisserieDetail.fromJson(json.decode(str));

String rostisserieDetailToJson(RostisserieDetail data) =>
    json.encode(data.toJson());

class RostisserieDetail {
  RostisserieDetail({
    required this.branchId,
    required this.rostisserieBalanceProducts,
    required this.rostisserieBalanceDocuments,
    required this.rostisserieBalanceCash,
    required this.date,
    required this.id,
  });

  int? branchId;
  List<RostisserieBalanceProduct>? rostisserieBalanceProducts;
  List<RostisserieBalanceDocument>? rostisserieBalanceDocuments;
  RostisserieBalanceCash? rostisserieBalanceCash;
  DateTime? date;
  int? id;

  factory RostisserieDetail.fromVoid() => RostisserieDetail(
      branchId: 0,
      rostisserieBalanceProducts: [],
      rostisserieBalanceDocuments: [],
      rostisserieBalanceCash: RostisserieBalanceCash(
          rostisserieBalance: 0,
          rostisserieBalanceId: 0,
          cashTotal: 0,
          voucherTotal: 0,
          saleTotal: 0,
          borrowedChange: 0,
          id: 0),
      date: DateTime(0),
      id: 0);

  factory RostisserieDetail.fromJson(Map<String, dynamic> json) =>
      RostisserieDetail(
        branchId: json["branchId"] == null ? null : json["branchId"],
        rostisserieBalanceProducts: json["rostisserieBalanceProducts"] == null
            ? null
            : List<RostisserieBalanceProduct>.from(
                json["rostisserieBalanceProducts"]
                    .map((x) => RostisserieBalanceProduct.fromJson(x))),
        rostisserieBalanceDocuments: json["rostisserieBalanceDocuments"] == null
            ? null
            : List<RostisserieBalanceDocument>.from(
                json["rostisserieBalanceDocuments"]
                    .map((x) => RostisserieBalanceDocument.fromJson(x))),
        rostisserieBalanceCash: json["rostisserieBalanceCash"] == null
            ? null
            : RostisserieBalanceCash.fromJson(json["rostisserieBalanceCash"]),
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "branchId": branchId == null ? null : branchId,
        "rostisserieBalanceProducts": rostisserieBalanceProducts == null
            ? null
            : List<dynamic>.from(
                rostisserieBalanceProducts!.map((x) => x.toJson())),
        "rostisserieBalanceDocuments": rostisserieBalanceDocuments == null
            ? null
            : List<dynamic>.from(
                rostisserieBalanceDocuments!.map((x) => x.toJson())),
        "rostisserieBalanceCash": rostisserieBalanceCash == null
            ? null
            : rostisserieBalanceCash!.toJson(),
        "date": date == null ? null : date!.toIso8601String(),
        "id": id == null ? null : id,
      };
}

class RostisserieBalanceCash {
  RostisserieBalanceCash({
    required this.rostisserieBalance,
    required this.rostisserieBalanceId,
    required this.cashTotal,
    required this.voucherTotal,
    required this.saleTotal,
    required this.borrowedChange,
    required this.id,
  });

  dynamic rostisserieBalance;
  int? rostisserieBalanceId;
  double? cashTotal;
  double? voucherTotal;
  double? saleTotal;
  double? borrowedChange;
  int? id;

  factory RostisserieBalanceCash.fromJson(Map<String, dynamic> json) =>
      RostisserieBalanceCash(
        rostisserieBalance: json["rostisserieBalance"],
        rostisserieBalanceId: json["rostisserieBalanceId"] == null
            ? null
            : json["rostisserieBalanceId"],
        cashTotal: json["cashTotal"] == null ? null : json["cashTotal"],
        voucherTotal:
            json["voucherTotal"] == null ? null : json["voucherTotal"],
        saleTotal: json["saleTotal"] == null ? null : json["saleTotal"],
        borrowedChange:
            json["borrowedChange"] == null ? null : json["borrowedChange"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "rostisserieBalance": rostisserieBalance,
        "rostisserieBalanceId":
            rostisserieBalanceId == null ? null : rostisserieBalanceId,
        "cashTotal": cashTotal == null ? null : cashTotal,
        "voucherTotal": voucherTotal == null ? null : voucherTotal,
        "saleTotal": saleTotal == null ? null : saleTotal,
        "borrowedChange": borrowedChange == null ? null : borrowedChange,
        "id": id == null ? null : id,
      };
}

class RostisserieBalanceDocument {
  RostisserieBalanceDocument({
    required this.rostisserieBalance,
    required this.rostisserieBalanceId,
    required this.fileManagerId,
    required this.fileManagerName,
    required this.fileManagerExtension,
    required this.fileManagerRealName,
    required this.id,
  });

  dynamic rostisserieBalance;
  int? rostisserieBalanceId;
  int? fileManagerId;
  String? fileManagerName;
  String? fileManagerExtension;
  String? fileManagerRealName;
  int? id;

  factory RostisserieBalanceDocument.fromJson(Map<String, dynamic> json) =>
      RostisserieBalanceDocument(
        rostisserieBalance: json["rostisserieBalance"],
        rostisserieBalanceId: json["rostisserieBalanceId"] == null
            ? null
            : json["rostisserieBalanceId"],
        fileManagerId:
            json["fileManagerId"] == null ? null : json["fileManagerId"],
        fileManagerName:
            json["fileManagerName"] == null ? null : json["fileManagerName"],
        fileManagerExtension: json["fileManagerExtension"] == null
            ? null
            : json["fileManagerExtension"],
        fileManagerRealName: json["fileManagerRealName"] == null
            ? null
            : json["fileManagerRealName"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "rostisserieBalance": rostisserieBalance,
        "rostisserieBalanceId":
            rostisserieBalanceId == null ? null : rostisserieBalanceId,
        "fileManagerId": fileManagerId == null ? null : fileManagerId,
        "fileManagerName": fileManagerName == null ? null : fileManagerName,
        "fileManagerExtension":
            fileManagerExtension == null ? null : fileManagerExtension,
        "fileManagerRealName":
            fileManagerRealName == null ? null : fileManagerRealName,
        "id": id == null ? null : id,
      };
}

class RostisserieBalanceProduct {
  RostisserieBalanceProduct({
    required this.rostisserieBalance,
    required this.rostisserieBalanceId,
    required this.productId,
    required this.productName,
    required this.total,
    required this.stock,
    required this.changesPending,
    required this.observations,
    required this.unitPrice,
    required this.id,
  });

  dynamic rostisserieBalance;
  int? rostisserieBalanceId;
  int? productId;
  String? productName;
  double? total;
  double? stock;
  double? changesPending;
  String? observations;
  double? unitPrice;
  int? id;

  factory RostisserieBalanceProduct.fromJson(Map<String, dynamic> json) =>
      RostisserieBalanceProduct(
        rostisserieBalance: json["rostisserieBalance"],
        rostisserieBalanceId: json["rostisserieBalanceId"] == null
            ? null
            : json["rostisserieBalanceId"],
        productId: json["productId"] == null ? null : json["productId"],
        productName: json["productName"] == null ? null : json["productName"],
        total: json["total"] == null ? null : json["total"],
        stock: json["stock"] == null ? null : json["stock"],
        changesPending:
            json["changesPending"] == null ? null : json["changesPending"],
        observations:
            json["observations"] == null ? null : json["observations"],
        unitPrice:
            json["unitPrice"] == null ? null : json["unitPrice"].toDouble(),
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "rostisserieBalance": rostisserieBalance,
        "rostisserieBalanceId":
            rostisserieBalanceId == null ? null : rostisserieBalanceId,
        "productId": productId == null ? null : productId,
        "productName": productName == null ? null : productName,
        "total": total == null ? null : total,
        "stock": stock == null ? null : stock,
        "changesPending": changesPending == null ? null : changesPending,
        "observations": observations == null ? null : observations,
        "unitPrice": unitPrice == null ? null : unitPrice,
        "id": id == null ? null : id,
      };
}
