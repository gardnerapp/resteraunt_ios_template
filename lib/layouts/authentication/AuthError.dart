import 'package:flutter/material.dart';
//TODO CONTACT CUSTOMER SERVICE CORRECT URL
class AuthError extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Error !!"),
          elevation: 16.0,
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
            Navigator.pop(context);
          }),
        ),
        body:
        Container(
          padding: EdgeInsets.all(20.0),
          child: Center(
              child: Text("\tIf this continues to be an issue please contact our customer service\n\n https://newportmarine.app/help ",
                style: TextStyle(fontSize: 30.0), textAlign: TextAlign.center,)
          ),));
  }
}
