class TicketResponseModel {
  TicketResponseModel({
      this.id, 
      this.userId, 
      this.horarioId, 
      this.fCreation, 
      this.isPaid, 
      this.asiento, 
      this.costo, 
      this.isAdult,});

  TicketResponseModel.fromJson(dynamic json) {
    id = json['id'];
    userId = json['userId'];
    horarioId = json['horarioId'];
    fCreation = json['fCreation'];
    isPaid = json['isPaid'];
    asiento = json['asiento'];
    costo = json['costo'];
    isAdult = json['isAdult'];
  }
  int? id;
  int? userId;
  int? horarioId;
  String? fCreation;
  bool? isPaid;
  String? asiento;
  double? costo;
  bool? isAdult;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['userId'] = userId;
    map['horarioId'] = horarioId;
    map['fCreation'] = fCreation;
    map['isPaid'] = isPaid;
    map['asiento'] = asiento;
    map['costo'] = costo;
    map['isAdult'] = isAdult;
    return map;
  }

}