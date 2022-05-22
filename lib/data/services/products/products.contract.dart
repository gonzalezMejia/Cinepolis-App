import 'package:cinepolis/data/models/entities/promotions/products.model.dart';

abstract class IProductsService {
  Future<List<ProductsModel>> getAllProducts();
}
