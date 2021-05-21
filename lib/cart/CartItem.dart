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
    print(this.item.sides);
      return Card(
          elevation: 16.0,
          child: ListTile(
            title: Text("${this.item.name}"),
            subtitle: Text("\$${item.price}\nSides: \$3.0\ntotal: 23.0"),
            leading: IconButton(
                icon: Icon(Icons.remove_circle_rounded, color: Colors.red),
                splashColor: Colors.red,
                onPressed: () {
                  BlocProvider.of<FoodBloc>(context).add(FoodEvent.delete(this.item));

                }),
          ));
    }
  }

