import 'package:cinepolis/data/models/entities/products/product.response.model.dart';
import 'package:cinepolis/data/models/entities/products/shopping_product.model.dart';
import 'package:cinepolis/data/models/entities/tickets/shopping_ticket.model.dart';

abstract class IShoppingCardService {
  Future<int> getCountShopping(int userId);
  Future<List<ShoppingTicketModel>> getTickets(int userId, int isPaid);
  Future<List<ShoppingProductModel>> getProducts(int userId, int isPaid);
  Future saveProducts(List<ProductResponseModel> products);
  Future saveTickets(ShoppingTicketModel tickets);
}
