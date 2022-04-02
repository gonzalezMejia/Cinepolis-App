import 'dart:convert';

List<QuizzSummary> quizzSummaryFromJson(String str) => List<QuizzSummary>.from(
    json.decode(str).map((x) => QuizzSummary.fromJson(x)));

String quizzSummaryToJson(List<QuizzSummary> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuizzSummary {
  QuizzSummary({
    required this.generateScore,
    required this.finalScore,
    required this.totalScore,
    required this.objectsCount,
    required this.objectsResponseCount,
    required this.elapsedMinutes,
  });

  bool generateScore;
  dynamic finalScore;
  double totalScore;
  int objectsCount;
  int objectsResponseCount;
  int elapsedMinutes;

  factory QuizzSummary.fromVoid() => QuizzSummary(
      generateScore: false,
      finalScore: 0,
      totalScore: 0,
      objectsCount: 0,
      objectsResponseCount: 0,
      elapsedMinutes: 0);

  factory QuizzSummary.fromJson(Map<String, dynamic> json) => QuizzSummary(
        generateScore: json["generateScore"],
        finalScore: json["finalScore"],
        totalScore: json["totalScore"],
        objectsCount: json["objectsCount"],
        objectsResponseCount: json["objectsResponseCount"],
        elapsedMinutes: json["elapsedMinutes"],
      );

  Map<String, dynamic> toJson() => {
        "generateScore": generateScore,
        "finalScore": finalScore,
        "totalScore": totalScore,
        "objectsCount": objectsCount,
        "objectsResponseCount": objectsResponseCount,
        "elapsedMinutes": elapsedMinutes,
      };
}
