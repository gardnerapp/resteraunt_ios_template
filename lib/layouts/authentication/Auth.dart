import 'package:flutter/material.dart';
import 'package:resteraunt_starter/layouts/authentication/SignIn.dart';
import 'package:resteraunt_starter/layouts/authentication/SignUp.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool showSignUp = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              "Newport Marine",
            ),
            elevation: 16.0,
            leading: IconButton(
                icon: Icon(Icons.swap_horiz),
                onPressed: () {
                  setState(() {
                    showSignUp = !showSignUp;
                  });
                })),
        body: Container(child: showSignUp ? SignUp() : SignIn()));
  }
}