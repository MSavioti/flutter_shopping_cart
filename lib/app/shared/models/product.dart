class Product {
  final int id;
  final String sku;
  final String name;
  final String image;
  final double price;

  Product({
    required this.id,
    required this.sku,
    required this.name,
    required this.image,
    required this.price,
  });

  @override
  bool operator ==(Object other) {
    return other is Product && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
