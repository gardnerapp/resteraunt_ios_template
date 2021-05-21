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



class Cart extends StatefulWidget {
  const Cart({Key key}) : super(key: key);

// might need to wrap this in a bloc consumer an dynamically eneder based on state of the bloc
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
            // TOOD WTF do I do here
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
                    CartItemList(foodList: foodList,),
                  SizedBox(height: 30.0),
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
                        print(total);
                        apiFoodList.forEach((element) {
                          total += element['total'];
                        });
                        print(total);

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
