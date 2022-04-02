class Evidences {
  Evidences({
    required this.id,
    required this.fileManagerId,
    required this.fileManagerName,
    required this.fileManagerExtension,
    required this.fileManagerRealName,
    required this.mimeType,
  });

  int? id;
  int? fileManagerId;
  String? fileManagerName;
  String? fileManagerExtension;
  String? fileManagerRealName;
  String? mimeType;

  factory Evidences.fromJson(Map<String, dynamic> json) =>
      Evidences(
        id: json["id"] == null ? null : json["id"],
        fileManagerId:
        json["fileManagerId"] == null ? null : json["fileManagerId"],
        fileManagerName:
        json["fileManagerName"] == null ? null : json["fileManagerName"],
        fileManagerExtension: json["fileManagerExtension"] == null
            ? null
            : json["fileManagerExtension"],
        fileManagerRealName: json["fileManagerRealName"] == null
            ? null
            : json["fileManagerRealName"],
        mimeType: json["mimeType"] == null ? null : json["mimeType"],
      );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "fileManagerId": fileManagerId == null ? null : fileManagerId,
    "fileManagerName": fileManagerName == null ? null : fileManagerName,
    "fileManagerExtension":
    fileManagerExtension == null ? null : fileManagerExtension,
    "fileManagerRealName":
    fileManagerRealName == null ? null : fileManagerRealName,
    "mimeType": mimeType == null ? null : mimeType,
  };
}