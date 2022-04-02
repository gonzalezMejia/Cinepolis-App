import 'package:Cinepolis/app/pages/audit/cash_register/cash_register.controller.dart';
import 'package:Cinepolis/app/pages/audit/cash_register/new_archery/step_2/step2.page.dart';
import 'package:Cinepolis/app/utils/msg.utils.dart';
import 'package:Cinepolis/data/models/entities/audit/business_type.model.dart';
import 'package:Cinepolis/data/models/entities/audit/sendArqueo.model.dart';
import 'package:Cinepolis/data/models/entities/branches/branch.model.dart';
import 'package:Cinepolis/data/services/audit/audit.contract.dart';
import 'package:Cinepolis/data/services/branch/branch.contract.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NewArcheryController extends GetxController {
  late final IAuditService _auditService;
  late final IBranchService _branchService;

  NewArcheryController(this._auditService, this._branchService);

//Campos
  var controllerSearch = TextEditingController().obs;
  var depositPendingSend = TextEditingController(text: '0.0').obs;
  var deposit = TextEditingController(text: '0.0').obs;
  var sumWithdrawal = TextEditingController(text: '0.0').obs;
  var retreatsDay = TextEditingController(text: '0.0').obs;
  var messenger = TextEditingController(text: '0.0').obs;
  var currency = TextEditingController(text: '0.0').obs;
  var other = TextEditingController(text: '0.0').obs;
  var difference = TextEditingController(text: '0.0').obs;
  var yesterdayRetreats = TextEditingController(text: '0.0').obs;
  var observation = TextEditingController(text: '').obs;

  var subtotalRetreats = 0.0.obs;
  var totalTotales = 0.0.obs;
  var totalExpanses = 0.0.obs;
  var totalVoucher = 0.0.obs;
  var totalBox = 0.0.obs;
  var totalReal = 0.0.obs;
  var missingEmployee = 0.0.obs;
  var differencePercentage = 0.0.obs;
  var keyword = ''.obs;

//Listas
  var listBranch = <Branch?>[].obs;
  var listBusiness = <BusinessType>[].obs;

//Bools
  var loading = false.obs;
  var loadingCash = false.obs;
  var visibleBranch = true.obs;
  var visibleBusiness = false.obs;

// Combos
  var selectedBranchId = 0.obs;
  var selectedBusinessId = 0.obs;

//Result double
  var totalDepositoryToComplete = 0.0.obs;
  var date = 'Ingresa una fecha'.obs;
  var totalCash = 0.0.obs;
  var totalSaleDay = 0.0.obs;
  var openingChange = 0.0.obs;

//Step 2 Variables

// TextField Ticket Guard
  var ticketsGuardAmount20 = TextEditingController(text: '0.0').obs;
  var ticketsGuardAmount50 = TextEditingController(text: '0.0').obs;
  var ticketsGuardAmount100 = TextEditingController(text: '0.0').obs;
  var ticketsGuardAmount200 = TextEditingController(text: '0.0').obs;
  var ticketsGuardAmount500 = TextEditingController(text: '0.0').obs;
  var ticketsGuardAmount1000 = TextEditingController(text: '0.0').obs;

// Labels Ticket Guard
  var ticketsGuardTotalAmount20 = 0.0.obs;
  var ticketsGuardTotalAmount50 = 0.0.obs;
  var ticketsGuardTotalAmount100 = 0.0.obs;
  var ticketsGuardTotalAmount200 = 0.0.obs;
  var ticketsGuardTotalAmount500 = 0.0.obs;
  var ticketsGuardTotalAmount1000 = 0.0.obs;
  var ticketGuardTotalAmountGeneral = 0.0.obs;

// TextField Ticket Box
  var ticketsBoxAmount20 = TextEditingController(text: '0.0').obs;
  var ticketsBoxAmount50 = TextEditingController(text: '0.0').obs;
  var ticketsBoxAmount100 = TextEditingController(text: '0.0').obs;
  var ticketsBoxAmount200 = TextEditingController(text: '0.0').obs;
  var ticketsBoxAmount500 = TextEditingController(text: '0.0').obs;
  var ticketsBoxAmount1000 = TextEditingController(text: '0.0').obs;

