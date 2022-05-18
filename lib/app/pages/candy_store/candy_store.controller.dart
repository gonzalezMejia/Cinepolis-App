import 'package:Cinepolis/data/models/entities/promotions/products.model.dart';
import 'package:Cinepolis/data/services/products/products.contract.dart';
import 'package:get/get.dart';

class CandyStoreController extends GetxController {
  late final IProductsService _iProductsService;

  var products=<ProductsModel>[].obs;
  CandyStoreController(this._iProductsService);

  @override
  void onInit() async {
    super.onInit();
    products.value = await _iProductsService.getAllProducts();
  }


}