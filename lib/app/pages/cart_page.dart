import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart/app/shared/controllers/cart_controller.dart';
import 'package:flutter_shopping_cart/app/shared/models/cart_item.dart';
import 'package:flutter_shopping_cart/app/shared/widgets/button_home.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late List<CartItem> cartItems;
  double cartTotalPrice = 0.0;
  final double checkoutOverlayHeight = 160.0;

  @override
  void initState() {
    cartItems = CartController.instance.cartItems;
    cartTotalPrice = CartController.instance.cartTotalPrice;
    super.initState();
  }

  void _updateCart() {
    setState(() {
      cartItems = CartController.instance.cartItems;
      cartTotalPrice = CartController.instance.cartTotalPrice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        actions: const [
          ButtonHome(),
        ],
      ),
      body: SafeArea(
        child: cartItems.isEmpty
            ? const Center(
                child: Text('Your cart is empty.'),
              )
            : Stack(
                children: [
                  Positioned.fill(
                    child: CustomScrollView(
                      shrinkWrap: true,
                      slivers: [
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              for (var i = 0; i < cartItems.length; i++)
                                Card(
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 8.0,
                                      horizontal: 8.0,
                                    ),
                                    leading: Image.network(
                                        cartItems[i].product.image),
                                    title: Text(cartItems[i].product.name),
                                    subtitle: Text(
                                        '\$ ${cartItems[i].product.price.toStringAsFixed(2)}'),
                                    trailing: SizedBox(
                                      width: 128.0,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          DecoratedBox(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1.0,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            child: IconButton(
                                              onPressed: () {
                                                CartController.instance
                                                    .decreaseQuantity(
                                                        cartItems[i]);
                                                _updateCart();
                                              },
                                              icon: const Icon(
                                                Icons.exposure_minus_1,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0,
                                            ),
                                            child: Text(
                                              '${cartItems[i].quantity}',
                                              style: const TextStyle(
                                                fontSize: 18.0,
                                              ),
                                            ),
                                          ),
                                          DecoratedBox(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1.0,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            child: IconButton(
                                              onPressed: () {
                                                CartController.instance
                                                    .increaseQuantity(
                                                        cartItems[i]);
                                                _updateCart();
                                              },
                                              icon: const Icon(
                                                Icons.plus_one,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                        '/product',
                                        arguments: cartItems[i].product,
                                      );
                                    },
                                  ),
                                ),
                              if (CartController.instance.hasItems)
                                SizedBox(height: checkoutOverlayHeight),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    height: checkoutOverlayHeight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 24.0,
                          horizontal: 48.0,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Total:',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  '\$ ${cartTotalPrice.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(
                                  const Size(192.0, 48.0),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'CHECKOUT',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
