class MoviesModel {
  MoviesModel({
      this.id, 
      this.nombre, 
      this.categorias, 
      this.duracion, 
      this.traierUrl, 
      this.costo, 
      this.sinopsis, 
      this.clasificacion, 
      this.actores, 
      this.directores, 
      this.isEstreno,});

  MoviesModel.fromJson(dynamic json) {
    id = json['id'];
    nombre = json['nombre'];
    categorias = json['categorias'];
    duracion = json['duracion'];
    traierUrl = json['traierUrl'];
    costo = json['costo'];
    sinopsis = json['sinopsis'];
    clasificacion = json['clasificacion'];
    actores = json['actores'];
    directores = json['directores'];
    isEstreno = json['isEstreno'];
  }
  int? id;
  String? nombre;
  String? categorias;
  int? duracion;
  String? traierUrl;
  double? costo;
  String? sinopsis;
  String? clasificacion;
  String? actores;
  String? directores;
  bool? isEstreno;
MoviesModel copyWith({  int? id,
  String? nombre,
  String? categorias,
  int? duracion,
  String? traierUrl,
  double? costo,
  String? sinopsis,
  String? clasificacion,
  String? actores,
  String? directores,
  bool? isEstreno,
}) => MoviesModel(  id: id ?? this.id,
  nombre: nombre ?? this.nombre,
  categorias: categorias ?? this.categorias,
  duracion: duracion ?? this.duracion,
  traierUrl: traierUrl ?? this.traierUrl,
  costo: costo ?? this.costo,
  sinopsis: sinopsis ?? this.sinopsis,
  clasificacion: clasificacion ?? this.clasificacion,
  actores: actores ?? this.actores,
  directores: directores ?? this.directores,
  isEstreno: isEstreno ?? this.isEstreno,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['nombre'] = nombre;
    map['categorias'] = categorias;
    map['duracion'] = duracion;
    map['traierUrl'] = traierUrl;
    map['costo'] = costo;
    map['sinopsis'] = sinopsis;
    map['clasificacion'] = clasificacion;
    map['actores'] = actores;
    map['directores'] = directores;
    map['isEstreno'] = isEstreno;
    return map;
  }

}