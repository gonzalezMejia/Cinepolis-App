class Branch {
  int idUnidadOperativa;
  String descripcion;
  String razonSocial;
  String rfc;
  String calle;
  String colonia;
  String delegacion;
  String cp;
  String numero;
  String estado;
  String telefono;
  String correo;
  String latitud;
  String longitud;
  int idEmpresa;
  bool isOnline;

  Branch({
      required this.idUnidadOperativa,
      required this.descripcion,
      required this.razonSocial,
      required this.rfc,
      required this.calle,
      required this.colonia,
      required this.delegacion,
      required this.cp,
      required this.numero,
      required this.estado,
      required this.telefono,
      required this.correo,
      required this.latitud,
      required this.longitud,
      required this.idEmpresa,
      required this.isOnline});

  factory Branch.fromVoid() =>Branch(
      idUnidadOperativa: 0,
      descripcion: "",
      razonSocial: "",
      rfc: "",
      calle: "",
      colonia: "",
      delegacion: "",
      cp: "",
      numero: "",
      estado: "",
      telefono: "",
      correo: "",
      latitud: "0.0",
      longitud: "",
      idEmpresa: 0,
      isOnline: false);

 factory Branch.fromJson(dynamic json) =>Branch(
     idUnidadOperativa: json["IdUnidadOperativa"], descripcion: json["Descripcion"],
     razonSocial: json["RazonSocial"],
     rfc: json["Rfc"], calle: json["Calle"],
     colonia: json["Colonia"], delegacion: json["Delegacion"], cp: json["CP"], numero: json["Numero"], estado: json["Estado"],
     telefono: json["Telefono"], correo: json["Correo"], latitud: json["Latitud"], longitud: json["Longitud"],
     idEmpresa: json["IdEmpresa"], isOnline: json["IsOnline"]);


  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["IdUnidadOperativa"] = idUnidadOperativa;
    map["Descripcion"] = descripcion;
    map["RazonSocial"] = razonSocial;
    map["Rfc"] = rfc;
    map["Calle"] = calle;
    map["Colonia"] = colonia;
    map["Delegacion"] = delegacion;
    map["CP"] = cp;
    map["Numero"] = numero;
    map["Estado"] = estado;
    map["Telefono"] = telefono;
    map["Correo"] = correo;
    map["Latitud"] = latitud;
    map["Longitud"] = longitud;
    map["IdEmpresa"] = idEmpresa;
    map["IsOnline"] = isOnline;
    return map;
  }

}