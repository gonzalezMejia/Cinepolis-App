class Employee2 {
  int employeeId = 0;
  int employeeNumber = 0;
  String completeName = '';
  dynamic phoneNumber = '';

  Employee2(
      {required this.employeeId,
      required this.employeeNumber,
      required this.completeName,
      required this.phoneNumber});

  factory Employee2.fromJson(dynamic json) =>
      Employee2(
        employeeId: json["employeeId"],
        employeeNumber: json["employeeNumber"],
        completeName: json["completeName"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["employeeId"] = employeeId;
    map["employeeNumber"] = employeeNumber;
    map["completeName"] = completeName;
    map["phoneNumber"] = phoneNumber;
    return map;
  }
}
