class SeatingModel {
  SeatingModel({
  this.id,
  this.horarioId,
  this.carritoTicketId,
  this.nombreAsiento,
  this.costo,
  this.isAdult,});

  SeatingModel.fromJson(dynamic json) {
  id = json['id'];
  horarioId = json['horarioId'];
  carritoTicketId = json['carritoTicketId'];
  nombreAsiento = json['nombreAsiento'];
  costo = json['costo'];
  isAdult = json['isAdult'];
  }
  int? id;
  int? horarioId;
  int? carritoTicketId;
  String? nombreAsiento;
  double? costo;
  bool? isAdult;

  Map<String, dynamic> toJson() {
  final map = <String, dynamic>{};
  map['id'] = id;
  map['horarioId'] = horarioId;
  map['carritoTicketId'] = carritoTicketId;
  map['nombreAsiento'] = nombreAsiento;
  map['costo'] = costo;
  map['isAdult'] = isAdult;
  return map;
  }
}