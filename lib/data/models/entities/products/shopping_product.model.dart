import 'package:cinepolis/data/models/entities/products/products.model.dart';

class ShoppingProductModel {
  ShoppingProductModel({
      this.id, 
      this.userId, 
      this.productos, 
      this.fcreacion, 
      this.ispaid,});

  ShoppingProductModel.fromJson(dynamic json) {
    id = json['id'];
    userId = json['userId'];
    if (json['productos'] != null) {
      productos = [];
      json['productos'].forEach((v) {
        productos?.add(ProductsModel.fromJson(v));
      });
    }
    fcreacion = json['fcreacion'];
    ispaid = json['ispaid'];
  }
  int? id;
  int? userId;
  List<ProductsModel>? productos;
  String? fcreacion;
  bool? ispaid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['userId'] = userId;
    if (productos != null) {
      map['productos'] = productos?.map((v) => v.toJson()).toList();
    }
    map['fcreacion'] = fcreacion;
    map['ispaid'] = ispaid;
    return map;
  }

}