import 'package:flutter/material.dart';
import 'package:resteraunt_starter/cart/Cart.dart';


CustomAppBar(String title, BuildContext context){
  return AppBar(
    title: Text(title),
    actions: [
      IconButton(
        icon: Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
        },
      )
    ],
  );
}