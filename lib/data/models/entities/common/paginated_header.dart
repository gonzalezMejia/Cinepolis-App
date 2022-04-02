class PaginatedHeader {
  PaginatedHeader({
    this.total,    
  });
  
  int? total;  

  factory PaginatedHeader.fromJson(Map<String, dynamic> json) => PaginatedHeader(
    total: json["total"] == null ? 0 : int.parse(json["total"])
  );  
}

