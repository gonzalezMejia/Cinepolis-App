import 'dart:convert';

import 'package:cinepolis/app/pages/shopping_card/shopping-card.controller.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController{


var paymentModel= PaymentData(0,[],[]).obs;

  @override
  void onInit() async {
    paymentModel.value= PaymentData.fromJson(json.decode(Get.parameters.values.first!));
    super.onInit();
  }

}