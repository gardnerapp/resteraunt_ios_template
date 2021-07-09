import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resteraunt_starter/api/AuthAPI.dart';
import 'package:resteraunt_starter/components/RaisedIconButton.dart';
import 'package:resteraunt_starter/components/text_form_styles.dart';
import 'package:resteraunt_starter/layouts/authentication/AuthError.dart';
import 'package:resteraunt_starter/layouts/home/MyHomePage.dart';
import 'package:resteraunt_starter/layouts/shared/helpers.dart';
import 'package:resteraunt_starter/models/prefs/prefs.dart';
import 'package:resteraunt_starter/models/user/UserCubit.dart';
import 'package:resteraunt_starter/models/user/user.dart';
import 'package:resteraunt_starter/stripe/cards/CardForm.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}


class _SignUpState extends State<SignUp> {
  AuthAPI _authAPI = AuthAPI();
  final _key = GlobalKey<FormState>();
  String name;
  String email;
  String phone;
  String password;
  String passwordConfirmation;
  static Pattern emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp emailRegex = new RegExp(emailPattern);
  static Pattern phonePattern = r'^(?:[+0]9)?[0-9]{10}$';
  RegExp phoneRegex = new RegExp(phonePattern);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                    margin: EdgeInsets.all(25.0),
                      child: Text(
                "Create Your Account",
                style: formTitleStyle(),
              )),
              Expanded(
                  child: Container(
                      width: 400,
                      child: TextFormField(
                        decoration: textInputDecoration("Name", context),
                        onChanged: (val) {
                          setState(() {
                            name = val;
                          });
                        },
                        validator: (val) =>
                            val.isEmpty ? "Please enter your name" : null,
                      ))),
              Expanded(
                  child: Container(
                      width: 400,
                      child: TextFormField(
                          decoration: textInputDecoration("Email", context),
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          },
                          validator: (val) {
                            if (val.isEmpty) {
                              return "You Forgot to enter your email";
                            } else if (!emailRegex.hasMatch(val)) {
                              return "Your did not enter a valid email address";
                            }
                            return null;
                          }))),
              Expanded(
                  child: Container(
                      width: 400,
                      child: TextFormField(
                          decoration: textInputDecoration("Phone", context),
                          onChanged: (val) {
                            setState(() {
                              phone = val;
                            });
                          },
                          validator: (val) {
                            if (val.isEmpty) {
                              return "You Forgot to enter your email";
                            } else if (!phoneRegex.hasMatch(val)) {
                              return "Your did not enter a valid phone number, ommit - & ()";
                            }
                            return null;
                          }))),
              Expanded(
                  child: Container(
                      width: 400,
                      child: TextFormField(
                          obscureText: true,
                          decoration: textInputDecoration("Password", context),
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                          validator: (val) {
                            if (val.isEmpty) {
                              return "You forgot to enter a password";
                            } else if (val.length < 6) {
                              return "Password must be 6 characters long";
                            } else if (val == "password") {
                              return "That's definitely not a good password choice";
                            }
                            return null;
                          }))),
              Expanded(
                  child: Container(
                      width: 400,
                      child: TextFormField(
                        obscureText: true,
                        decoration: textInputDecoration(
                            "Password Confirmation", context),
                        onChanged: (val) {
                          setState(() {
                            passwordConfirmation = val;
                          });
                        },
                        validator: (val) => val != password
                            ? "Your Passwords Don't Match"
                            : null,
                      ))),
              Expanded(
                  child: Container(
                      width: 400,
                      child: customRaisedIconButton(
                          "Sign Up !", Icons.send, context, () async {
                        if (_key.currentState.validate()) {
                          try {
                            var req = await _authAPI.signUpUser(name, email,
                                phone, password, passwordConfirmation);
                            if (req.statusCode == 202) {
                              var user = User.fromReqBody(req.body);
                              BlocProvider.of<UserCubit>(context).login(user);
                              upDateSharedPreferences(user.token, user.id);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CardForm()));
                            } else {
                              pushError(context);
                            }
                          } on Exception catch (e) {
                            pushError(context);
                          }
                        }
                      })))
            ],
          ),
        ));
  }

}