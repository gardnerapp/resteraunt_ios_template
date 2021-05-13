import 'package:flutter/material.dart';
import 'package:resteraunt_starter/layouts/authentication/AuthError.dart';


void pushError(context){
  Navigator.push(context, MaterialPageRoute(builder: (context) => AuthError()));
}