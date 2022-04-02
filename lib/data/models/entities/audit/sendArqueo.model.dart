// To parse this JSON data, do
//
//     final sendArqueo = sendArqueoFromJson(jsonString);

import 'dart:convert';

SendArqueo sendArqueoFromJson(String str) =>
    SendArqueo.fromJson(json.decode(str));

String sendArqueoToJson(SendArqueo data) => json.encode(data.toJson());

class SendArqueo {
  SendArqueo({
    required this.branchId,
    required this.businessTypeId,
    required this.employeeDebitMissing,
    required this.percentageRealDifference,
    required this.comments,
    required this.withoutDebitDifference,
    required this.cashBalanceChest,
    required this.cashBalanceCash,
    required this.cashBalanceWithdrawal,
    required this.cashBalanceTotal,
    required this.cashBalanceCountings,
  });

  double? branchId;
  double? businessTypeId;
  double? employeeDebitMissing;
  String? percentageRealDifference;
  String? comments;
  double? withoutDebitDifference;
  CashBalanceChest? cashBalanceChest;
  CashBalanceCash? cashBalanceCash;
  CashBalanceWithdrawal? cashBalanceWithdrawal;
  CashBalanceTotal? cashBalanceTotal;
  List<CashBalanceCounting>? cashBalanceCountings;

