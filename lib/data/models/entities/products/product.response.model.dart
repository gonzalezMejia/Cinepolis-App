class ProductResponseModel {
  ProductResponseModel({
      this.id, 
      this.userId, 
      this.productId, 
      this.fCreation, 
      this.isPaid,});

  ProductResponseModel.fromJson(dynamic json) {
    id = json['id'];
    userId = json['userId'];
    productId = json['productId'];
    fCreation = json['fCreation'];
    isPaid = json['isPaid'];
  }
  int? id;
  int? userId;
  int? productId;
  String? fCreation;
  bool? isPaid;
ProductResponseModel copyWith({  int? id,
  int? userId,
  int? productId,
  String? fCreation,
  bool? isPaid,
}) => ProductResponseModel(  id: id ?? this.id,
  userId: userId ?? this.userId,
  productId: productId ?? this.productId,
  fCreation: fCreation ?? this.fCreation,
  isPaid: isPaid ?? this.isPaid,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['userId'] = userId;
    map['productId'] = productId;
    map['fCreation'] = fCreation;
    map['isPaid'] = isPaid;
    return map;
  }

}