import 'package:flutter/material.dart';
import 'package:resteraunt_starter/layouts/shared/ErrorPage.dart';

import 'layouts/home/MyHomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String restaurantName = "Corey\'s Corner";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
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


