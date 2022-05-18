import 'dart:convert';
import 'package:Cinepolis/core/values/enviroments.dart';
import 'package:Cinepolis/data/models/entities/promotions/products.model.dart';
import 'package:Cinepolis/data/services/base.service.dart';
import 'package:Cinepolis/data/services/products/products.contract.dart';
import 'package:flutter/services.dart';

class ProductsApiService extends BaseService implements IProductsService {
  final String _recruitmentUrl = Environments.RECRUITMENT_URL;

  @override
  Future<List<ProductsModel>> getAllProducts() async {
    var userJson = json.decode(await rootBundle.loadString('assets/data/fake_invoice.json'));
 /*   var userJson = await provider.request<ProductsModel>(RequestMethod.get,
        "${_recruitmentUrl}api/Cinepolis/promotions", //Aplicacion de postman de ricardo
        useDefaultUrl: false);*/
    return List<ProductsModel>.from(
        userJson.map((x) => ProductsModel.fromJson(x)));
  }
}
