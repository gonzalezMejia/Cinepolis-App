class RFCResponse {
  RFCResponse({
    required this.rfc,
    required this.razonSocial,
    required this.pais,
    this.numRegIdTrib,
    required this.email,
    required this.desgloseIeps,
    required this.usoCfdi,
  });

  String? rfc;
  String? razonSocial;
  String? pais;
  dynamic numRegIdTrib;
  String? email;
  bool? desgloseIeps;
  int? usoCfdi;

  factory RFCResponse.fromJson(Map<String, dynamic> json) => RFCResponse(
        rfc: json["rfc"] == null ? null : json["rfc"],
        razonSocial: json["razonSocial"] == null ? null : json["razonSocial"],
        pais: json["pais"] == null ? null : json["pais"],
        numRegIdTrib:
            json["numRegIDTrib"] == null ? null : json["numRegIDTrib"],
        email: json["email"] == null ? null : json["email"],
        desgloseIeps:
            json["desgloseIEPS"] == null ? null : json["desgloseIEPS"],
        usoCfdi: json["usoCFDI"] == null ? null : json["usoCFDI"],
      );

  Map<String, dynamic> toJson() => {
        "rfc": rfc,
        "razonSocial": razonSocial,
        "pais": pais,
        "numRegIDTrib": numRegIdTrib,
        "email": email,
        "desgloseIEPS": desgloseIeps,
        "usoCFDI": usoCfdi,
      };
}
