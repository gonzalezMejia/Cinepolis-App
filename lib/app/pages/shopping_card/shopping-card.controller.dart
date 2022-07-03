import 'package:cinepolis/core/routes/pages.dart';
import 'package:cinepolis/data/models/entities/products/shopping_product.model.dart';
import 'package:cinepolis/data/models/entities/tickets/shopping_ticket.model.dart';
import 'package:cinepolis/data/models/entities/users/user.model.dart';
import 'package:cinepolis/data/services/auth/auth.contract.dart';
import 'package:cinepolis/data/services/shopping_cart/shopping_card.contract.dart';
import 'package:get/get.dart';

class ShoppingCardController extends GetxController {
  late final IAuthService _service;
  late final IShoppingCardService _shoppingService;

  var user = User.fromVoid().obs;
  var tickets= <ShoppingTicketModel>[].obs;
  var products= <ShoppingProductModel>[].obs;
  var loading = true.obs;


  ShoppingCardController(this._service,this._shoppingService);

  @override
  void onInit() async {
    await _currentUser();
    super.onInit();
  }

  _currentUser() async {
    await _service.checkUser().then((value) async {
      user.value = value!;
      tickets.value=await _shoppingService.getTickets(user.value.id!,0);
      products.value=await _shoppingService.getProducts(user.value.id!,0);
      loading.value = false;
    });
  }

  onPayment(){
    Get.toNamed("${Routes.payment}?user=${user.value.id!}");
  }


}

class PaymentData {
  double total=0;
  List<ShoppingTicketModel> tickets=[];
  List<ShoppingProductModel>products=[];

  PaymentData(this.total,this.products,this.tickets);

  PaymentData.fromJson(dynamic json) {
    total = json['total'];
    json['tickets'].forEach((v) =>tickets.add(ShoppingTicketModel.fromJson(v)));
    json['products'].forEach((v) =>products.add(ShoppingProductModel.fromJson(v)));
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    map['tickets'] = tickets.map((v) => v.toJson()).toList();
    map['products'] = products.map((v) => v.toJson()).toList();
    return map;
  }

}
