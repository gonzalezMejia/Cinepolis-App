// To parse this JSON data, do
//
//     final branchesVisited = branchesVisitedFromJson(jsonString);

import 'dart:convert';

List<BranchesVisited> branchesVisitedFromJson(String str) =>
    List<BranchesVisited>.from(
        json.decode(str).map((x) => BranchesVisited.fromJson(x)));

String branchesVisitedToJson(List<BranchesVisited> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BranchesVisited {
  BranchesVisited({
    required this.assignmentId,
    required this.supervisorId,
    required this.supervisor,
    required this.startDate,
    required this.endDate,
    required this.branchId,
    required this.branchName,
    required this.isMenuQuizzCompleted,
  });

  int? assignmentId;
  int? supervisorId;
  String? supervisor;
  DateTime? startDate;
  DateTime? endDate;
  int? branchId;
  String? branchName;
  bool? isMenuQuizzCompleted;

  factory BranchesVisited.fromJson(Map<String, dynamic> json) =>
      BranchesVisited(
        assignmentId:
            json["assignmentId"] == null ? null : json["assignmentId"],
        supervisorId:
            json["supervisorId"] == null ? null : json["supervisorId"],
        supervisor: json["supervisor"],
        startDate: json["startDate"] == null
            ? null
            : DateTime.parse(json["startDate"]),
        endDate:
            json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        branchId: json["branchId"] == null ? null : json["branchId"],
        branchName: json["branchName"] == null ? null : json["branchName"],
        isMenuQuizzCompleted: json["isMenuQuizzCompleted"] == null
            ? null
            : json["isMenuQuizzCompleted"],
      );

  Map<String, dynamic> toJson() => {
        "assignmentId": assignmentId == null ? null : assignmentId,
        "supervisorId": supervisorId == null ? null : supervisorId,
        "supervisor": supervisor,
        "startDate": startDate == null ? null : startDate!.toIso8601String(),
        "endDate": endDate == null ? null : endDate!.toIso8601String(),
        "branchId": branchId == null ? null : branchId,
        "branchName": branchName == null ? null : branchName,
        "isMenuQuizzCompleted":
            isMenuQuizzCompleted == null ? null : isMenuQuizzCompleted,
      };
}
