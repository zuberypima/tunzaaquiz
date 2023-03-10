
class Cart{
  int id;
  int userId;
  List<dynamic> products;

  Cart({required this.id, required this.userId, required this.products});

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'],
      userId: json['userId'],
      products: json['products'],
    );
  }
}