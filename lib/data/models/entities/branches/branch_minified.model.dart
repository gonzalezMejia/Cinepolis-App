class BranchMinified {
  int id;
  String description;

  BranchMinified({
      required this.id,
      required this.description});

   factory BranchMinified.fromJson(dynamic json) =>BranchMinified(
      id: json["id"],
      description: json["description"]);


  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["description"] = description;
    return map;
  }

}