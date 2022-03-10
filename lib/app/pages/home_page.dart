import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart/app/shared/controllers/cart_controller.dart';
import 'package:flutter_shopping_cart/app/shared/models/product.dart';
import 'package:flutter_shopping_cart/app/shared/services/services_products.dart';
import 'package:flutter_shopping_cart/app/shared/widgets/button_shopping_cart.dart';
import 'package:flutter_shopping_cart/app/shared/widgets/cart_overlay.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> _products = [];
  final cartOverlayHeight = 92.0;

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
      body: SafeArea(
        child: _products.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  Positioned.fill(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            itemCount: _products.length,
                            itemBuilder: (context, i) {
                              final String _price =
                                  _products[i].price.toStringAsPrecision(1);

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
                          if (CartController.instance.hasItems)
                            SizedBox(height: cartOverlayHeight),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    height: cartOverlayHeight,
                    child: const CartOverlay(),
                  ),
                ],
              ),
      ),
    );
  }
}
