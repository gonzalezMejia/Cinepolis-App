import 'dart:convert';

import 'package:Cinepolis/app/utils/msg.utils.dart';
import 'package:Cinepolis/core/routes/pages.dart';
import 'package:Cinepolis/data/models/entities/audit/rostisserie_list.model.dart';
import 'package:Cinepolis/data/models/entities/branches/branch.model.dart';
import 'package:Cinepolis/data/services/audit/audit.contract.dart';
import 'package:Cinepolis/data/services/branch/branch.contract.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RotisserieInventoryController extends GetxController {
  late final IAuditService _auditService;
  late final IBranchService _branchService;

  var loading = false.obs;

  //sucursal
  var branches = <Branch?>[].obs;
  var selectBranchId = 0.obs;

//Listado
  var rostisserieBalance = <RostisserieList>[].obs;

  var textController = TextEditingController(text: "").obs;

  RotisserieInventoryController(this._branchService, this._auditService);

  @override
  void onInit() async {
    super.onInit();
    loading.value = true;
    getBranches();
  }

  getBranches() async {
    await _branchService.getAll().then((value) {
      branches.value = value;
    });

    loading.value = false;
  }

  Iterable<Branch?> getAllBranch(String value) {
    Iterable<Branch?> filter = [];
    if (value == "") {
      return filter = branches;
    } else {
      filter = branches.where((element) =>
          element!.descripcion.toLowerCase().contains(value.toLowerCase()) ||
          element.idUnidadOperativa.toString().contains(value.toLowerCase()));

      return filter;
    }
  }

  getRostisserieBalances(int branch) async {
    loading.value = true;
    _auditService
        .getAllByBrachRotisserie(branch)
        .then((value) => rostisserieBalance.value = value);
    loading.value = false;
  }

  getToDetails(var item) {
    var encode = jsonEncode(item);
    Get.toNamed("${Routes.ROTISSERIE_INVENTORY_DETAIL}?itemDetail=$encode");
  }

  onBranchSelect(int? id) {
    loading.value = true;
    if (id == null) return;
    selectBranchId.value = id;
    getRostisserieBalances(selectBranchId.value);
    loading.value = false;
  }

  onNewInventory() => selectBranchId.value != 0
      ? Get.toNamed(
          "${Routes.ROTISSERIE_INVENTORY_NEW}?branchId=$selectBranchId")
      : SnackUtils.error("Debes de Seleccionar una Sucursal", "Advertencía");
}
