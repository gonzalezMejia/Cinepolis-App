import 'dart:convert';
import 'package:cinepolis/core/values/enviroments.dart';
import 'package:cinepolis/data/models/entities/promotions/products.model.dart';
import 'package:cinepolis/data/services/base.service.dart';
import 'package:cinepolis/data/services/products/products.contract.dart';
import 'package:flutter/services.dart';

class ProductsApiService extends BaseService implements IProductsService {
  final String _recruitmentUrl = Environments.recruitmentUrl;

  @override
  Future<List<ProductsModel>> getAllProducts() async {
    var userJson = json
        .decode(await rootBundle.loadString('assets/data/fake_invoice.json'));
    /*   var userJson = await provider.request<ProductsModel>(RequestMethod.get,
        "${_recruitmentUrl}api/cinepolis/promotions", //Aplicacion de postman de ricardo
        useDefaultUrl: false);*/
    return List<ProductsModel>.from(
        userJson.map((x) => ProductsModel.fromJson(x)));
  }
}
