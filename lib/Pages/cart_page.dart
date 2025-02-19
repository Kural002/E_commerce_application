import 'package:e_commerce_app/components/My_Button.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("remove this item to your cart?"),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<Shop>().removeFromCart(product);
            },
            child: Text("Yes"),
          ),
        ],
      ),
    );
  }

  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
            'user wants to Pay! Connect this app to your payment backent '),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Cart'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          // card list
          Expanded(
            child: cart.isEmpty
                ? Center(child: Text('Your card is Empty'))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(item.price.toStringAsFixed(2)),
                        trailing: IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () => removeItemFromCart(context, item),
                        ),
                      );
                    },
                  ),
          ),
          // card button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
                onTap: () => payButtonPressed(context), child: Text("PAY NOW")),
          ),
        ],
      ),
    );
  }
}
  //  itemCount: cart.length,
  //             itemBuilder: (context, index) {
  //               final item = cart[index];
  //               return ListTile(
  //                 title: Text(item.name),
  //                 subtitle: Text(item.description),
  //                 trailing: Text("\$${item.price}"),
  //                 leading: IconButton(
  //                   icon: Icon(Icons.remove),
  //                   onPressed: () => removeItemFromCart(context, item),
  //                 ),
  //               );
  //             }, 