  factory SendArqueo.fromJson(Map<String, dynamic> json) => SendArqueo(
        branchId: json["branchId"] == null ? null : json["branchId"],
        businessTypeId:
            json["businessTypeId"] == null ? null : json["businessTypeId"],
        employeeDebitMissing: json["employeeDebitMissing"] == null
            ? null
            : json["employeeDebitMissing"],
        percentageRealDifference: json["percentageRealDifference"] == null
            ? null
            : json["percentageRealDifference"],
        comments: json["comments"] == null ? null : json["comments"],
        withoutDebitDifference: json["withoutDebitDifference"] == null
            ? null
            : json["withoutDebitDifference"],
        cashBalanceChest: json["cashBalanceChest"] == null
            ? null
            : CashBalanceChest.fromJson(json["cashBalanceChest"]),
        cashBalanceCash: json["cashBalanceCash"] == null
            ? null
            : CashBalanceCash.fromJson(json["cashBalanceCash"]),
        cashBalanceWithdrawal: json["cashBalanceWithdrawal"] == null
            ? null
            : CashBalanceWithdrawal.fromJson(json["cashBalanceWithdrawal"]),
        cashBalanceTotal: json["cashBalanceTotal"] == null
            ? null
            : CashBalanceTotal.fromJson(json["cashBalanceTotal"]),
        cashBalanceCountings: json["cashBalanceCountings"] == null
            ? null
            : List<CashBalanceCounting>.from(json["cashBalanceCountings"]
                .map((x) => CashBalanceCounting.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "branchId": branchId == null ? null : branchId,
        "businessTypeId": businessTypeId == null ? null : businessTypeId,
        "employeeDebitMissing":
            employeeDebitMissing == null ? null : employeeDebitMissing,
        "percentageRealDifference":
            percentageRealDifference == null ? null : percentageRealDifference,
        "comments": comments == null ? null : comments,
        "withoutDebitDifference":
            withoutDebitDifference == null ? null : withoutDebitDifference,
        "cashBalanceChest":
            cashBalanceChest == null ? null : cashBalanceChest!.toJson(),
        "cashBalanceCash":
            cashBalanceCash == null ? null : cashBalanceCash!.toJson(),
        "cashBalanceWithdrawal": cashBalanceWithdrawal == null
            ? null
            : cashBalanceWithdrawal!.toJson(),
        "cashBalanceTotal":
            cashBalanceTotal == null ? null : cashBalanceTotal!.toJson(),
        "cashBalanceCountings": cashBalanceCountings == null
            ? null
            : List<dynamic>.from(cashBalanceCountings!.map((x) => x.toJson())),
      };
}

class CashBalanceCash {
  CashBalanceCash({
    required this.depositToComplete,
    required this.totalSales,
    required this.initialBalance,
    required this.total,
  });

  double? depositToComplete;
  double? totalSales;
  double? initialBalance;
  double? total;

  factory CashBalanceCash.fromJson(Map<String, dynamic> json) =>
      CashBalanceCash(
        depositToComplete: json["depositToComplete"] == null
            ? null
            : json["depositToComplete"],
        totalSales: json["totalSales"] == null ? null : json["totalSales"],
        initialBalance:
            json["initialBalance"] == null ? null : json["initialBalance"],
        total: json["total"] == null ? null : json["total"],
      );

  Map<String, dynamic> toJson() => {
        "depositToComplete":
            depositToComplete == null ? null : depositToComplete,
        "totalSales": totalSales == null ? null : totalSales,
        "initialBalance": initialBalance == null ? null : initialBalance,
        "total": total == null ? null : total,
      };
}

class CashBalanceChest {
  CashBalanceChest({
    required this.pendingDeposit,
    required this.yesterdayDeposit,
    required this.yesterdayWithdrawal,
    required this.addToWithdrawal,
    required this.depositToComplete,
  });

  double? pendingDeposit;
  double? yesterdayDeposit;
  double? yesterdayWithdrawal;
  double? addToWithdrawal;
  double? depositToComplete;

  factory CashBalanceChest.fromJson(Map<String, dynamic> json) =>
      CashBalanceChest(
        pendingDeposit:
            json["pendingDeposit"] == null ? null : json["pendingDeposit"],
        yesterdayDeposit:
            json["yesterdayDeposit"] == null ? null : json["yesterdayDeposit"],
        yesterdayWithdrawal: json["yesterdayWithdrawal"] == null
            ? null
            : json["yesterdayWithdrawal"],
        addToWithdrawal:
            json["addToWithdrawal"] == null ? null : json["addToWithdrawal"],
        depositToComplete: json["depositToComplete"] == null
            ? null
            : json["depositToComplete"],
      );

  Map<String, dynamic> toJson() => {
        "pendingDeposit": pendingDeposit == null ? null : pendingDeposit,
        "yesterdayDeposit": yesterdayDeposit == null ? null : yesterdayDeposit,
        "yesterdayWithdrawal":
            yesterdayWithdrawal == null ? null : yesterdayWithdrawal,
        "addToWithdrawal": addToWithdrawal == null ? null : addToWithdrawal,
        "depositToComplete":
            depositToComplete == null ? null : depositToComplete,
      };
}

class CashBalanceCounting {
  CashBalanceCounting({
    required this.id,
    required this.name,
    required this.denominationTypeId,
    required this.guard,
    required this.cash,
  });

  double? id;
  String? name;
  double? denominationTypeId;
  double? guard;
  double? cash;

  factory CashBalanceCounting.fromJson(Map<String, dynamic> json) =>
      CashBalanceCounting(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        denominationTypeId: json["denominationTypeId"] == null
            ? null
            : json["denominationTypeId"],
        guard: json["guard"] == null ? null : json["guard"],
        cash: json["cash"] == null ? null : json["cash"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "denominationTypeId":
            denominationTypeId == null ? null : denominationTypeId,
        "guard": guard == null ? null : guard,
        "cash": cash == null ? null : cash,
      };
}

class CashBalanceTotal {
  CashBalanceTotal({
    required this.cashTotal,
    required this.expenseTotal,
    required this.voucherTotal,
    required this.balanceTotal,
    required this.realDifference,
  });

  double? cashTotal;
  double? expenseTotal;
  double? voucherTotal;
  double? balanceTotal;
  double? realDifference;

  factory CashBalanceTotal.fromJson(Map<String, dynamic> json) =>
      CashBalanceTotal(
        cashTotal: json["cashTotal"] == null ? null : json["cashTotal"],
        expenseTotal:
            json["expenseTotal"] == null ? null : json["expenseTotal"],
        voucherTotal:
            json["voucherTotal"] == null ? null : json["voucherTotal"],
        balanceTotal:
            json["balanceTotal"] == null ? null : json["balanceTotal"],
        realDifference:
            json["realDifference"] == null ? null : json["realDifference"],
      );

  Map<String, dynamic> toJson() => {
        "cashTotal": cashTotal == null ? null : cashTotal,
        "expenseTotal": expenseTotal == null ? null : expenseTotal,
        "voucherTotal": voucherTotal == null ? null : voucherTotal,
        "balanceTotal": balanceTotal == null ? null : balanceTotal,
        "realDifference": realDifference == null ? null : realDifference,
      };
}

class CashBalanceWithdrawal {
  CashBalanceWithdrawal({
    required this.dayWithdrawals,
    required this.administrativeExpense,
    required this.coinInChest,
    required this.others,
    required this.subtotal,
  });

  double? dayWithdrawals;
  double? administrativeExpense;
  double? coinInChest;
  double? others;
  double? subtotal;

  factory CashBalanceWithdrawal.fromJson(Map<String, dynamic> json) =>
      CashBalanceWithdrawal(
        dayWithdrawals:
            json["dayWithdrawals"] == null ? null : json["dayWithdrawals"],
        administrativeExpense: json["administrativeExpense"] == null
            ? null
            : json["administrativeExpense"],
        coinInChest: json["coinInChest"] == null ? null : json["coinInChest"],
        others: json["others"] == null ? null : json["others"],
        subtotal: json["subtotal"] == null ? null : json["subtotal"],
      );

  Map<String, dynamic> toJson() => {
        "dayWithdrawals": dayWithdrawals == null ? null : dayWithdrawals,
        "administrativeExpense":
            administrativeExpense == null ? null : administrativeExpense,
        "coinInChest": coinInChest == null ? null : coinInChest,
        "others": others == null ? null : others,
        "subtotal": subtotal == null ? null : subtotal,
      };
}
