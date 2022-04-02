import 'dart:convert';

import 'package:Cinepolis/data/models/entities/dynamic/evidences.model.dart';

Quizz quizzFromJson(String str) => Quizz.fromJson(json.decode(str));

String quizzToJson(Quizz data) => json.encode(data.toJson());

class Quizz {
  Quizz({
    required this.userCampaignId,
    required this.userCampaign,
    required this.referenceObjectId,
    required this.referenceSelectedOptionId,
    required this.referenceSelectedOptions,
    required this.label,
    required this.value,
    required this.observations,
    required this.scoreValue,
    required this.requestDate,
    required this.responseDate,
    required this.object,
    required this.files,
    required this.questionNumber,
    required this.isCompleted,
    required this.id,
  });

  factory Quizz.fromVoid() => Quizz(
        userCampaignId: 0,
        userCampaign: '',
        referenceObjectId: 0,
        referenceSelectedOptionId: 0,
        referenceSelectedOptions: '',
        label: '',
        value: '',
        observations: '',
        scoreValue: 0.0,
        requestDate: '',
        responseDate: '',
        object: Object(
            quizId: 0,
            quiz: '',
            sectionId: 0,
            section: '',
            objectTypeId: 0,
            objectType: ObjectType(name: '', id: 0, isActive: false),
            label: '',
            scoreValue: 0,
            minRateValue: 0,
            maxRateValue: 0,
            allowObservations: false,
            observationsLabel: '',
            allowFiles: false,
            maxValueFiles: 0,
            minValueFiles: 0,
            order: 0,
            inputValidationTypeId: 0,
            inputValidationType: InputValidationType(
              name: '',
              isActive: false,
              id: 0,
            ),
            ratingLayoutId: 0,
            ratingLayout: RatingLayout(
                color: 'Colors.black54',
                icon: 'star',
                id: 0,
                isActive: false,
                name: ''),
            isActive: false,
            options: [],
            canNotification: false,
            areaNotificationId: 0,
            positionNotifications: '',
            id: 0),
        files: [],
        questionNumber: '',
        isCompleted: false,
        id: 0,
      );

  Quizz.fromJson(dynamic json) {
    userCampaignId = json['userCampaignId'];
    userCampaign = json['userCampaign'];
    referenceObjectId = json['referenceObjectId'];
    referenceSelectedOptionId = json['referenceSelectedOptionId'];
    referenceSelectedOptions = json['referenceSelectedOptions'];
    label = json['label'];
    value = json['value'];
    observations = json['observations'];
    scoreValue = json['scoreValue'];
    requestDate = json['requestDate'];
    responseDate = json['responseDate'];
    object = json['object'] != null ? Object.fromJson(json['object']) : null;
    if (json['files'] != null) {
      files = [];
      json['files'].forEach((v) {
        files?.add(Evidences.fromJson(v));
      });
    }
    questionNumber = json['questionNumber'];
    isCompleted = json['isCompleted'];
    id = json['id'];
  }

  int? userCampaignId;
  String? userCampaign;
  int? referenceObjectId;
  int? referenceSelectedOptionId;
  String? referenceSelectedOptions;
  String? label;
  dynamic value;
  String? observations;
  double? scoreValue;
  String? requestDate;
  String? responseDate;
  Object? object;
  List<Evidences>? files;
  String? questionNumber;
  bool? isCompleted;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userCampaignId'] = userCampaignId;
    map['userCampaign'] = userCampaign;
    map['referenceObjectId'] = referenceObjectId;
    map['referenceSelectedOptionId'] = referenceSelectedOptionId;
    map['referenceSelectedOptions'] = referenceSelectedOptions;
    map['label'] = label;
    map['value'] = value;
    map['observations'] = observations;
    map['scoreValue'] = scoreValue;
    map['requestDate'] = requestDate;
    map['responseDate'] = responseDate;
    if (object != null) {
      map['object'] = object?.toJson();
    }
    if (files != null) {
      map['files'] = files?.map((v) => v.toJson()).toList();
    }
    map['questionNumber'] = questionNumber;
    map['isCompleted'] = isCompleted;
    map['id'] = id;
    return map;
  }
}

class Object {
  Object({
    this.quizId,
    this.quiz,
    this.sectionId,
    this.section,
    this.objectTypeId,
    this.objectType,
    this.label,
    this.scoreValue,
    this.minRateValue,
    this.maxRateValue,
    this.allowObservations,
    this.observationsLabel,
    this.allowFiles,
    this.maxValueFiles,
    this.minValueFiles,
    this.order,
    this.inputValidationTypeId,
    this.inputValidationType,
    this.ratingLayoutId,
    this.ratingLayout,
    this.isActive,
    this.options,
    this.canNotification,
    this.areaNotificationId,
    this.positionNotifications,
    this.id,
  });

