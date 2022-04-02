// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

List<NewsModel> newsModelFromJson(String str) =>
    List<NewsModel>.from(json.decode(str).map((x) => NewsModel.fromJson(x)));

String newsModelToJson(List<NewsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsModel {
  NewsModel({
    required this.idCampania,
    required this.nombre,
    required this.descripcion,
    required this.tiempo,
    required this.idAviso,
    required this.tipoAviso,
    required this.nombre1,
    required this.descripcion1,
    required this.nombreArchivo,
    required this.urlArchivo,
  });

  int? idCampania;
  String? nombre;
  String? descripcion;
  int? tiempo;
  int? idAviso;
  int? tipoAviso;
  String? nombre1;
  String? descripcion1;
  String? nombreArchivo;
  String? urlArchivo;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        idCampania: json["idCampania"] == null ? null : json["idCampania"],
        nombre: json["nombre"] == null ? null : json["nombre"],
        descripcion: json["descripcion"] == null ? null : json["descripcion"],
        tiempo: json["tiempo"] == null ? null : json["tiempo"],
        idAviso: json["idAviso"] == null ? null : json["idAviso"],
        tipoAviso: json["tipoAviso"] == null ? null : json["tipoAviso"],
        nombre1: json["nombre1"] == null ? null : json["nombre1"],
        descripcion1:
            json["descripcion1"] == null ? null : json["descripcion1"],
        nombreArchivo:
            json["nombreArchivo"] == null ? null : json["nombreArchivo"],
        urlArchivo: json["urlArchivo"] == null ? null : json["urlArchivo"],
      );

  Map<String, dynamic> toJson() => {
        "idCampania": idCampania == null ? null : idCampania,
        "nombre": nombre == null ? null : nombre,
        "descripcion": descripcion == null ? null : descripcion,
        "tiempo": tiempo == null ? null : tiempo,
        "idAviso": idAviso == null ? null : idAviso,
        "tipoAviso": tipoAviso == null ? null : tipoAviso,
        "nombre1": nombre1 == null ? null : nombre1,
        "descripcion1": descripcion1 == null ? null : descripcion1,
        "nombreArchivo": nombreArchivo == null ? null : nombreArchivo,
        "urlArchivo": urlArchivo == null ? null : urlArchivo,
      };
}
