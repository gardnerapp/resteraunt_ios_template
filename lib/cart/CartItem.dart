import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resteraunt_starter/models/bloc/CheckoutItem.dart';
import 'package:resteraunt_starter/models/bloc/FoodBloc.dart';
import 'package:resteraunt_starter/models/bloc/FoodEvent.dart';

class CartITem extends StatelessWidget {
  final CheckOutItem item;
  const CartITem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var total = 0.0;
    var sidesTotal = this.item.sides.map((e) => e.price + total);
    return Card(
        elevation: 16.0,
        child: ListTile(
          title: Text("${item.name}"),
          subtitle: Text("Item: \$22.0 Sides: \$$sidesTotal"),
          leading: IconButton(
              icon: Icon(Icons.remove_circle_rounded, color: Colors.red),
              onPressed: () {
                BlocProvider.of<FoodBloc>(context).add(FoodEvent.delete(this.item));

              }),
        ));
  }
}