// Labels Ticket Box
  var ticketsBoxTotalAmount20 = 0.0.obs;
  var ticketsBoxTotalAmount50 = 0.0.obs;
  var ticketsBoxTotalAmount100 = 0.0.obs;
  var ticketsBoxTotalAmount200 = 0.0.obs;
  var ticketsBoxTotalAmount500 = 0.0.obs;
  var ticketsBoxTotalAmount1000 = 0.0.obs;
  var ticketsBoxTotalAmountGeneral = 0.0.obs;

// TextField Coins Guard
  var coinsGuardAmount1 = TextEditingController(text: '0.0').obs;
  var coinsGuardAmount2 = TextEditingController(text: '0.0').obs;
  var coinsGuardAmount5 = TextEditingController(text: '0.0').obs;
  var coinsGuardAmount10 = TextEditingController(text: '0.0').obs;
  var coinsGuardAmount20 = TextEditingController(text: '0.0').obs;

// Labels Coins Guard
  var coinsGuardTotalAmount1 = 0.0.obs;
  var coinsGuardTotalAmount2 = 0.0.obs;
  var coinsGuardTotalAmount5 = 0.0.obs;
  var coinsGuardTotalAmount10 = 0.0.obs;
  var coinsGuardTotalAmount20 = 0.0.obs;
  var coinsGuardTotalAmountGeneral = 0.0.obs;

  // TextField Coins Box
  var coinsBoxAmount1 = TextEditingController(text: '0.0').obs;
  var coinsBoxAmount2 = TextEditingController(text: '0.0').obs;
  var coinsBoxAmount5 = TextEditingController(text: '0.0').obs;
  var coinsBoxAmount10 = TextEditingController(text: '0.0').obs;
  var coinsBoxAmount20 = TextEditingController(text: '0.0').obs;

// Labels Coins Box
  var coinsBoxTotalAmount1 = 0.0.obs;
  var coinsBoxTotalAmount2 = 0.0.obs;
  var coinsBoxTotalAmount5 = 0.0.obs;
  var coinsBoxTotalAmount10 = 0.0.obs;
  var coinsBoxTotalAmount20 = 0.0.obs;
  var coinsBoxTotalAmountGeneral = 0.0.obs;

