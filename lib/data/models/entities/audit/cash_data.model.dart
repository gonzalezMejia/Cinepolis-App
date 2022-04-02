// To parse this JSON data, do
//
//     final cashData = cashDataFromJson(jsonString);

import 'dart:convert';

CashData cashDataFromJson(String str) => CashData.fromJson(json.decode(str));

String cashDataToJson(CashData data) => json.encode(data.toJson());

class CashData {
  CashData({
    required this.totalSales,
    required this.initialBalance,
    required this.totalCash,
    required this.totalExpenses,
    required this.totalVoucher,
  });

  double? totalSales;
  double? initialBalance;
  double? totalCash;
  double? totalExpenses;
  double? totalVoucher;

  factory CashData.fromJson(Map<String, dynamic> json) => CashData(
        totalSales: json["totalSales"] == null ? null : json["totalSales"],
        initialBalance: json["initialBalance"] == null
            ? null
            : json["initialBalance"].toDouble(),
        totalCash: json["totalCash"] == null ? null : json["totalCash"],
        totalExpenses:
            json["totalExpenses"] == null ? null : json["totalExpenses"],
        totalVoucher:
            json["totalVoucher"] == null ? null : json["totalVoucher"],
      );

  Map<String, dynamic> toJson() => {
        "totalSales": totalSales == null ? null : totalSales,
        "initialBalance": initialBalance == null ? null : initialBalance,
        "totalCash": totalCash == null ? null : totalCash,
        "totalExpenses": totalExpenses == null ? null : totalExpenses,
        "totalVoucher": totalVoucher == null ? null : totalVoucher,
      };
}
