class User {
  User({
    required this.id,
    required this.name,
    required this.surname,
    required this.lastName,
    required this.code,
    required this.email,
    required this.picture,
    required this.password,
    required this.operativeUnit,
    required this.nss,
    required this.positionId,
    required this.birthday,
  });

  int id;
  String name;
  String surname;
  String lastName;
  String code;
  String email;
  String picture;
  String password;
  int operativeUnit;
  String nss;
  int positionId;
  DateTime birthday;

  factory User.fromVoid() => User(
      id: 0,
      name: '',
      surname: '',
      lastName: '',
      code: '',
      email: '',
      picture: '',
      password: '',
      operativeUnit: 0,
      nss: '',
      positionId: 0,
      birthday: DateTime.now());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["Id"],
        name: json["Name"],
        surname: json["Surname"],
        lastName: json["LastName"],
        code: json["Code"],
        email: json["Email"],
        picture: json["Picture"],
        password: json["Password"],
        operativeUnit: json["OperativeUnit"],
        nss: json["Nss"],
        positionId: json["PositionId"],
        birthday: DateTime.parse(json["Birthday"]),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Surname": surname,
        "LastName": lastName,
        "Code": code,
        "Email": email,
        "Picture": picture,
        "Password": password,
        "OperativeUnit": operativeUnit,
        "Nss": nss,
        "PositionId": positionId,
        "Birthday": birthday.toIso8601String(),
      };
}
