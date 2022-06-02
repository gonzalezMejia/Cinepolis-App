import 'dart:convert';

import 'package:cinepolis/core/values/enviroments.dart';
import 'package:cinepolis/data/models/entities/products/product.response.model.dart';
import 'package:cinepolis/data/models/entities/products/shopping_product.model.dart';
import 'package:cinepolis/data/models/entities/tickets/shopping_ticket.model.dart';
import 'package:cinepolis/data/models/entities/tickets/ticket.response.model.dart';
import 'package:cinepolis/data/models/enums/request_method.enum.dart';
import 'package:cinepolis/data/services/base.service.dart';
import 'package:cinepolis/data/services/shopping_cart/shopping_card.contract.dart';

class ShoppingCardApiService extends BaseService implements IShoppingCardService {
  final String _recruitmentUrl = Environments.recruitmentUrl;

  @override
  Future<int> getCountShopping(int userId) async{
    var userJson = await provider.request<int>(
        RequestMethod.get, '${_recruitmentUrl}api/carrito/count/2',
        useDefaultUrl: false);
    return int.tryParse(userJson.toString())??0;
  }

  @override
  Future<List<ShoppingProductModel>> getProducts(int userId, int isPaid) async{
    var userJson = await provider.request<ShoppingProductModel>(RequestMethod.get,
        "${_recruitmentUrl}api/carrito/products/$userId/$isPaid",
        useDefaultUrl: false);
    return List<ShoppingProductModel>.from(
        userJson.map((x) => ShoppingProductModel.fromJson(x)));
  }

  @override
  Future<List<ShoppingTicketModel>> getTickets(int userId, int isPaid) async{
    var userJson = await provider.request<ShoppingTicketModel>(RequestMethod.get,
        "${_recruitmentUrl}api/carrito/tickets/$userId/$isPaid",
        useDefaultUrl: false);
    return List<ShoppingTicketModel>.from(
        userJson.map((x) => ShoppingTicketModel.fromJson(x)));
  }

  @override
  Future saveProducts(List<ProductResponseModel> products)async {
    var body = json.encode(products.map((e) => e.toJson()));
    var userJson = await provider.request<dynamic>(
        RequestMethod.post, "${_recruitmentUrl}api/carrito/products",
        useDefaultUrl: false, body: body);

    var bodyResponse = json.decode(userJson.body);

    return bodyResponse;
  }

  @override
  Future saveTickets(List<TicketResponseModel> tickets)async {
    var body = json.encode(tickets.map((e) => e.toJson()));
    var userJson = await provider.request<dynamic>(
        RequestMethod.post, "${_recruitmentUrl}api/carrito/tickets",
        useDefaultUrl: false, body: body);

    var bodyResponse = json.decode(userJson.body);

    return bodyResponse;
  }


}
