import 'package:flutter/material.dart';
import 'package:resteraunt_starter/cart/CartItem.dart';
import 'package:resteraunt_starter/models/bloc/CheckoutItem.dart';
import 'package:resteraunt_starter/models/bloc/FoodBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//item price shpuld be equal to the sides selected

class CartItemList extends StatefulWidget {
  const CartItemList({Key key}) : super(key: key);

  @override
  _CartItemListState createState() => _CartItemListState();
}

class _CartItemListState extends State<CartItemList> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FoodBloc, List<CheckOutItem>>(
        listener: (context, state){
          //TODO what is listener for, is the listen when necessary, what is build when
        },
        buildWhen: (List<CheckOutItem> previous, List<CheckOutItem> current){
          return true;
        },
        listenWhen: (List<CheckOutItem> previous, List<CheckOutItem> current){
      if (current.length != previous.length) {
        return true;
      }
      return false;
    }, builder: (context, foodlist) {
      return Container(child:
          Expanded(
            child:
              ListView.separated(
              itemBuilder: (BuildContext context, int i) {
                return CartITem(item: foodlist[i]);
              },
              separatorBuilder: (BuildContext context, int i) {
                return SizedBox(height: 5.0);
              },
              itemCount: foodlist.length,
            ),
          ),
      );
    });
  }
}
