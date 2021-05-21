import 'package:flutter/material.dart';
import 'package:resteraunt_starter/cart/CartItem.dart';
import 'package:resteraunt_starter/models/bloc/CheckoutItem.dart';
import 'package:resteraunt_starter/models/bloc/FoodBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//item price shpuld be equal to the sides selected


class CartItemList extends StatelessWidget {
  final List<CheckOutItem> foodList;
  const CartItemList({Key key, this.foodList}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(child:
    Expanded(
      child:
      ListView.separated(
        itemBuilder: (BuildContext context, int i) {
          return CartITem(item: this.foodList[i]);
        },
        separatorBuilder: (BuildContext context, int i) {
          return SizedBox(height: 5.0);
        },
        itemCount: this.foodList.length,
      ),
    ),
    );
  }
}



