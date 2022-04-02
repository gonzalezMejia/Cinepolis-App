class PaginatedResponse<T> {  
  int total;  
  List<T> items;  

  PaginatedResponse(
    this.total,    
    this.items
  );
}

