import 'package:Cinepolis/app/pages/audit/cash_register/widgets/detail/balances.page.dart';
import 'package:Cinepolis/app/pages/audit/cash_register/widgets/detail/balances_detail.widget.dart';
import 'package:Cinepolis/app/pages/audit/cash_register/widgets/detail/bills.detail.widget.dart';
import 'package:Cinepolis/core/routes/pages.dart';
import 'package:Cinepolis/data/models/core/tab_item.dart';
import 'package:Cinepolis/data/models/entities/audit/cash_balances.model.dart';
import 'package:Cinepolis/data/models/entities/audit/cash_balances_detail.model.dart';
import 'package:Cinepolis/data/models/entities/branches/branch.model.dart';
import 'package:Cinepolis/data/models/entities/branches/branch_minified.model.dart';
import 'package:Cinepolis/data/services/audit/audit.contract.dart';
import 'package:Cinepolis/data/services/branch/branch.contract.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CashRegisterController extends GetxController {
  late final IAuditService _auditService;
  late final IBranchService _branchService;

  var loading = false.obs;

  var balancesList = <CashBalances?>[].obs;
  var branchList = <Branch?>[].obs;
  var listBusinessType = <BranchMinified>[
    BranchMinified(id: 0, description: 'Todos'),
    BranchMinified(id: 1, description: 'Panadería'),
    BranchMinified(id: 2, description: 'Rosticería')
  ];
  int selectedBusinessId = 0;
  int selectedBranchId = 0;
  List<TabItem> navigationItems = [];
  var searchController = TextEditingController(text: "").obs;

  CashRegisterController(this._auditService, this._branchService);

  @override
  void onInit() {
    super.onInit();
    getBranch();
    getBalances();
  }

  Iterable<Branch?> getAllBranch(String value) {
    Iterable<Branch?> filter = [];
    if (value == "") {
      return filter = branchList;
    } else {
      filter = branchList.where((element) =>
          element!.descripcion.toLowerCase().contains(value.toLowerCase()) ||
          element.idUnidadOperativa.toString().contains(value.toLowerCase()));

      return filter;
    }
  }

  getBalances({int type = 0}) async {
    selectedBusinessId = type;

    if (selectedBranchId > 0) {
      filterByBranch(selectedBusinessId, selectedBranchId);
    } else {
      loading.value = true;
      balancesList.value = await _auditService.getBalances(type);
      loading.value = false;
    }
  }

  getBranch() async {
    loading.value = true;
    branchList.value = await _branchService.getAll();
    loading.value = false;
  }

  filterByBranch(int type, int branch) async {
    loading.value = true;
    balancesList.value = await _auditService.getBalancesByBranch(type, branch);
    loading.value = false;
  }

  onBranchSelect(int? id) {
    loading.value = true;
    if (id == null) return;
    selectedBranchId = id;
    filterByBranch(selectedBusinessId, selectedBranchId);
    loading.value = false;
  }

  onNewBalance() {
    Get.toNamed(Routes.CASH_NEW);
  }

  onBalanceTap(CashBalances balance, BuildContext context) async {
    await _auditService.getBalanceDetail(balance.id!).then((balanceDetail) {
      List<Bills> listBills = [];
      List<Bills> listCoins = [];

      balanceDetail!.cashBalanceCountings!.forEach((element) {
        if (element.denominationId! <= 6) {
          listBills.add(Bills(
              element.denominationId!, element.guard!, element.cash!.toInt()));
          balanceDetail.totalGuardB =
              balanceDetail.totalGuardB! + element.guard!;
          balanceDetail.totalB =
              balanceDetail.totalB! + element.guard! + element.cash!;
        } else {
          listCoins.add(Bills(
              element.denominationId!, element.guard!, element.cash!.toInt()));
          balanceDetail.totalGuardC =
              balanceDetail.totalGuardC! + element.guard!;
          balanceDetail.totalC =
              balanceDetail.totalC! + element.guard! + element.cash!;
        }
      });
      _asignNames(context, listBills, listCoins, balanceDetail);
    });
  }

  void _asignNames(BuildContext context, List<Bills> listBills,
      List<Bills> listCoins, CashBalancesDetail balanceDetail) {
    listCoins.forEach((elementC) {
      listBills.forEach((elementB) {
        switch (elementB.denominationId) {
          case 1:
            elementB.denomination = "\$20.00";
            break;
          case 2:
            elementB.denomination = "\$50.00";
            break;
          case 3:
            elementB.denomination = "\$100.00";
            break;
          case 4:
            elementB.denomination = "\$200.00";
            break;
          case 5:
            elementB.denomination = "\$500.00";
            break;
          case 6:
            elementB.denomination = "\$1,000.00";
            break;
          default:
            elementB.denomination = "No especificado";
            break;
        }
        switch (elementC.denominationId) {
          case 7:
            elementC.denomination = "\$1.00";
            break;
          case 8:
            elementC.denomination = "\$2.00";
            break;
          case 9:
            elementC.denomination = "\$5.00";
            break;
          case 10:
            elementC.denomination = "\$10.00";
            break;
          case 11:
            elementC.denomination = "\$20.00";
            break;
          default:
            elementB.denomination = "No especificado";
            break;
        }
      });
    });

    navigationItems = [
      TabItem(Icons.savings_outlined, BalanceDetail(balanceDetail), "Caja"),
      TabItem(FontAwesomeIcons.dollarSign,
          BillsDetail(balanceDetail, listBills, listCoins), "Billetes"),
    ];
    Get.to(() => BalancesPage());
  }
}

class Bills {
  int denominationId;
  double guard;
  int box;
  String denomination;

  Bills(this.denominationId, this.guard, this.box, {this.denomination = ''});
}
