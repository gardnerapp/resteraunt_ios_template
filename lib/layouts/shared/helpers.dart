import 'package:flutter/material.dart';
import 'package:resteraunt_starter/layouts/shared/ErrorPage.dart';

void pushError(context){
  Navigator.push(context, MaterialPageRoute(builder: (context) => ErrorPage()));
}