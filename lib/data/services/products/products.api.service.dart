import 'package:cinepolis/core/values/enviroments.dart';
import 'package:cinepolis/data/models/entities/products/products.model.dart';
import 'package:cinepolis/data/models/entities/promotions/promotions.model.dart';
import 'package:cinepolis/data/models/enums/request_method.enum.dart';
import 'package:cinepolis/data/services/base.service.dart';
import 'package:cinepolis/data/services/products/products.contract.dart';

class ProductsApiService extends BaseService implements IProductsService {
  final String _recruitmentUrl = Environments.recruitmentUrl;

  @override
  Future<List<ProductsModel>> getAllProducts() async {
      var userJson = await provider.request<ProductsModel>(RequestMethod.get,
        "${_recruitmentUrl}api/products/all", //Aplicacion de postman de ricardo
        useDefaultUrl: false);
    return List<ProductsModel>.from(
        userJson.map((x) => ProductsModel.fromJson(x)));
  }

  @override
  Future<List<PromotionsModel>> getPromotions() async {
    var userJson = await provider.request<PromotionsModel>(RequestMethod.get,
        "${_recruitmentUrl}api/products/promotions", //Aplicacion de postman de ricardo
        useDefaultUrl: false);
    return List<PromotionsModel>.from(
        userJson.map((x) => PromotionsModel.fromJson(x)));
  }
}
