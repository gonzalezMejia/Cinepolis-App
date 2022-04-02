import 'package:Cinepolis/data/models/entities/dynamic/evidences.model.dart';
import 'package:flutter/material.dart';

class Rotisserie {
  Rotisserie({
    this.branchId,
    this.rostisserieBalanceProducts,
    this.rostisserieBalanceDocuments,
    this.rostisserieBalanceCash,
    this.date,
    this.id,
  });

  factory Rotisserie.fromVoid() => Rotisserie(
      branchId: 0,
      date: null,
      id: 0,
      rostisserieBalanceDocuments: [],
      rostisserieBalanceProducts: [],
      rostisserieBalanceCash: RostisserieBalanceCash.formVoid());

  Rotisserie.fromJson(dynamic json) {
    branchId = json['branchId'];
    if (json['rostisserieBalanceProducts'] != null) {
      rostisserieBalanceProducts = [];
      json['rostisserieBalanceProducts'].forEach((v) {
        rostisserieBalanceProducts?.add(RostisserieBalanceProducts.fromJson(v));
      });
    }
    if (json['rostisserieBalanceDocuments'] != null) {
      rostisserieBalanceDocuments = [];
      json['rostisserieBalanceDocuments'].forEach((v) {
        rostisserieBalanceDocuments?.add(Evidences.fromJson(v));
      });
    }
    if (json['rostisserieBalanceCash'] != null) {
      rostisserieBalanceCash = json['rostisserieBalanceCash'];
    } else {
      rostisserieBalanceCash = RostisserieBalanceCash.formVoid();
    }
    date = json["date"];
    id = json['id'];
  }

  int? branchId;
  List<RostisserieBalanceProducts>? rostisserieBalanceProducts;
  List<Evidences>? rostisserieBalanceDocuments;
  RostisserieBalanceCash? rostisserieBalanceCash;
  String? date;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['branchId'] = branchId;
    if (rostisserieBalanceProducts != null) {
      map['rostisserieBalanceProducts'] =
          rostisserieBalanceProducts?.map((v) => v.toJson()).toList();
    }
    if (rostisserieBalanceDocuments != null) {
      map['rostisserieBalanceDocuments'] =
          rostisserieBalanceDocuments?.map((v) => v.toJson()).toList();
    }
    map['rostisserieBalanceCash'] = rostisserieBalanceCash;
    map['date'] = date;
    map['id'] = id;
    return map;
  }
}

class RostisserieBalanceCash {
  RostisserieBalanceCash(
      {this.rostisserieBalance,
      this.rostisserieBalanceId,
      this.cashTotal,
      this.voucherTotal,
      this.saleTotal,
      this.borrowedChange,
      this.id,
      this.cashXCard,
      this.differenceTonnage});

  RostisserieBalanceCash.formVoid() {
    borrowedChange = 0;
    cashTotal = 0;
    id = 0;
    rostisserieBalance = "";
    rostisserieBalanceId = 0;
    saleTotal = 0;
    voucherTotal = 0;
    cashXCard = TextEditingController(text: "");
    differenceTonnage = TextEditingController(text: "");
  }
  RostisserieBalanceCash.fromJson(dynamic json) {
    rostisserieBalance = json['rostisserieBalance'];
    rostisserieBalanceId = json['rostisserieBalanceId'];
    cashTotal = json['cashTotal'];
    voucherTotal = json['voucherTotal'];
    saleTotal = json['saleTotal'];
    borrowedChange = json['borrowedChange'];
    id = json['id'];
    cashXCard = TextEditingController(text: "");
    differenceTonnage = TextEditingController(text: "");
  }

  dynamic rostisserieBalance;
  int? rostisserieBalanceId;
  double? cashTotal;
  double? voucherTotal;
  double? saleTotal;
  double? borrowedChange;
  int? id;
  TextEditingController? cashXCard;
  TextEditingController? differenceTonnage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rostisserieBalance'] = rostisserieBalance;
    map['rostisserieBalanceId'] = rostisserieBalanceId;
    map['cashTotal'] = cashTotal;
    map['voucherTotal'] = voucherTotal;
    map['saleTotal'] = saleTotal;
    map['borrowedChange'] = borrowedChange;
    map['id'] = id;
    return map;
  }
}

class RostisserieBalanceProducts {
  RostisserieBalanceProducts(
      {this.rostisserieBalance,
      this.rostisserieBalanceId,
      this.productId,
      this.productName,
      this.total,
      this.stock,
      this.changesPending,
      this.observations,
      this.unitPrice,
      this.id,
      this.physicalExistence,
      this.differenceParts,
      this.differencePesos});

  RostisserieBalanceProducts.fromJson(dynamic json) {
    rostisserieBalance = json['rostisserieBalance'];
    rostisserieBalanceId = json['rostisserieBalanceId'];
    productId = json['productId'];
    productName = json['productName'];
    total = json['total'];
    stock = json['stock'];
    changesPending = json['changesPending'];
    observations = json['observations'];
    unitPrice = json['unitPrice'];
    physicalExistence = 0;
    differenceParts = TextEditingController(text: "");
    differencePesos = TextEditingController(text: "");
    id = json['id'];
  }

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
  double? physicalExistence;
  TextEditingController? differenceParts;
  TextEditingController? differencePesos;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rostisserieBalance'] = rostisserieBalance;
    map['rostisserieBalanceId'] = rostisserieBalanceId;
    map['productId'] = productId;
    map['productName'] = productName;
    map['total'] = total;
    map['stock'] = stock;
    map['changesPending'] = changesPending;
    map['observations'] = observations;
    map['unitPrice'] = unitPrice;
    map['id'] = id;
    return map;
  }
}
