import 'dart:convert';

class QuizzAvailable {
  int campaignId;
  String campaignName;
  String campaignDescription;
  int quizId;
  String quizName;
  String quizDescription;
  String quizScopeName;
  String quizTypeName;
  String visualizationBeginDate;
  String visualizationEndDate;

  QuizzAvailable(
      {required this.campaignId,
      required this.campaignName,
      required this.campaignDescription,
      required this.quizId,
      required this.quizName,
      required this.quizDescription,
      required this.quizScopeName,
      required this.quizTypeName,
      required this.visualizationBeginDate,
      required this.visualizationEndDate});

  factory QuizzAvailable.fromVoid() => QuizzAvailable(
      campaignId: 0,
      campaignName: "",
      campaignDescription: "",
      quizId: 0,
      quizName: "",
      quizDescription: "",
      quizScopeName: "",
      quizTypeName: "",
      visualizationBeginDate: "",
      visualizationEndDate: "");

  factory QuizzAvailable.fromJson(Map<String, dynamic> json) => QuizzAvailable(
        campaignId: json["campaignId"],
        campaignName: json["campaignName"],
        campaignDescription: json["campaignDescription"],
        quizId: json["quizId"],
        quizName: json["quizName"],
        quizDescription: json["quizDescription"],
        quizScopeName: json["quizScopeName"],
        quizTypeName: json["quizTypeName"],
        visualizationBeginDate: json["visualizationBeginDate"],
        visualizationEndDate: json["visualizationEndDate"],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['campaignId'] = this.campaignId;
    data['campaignName'] = this.campaignName;
    data['campaignDescription'] = this.campaignDescription;
    data['quizId'] = this.quizId;
    data['quizName'] = this.quizName;
    data['quizDescription'] = this.quizDescription;
    data['quizScopeName'] = this.quizScopeName;
    data['quizTypeName'] = this.quizTypeName;
    data['visualizationBeginDate'] = this.visualizationBeginDate;
    data['visualizationEndDate'] = this.visualizationEndDate;
    return data;
  }
}

// To parse this JSON data, do
//
//     final availableBranches = availableBranchesFromJson(jsonString);

List<AvailableBranches> availableBranchesFromJson(String str) =>
    List<AvailableBranches>.from(
        json.decode(str).map((x) => AvailableBranches.fromJson(x)));

String availableBranchesToJson(List<AvailableBranches> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AvailableBranches {
  AvailableBranches({
    required this.internalCode,
    required this.name,
    required this.isActive,
    required this.id,
  });

  int internalCode;
  String name;
  bool isActive;
  int id;

  factory AvailableBranches.fromJson(Map<String, dynamic> json) =>
      AvailableBranches(
        internalCode: json["internalCode"],
        name: json["name"],
        isActive: json["isActive"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "internalCode": internalCode,
        "name": name,
        "isActive": isActive,
        "id": id,
      };
}
