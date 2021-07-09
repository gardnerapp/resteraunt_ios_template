import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resteraunt_starter/api/OrderAPI.dart';
import 'package:resteraunt_starter/cart/CartItemsList.dart';
import 'package:resteraunt_starter/components/RaisedIconButton.dart';
import 'package:resteraunt_starter/layouts/authentication/Auth.dart';
import 'package:resteraunt_starter/layouts/shared/helpers.dart';
import 'package:resteraunt_starter/models/bloc/CheckoutItem.dart';
import 'package:resteraunt_starter/models/bloc/FoodBloc.dart';
import 'package:resteraunt_starter/models/user/UserCubit.dart';
import 'package:resteraunt_starter/models/user/user.dart';

//TODO get total from fooditems, calculate sales taxes & make dynamic ie. if user not logged in don't show confirm order

class Cart extends StatefulWidget {
  const Cart({Key key}) : super(key: key);


  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    OrderAPI _orderAPI = OrderAPI();
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: BlocConsumer<FoodBloc, List<CheckOutItem>>(
          listener: (context, state) {

          },
        listenWhen: (List<CheckOutItem> previous, List<CheckOutItem> current) {
          if (current.length != previous.length) {
            return true;
          }
          return false;
        },
        buildWhen: (List<CheckOutItem> previous, List<CheckOutItem> current) {
          return true;
        },
        builder: (BuildContext context, List<CheckOutItem> foodList) {
          return BlocBuilder<UserCubit, User>(
            buildWhen: (previous, current) => previous != current,
            builder: (BuildContext context, User state) {
              return
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30.0),
                    Text("Confirm Order:",
                        style: TextStyle(
                            fontSize: 22.0,
                            decoration: TextDecoration.underline)),SizedBox(height: 10.0),
                    Text("Corey Gardner\n401-536-4647",
                        style: TextStyle(fontSize: 22.0)),SizedBox(height: 10.0),
                    Text("Total:\t \$35.00", style: TextStyle(fontSize: 22.0)),SizedBox(height: 30.0),
                    CartItemList(
                    foodList: foodList,
                  ),
                  customRaisedIconButton(
                      "Place Your Order", Icons.shopping_cart_sharp, context,
                      () async {
                    // Do We have a User
                    if (state == null) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Auth()));
                      return null;
                      // Are there Items in our Cart
                    }
                    if (foodList == null || foodList.isEmpty) {
                      return null;
                    } else {
                      try {
                        var apiFoodList =
                            foodList.map((e) => e.toJson()).toList();
                        var total;
                        apiFoodList.forEach((element) {
                          total += element['total'];
                        });
                        print(total.runtimeType);
                        var req = await _orderAPI.createOrder(
                            state.id, state.token, total, apiFoodList);
                        if (req.statusCode == 202) {
                          // push thankyou
                        } else {
                          pushError(context);
                        }
                      } on Exception catch (e) {}
                    }
                  }),
                  SizedBox(height: 30.0)
                ],
              );
            },
          );
        },
      ),
    );
  }
}
