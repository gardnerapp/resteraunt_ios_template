import 'package:flutter/material.dart';
import 'package:resteraunt_starter/cart/CartItemsList.dart';
import 'package:resteraunt_starter/components/RaisedIconButton.dart';



class Cart extends StatefulWidget {
  const Cart({Key key}) : super(key: key);

// might need to wrap this in a bloc consumer an dynamically eneder based on state of the bloc
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: Column(
        children: [
          CartItemList(),
          customRaisedIconButton(
              "Place Your Order", Icons.shopping_cart_sharp, context, () {})
        ],
      ),
    );
  }
}
