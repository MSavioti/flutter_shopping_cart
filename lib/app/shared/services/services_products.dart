import 'package:flutter_shopping_cart/app/shared/models/product.dart';

class ServiceProducts {
  ServiceProducts._();

  static ServiceProducts? _instance;

  static ServiceProducts get instance => _instance ??= ServiceProducts._();

  Future<List<Product>> getProducts(int pageSize) async {
    await Future.delayed(const Duration(seconds: 2));

    final List<Product> _products = [];

    for (var i = 0; i < pageSize; i++) {
      final _product = Product(
        id: i + 1,
        sku: '${i + 1}',
        name: 'Product ${i + 1}',
        image: 'https://picsum.photos/100?random=${i + 1}',
        price: 0.01,
      );
      _products.add(_product);
    }

    return _products;
  }
}
