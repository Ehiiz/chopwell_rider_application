class Product {
  String price; // add this line
  String name;
  String id;
  String image;
  String restaurantId;
  String quantity;
  String sumAmount;
// add

  Product(
      {required this.price,
      required this.name,
      required this.id,
      required this.image,
      required this.restaurantId,
      this.quantity = "1",
      this.sumAmount = "0"});

  Product copyWith({
    String? price,
    String? name,
    String? id,
    String? image,
    String? restaurantId,
    String? quantity,
  }) {
    return Product(
      price: price ?? this.price,
      name: name ?? this.name,
      id: id ?? this.id,
      image: image ?? this.image,
      restaurantId: restaurantId ?? this.restaurantId,
      quantity: quantity ?? this.quantity,
    );
  }

  static Map<String, String> productToMap(Product p) {
    return {
      'food_name': p.name,
      'food_price': p.price,
      'food_id': p.id,
      'food_qty': p.quantity
    };
  }

  static List<Map<String, String>> convert(List<Product> products) {
    return products.map(productToMap).toList();
  }
}
