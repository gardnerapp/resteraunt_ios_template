import 'package:flutter/material.dart';
import 'package:resteraunt_starter/cart/CartItemsList.dart';
import 'package:resteraunt_starter/components/RaisedIconButton.dart';
import 'package:resteraunt_starter/models/bloc/FoodBloc.dart';
import 'package:resteraunt_starter/models/user/UserCubit.dart';



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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CartItemList(),
          SizedBox(height: 30.0),
          customRaisedIconButton(
            //TODO Acess Bloc & Cubit Data with the least amount of code
              "Place Your Order", Icons.shopping_cart_sharp, context, () {
            //route to Auth if user not logged in

            //make purchases if items in cart else do nothing
          }),
          SizedBox(height: 30.0)
        ],
      ),
    );
  }
}
