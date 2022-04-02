import 'dart:convert';

ApiException apiExceptionFromJson(String str) =>
    ApiException.fromJson(json.decode(str));

String apiExceptionToJson(ApiException data) => json.encode(data.toJson());

class ApiException {
  ApiException({
    required this.message,
    required this.exceptionMessage,
    required this.exceptionType,
    required this.stackTrace,
  });

  String? message;
  String? exceptionMessage;
  String? exceptionType;
  String? stackTrace;

  factory ApiException.fromJson(Map<String, dynamic> json) => ApiException(
        message: json["message"] == null ? json["message"] : json["Message"],
        exceptionMessage: json["exceptionMessage"] != null
            ? json["exceptionMessage"]
            : json["ExceptionMessage"],
        exceptionType: json["exceptionType"] != null
            ? json["exceptionType"]
            : json["ExceptionType"],
        stackTrace: json["stackTrace"] != null
            ? json["stackTrace"]
            : json["StackTrace"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "exceptionMessage": exceptionMessage,
        "exceptionType": exceptionType,
        "stackTrace": stackTrace,
      };
}
