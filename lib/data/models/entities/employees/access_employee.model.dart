
class AccessEmployee {
  AccessEmployee({
    required this.accessTypeId,
    required this.accessType,
    required this.employeeId,
    required this.id,
    required this.creationDate,
    required this.userCreate,
    required this.modifyDate,
    required this.userModify,
  });

  int accessTypeId;
  String accessType;
  int employeeId;
  int id;
  DateTime creationDate;
  int userCreate;
  DateTime modifyDate;
  dynamic userModify;

  factory AccessEmployee.fromJson(Map<String, dynamic> json) => AccessEmployee(
    accessTypeId: json["accessTypeId"],
    accessType: json["accessType"],
    employeeId: json["employeeId"],
    id: json["id"],
    creationDate: DateTime.parse(json["creationDate"]),
    userCreate: json["userCreate"],
    modifyDate: json["modifyDate"],
    userModify: json["userModify"],
  );

  Map<String, dynamic> toJson() => {
    "accessTypeId": accessTypeId,
    "accessType": accessType,
    "employeeId": employeeId,
    "id": id,
    "creationDate": creationDate.toIso8601String(),
    "userCreate": userCreate,
    "modifyDate": modifyDate,
    "userModify": userModify,
  };
}
