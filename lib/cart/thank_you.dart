import 'package:flutter/material.dart';
import 'package:resteraunt_starter/layouts/home/MyHomePage.dart';

class ThankYou extends StatelessWidget {
  const ThankYou({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Corey's Corner"),
        leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyHomePage()));
            }),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Thank You !",
            style: thanksText(),
          ),
          SizedBox(height: 10),
          Text(
            "Your Order Will Be Available Soon",
            style: thanksText(),
          )
        ],
      )),
    );
  }

  TextStyle thanksText() {
    return TextStyle(fontSize: 22.0);
  }
}
