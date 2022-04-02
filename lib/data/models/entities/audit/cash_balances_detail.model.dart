class CashBalancesDetail {
  CashBalancesDetail(
      {this.branchId,
      this.businessTypeId,
      this.employeeDebitMissing,
      this.percentageRealDifference,
      this.comments,
      this.withoutDebitDifference,
      this.cashBalanceChest,
      this.cashBalanceCash,
      this.cashBalanceWithdrawal,
      this.cashBalanceTotal,
      this.cashBalanceCountings,
      this.totalB,
      this.totalGuardB,
      this.totalC,
      this.totalGuardC});

  CashBalancesDetail.fromJson(dynamic json) {
    branchId = json['branchId'];
    businessTypeId = json['businessTypeId'];
    employeeDebitMissing = json['employeeDebitMissing'];
    percentageRealDifference = json['percentageRealDifference'];
    comments = json['comments'];
    withoutDebitDifference = json['withoutDebitDifference'];
    cashBalanceChest = json['cashBalanceChest'] != null
        ? CashBalanceChest.fromJson(json['cashBalanceChest'])
        : null;
    cashBalanceCash = json['cashBalanceCash'] != null
        ? CashBalanceCash.fromJson(json['cashBalanceCash'])
        : null;
    cashBalanceWithdrawal = json['cashBalanceWithdrawal'] != null
        ? CashBalanceWithdrawal.fromJson(json['cashBalanceWithdrawal'])
        : null;
    cashBalanceTotal = json['cashBalanceTotal'] != null
        ? CashBalanceTotal.fromJson(json['cashBalanceTotal'])
        : null;
    if (json['cashBalanceCountings'] != null) {
      cashBalanceCountings = [];
      json['cashBalanceCountings'].forEach((v) {
        cashBalanceCountings?.add(CashBalanceCountings.fromJson(v));
      });
    }
    totalGuardB = 0;
    totalB = 0;
    totalGuardC = 0;
    totalC = 0;
  }

  int? branchId;
  int? businessTypeId;
  double? employeeDebitMissing;
  double? percentageRealDifference;
  String? comments;
  double? withoutDebitDifference;
  CashBalanceChest? cashBalanceChest;
  CashBalanceCash? cashBalanceCash;
  CashBalanceWithdrawal? cashBalanceWithdrawal;
  CashBalanceTotal? cashBalanceTotal;
  List<CashBalanceCountings>? cashBalanceCountings;
  double? totalGuardB;
  double? totalB;
  double? totalGuardC;
  double? totalC;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['branchId'] = branchId;
    map['businessTypeId'] = businessTypeId;
    map['employeeDebitMissing'] = employeeDebitMissing;
    map['percentageRealDifference'] = percentageRealDifference;
    map['comments'] = comments;
    map['withoutDebitDifference'] = withoutDebitDifference;
    if (cashBalanceChest != null) {
      map['cashBalanceChest'] = cashBalanceChest?.toJson();
    }
    if (cashBalanceCash != null) {
      map['cashBalanceCash'] = cashBalanceCash?.toJson();
    }
    if (cashBalanceWithdrawal != null) {
      map['cashBalanceWithdrawal'] = cashBalanceWithdrawal?.toJson();
    }
    if (cashBalanceTotal != null) {
      map['cashBalanceTotal'] = cashBalanceTotal?.toJson();
    }
    if (cashBalanceCountings != null) {
      map['cashBalanceCountings'] =
          cashBalanceCountings?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class CashBalanceCountings {
  CashBalanceCountings({
    this.cashBalanceId,
    this.cashBalance,
    this.denominationId,
    this.denomination,
    this.guard,
    this.cash,
    this.id,
  });

  CashBalanceCountings.fromJson(dynamic json) {
    cashBalanceId = json['cashBalanceId'];
    cashBalance = json['cashBalance'];
    denominationId = json['denominationId'];
    denomination = json['denomination'];
    guard = json['guard'];
    cash = json['cash'];
    id = json['id'];
  }

  int? cashBalanceId;
  dynamic cashBalance;
  int? denominationId;
  dynamic denomination;
  double? guard;
  double? cash;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cashBalanceId'] = cashBalanceId;
    map['cashBalance'] = cashBalance;
    map['denominationId'] = denominationId;
    map['denomination'] = denomination;
    map['guard'] = guard;
    map['cash'] = cash;
    map['id'] = id;
    return map;
  }
}

class CashBalanceTotal {
  CashBalanceTotal({
    this.cashBalanceId,
    this.cashBalance,
    this.cashTotal,
    this.expenseTotal,
    this.voucherTotal,
    this.balanceTotal,
    this.realDifference,
    this.id,
  });

  CashBalanceTotal.fromJson(dynamic json) {
    cashBalanceId = json['cashBalanceId'];
    cashBalance = json['cashBalance'];
    cashTotal = json['cashTotal'];
    expenseTotal = json['expenseTotal'];
    voucherTotal = json['voucherTotal'];
    balanceTotal = json['balanceTotal'];
    realDifference = json['realDifference'];
    id = json['id'];
  }

  int? cashBalanceId;
  dynamic cashBalance;
  double? cashTotal;
  double? expenseTotal;
  double? voucherTotal;
  double? balanceTotal;
  double? realDifference;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cashBalanceId'] = cashBalanceId;
    map['cashBalance'] = cashBalance;
    map['cashTotal'] = cashTotal;
    map['expenseTotal'] = expenseTotal;
    map['voucherTotal'] = voucherTotal;
    map['balanceTotal'] = balanceTotal;
    map['realDifference'] = realDifference;
    map['id'] = id;
    return map;
  }
}

