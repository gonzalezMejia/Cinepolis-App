class LocationsAvailableModel {
  LocationsAvailableModel({
      this.id, 
      this.inicia, 
      this.isEspanish, 
      this.salaId, 
      this.sala, 
      this.ocupados, 
      this.capacidad, 
      this.idSucursal, 
      this.branchName, 
      this.directionBranch,});

  LocationsAvailableModel.fromJson(dynamic json) {
    id = json['id'];
    inicia = json['inicia'];
    isEspanish = json['isEspanish'];
    salaId = json['salaId'];
    sala = json['sala'];
    ocupados = json['ocupados'];
    capacidad = json['capacidad'];
    idSucursal = json['idSucursal'];
    branchName = json['branchName'];
    directionBranch = json['directionBranch'];
  }
  int? id;
  String? inicia;
  bool? isEspanish;
  int? salaId;
  int? sala;
  int? ocupados;
  int? capacidad;
  int? idSucursal;
  String? branchName;
  String? directionBranch;
LocationsAvailableModel copyWith({  int? id,
  String? inicia,
  bool? isEspanish,
  int? salaId,
  int? sala,
  int? ocupados,
  int? capacidad,
  int? idSucursal,
  String? branchName,
  String? directionBranch,
}) => LocationsAvailableModel(  id: id ?? this.id,
  inicia: inicia ?? this.inicia,
  isEspanish: isEspanish ?? this.isEspanish,
  salaId: salaId ?? this.salaId,
  sala: sala ?? this.sala,
  ocupados: ocupados ?? this.ocupados,
  capacidad: capacidad ?? this.capacidad,
  idSucursal: idSucursal ?? this.idSucursal,
  branchName: branchName ?? this.branchName,
  directionBranch: directionBranch ?? this.directionBranch,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['inicia'] = inicia;
    map['isEspanish'] = isEspanish;
    map['salaId'] = salaId;
    map['sala'] = sala;
    map['ocupados'] = ocupados;
    map['capacidad'] = capacidad;
    map['idSucursal'] = idSucursal;
    map['branchName'] = branchName;
    map['directionBranch'] = directionBranch;
    return map;
  }

}