import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  //todo change link and make clickable, colorize as Blu
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(20.0),
          child: Center(
              child: Text(
            "Request couldn't be processed, please contact customer service\n\n https://newportmarine.app/help ",
            style: TextStyle(fontSize: 30.0),
            textAlign: TextAlign.center,
          )),
        )
      ],
    );
  }
}