  Object.fromJson(dynamic json) {
    quizId = json['quizId'];
    quiz = json['quiz'];
    sectionId = json['sectionId'];
    section = json['section'];
    objectTypeId = json['objectTypeId'];
    objectType = json['objectType'] != null
        ? ObjectType.fromJson(json['objectType'])
        : null;
    label = json['label'];
    scoreValue = json['scoreValue'];
    minRateValue = json['minRateValue'];
    maxRateValue = json['maxRateValue'];
    allowObservations = json['allowObservations'];
    observationsLabel = json['observationsLabel'];
    allowFiles = json['allowFiles'];
    maxValueFiles = json['maxValueFiles'];
    minValueFiles = json['minValueFiles'];
    order = json['order'];
    inputValidationTypeId = json['inputValidationTypeId'];
    inputValidationType = json['inputValidationType'] != null
        ? InputValidationType.fromJson(json['inputValidationType'])
        : null;
    ratingLayoutId = json['ratingLayoutId'];
    ratingLayout = json['ratingLayout'] != null
        ? RatingLayout.fromJson(json['ratingLayout'])
        : null;
    isActive = json['isActive'];
    if (json["options"] != null) {
      options = [];
      json["options"].forEach((v) {
        options!.add(Option.fromJson(v));
      });
    }
    canNotification = json['canNotification'];
    areaNotificationId = json['areaNotificationId'];
    positionNotifications = json['positionNotifications'];
    id = json['id'];
  }

  int? quizId;
  String? quiz;
  int? sectionId;
  String? section;
  int? objectTypeId;
  ObjectType? objectType;
  String? label;
  double? scoreValue;
  int? minRateValue;
  int? maxRateValue;
  bool? allowObservations;
  String? observationsLabel;
  bool? allowFiles;
  int? maxValueFiles;
  int? minValueFiles;
  int? order;
  int? inputValidationTypeId;
  InputValidationType? inputValidationType;
  int? ratingLayoutId;
  RatingLayout? ratingLayout;
  bool? isActive;
  List<Option>? options = [];
  bool? canNotification;
  int? areaNotificationId;
  dynamic positionNotifications;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['quizId'] = quizId;
    map['quiz'] = quiz;
    map['sectionId'] = sectionId;
    map['section'] = section;
    map['objectTypeId'] = objectTypeId;
    if (objectType != null) {
      map['objectType'] = objectType?.toJson();
    }
    map['label'] = label;
    map['scoreValue'] = scoreValue;
    map['minRateValue'] = minRateValue;
    map['maxRateValue'] = maxRateValue;
    map['allowObservations'] = allowObservations;
    map['observationsLabel'] = observationsLabel;
    map['allowFiles'] = allowFiles;
    map['maxValueFiles'] = maxValueFiles;
    map['minValueFiles'] = minValueFiles;
    map['order'] = order;
    map['inputValidationTypeId'] = inputValidationTypeId;
    map['inputValidationType'] = inputValidationType;
    map['ratingLayoutId'] = ratingLayoutId;
    map['ratingLayout'] = ratingLayout;
    map['isActive'] = isActive;
    map['options'] = options;
    map['canNotification'] = canNotification;
    map['areaNotificationId'] = areaNotificationId;
    map['positionNotifications'] = positionNotifications;
    map['id'] = id;
    return map;
  }
}

class ObjectType {
  ObjectType({
    this.name,
    this.isActive,
    this.id,
  });

  ObjectType.fromJson(dynamic json) {
    name = json['name'];
    isActive = json['isActive'];
    id = json['id'];
  }
  String? name;
  bool? isActive;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['isActive'] = isActive;
    map['id'] = id;
    return map;
  }
}

class RatingLayout {
  RatingLayout({this.icon, this.color, this.name, this.isActive, this.id});

  RatingLayout.fromJson(dynamic json) {
    try {
      icon = json['icon'];
    } catch (e) {
      print('No es DataIcon $e');
    }
    color = json['color'];
    name = json['name'];
    isActive = json['isActive'];
    id = json['id'];
  }

  String? icon;
  String? color;
  String? name;
  bool? isActive;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['icon'] = icon;
    map['color'] = color;
    map['name'] = name;
    map['isActive'] = isActive;
    map['id'] = id;
    return map;
  }
}

class InputValidationType {
  InputValidationType({this.name, this.isActive, this.id});

  InputValidationType.fromJson(dynamic json) {
    name = json['name'];
    isActive = json['isActive'];
    id = json['id'];
  }

  String? name;
  bool? isActive;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['isActive'] = isActive;
    map['id'] = id;
    return map;
  }
}

class Option {
  Option({
    this.objectId,
    this.object,
    this.label,
    this.scoreValue,
    this.icon,
    this.id,
  });

  int? objectId;
  dynamic object;
  String? label;
  double? scoreValue;
  dynamic icon;
  int? id;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        objectId: json["objectId"],
        object: json["object"],
        label: json["label"],
        scoreValue: json["scoreValue"],
        icon: json["icon"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "objectId": objectId,
        "object": object,
        "label": label,
        "scoreValue": scoreValue,
        "icon": icon,
        "id": id,
      };
}
