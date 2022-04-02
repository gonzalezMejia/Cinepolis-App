class Exceptions {
  Exceptions({
    required this.message,
    required this.exceptionMessage,
    required this.exceptionType,
    required this.stackTrace,
  });

  String message;
  String exceptionMessage;
  String exceptionType;
  String stackTrace;

  factory Exceptions.fromJson(Map<String, dynamic> json) => Exceptions(
    message: json["Message"],
    exceptionMessage: json["ExceptionMessage"],
    exceptionType: json["ExceptionType"],
    stackTrace: json["StackTrace"],
  );

  Map<String, dynamic> toJson() => {
    "Message": message,
    "ExceptionMessage": exceptionMessage,
    "ExceptionType": exceptionType,
    "StackTrace": stackTrace,
  };
}
