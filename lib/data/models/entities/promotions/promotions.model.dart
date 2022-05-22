class PromotionsModel {
  int? id;
  String? producto;
  String? descripcion;
  String? categoria;
  int? idCategoria;
  String? photo;
  double? precioV;

  PromotionsModel(
      {this.id,
      this.producto,
      this.descripcion,
      this.categoria,
      this.idCategoria,
      this.photo,
      this.precioV});

  PromotionsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    producto = json['producto'];
    descripcion = json['descripcion'];
    categoria = json['categoria'];
    idCategoria = json['idCategoria'];
    photo = json['photo'];
    precioV = json['precioV'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['producto'] = producto;
    data['descripcion'] = descripcion;
    data['categoria'] = categoria;
    data['idCategoria'] = idCategoria;
    data['photo'] = photo;
    data['precioV'] = precioV;
    return data;
  }
}
