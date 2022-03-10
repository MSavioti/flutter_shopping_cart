import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart/app/shared/controllers/cart_controller.dart';
import 'package:flutter_shopping_cart/app/shared/models/product.dart';
import 'package:flutter_shopping_cart/app/shared/widgets/button_shopping_cart.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  void _addToCart(Product product) {
    CartController.instance.addItem(product, 1);
  }

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)?.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        actions: const [
          ButtonShoppingCart(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 100.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(product.image),
                  const SizedBox(width: 24.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.name),
                      Text(
                        '\$ ${product.price.toStringAsPrecision(1)}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 24.0,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              width: 192.0,
              height: 48.0,
              child: ElevatedButton(
                onPressed: () {
                  _addToCart(product);
                  const snackBar = SnackBar(
                    content: Text('Item added to the cart!'),
                    duration: Duration(seconds: 1),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: const Text(
                  'BUY',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
