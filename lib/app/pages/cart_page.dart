import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart/app/shared/widgets/button_home.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        actions: const [
          ButtonHome(),
        ],
      ),
    );
  }
}
