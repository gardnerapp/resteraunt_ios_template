import 'package:flutter/material.dart';
import 'package:resteraunt_starter/models/user/user.dart';

class OrderDetails extends StatelessWidget {
  final User user;
  final double total;
  final int itemCount;
  const OrderDetails({Key key, this.user, this.total, this.itemCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          child: Column(
            children: [
              Text("Confirm Order:",
                  style: TextStyle(
                      fontSize: 22.0,
                      decoration: TextDecoration.underline)),
              SizedBox(height: 10.0),
                  Text("${user.name}",
                  style: TextStyle(fontSize: 22.0)),
              SizedBox(height: 10.0),
              Text("${user.phone}",
                  style: TextStyle(fontSize: 22.0)),
              SizedBox(height: 10.0),
              Text("$itemCount item(s)", style: TextStyle(fontSize: 22.0)),
              SizedBox(height: 10.0),
              Text("Total:\t \$$total", style: TextStyle(fontSize: 22.0)),
              SizedBox(height: 30.0),
            ],
          ),
        );
  }
}

