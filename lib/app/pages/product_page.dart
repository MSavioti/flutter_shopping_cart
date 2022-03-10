import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart/app/shared/models/product.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _product = ModalRoute.of(context)?.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: Text(_product.name),
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
                  Image.network(_product.image),
                  const SizedBox(width: 24.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_product.name),
                      Text(
                        '\$ ${_product.price.toStringAsPrecision(3)}',
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
                onPressed: () {},
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
