import 'dart:convert';

import 'package:Cinepolis/data/models/entities/audit/rostisserie_detail.model.dart';
import 'package:Cinepolis/data/models/entities/audit/rostisserie_list.model.dart';
import 'package:Cinepolis/data/services/audit/audit.contract.dart';
import 'package:get/get.dart';

class RotisserieInventoryDetailController extends GetxController {
  late final IAuditService _auditService;

  var loadingList = false.obs;

//Listado
  RostisserieList items = RostisserieList.fromVoid();
  var detail = RostisserieDetail.fromVoid().obs;
  var sumTotalDifference = 0.0.obs;
  var sumTotalProduct = 0.0.obs;

  RotisserieInventoryDetailController(this._auditService);

  @override
  void onInit() async {
    super.onInit();
    Map<String, dynamic> valueMap = json.decode(Get.parameters.values.first!);
    items = RostisserieList.fromJson(valueMap);
    getDetail(items.id!);
  }

  getDetail(int folio) async {
    loadingList.value = true;
    detail.value = await _auditService.getRostisserieDetail(folio);
    loadingList.value = false;
    if (detail.value.rostisserieBalanceProducts!.length > 0) {
      totalDifferencePositiveAndNegative();
    }
  }

  double moneyDifferenceMultiplication(var unitPrice, var stock) {
    return unitPrice * stock;
  }

  double difference(var stock, var total) {
    return stock -= total;
  }

  totalDifferencePositiveAndNegative() {
    detail.value.rostisserieBalanceProducts!.forEach((element) {
      if (moneyDifferenceMultiplication(element.unitPrice, element.stock)
          .isNegative) {
        sumTotalProduct.value +=
            moneyDifferenceMultiplication(element.unitPrice, element.stock);
      } else {
        sumTotalDifference.value +=
            moneyDifferenceMultiplication(element.unitPrice, element.stock);
      }
    });
  }
}
