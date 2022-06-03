import 'package:cinepolis/data/models/entities/movies/movies.model.dart';

class ShoppingTicketModel {
  ShoppingTicketModel({
      this.id, 
      this.userId, 
      this.horarios, 
      this.fCreation, 
      this.isPaid, 
      this.asiento, 
      this.costo, 
      this.isAdult,});

  ShoppingTicketModel.fromJson(dynamic json) {
    id = json['id'];
    userId = json['userId'];
    horarios = json['horarios'] != null ? Horarios.fromJson(json['horarios']) : null;
    fCreation = json['fCreation'];
    isPaid = json['isPaid'];
    asiento = json['asiento'];
    costo = json['costo'];
    isAdult = json['isAdult'];
  }
  int? id;
  int? userId;
  Horarios? horarios;
  String? fCreation;
  bool? isPaid;
  String? asiento;
  double? costo;
  bool? isAdult;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['userId'] = userId;
    if (horarios != null) {
      map['horarios'] = horarios?.toJson();
    }
    map['fCreation'] = fCreation;
    map['isPaid'] = isPaid;
    map['asiento'] = asiento;
    map['costo'] = costo;
    map['isAdult'] = isAdult;
    return map;
  }

}

class Horarios {
  Horarios({
      this.id, 
      this.inicia, 
      this.isEspanish, 
      this.pelicula, 
      this.sala,});

  Horarios.fromJson(dynamic json) {
    id = json['id'];
    inicia = json['inicia'];
    isEspanish = json['isEspanish'];
    pelicula = json['pelicula'] != null ? MoviesModel.fromJson(json['pelicula']) : null;
    sala = json['sala'] != null ? Sala.fromJson(json['sala']) : null;
  }
  int? id;
  String? inicia;
  bool? isEspanish;
  MoviesModel? pelicula;
  Sala? sala;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['inicia'] = inicia;
    map['isEspanish'] = isEspanish;
    if (pelicula != null) {
      map['pelicula'] = pelicula?.toJson();
    }
    if (sala != null) {
      map['sala'] = sala?.toJson();
    }
    return map;
  }

}

class Sala {
  Sala({
      this.id, 
      this.sala, 
      this.capacidad, 
      this.idSucursal, 
      this.ocupados,});

  Sala.fromJson(dynamic json) {
    id = json['id'];
    sala = json['sala'];
    capacidad = json['capacidad'];
    idSucursal = json['idSucursal'];
    ocupados = json['ocupados'];
  }
  int? id;
  int? sala;
  int? capacidad;
  int? idSucursal;
  int? ocupados;
Sala copyWith({  int? id,
  int? sala,
  int? capacidad,
  int? idSucursal,
  int? ocupados,
}) => Sala(  id: id ?? this.id,
  sala: sala ?? this.sala,
  capacidad: capacidad ?? this.capacidad,
  idSucursal: idSucursal ?? this.idSucursal,
  ocupados: ocupados ?? this.ocupados,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['sala'] = sala;
    map['capacidad'] = capacidad;
    map['idSucursal'] = idSucursal;
    map['ocupados'] = ocupados;
    return map;
  }

}