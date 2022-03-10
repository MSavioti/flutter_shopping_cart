import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart/app/pages/home_page.dart';
import 'package:flutter_shopping_cart/app/pages/product_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/product': (context) => const ProductPage(),
        // '/cart': (context) => const CartPage(),
      },
    );
  }
}
