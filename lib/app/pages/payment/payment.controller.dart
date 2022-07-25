import 'package:cinepolis/app/pages/shopping_card/shopping-card.controller.dart';
import 'package:cinepolis/app/utils/msg.utils.dart';
import 'package:cinepolis/core/routes/pages.dart';
import 'package:cinepolis/data/models/entities/dynamic/basic.model.dart';
import 'package:cinepolis/data/services/shopping_cart/shopping_card.contract.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController{
final IShoppingCardService _shoppingCardService;

var paymentModel= PaymentData(0,[],[]).obs;
var loading =true.obs;
var methodPaySelected= 0.obs;
var methods=<BasicModel>[BasicModel(id: 0, name: 'Selecciona'),BasicModel(id: 1, name: 'Tarjeta'),BasicModel(id: 2, name: 'PayPal'),BasicModel(id: 3, name: 'Efectivo')];

PaymentController(this._shoppingCardService);

  @override
  void onInit() async {
    super.onInit();
    var userId= int.parse(Get.parameters.values.first!);
    var total=0.0;
    paymentModel.value.products=await _shoppingCardService.getProducts(userId, 0);
    paymentModel.value.tickets=await _shoppingCardService.getTickets(userId, 0);
    paymentModel.value.tickets.forEach((element){
      var x= 0.0;
      element.asientos!.forEach((e){
      x=x+e.costo!;
      });
      total = total +x;
    });
    paymentModel.value.products.forEach((element){
      var x= 0.0;
      element.productos!.forEach((e){
        x=x+e.precioV!;
      });
      total = total +x;
    });
    paymentModel.value.total=total;
    loading.value=false;
  }

  onClosed() {
    Get.offNamedUntil(Routes.main, ModalRoute.withName(Routes.main));
    return true;
  }

  onPay() async{
    await _shoppingCardService.payTickets(
        paymentModel.value.tickets
    ).then((value) {
      Get.offNamedUntil(Routes.main, ModalRoute.withName(Routes.main));
      SnackUtils.success("¡Compra Exitosa!");
    }).onError((error, stackTrace) {
      print(error.toString());
      SnackUtils.error("Ah ocurrido un error, intentalo mas tarde", "Error");
    });

  }

}