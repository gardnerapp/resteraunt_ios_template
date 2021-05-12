import 'package:flutter/material.dart';
import 'package:resteraunt_starter/components/text_form_styles.dart';

class SignIn extends StatefulWidget {

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _key =  GlobalKey<FormState>();
  String phone;
  String password;
  @override
  Widget build(BuildContext context) {

    return  Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
        child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 70),
                Text("Sign In", style: formTitleStyle(),),
                SizedBox(height: 30),
                Container(
                    width: 400,
                    child: TextFormField(
                      decoration: textInputDecoration("Phone", context),
                      onChanged: (val) => setState(() => phone = val),
                    )
                ),
                SizedBox(height: 30),
                Container(
                  width: 400,
                  child: TextFormField(
                    obscureText: true,
                    decoration: textInputDecoration("Password", context),
                    onChanged: (val) => setState(() => password = val),
                  ),
                ),
                SizedBox(height: 25),
                GestureDetector(
                  child: Text("Forgot Password ?", style: TextStyle(
                      fontSize: 18.0,
                      decoration: TextDecoration.underline
                  ),),
                  onTap: (){
                  //  Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPassword()));
                  },
                ),
                SizedBox(height: 25),
               // Todo submit button
              ],
            )
        )
    );
  }

/*  todo takes json as arg

void PushError(){
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => LoginError()
    ));
  }*/

}