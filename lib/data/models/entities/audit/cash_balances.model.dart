class CashBalances {
  CashBalances({
      this.id, 
      this.branchId, 
      this.insertDate, 
      this.businessType,});

  CashBalances.fromJson(dynamic json) {
    id = json['id'];
    branchId = json['branchId'];
    insertDate = json['insertDate'];
    businessType = json['businessType'];
  }
  CashBalances.fromVoid() {
    id = 0;
    branchId = 0;
    insertDate = '';
    businessType = "";
  }

  int? id=0;
  int? branchId=0;
  String? insertDate='';
  String? businessType='';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['branchId'] = branchId;
    map['insertDate'] = insertDate;
    map['businessType'] = businessType;
    return map;
  }

}