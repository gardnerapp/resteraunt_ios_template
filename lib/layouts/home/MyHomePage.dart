import 'package:flutter/material.dart';
import 'package:resteraunt_starter/layouts/authentication/Auth.dart';
import 'package:resteraunt_starter/layouts/home/MyCarousel.dart';
import 'package:resteraunt_starter/layouts/home/SectionListBuilder.dart';
import 'package:resteraunt_starter/models/user/user.dart';

// TODO checkout new branch, add shared preferences, upon login update shared preferences, logout remove
// todo if shared preferences get user

class MyHomePage extends StatefulWidget {
  User user;

  MyHomePage({Key key, this.user}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Corey\'s Corner"),
            leading: this.widget.user == null ? IconButton(
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
