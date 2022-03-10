import 'package:flutter/material.dart';

class ButtonShoppingCart extends StatelessWidget {
  const ButtonShoppingCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: IconButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/cart');
        },
        icon: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
