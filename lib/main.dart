import 'package:flutter/material.dart';

import 'layouts/home/MyHomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String restaurantName = "Corey\'s Corner";
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Starter',
      theme: ThemeData(
        splashColor: Colors.white,
        primarySwatch: Colors.orange,
        appBarTheme: AppBarTheme(
            elevation: 16.0
        ),

      ),
      home: MyHomePage(restaurantName: restaurantName),
    );
  }
}


