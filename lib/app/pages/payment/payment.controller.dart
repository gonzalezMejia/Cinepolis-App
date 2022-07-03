import 'package:cinepolis/app/pages/shopping_card/shopping-card.controller.dart';
import 'package:cinepolis/data/services/shopping_cart/shopping_card.contract.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController{
final IShoppingCardService _shoppingCardService;

var paymentModel= PaymentData(0,[],[]).obs;

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
  }

}