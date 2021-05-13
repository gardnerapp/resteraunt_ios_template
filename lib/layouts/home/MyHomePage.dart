import 'package:flutter/material.dart';
import 'package:resteraunt_starter/layouts/authentication/Auth.dart';
import 'package:resteraunt_starter/layouts/home/MyCarousel.dart';
import 'package:resteraunt_starter/layouts/home/SectionListBuilder.dart';
import 'package:resteraunt_starter/models/user/user.dart';

class MyHomePage extends StatelessWidget {
  User user;

  MyHomePage({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Corey\'s Corner"),
            leading: this.user == null ? IconButton(
                  icon: Icon(Icons.login),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Auth()));
                  },
                )
              : null,
          actions: [
            IconButton(icon: Icon(Icons.shopping_cart_sharp), onPressed: () {})
          ],
        ),
        body: Column(
          children: [
            MyCarousel(),
            SectionListBuilder(),
          ],
        ));
  }
}
