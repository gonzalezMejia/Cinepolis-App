import 'package:cinepolis/data/models/entities/products/products.model.dart';
import 'package:cinepolis/data/models/entities/promotions/promotions.model.dart';

abstract class IProductsService {
  Future<List<ProductsModel>> getAllProducts();
  Future<List<PromotionsModel>> getPromotions();
}
