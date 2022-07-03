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
  LocationsAvailableModel.fromVoid() {
    id = 0;
    inicia = "";
    isEspanish = false;
    salaId = 0;
    sala = 0;
    ocupados = 0;
    capacidad = 0;
    idSucursal =0;
    branchName = "";
    directionBranch = "";
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