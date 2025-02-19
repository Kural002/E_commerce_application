import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({super.key, required this.product});

  void addToCart(BuildContext context) {
    showDialog(context: context, builder: (context) => AlertDialog(
      content: Text("add this item to your cart?"),
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
            context.read<Shop>().addToCart(product);
            
          },
          child: Text("Yes"),
        ),
      ],  
    ));
  } 

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //product image
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12)),
                  width: double.infinity,
                  padding: EdgeInsets.all(25),
                  child: Image.asset(product.imagePath, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 25),

              //product name

              Text(
                product.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),

              //product description
              const SizedBox(height: 10),

              Text(
                product.description,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ],
          ),
          const SizedBox(height: 25),

          //product price + add to cart button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$" + product.price.toStringAsFixed(2),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).colorScheme.secondary),
                child: IconButton(
                  onPressed: () => addToCart(context),
                  icon: Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
