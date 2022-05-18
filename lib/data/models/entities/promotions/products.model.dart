class ProductsModel {
  ProductsModel({
      this.id, 
      this.descripcion, 
      this.producto, 
      this.precioV, 
      this.idCategoria, 
      this.photo,});

  ProductsModel.fromJson(dynamic json) {
    id = json['id'];
    descripcion = json['descripcion'];
    producto = json['producto'];
    precioV = json['precioV'];
    idCategoria = json['idCategoria'];
    photo = json['photo'];
  }
  int? id;
  String? descripcion;
  String? producto;
  double? precioV;
  int? idCategoria;
  String? photo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['descripcion'] = descripcion;
    map['producto'] = producto;
    map['precioV'] = precioV;
    map['idCategoria'] = idCategoria;
    map['photo'] = photo;
    return map;
  }

}