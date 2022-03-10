import 'package:flutter_shopping_cart/app/shared/extensions/list_extension.dart';
import 'package:flutter_shopping_cart/app/shared/models/cart_item.dart';
import 'package:flutter_shopping_cart/app/shared/models/product.dart';

class CartController {
  CartController._();

  static CartController? _instance;

  static CartController get instance => _instance ??= CartController._();

  List<CartItem> _cartItems = [];
  List<CartItem> get cartItems => _cartItems;
  int get itemsCount => _cartItems.length;

  void addItem(Product product, int quantity) {
    final cartItem = CartItem(product: product, quantity: quantity);

    if (_cartItems.contains(cartItem)) {
      return;
    }

    _cartItems.add(cartItem);
  }

  void increaseQuantity(CartItem cartItem) {
    if (!_cartItems.contains(cartItem)) {
      return;
    }

    final targetItem = _cartItems.firstWhere((item) => item == cartItem);
    final updatedItem = CartItem(
      product: targetItem.product,
      quantity: targetItem.quantity + 1,
    );

    final index = _cartItems.indexOf(cartItem);
    _cartItems = _cartItems.updateItem(index, updatedItem);
  }

  void decreaseQuantity(CartItem cartItem) {
    if (!_cartItems.contains(cartItem)) {
      return;
    }

    final targetItem = _cartItems.firstWhere((item) => item == cartItem);

    if (targetItem.quantity == 1) {
      removeItem(cartItem);
      return;
    }

    final updatedItem = CartItem(
      product: targetItem.product,
      quantity: targetItem.quantity - 1,
    );

    final index = _cartItems.indexOf(cartItem);
    _cartItems = _cartItems.updateItem(index, updatedItem);
  }

  void removeItem(CartItem cartItem) {
    if (!_cartItems.contains(cartItem)) {
      return;
    }

    _cartItems.remove(cartItem);
  }

  void clear() {
    _cartItems.clear();
  }
}
