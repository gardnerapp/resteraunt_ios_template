import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  //todo change link and make clickable, colorize as Blu
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Error")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Your Request Couldn't Be Processed At This Moment",
                style: TextStyle(color: Colors.black, fontSize: 20.0)),
            Text("Please Reach Out To Our Customer Service For Help:",
                style: TextStyle(color: Colors.black, fontSize: 20.0)),
            Text("https://example.com/help", style: TextStyle(color: Colors.black, fontSize: 20.0))
          ],
        ));
  }
}