//Labels Grand Total
  var grandTotalTickets = 0.0.obs;
  var grandTotalCoins = 0.0.obs;

  var searchController = TextEditingController(text: "").obs;

  @override
  void onInit() async {
    super.onInit();
    loading.value = true;
    return await _branchService.getAll().then((value) {
      listBranch.value = value;
      if (listBranch.length > 0) {
        selectedBranchId.value = listBranch.first!.idUnidadOperativa;
      }
      getBusinessType();
      loading.value = false;
    });
  }

  Iterable<Branch?> getAllBranch(String value) {
    Iterable<Branch?> filter = [];
    if (value == "") {
      return filter = listBranch;
    } else {
      filter = listBranch.where((element) =>
          element!.descripcion.toLowerCase().contains(value.toLowerCase()) ||
          element.idUnidadOperativa.toString().contains(value.toLowerCase()));

      return filter;
    }
  }

  getBusinessType() async {
    listBusiness.value = await _auditService.getBusnisseType();
  }

  getDeposit(int branch, String date) async {
    var depo = await _auditService.getDeposit(branch, date);
    deposit.value.text = depo.deposit.toString();
    depositoryToComplete(deposit.value.text);
  }

  getCash(int branch, int busnisseType) async {
    loadingCash.value = true;
    var cashh = await _auditService.getCash(branch, busnisseType);

    totalTotales.value = cashh.totalCash!.toDouble();
    totalSaleDay.value = cashh.totalSales!.toDouble();
    openingChange.value = cashh.initialBalance!.toDouble();
    totalExpanses.value = cashh.totalExpenses!.toDouble();
    totalVoucher.value = cashh.totalVoucher!.toDouble();

    sumTotalCash();
    totalSum();
    loadingCash.value = false;
  }

  sumTotalCash() {
    totalCash.value = totalSaleDay.value +
        openingChange.value +
        totalDepositoryToComplete.value;
  }

  totalSum() {
    totalBox.value =
        totalSaleDay.value + totalExpanses.value + totalVoucher.value;
    totalReal.value = totalCash.value - totalBox.value;
  }

  changeBranch({int type = 0}) {
    visibleBusiness.value = true;
    selectedBranchId.value = type;

    if (selectedBusinessId > 0 && selectedBranchId > 0) {
      getCash(selectedBranchId.value, selectedBusinessId.value);
    }
  }

  changeBusiness({int type = 0}) {
    selectedBusinessId.value = type;

    if (selectedBusinessId > 0 && selectedBranchId > 0) {
      getCash(selectedBranchId.value, selectedBusinessId.value);
    }
  }

  bool validateCombo() {
    if (selectedBusinessId.value > 0 && selectedBranchId.value > 0) {
      return true;
    } else {
      return false;
    }
  }

  depositoryToComplete(String text) {
    if (text != "") {
      double operacion = (double.parse(depositPendingSend.value.text) +
          double.parse(deposit.value.text) -
          double.parse(yesterdayRetreats.value.text));
      totalDepositoryToComplete.value = operacion;
      sumTotalCash();
      totalSum();
    }
  }

  subTotRetreats(String text) {
    if (text != "") {
      double operacion = (double.parse(messenger.value.text) +
          double.parse(currency.value.text) +
          double.parse(other.value.text));

      subtotalRetreats.value = operacion;
    }
  }

  sumGuard() {
    yesterdayRetreats.value.text = (double.parse(sumWithdrawal.value.text) +
            double.parse(yesterdayRetreats.value.text))
        .toString();
    depositoryToComplete(yesterdayRetreats.value.text);
    sumWithdrawal.value.text = "0";
  }

  sumObservation(String text) {
    if (text != "") {
      missingEmployee.value =
          totalReal.value - double.parse(difference.value.text);

      var op = (totalCash.value * 100) / totalReal.value;
      if (op.isNaN || op.isInfinite) {
        differencePercentage.value = 0.0;
      } else {
        differencePercentage.value = op;
      }
    }
  }

  next() {
    if (selectedBranchId.value != 0) {
      if (observation.value.text.isNotEmpty) {
        if (observation.value.text.length < 15 ||
            observation.value.text.length > 120) {
          SnackUtils.error(
              "El mínimo de palabras es de 15 y el máximo de 120...",
              "Advertencia");
        } else {
          //Siguiente pagina
          Get.to(() => Step2Page());
        }
      } else {
        SnackUtils.error("Ingresa una Observación...", "Advertencia");
      }
    } else {
      SnackUtils.error("No has seleccionado ninguna sucursal", "Advertencia");
    }
  }

