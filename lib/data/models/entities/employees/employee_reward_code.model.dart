class EmployeeRewardCode {
    EmployeeRewardCode({
        required this.employeeId,
        this.employee,
        required this.employeeCodeStatusId,
        this.employeeCodeStatus,
        required this.code,
        required this.endValidDate,
        required this.id,
    });

    int employeeId;
    dynamic employee;
    int employeeCodeStatusId;
    dynamic employeeCodeStatus;
    String code;
    DateTime endValidDate;
    int id;

    factory EmployeeRewardCode.fromJson(Map<String, dynamic> json) => EmployeeRewardCode(
        employeeId: json["employeeId"],
        employee: json["employee"],
        employeeCodeStatusId: json["employeeCodeStatusId"],
        employeeCodeStatus: json["employeeCodeStatus"],
        code: json["code"],
        endValidDate: DateTime.parse(json["endValidDate"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "employeeId": employeeId,
        "employee": employee,
        "employeeCodeStatusId": employeeCodeStatusId,
        "employeeCodeStatus": employeeCodeStatus,
        "code": code,
        "endValidDate": endValidDate.toIso8601String(),
        "id": id,
    };
}
