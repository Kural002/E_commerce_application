import 'package:e_commerce_app/Pages/cart_page.dart';
import 'package:e_commerce_app/Pages/intro_page.dart';
import 'package:e_commerce_app/Pages/shop_page.dart';
import 'package:e_commerce_app/models/shop.dart';
import 'package:e_commerce_app/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Shop(),
    child: const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      theme: lightmode,
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/shop_page': (context) => const ShopPage(),
        '/cart_page': (context) => const CartPage(),
      },
    );
  }
}
