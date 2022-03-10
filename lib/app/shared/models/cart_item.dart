import 'package:flutter_shopping_cart/app/shared/models/product.dart';

class CartItem {
  final Product product;
  final int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });

  double get price => product.price * quantity;

  @override
  bool operator ==(Object other) {
    return other is CartItem && other.product == product;
  }

  @override
  int get hashCode => product.hashCode;
}
