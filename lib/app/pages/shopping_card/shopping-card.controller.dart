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
      tickets.value=await _shoppingService.getTickets(user.value.id,0);
      products.value=await _shoppingService.getProducts(user.value.id,0);
      loading.value = false;
    });
  }


}
