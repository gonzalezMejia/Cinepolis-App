class User {
  User({
      this.id,
      this.name,
      this.secondName,
      this.fAdmission,
      this.email,
      this.pass,
      this.genero,
      this.telephone,
      this.photo,
      this.age,});

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    secondName = json['secondName'];
    fAdmission = json['fAdmission'];
    email = json['email'];
    pass = json['pass'];
    genero = json['genero'];
    telephone = json['telephone'];
    photo = json['photo'];
    age = json['age'];
  }

  User.fromVoid() {
    id = 0;
    name = "";
    secondName = "";
    fAdmission = "";
    email = "";
    pass = "";
    genero = "";
    telephone = 0;
    photo = "";
    age = 0;
  }
  int? id;
  String? name;
  String? secondName;
  String? fAdmission;
  String? email;
  String? pass;
  String? genero;
  double? telephone;
  String? photo;
  int? age;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['secondName'] = secondName;
    map['fAdmission'] = fAdmission;
    map['email'] = email;
    map['pass'] = pass;
    map['genero'] = genero;
    map['telephone'] = telephone!.toInt();
    map['photo'] = photo;
    map['age'] = age;
    return map;
  }

}