class CashBalanceWithdrawal {
  CashBalanceWithdrawal({
    this.cashBalanceId,
    this.cashBalance,
    this.dayWithdrawals,
    this.administrativeExpense,
    this.coinInChest,
    this.others,
    this.subtotal,
    this.id,
  });

  CashBalanceWithdrawal.fromJson(dynamic json) {
    cashBalanceId = json['cashBalanceId'];
    cashBalance = json['cashBalance'];
    dayWithdrawals = json['dayWithdrawals'];
    administrativeExpense = json['administrativeExpense'];
    coinInChest = json['coinInChest'];
    others = json['others'];
    subtotal = json['subtotal'];
    id = json['id'];
  }

  int? cashBalanceId;
  dynamic cashBalance;
  double? dayWithdrawals;
  double? administrativeExpense;
  double? coinInChest;
  double? others;
  double? subtotal;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cashBalanceId'] = cashBalanceId;
    map['cashBalance'] = cashBalance;
    map['dayWithdrawals'] = dayWithdrawals;
    map['administrativeExpense'] = administrativeExpense;
    map['coinInChest'] = coinInChest;
    map['others'] = others;
    map['subtotal'] = subtotal;
    map['id'] = id;
    return map;
  }
}

class CashBalanceCash {
  CashBalanceCash({
    this.cashBalanceId,
    this.cashBalance,
    this.depositToComplete,
    this.totalSales,
    this.initialBalance,
    this.total,
    this.id,
  });

  CashBalanceCash.fromJson(dynamic json) {
    cashBalanceId = json['cashBalanceId'];
    cashBalance = json['cashBalance'];
    depositToComplete = json['depositToComplete'];
    totalSales = json['totalSales'];
    initialBalance = json['initialBalance'];
    total = json['total'];
    id = json['id'];
  }

  int? cashBalanceId;
  dynamic cashBalance;
  double? depositToComplete;
  double? totalSales;
  double? initialBalance;
  double? total;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cashBalanceId'] = cashBalanceId;
    map['cashBalance'] = cashBalance;
    map['depositToComplete'] = depositToComplete;
    map['totalSales'] = totalSales;
    map['initialBalance'] = initialBalance;
    map['total'] = total;
    map['id'] = id;
    return map;
  }
}

class CashBalanceChest {
  CashBalanceChest({
    this.cashBalanceId,
    this.cashBalance,
    this.pendingDeposit,
    this.yesterdayDeposit,
    this.yesterdayWithdrawal,
    this.depositToComplete,
    this.id,
  });

  CashBalanceChest.fromJson(dynamic json) {
    cashBalanceId = json['cashBalanceId'];
    cashBalance = json['cashBalance'];
    pendingDeposit = json['pendingDeposit'];
    yesterdayDeposit = json['yesterdayDeposit'];
    yesterdayWithdrawal = json['yesterdayWithdrawal'];
    depositToComplete = json['depositToComplete'];
    id = json['id'];
  }

  int? cashBalanceId;
  dynamic cashBalance;
  double? pendingDeposit;
  double? yesterdayDeposit;
  double? yesterdayWithdrawal;
  double? depositToComplete;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cashBalanceId'] = cashBalanceId;
    map['cashBalance'] = cashBalance;
    map['pendingDeposit'] = pendingDeposit;
    map['yesterdayDeposit'] = yesterdayDeposit;
    map['yesterdayWithdrawal'] = yesterdayWithdrawal;
    map['depositToComplete'] = depositToComplete;
    map['id'] = id;
    return map;
  }
}
