// To parse this JSON data, do
//
//     final cashDeposit = cashDepositFromJson(jsonString);

import 'dart:convert';

CashDeposit cashDepositFromJson(String str) =>
    CashDeposit.fromJson(json.decode(str));

String cashDepositToJson(CashDeposit data) => json.encode(data.toJson());

class CashDeposit {
  CashDeposit({
    required this.deposit,
  });

  double? deposit;

  factory CashDeposit.fromJson(Map<String, dynamic> json) => CashDeposit(
        deposit: json["deposit"] == null ? null : json["deposit"],
      );

  Map<String, dynamic> toJson() => {
        "deposit": deposit == null ? null : deposit,
      };
}
