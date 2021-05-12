import 'package:flutter/material.dart';

customRaisedIconButton(
    String text, IconData icon, BuildContext context, Function onPressed) {
  return ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
        shadowColor: Theme.of(context).primaryColor,
        elevation: 12.0,
        primary: Colors.grey[200],
        onPrimary: Colors.black,
        minimumSize: Size(50, 70),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
    icon: Icon(icon, size: 40.0),
    label: Text(text, style: TextStyle(fontSize: 20.0)),
    onPressed: onPressed,
  );
}