class Stock {
  int? id;
  String name;
  String description;
  String price;
  String quantity;

  Stock({
    this.id, 
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
  });
}