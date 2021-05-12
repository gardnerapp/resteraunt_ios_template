import 'package:flutter/material.dart';
import 'package:resteraunt_starter/layouts/authentication/Auth.dart';
import 'package:resteraunt_starter/layouts/home/MyCarousel.dart';
import 'package:resteraunt_starter/layouts/home/SectionListBuilder.dart';

class MyHomePage extends StatelessWidget {
  final String restaurantName;

  const MyHomePage({Key key, this.restaurantName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Auth();
  }
// Scaffold(
//       appBar: AppBar(
//         title: Text(restaurantName),),
//       body:  Column(
//           children: [
//             MyCarousel(),
//             SectionListBuilder(),
//           ],
//         )
//       );
}

