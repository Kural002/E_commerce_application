import 'package:e_commerce_app/components/My_list_tile..dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      // logo
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Icon(
                  Icons.shopping_bag,
                  size: 72,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              //shop title
              MyListTile(
                text: "Shop",
                icon: Icons.home,
                onTap: () => Navigator.pop(context),
              ),

              //cart title
              MyListTile(
                text: "Cart",
                icon: Icons.shopping_cart,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/cart_page');
                },
              ),
            ],
          ),
          //exit
          MyListTile(
            text: "Exit",
            icon: Icons.logout,
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/intro_page');
            },
          ),
        ],
      ),
    );
  }
}
