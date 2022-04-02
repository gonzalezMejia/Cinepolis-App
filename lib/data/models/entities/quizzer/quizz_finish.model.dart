import 'dart:convert';

FinishQuizzer finishQuizzerFromJson(String str) =>
    FinishQuizzer.fromJson(json.decode(str));

String finishQuizzerToJson(FinishQuizzer data) => json.encode(data.toJson());

class FinishQuizzer {
  FinishQuizzer({
    required this.id,
    required this.geolocationEnd,
  });

  int id;
  String geolocationEnd;

  factory FinishQuizzer.fromJson(Map<String, dynamic> json) => FinishQuizzer(
        id: json["id"],
        geolocationEnd: json["geolocationEnd"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "geolocationEnd": geolocationEnd,
      };
}
