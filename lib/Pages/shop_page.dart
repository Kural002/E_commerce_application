import 'package:e_commerce_app/components/My_Product_tile.dart';
import 'package:e_commerce_app/components/My_drawer.dart';
import 'package:e_commerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Shop Page'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart_page');
            },
            icon: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      drawer: MyDrawer(),

      body: ListView(
        children: [
          const SizedBox(height: 25),
          Center(
            child: Text(
              'Pick From a Selected list of Premium Product',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),

        
          SizedBox(
            height: 550,
            child: ListView.builder(
              padding: EdgeInsets.all(15),
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final product = products[index];
                return MyProductTile(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
