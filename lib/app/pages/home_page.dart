import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart/app/shared/models/product.dart';
import 'package:flutter_shopping_cart/app/shared/services/services_products.dart';
import 'package:flutter_shopping_cart/app/shared/widgets/button_shopping_cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> _products = [];

  @override
  void initState() {
    _loadProducts();
    super.initState();
  }

  void _loadProducts() async {
    final _retrievedProducts = await ServiceProducts.instance.getProducts(12);

    setState(() {
      _products = _retrievedProducts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: const [
          ButtonShoppingCart(),
        ],
      ),
      body: _products.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              itemCount: _products.length,
              itemBuilder: (context, i) {
                final String _price = _products[i].price.toStringAsPrecision(3);

                return Card(
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 8.0,
                    ),
                    leading: Image.network(_products[i].image),
                    title: Text(_products[i].name),
                    subtitle: Text('\$ $_price'),
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        '/product',
                        arguments: _products[i],
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
