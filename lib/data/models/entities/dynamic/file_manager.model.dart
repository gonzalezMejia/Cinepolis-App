class FileManager {
  int? id;
  String name;
  String realName;
  String extension;
  String mimeType;
  int typeId;
  String creationDate;
  int statusId;
  int userCreate;
  String reference;
  int userModify;
  String modifyDate;

  FileManager(
      {required this.id,
      required this.name,
      required this.realName,
      required this.extension,
      required this.mimeType,
      required this.typeId,
      required this.creationDate,
      required this.statusId,
      required this.userCreate,
      required this.reference,
      required this.userModify,
      required this.modifyDate});

  factory FileManager.fromVoid() => FileManager(
      id: 0,
      name: '',
      realName: '',
      extension: '',
      mimeType: '',
      typeId: 0,
      creationDate: '',
      statusId: 0,
      userCreate: 0,
      reference: '',
      userModify: 0,
      modifyDate: '');

  factory FileManager.fromJson(Map<String, dynamic> json) => FileManager(
      id: json["id"] == null ? json["Id"] : null,
      name: json["name"],
      realName: json["realName"],
      extension: json["extension"],
      mimeType: json["mimeType"],
      typeId: json["typeId"],
      creationDate: json["creationDate"],
      statusId: json["statusId"],
      userCreate: json["userCreate"],
      reference: json["reference"],
      userModify: json["userModify"],
      modifyDate: json["modifyDate"]);

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["realName"] = realName;
    map["extension"] = extension;
    map["mimeType"] = mimeType;
    map["typeId"] = typeId;
    map["creationDate"] = creationDate;
    map["statusId"] = statusId;
    map["userCreate"] = userCreate;
    map["reference"] = reference;
    map["userModify"] = userModify;
    map["modifyDate"] = modifyDate;
    return map;
  }
}
