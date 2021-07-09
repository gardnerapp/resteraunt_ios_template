import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resteraunt_starter/models/bloc/CheckoutItem.dart';
import 'package:resteraunt_starter/models/bloc/FoodBloc.dart';
import 'package:resteraunt_starter/models/bloc/FoodEvent.dart';

class CartITem extends StatelessWidget {
  final CheckOutItem item;
  const CartITem({Key key, this.item}) : super(key: key);
// sides are not going into item
  @override
  Widget build(BuildContext context) {
    var sidesTotal = this.item.sidesTotal();
      return Card(
          elevation: 16.0,
          child: ListTile(
            title: Text("${this.item.name}", style: TextStyle(fontSize: 22.0)),
            subtitle: Text("\$${item.price}\nSides: \$$sidesTotal\ntotal: \$${this.item.sidesAndPriceTotal()}",
                style: TextStyle(fontSize: 20.0)),
            leading: IconButton(
                icon: Icon(Icons.remove_circle_rounded, color: Colors.red),
                splashColor: Colors.red,
                onPressed: () {
                  BlocProvider.of<FoodBloc>(context).add(FoodEvent.delete(this.item));

                }),
          ));
    }
  }

