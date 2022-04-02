import 'dart:convert';

QuizHistory quizHistoryFromJson(String str) => QuizHistory.fromJson(json.decode(str));

String quizHistoryToJson(QuizHistory data) => json.encode(data.toJson());

class QuizHistory {
  QuizHistory({
    required this.userCampaignId,
    required this.userCampaignStatusId,
    required this.userCampaignStatusName,
    required this.beginDate,
    required this.endDate,
    required this.validBeginDate,
    required this.validEndDate,
    required this.quizId,
    required this.quizName,
    required this.quizDescription,
    this.score,
  });

  int userCampaignId;
  int userCampaignStatusId;
  String userCampaignStatusName;
  DateTime beginDate;
  dynamic endDate;
  DateTime validBeginDate;
  DateTime validEndDate;
  int quizId;
  String quizName;
  String quizDescription;
  dynamic score;

  factory QuizHistory.fromJson(Map<String, dynamic> json) => QuizHistory(
    userCampaignId: json["userCampaignId"],
    userCampaignStatusId: json["userCampaignStatusId"],
    userCampaignStatusName: json["userCampaignStatusName"],
    beginDate: DateTime.parse(json["beginDate"]),
    endDate: json["endDate"],
    validBeginDate: DateTime.parse(json["validBeginDate"]),
    validEndDate: DateTime.parse(json["validEndDate"]),
    quizId: json["quizId"],
    quizName: json["quizName"],
    quizDescription: json["quizDescription"],
    score: json["score"],
  );

  Map<String, dynamic> toJson() => {
    "userCampaignId": userCampaignId,
    "userCampaignStatusId": userCampaignStatusId,
    "userCampaignStatusName": userCampaignStatusName,
    "beginDate": beginDate.toIso8601String(),
    "endDate": endDate,
    "validBeginDate": validBeginDate.toIso8601String(),
    "validEndDate": validEndDate.toIso8601String(),
    "quizId": quizId,
    "quizName": quizName,
    "quizDescription": quizDescription,
    "score": score,
  };
}
