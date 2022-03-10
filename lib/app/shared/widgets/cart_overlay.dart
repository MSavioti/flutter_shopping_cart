import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart/app/shared/controllers/cart_controller.dart';

class CartOverlay extends StatelessWidget {
  const CartOverlay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!CartController.instance.hasItems) {
      return const SizedBox();
    }

    final totalPrice =
        '\$ ${CartController.instance.cartTotalPrice.toStringAsFixed(2)}';

    return Container(
      color: Colors.blue.withOpacity(0.9),
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 16.0,
      ),
      child: Row(
        children: [
          const Text(
            'Total:',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          Text(
            totalPrice,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
