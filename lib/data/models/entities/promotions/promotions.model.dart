class PromotionsModel {
  int? id;
  String? producto;
  String? descripcion;
  String? categoria;
  int? idCategoria;
  String? photo;
  int? precioV;

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['producto'] = this.producto;
    data['descripcion'] = this.descripcion;
    data['categoria'] = this.categoria;
    data['idCategoria'] = this.idCategoria;
    data['photo'] = this.photo;
    data['precioV'] = this.precioV;
    return data;
  }
}
