import 'package:cinepolis/data/models/entities/products/products.model.dart';
import 'package:cinepolis/data/services/products/products.contract.dart';
import 'package:get/get.dart';

class CandyStoreController extends GetxController {
  late final IProductsService _iProductsService;

  var products = <ProductsModel>[].obs;
  var loading = false.obs;

  CandyStoreController(this._iProductsService);

  @override
  void onInit() async {
    super.onInit();
    loading.value = true;
    products.value = await _iProductsService.getAllProducts();
    loading.value = false;
  }
}
