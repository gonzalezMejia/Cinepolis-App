class InitQuizz {
  InitQuizz({
    required this.campaignId,
    required this.campaign,
    required this.userCampaignStatusId,
    required this.userCampaignStatus,
    required this.userId,
    required this.user,
    required this.branchId,
    required this.branch,
    required this.score,
    required this.validBeginDate,
    required this.validEndDate,
    required this.beginDate,
    required this.endDate,
    required this.ipInit,
    required this.ipEnd,
    required this.geolocationInit,
    required this.geolocationEnd,
    required this.cancelReason,
    required this.answers,
    required this.id,
  });

  int campaignId;
  dynamic campaign;
  int userCampaignStatusId;
  dynamic userCampaignStatus;
  int userId;
  dynamic user;
  int branchId;
  dynamic branch;
  dynamic score;
  DateTime validBeginDate;
  DateTime validEndDate;
  DateTime beginDate;
  dynamic endDate;
  String ipInit;
  dynamic ipEnd;
  String geolocationInit;
  dynamic geolocationEnd;
  dynamic cancelReason;
  dynamic answers;
  int id;

  factory InitQuizz.fromJson(Map<String, dynamic> json) => InitQuizz(
        campaignId: json["campaignId"],
        campaign: json["campaign"],
        userCampaignStatusId: json["userCampaignStatusId"],
        userCampaignStatus: json["userCampaignStatus"],
        userId: json["userId"],
        user: json["user"],
        branchId: json["branchId"],
        branch: json["branch"],
        score: json["score"],
        validBeginDate: DateTime.parse(json["validBeginDate"]),
        validEndDate: DateTime.parse(json["validEndDate"]),
        beginDate: DateTime.parse(json["beginDate"]),
        endDate: json["endDate"],
        ipInit: json["ipInit"],
        ipEnd: json["ipEnd"],
        geolocationInit: json["geolocationInit"],
        geolocationEnd: json["geolocationEnd"],
        cancelReason: json["cancelReason"],
        answers: json["answers"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "campaignId": campaignId,
        "campaign": campaign,
        "userCampaignStatusId": userCampaignStatusId,
        "userCampaignStatus": userCampaignStatus,
        "userId": userId,
        "user": user,
        "branchId": branchId,
        "branch": branch,
        "score": score,
        "validBeginDate": validBeginDate.toIso8601String(),
        "validEndDate": validEndDate.toIso8601String(),
        "beginDate": beginDate.toIso8601String(),
        "endDate": endDate,
        "ipInit": ipInit,
        "ipEnd": ipEnd,
        "geolocationInit": geolocationInit,
        "geolocationEnd": geolocationEnd,
        "cancelReason": cancelReason,
        "answers": answers,
        "id": id,
      };
}

class ParamsInitQuizz {
  ParamsInitQuizz({
    required this.branchId,
    required this.campaignId,
    required this.latitude,
    required this.longitude,
  });

  int branchId;
  int campaignId;
  String? latitude;
  String? longitude;

  factory ParamsInitQuizz.fromJson(Map<String, dynamic> json) =>
      ParamsInitQuizz(
        branchId: json["branchId"],
        campaignId: json["campaignId"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "branchId": branchId,
        "campaignId": campaignId,
        "latitude": latitude,
        "longitude": longitude,
      };
}