//Step2 Methods

  save() {
    loading.value = true;

    List<CashBalanceCounting> list = [
      CashBalanceCounting(
          id: 1,
          name: "20",
          denominationTypeId: 1,
          guard: ticketsGuardTotalAmount20.value,
          cash: ticketsBoxTotalAmount20.value),
      CashBalanceCounting(
          id: 2,
          name: "50",
          denominationTypeId: 1,
          guard: ticketsGuardTotalAmount50.value,
          cash: ticketsBoxTotalAmount50.value),
      CashBalanceCounting(
          id: 3,
          name: "100",
          denominationTypeId: 1,
          guard: ticketsGuardTotalAmount100.value,
          cash: ticketsBoxTotalAmount100.value),
      CashBalanceCounting(
          id: 4,
          name: "200",
          denominationTypeId: 1,
          guard: ticketsGuardTotalAmount200.value,
          cash: ticketsBoxTotalAmount200.value),
      CashBalanceCounting(
          id: 5,
          name: "500",
          denominationTypeId: 1,
          guard: ticketsGuardTotalAmount500.value,
          cash: ticketsBoxTotalAmount500.value),
      CashBalanceCounting(
          id: 6,
          name: "1000",
          denominationTypeId: 1,
          guard: ticketsGuardTotalAmount1000.value,
          cash: ticketsBoxTotalAmount1000.value),
      CashBalanceCounting(
          id: 7,
          name: "1",
          denominationTypeId: 2,
          guard: coinsGuardTotalAmount1.value,
          cash: coinsBoxTotalAmount1.value),
      CashBalanceCounting(
          id: 8,
          name: "2",
          denominationTypeId: 2,
          guard: coinsGuardTotalAmount2.value,
          cash: coinsBoxTotalAmount2.value),
      CashBalanceCounting(
          id: 9,
          name: "5",
          denominationTypeId: 2,
          guard: coinsGuardTotalAmount5.value,
          cash: coinsBoxTotalAmount5.value),
      CashBalanceCounting(
          id: 10,
          name: "10",
          denominationTypeId: 2,
          guard: coinsGuardTotalAmount10.value,
          cash: coinsBoxTotalAmount10.value),
      CashBalanceCounting(
          id: 11,
          name: "20",
          denominationTypeId: 2,
          guard: coinsGuardTotalAmount20.value,
          cash: coinsBoxTotalAmount20.value)
    ];

    var jsonData = SendArqueo(
        branchId: selectedBranchId.value.toDouble(),
        businessTypeId: selectedBusinessId.value.toDouble(),
        employeeDebitMissing: missingEmployee.value.toPrecision(2),
        percentageRealDifference:
            differencePercentage.value.toPrecision(2).toString(),
        comments: observation.value.text,
        withoutDebitDifference: double.parse(difference.value.text),
        cashBalanceChest: CashBalanceChest(
            pendingDeposit: double.parse(depositPendingSend.value.text),
            yesterdayDeposit: double.parse(deposit.value.text),
            yesterdayWithdrawal: double.parse(yesterdayRetreats.value.text),
            addToWithdrawal: 0,
            depositToComplete: totalDepositoryToComplete.value),
        cashBalanceCash: CashBalanceCash(
            depositToComplete: totalDepositoryToComplete.value,
            totalSales: totalSaleDay.value,
            initialBalance: openingChange.value,
            total: totalCash.value),
        cashBalanceWithdrawal: CashBalanceWithdrawal(
            dayWithdrawals: double.parse(retreatsDay.value.text),
            administrativeExpense: double.parse(messenger.value.text),
            coinInChest: double.parse(currency.value.text),
            others: double.parse(other.value.text),
            subtotal: subtotalRetreats.value),
        cashBalanceTotal: CashBalanceTotal(
            cashTotal: totalTotales.value,
            expenseTotal: totalExpanses.value,
            voucherTotal: totalVoucher.value,
            balanceTotal: totalBox.value,
            realDifference: totalReal.value.toPrecision(2)),
        cashBalanceCountings: list);

    _auditService.sendArqueo(jsonData).then((value) => value != null
        ? sucess()
        : SnackUtils.error("Sucedio un error inesperado...", "Advertencia"));
    loading.value = false;
  }

  sucess() {
    Get.back();
    Get.back(result: Get.find<CashRegisterController>().getBalances());
    SnackUtils.success("Arqueo agregado con exito...");
  }

  clean() {
    //Editext Ticket Guard
    ticketsGuardAmount20.value.text = '0.0';
    ticketsGuardAmount50.value.text = '0.0';
    ticketsGuardAmount100.value.text = '0.0';
    ticketsGuardAmount200.value.text = '0.0';
    ticketsGuardAmount500.value.text = '0.0';
    ticketsGuardAmount1000.value.text = '0.0';
    //Labels Ticket Guard
    ticketsGuardTotalAmount20.value = 0.0;
    ticketsGuardTotalAmount50.value = 0.0;
    ticketsGuardTotalAmount100.value = 0.0;
    ticketsGuardTotalAmount200.value = 0.0;
    ticketsGuardTotalAmount500.value = 0.0;
    ticketsGuardTotalAmount1000.value = 0.0;
    ticketGuardTotalAmountGeneral.value = 0.0;

    //Editext Ticket Box
    ticketsBoxAmount20.value.text = '0.0';
    ticketsBoxAmount50.value.text = '0.0';
    ticketsBoxAmount100.value.text = '0.0';
    ticketsBoxAmount200.value.text = '0.0';
    ticketsBoxAmount500.value.text = '0.0';
    ticketsBoxAmount1000.value.text = '0.0';
    //Labels Ticket Box
    ticketsBoxTotalAmount20.value = 0.0;
    ticketsBoxTotalAmount50.value = 0.0;
    ticketsBoxTotalAmount100.value = 0.0;
    ticketsBoxTotalAmount200.value = 0.0;
    ticketsBoxTotalAmount500.value = 0.0;
    ticketsBoxTotalAmount1000.value = 0.0;
    ticketsBoxTotalAmountGeneral.value = 0.0;

    //Editext Coins Guard
    coinsGuardAmount1.value.text = '0.0';
    coinsGuardAmount2.value.text = '0.0';
    coinsGuardAmount5.value.text = '0.0';
    coinsGuardAmount10.value.text = '0.0';
    coinsGuardAmount20.value.text = '0.0';
    //Labels Coins Guard
    coinsGuardTotalAmount1.value = 0.0;
    coinsGuardTotalAmount2.value = 0.0;
    coinsGuardTotalAmount5.value = 0.0;
    coinsGuardTotalAmount10.value = 0.0;
    coinsGuardTotalAmount20.value = 0.0;
    coinsGuardTotalAmountGeneral.value = 0.0;

    //Editext Coins Box
    coinsBoxAmount1.value.text = '0.0';
    coinsBoxAmount2.value.text = '0.0';
    coinsBoxAmount5.value.text = '0.0';
    coinsBoxAmount10.value.text = '0.0';
    coinsBoxAmount20.value.text = '0.0';
    //Labels Coins Box
    coinsBoxTotalAmount1.value = 0.0;
    coinsBoxTotalAmount2.value = 0.0;
    coinsBoxTotalAmount5.value = 0.0;
    coinsBoxTotalAmount10.value = 0.0;
    coinsBoxTotalAmount20.value = 0.0;
    coinsBoxTotalAmountGeneral.value = 0.0;

    //Grand Total
    grandTotalCoins.value = 0.0;
    grandTotalTickets.value = 0.0;
  }

  operationTicketsGuard(var cantidad) {
    switch (cantidad) {
      case 20:
        if (ticketsGuardTotalAmount20.value > 0.0) {
          var op = double.parse(ticketsGuardAmount20.value.text) *
              double.parse(cantidad.toString());

          ticketsGuardTotalAmount20.value += op;
        } else {
          ticketsGuardTotalAmount20.value =
              double.parse(ticketsGuardAmount20.value.text) *
                  double.parse(cantidad.toString());
        }
        break;
      case 50:
        if (ticketsGuardTotalAmount50.value > 0.0) {
          var op = double.parse(ticketsGuardAmount50.value.text) *
              double.parse(cantidad.toString());

          ticketsGuardTotalAmount50.value += op;
        } else {
          ticketsGuardTotalAmount50.value =
              double.parse(ticketsGuardAmount50.value.text) *
                  double.parse(cantidad.toString());
        }
        break;
      case 100:
        if (ticketsGuardTotalAmount100.value > 0.0) {
          var op = double.parse(ticketsGuardAmount100.value.text) *
              double.parse(cantidad.toString());

          ticketsGuardTotalAmount100.value += op;
        } else {
          ticketsGuardTotalAmount100.value =
              double.parse(ticketsGuardAmount100.value.text) *
                  double.parse(cantidad.toString());
        }
        break;
      case 200:
        if (ticketsGuardTotalAmount200.value > 0.0) {
          var op = double.parse(ticketsGuardAmount200.value.text) *
              double.parse(cantidad.toString());

          ticketsGuardTotalAmount200.value += op;
        } else {
          ticketsGuardTotalAmount200.value =
              double.parse(ticketsGuardAmount200.value.text) *
                  double.parse(cantidad.toString());
        }
        break;
      case 500:
        if (ticketsGuardTotalAmount500.value > 0.0) {
          var op = double.parse(ticketsGuardAmount500.value.text) *
              double.parse(cantidad.toString());

          ticketsGuardTotalAmount500.value += op;
        } else {
          ticketsGuardTotalAmount500.value =
              double.parse(ticketsGuardAmount500.value.text) *
                  double.parse(cantidad.toString());
        }

        break;
      case 1000:
        if (ticketsGuardTotalAmount1000.value > 0.0) {
          var op = double.parse(ticketsGuardAmount1000.value.text) *
              double.parse(cantidad.toString());

          ticketsGuardTotalAmount1000.value += op;
        } else {
          ticketsGuardTotalAmount1000.value =
              double.parse(ticketsGuardAmount1000.value.text) *
                  double.parse(cantidad.toString());
        }
        break;
    }

    ticketGuardTotalAmountGeneral.value = (ticketsGuardTotalAmount20.value +
            ticketsGuardTotalAmount50.value +
            ticketsGuardTotalAmount100.value +
            ticketsGuardTotalAmount200.value +
            ticketsGuardTotalAmount500.value +
            ticketsGuardTotalAmount1000.value)
        .toDouble();

    operationGrandTotal();
  }

  operationTicketsBox(var cantidad) {
    switch (cantidad) {
      case 20:
        if (ticketsBoxTotalAmount20.value > 0.0) {
          var op = double.parse(ticketsBoxAmount20.value.text) *
              double.parse(cantidad.toString());
          ticketsBoxTotalAmount20.value += op;
        } else {
          ticketsBoxTotalAmount20.value =
              double.parse(ticketsBoxAmount20.value.text) *
                  double.parse(cantidad.toString());
        }

        break;
      case 50:
        if (ticketsBoxTotalAmount50.value > 0.0) {
          var op = double.parse(ticketsBoxAmount50.value.text) *
              double.parse(cantidad.toString());
          ticketsBoxTotalAmount50.value += op;
        } else {
          ticketsBoxTotalAmount50.value =
              double.parse(ticketsBoxAmount50.value.text) *
                  double.parse(cantidad.toString());
        }

        break;
      case 100:
        if (ticketsBoxTotalAmount100.value > 0.0) {
          var op = double.parse(ticketsBoxAmount100.value.text) *
              double.parse(cantidad.toString());
          ticketsBoxTotalAmount100.value += op;
        } else {
          ticketsBoxTotalAmount100.value =
              double.parse(ticketsBoxAmount100.value.text) *
                  double.parse(cantidad.toString());
        }

        break;
      case 200:
        if (ticketsBoxTotalAmount200.value > 0.0) {
          var op = double.parse(ticketsBoxAmount200.value.text) *
              double.parse(cantidad.toString());
          ticketsBoxTotalAmount200.value += op;
        } else {
          ticketsBoxTotalAmount200.value =
              double.parse(ticketsBoxAmount200.value.text) *
                  double.parse(cantidad.toString());
        }

        break;
      case 500:
        if (ticketsBoxTotalAmount500.value > 0.0) {
          var op = double.parse(ticketsBoxAmount500.value.text) *
              double.parse(cantidad.toString());
          ticketsBoxTotalAmount500.value += op;
        } else {
          ticketsBoxTotalAmount500.value =
              double.parse(ticketsBoxAmount500.value.text) *
                  double.parse(cantidad.toString());
        }

        break;
      case 1000:
        if (ticketsBoxTotalAmount1000.value > 0.0) {
          var op = double.parse(ticketsBoxAmount1000.value.text) *
              double.parse(cantidad.toString());
          ticketsBoxTotalAmount1000.value += op;
        } else {
          ticketsBoxTotalAmount1000.value =
              double.parse(ticketsBoxAmount1000.value.text) *
                  double.parse(cantidad.toString());
        }

        break;
    }

    ticketsBoxTotalAmountGeneral.value = (ticketsBoxTotalAmount20.value +
            ticketsBoxTotalAmount50.value +
            ticketsBoxTotalAmount100.value +
            ticketsBoxTotalAmount200.value +
            ticketsBoxTotalAmount500.value +
            ticketsBoxTotalAmount1000.value)
        .toDouble();
    operationGrandTotal();
  }

  operationCoinsGuard(var cantidad) {
    switch (cantidad) {
      case 1:
        if (coinsGuardTotalAmount1.value > 0.0) {
          var op = double.parse(coinsGuardAmount1.value.text) *
              double.parse(cantidad.toString());
          coinsGuardTotalAmount1.value += op;
        } else {
          coinsGuardTotalAmount1.value =
              double.parse(coinsGuardAmount1.value.text) *
                  double.parse(cantidad.toString());
        }

        break;
      case 2:
        if (coinsGuardTotalAmount2.value > 0.0) {
          var op = double.parse(coinsGuardAmount2.value.text) *
              double.parse(cantidad.toString());
          coinsGuardTotalAmount2.value += op;
        } else {
          coinsGuardTotalAmount2.value =
              double.parse(coinsGuardAmount2.value.text) *
                  double.parse(cantidad.toString());
        }

        break;
      case 5:
        if (coinsGuardTotalAmount5.value > 0.0) {
          var op = double.parse(coinsGuardAmount5.value.text) *
              double.parse(cantidad.toString());
          coinsGuardTotalAmount5.value += op;
        } else {
          coinsGuardTotalAmount5.value =
              double.parse(coinsGuardAmount5.value.text) *
                  double.parse(cantidad.toString());
        }

        break;
      case 10:
        if (coinsGuardTotalAmount10.value > 0.0) {
          var op = double.parse(coinsGuardAmount10.value.text) *
              double.parse(cantidad.toString());
          coinsGuardTotalAmount10.value += op;
        } else {
          coinsGuardTotalAmount10.value =
              double.parse(coinsGuardAmount10.value.text) *
                  double.parse(cantidad.toString());
        }
        break;
      case 20:
        if (coinsGuardTotalAmount20.value > 0.0) {
          var op = double.parse(coinsGuardAmount20.value.text) *
              double.parse(cantidad.toString());
          coinsGuardTotalAmount20.value += op;
        } else {
          coinsGuardTotalAmount20.value =
              double.parse(coinsGuardAmount20.value.text) *
                  double.parse(cantidad.toString());
        }
        break;
    }

    coinsGuardTotalAmountGeneral.value = (coinsGuardTotalAmount1.value +
            coinsGuardTotalAmount2.value +
            coinsGuardTotalAmount5.value +
            coinsGuardTotalAmount10.value +
            coinsGuardTotalAmount20.value)
        .toDouble();
    operationGrandTotal();
  }

  operationCoinsBox(var cantidad) {
    switch (cantidad) {
      case 1:
        if (coinsBoxTotalAmount1.value > 0.0) {
          var op = double.parse(coinsBoxAmount1.value.text) *
              double.parse(cantidad.toString());
          coinsBoxTotalAmount1.value += op;
        } else {
          coinsBoxTotalAmount1.value =
              double.parse(coinsBoxAmount1.value.text) *
                  double.parse(cantidad.toString());
        }

        break;
      case 2:
        if (coinsBoxTotalAmount2.value > 0.0) {
          var op = double.parse(coinsBoxAmount2.value.text) *
              double.parse(cantidad.toString());
          coinsBoxTotalAmount2.value += op;
        } else {
          coinsBoxTotalAmount2.value =
              double.parse(coinsBoxAmount2.value.text) *
                  double.parse(cantidad.toString());
        }

        break;
      case 5:
        if (coinsBoxTotalAmount5.value > 0.0) {
          var op = double.parse(coinsBoxAmount5.value.text) *
              double.parse(cantidad.toString());
          coinsBoxTotalAmount5.value += op;
        } else {
          coinsBoxTotalAmount5.value =
              double.parse(coinsBoxAmount5.value.text) *
                  double.parse(cantidad.toString());
        }

        break;
      case 10:
        if (coinsBoxTotalAmount10.value > 0.0) {
          var op = double.parse(coinsBoxAmount10.value.text) *
              double.parse(cantidad.toString());
          coinsBoxTotalAmount10.value += op;
        } else {
          coinsBoxTotalAmount10.value =
              double.parse(coinsBoxAmount10.value.text) *
                  double.parse(cantidad.toString());
        }

        break;
      case 20:
        if (coinsBoxTotalAmount20.value > 0.0) {
          var op = double.parse(coinsBoxAmount20.value.text) *
              double.parse(cantidad.toString());
          coinsBoxTotalAmount20.value += op;
        } else {
          coinsBoxTotalAmount20.value =
              double.parse(coinsBoxAmount20.value.text) *
                  double.parse(cantidad.toString());
        }

        break;
    }

    coinsBoxTotalAmountGeneral.value = (coinsBoxTotalAmount1.value +
            coinsBoxTotalAmount2.value +
            coinsBoxTotalAmount5.value +
            coinsBoxTotalAmount10.value +
            coinsBoxTotalAmount20.value)
        .toDouble();
    operationGrandTotal();
  }

  operationGrandTotal() {
    grandTotalTickets.value = (ticketGuardTotalAmountGeneral.value +
        ticketsBoxTotalAmountGeneral.value);
    grandTotalCoins.value =
        (coinsGuardTotalAmountGeneral.value + coinsBoxTotalAmountGeneral.value);
  }
}
