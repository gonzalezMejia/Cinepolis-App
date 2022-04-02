// To parse this JSON data, do
//
//     final accessMenu = accessMenuFromJson(jsonString);

import 'dart:convert';

List<AccessMenu> accessMenuFromJson(String str) =>
    List<AccessMenu>.from(json.decode(str).map((x) => AccessMenu.fromJson(x)));

String accessMenuToJson(List<AccessMenu> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AccessMenu {
  AccessMenu({
    required this.shortName,
    required this.fullName,
    required this.applicationType,
    required this.url,
    required this.exeLocation,
    required this.pathLogo,
    required this.roles,
    required this.menuItems,
    required this.statusId,
    required this.status,
    required this.isFavorite,
    required this.grantAccessId,
    required this.id,
    required this.creationDate,
    required this.modificationDate,
    required this.userCreate,
    required this.userModify,
  });

  String shortName;
  String fullName;
  int applicationType;
  String url;
  String exeLocation;
  String pathLogo;
  dynamic roles;
  dynamic menuItems;
  int statusId;
  dynamic status;
  bool isFavorite;
  int grantAccessId;
  int id;
  DateTime creationDate;
  DateTime modificationDate;
  int userCreate;
  int userModify;

  factory AccessMenu.fromJson(Map<String, dynamic> json) => AccessMenu(
        shortName: json["ShortName"],
        fullName: json["FullName"],
        applicationType: json["ApplicationType"],
        url: json["Url"],
        exeLocation: json["ExeLocation"],
        pathLogo: json["PathLogo"],
        roles: json["Roles"],
        menuItems: json["MenuItems"],
        statusId: json["StatusId"],
        status: json["Status"],
        isFavorite: json["IsFavorite"],
        grantAccessId: json["GrantAccessId"],
        id: json["Id"],
        creationDate: DateTime.parse(json["CreationDate"]),
        modificationDate: DateTime.parse(json["ModificationDate"]),
        userCreate: json["UserCreate"],
        userModify: json["UserModify"],
      );

  Map<String, dynamic> toJson() => {
        "ShortName": shortName,
        "FullName": fullName,
        "ApplicationType": applicationType,
        "Url": url,
        "ExeLocation": exeLocation,
        "PathLogo": pathLogo,
        "Roles": roles,
        "MenuItems": menuItems,
        "StatusId": statusId,
        "Status": status,
        "IsFavorite": isFavorite,
        "GrantAccessId": grantAccessId,
        "Id": id,
        "CreationDate": creationDate.toIso8601String(),
        "ModificationDate": modificationDate.toIso8601String(),
        "UserCreate": userCreate,
        "UserModify": userModify,
      };
}
