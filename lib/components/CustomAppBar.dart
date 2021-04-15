import 'package:flutter/material.dart';


CustomAppBar(String title){
  return AppBar(
    title: Text(title),
    actions: [
      IconButton(
        icon: Icon(Icons.shopping_cart),
        onPressed: () {},
      )
    ],
  );
}