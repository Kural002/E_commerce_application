import 'package:e_commerce_app/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  // product for sale
  final List<Product> _shop = [
    //product 1
    Product(
      name: "Product 1",
      price: 69.85,
      description: "Item Discription..",
      imagePath: "assets/hoodie.png",
    ),
    //product 2
    Product(
      name: "Product 2",
      price: 59.85,
      description: "Item Discription..",
      imagePath: "assets/glass.png",
    ),
    //product 3
    Product(
      name: "Product 3",
      price: 89.85,
      description: "Item Discription..",
      imagePath: "assets/shoe.png",
    ),
    //product 4
    Product(
      name: "Product 4",
      price: 29.85,
      description: "Item Discription..",
      imagePath: "assets/rog.png",
    ),
    Product(
      name: "Product 5",
      price: 69.69,
      description: "Item Discription..",
      imagePath: "assets/phone.png",
    ),
  ];
  // user cart
  final List<Product> _cart = [];

  //get product list
  List<Product> get shop => _shop;

  //get user cart
  List<Product> get cart => _cart;

  //add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove item from item cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
