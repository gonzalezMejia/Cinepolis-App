class Invoice {
  Invoice({
    required this.rfc,
    required this.razonSocial,
    required this.email,
  });

  String rfc;
  String razonSocial;
  String email;

  factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
    rfc: json["rfc"],
    razonSocial: json["razonSocial"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "rfc": rfc,
    "razonSocial": razonSocial,
    "email": email,
  };
}

class InvoiceResponse {
int idDocumento;
String pdfLocation;
String xmlLocation;

InvoiceResponse({
required this.idDocumento,
required this.pdfLocation,
required this.xmlLocation});

factory InvoiceResponse.fromJson(dynamic json) =>InvoiceResponse(
    idDocumento: json['idDocumento'],
    pdfLocation: json['pdfLocation'],
    xmlLocation: json['xmlLocation']);

factory InvoiceResponse.fromVoid() => InvoiceResponse(
    idDocumento: 0,
    pdfLocation: '',
    xmlLocation: '');

Map<String, dynamic> toJson() {
  var map = <String, dynamic>{};
  map['idDocumento'] = idDocumento;
  map['pdfLocation'] = pdfLocation;
  map['xmlLocation'] = xmlLocation;
  return map;
}

}