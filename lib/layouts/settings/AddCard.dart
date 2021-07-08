import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resteraunt_starter/components/RaisedIconButton.dart';
import 'package:resteraunt_starter/components/text_form_styles.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key key}) : super(key: key);

  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {

  //then begin w api, length validations on exps

  String cardDigits;
  String expMonth;
  String expYear;
  String cvc;


  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add A Card"),),
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30.0,),
              TextFormField(
                decoration: textInputDecoration("Card Digits", context),
                onChanged: (val){
                  setState(() {
                    cardDigits = val;
                  });
                },
                validator: (val) => val == null || val.isEmpty ? "Please include your card number" : null,
              ),SizedBox(height: 30.0,),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    decoration: textInputDecoration("Exp Month", context),
                    onChanged: (val) => setState(() => expMonth = val),
                  )),
                  Text(
                    "   /   ",
                    style: TextStyle(fontSize: 32.0),
                  ),
                  Expanded(
                      child: TextFormField(
                    decoration: textInputDecoration("Exp Year", context),
                    onChanged: (val) => setState(() => expYear = val),
                  )),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              TextFormField(
                decoration: textInputDecoration("CVC", context),
                onChanged: (val) => setState(() => cvc = val),
              ),
              SizedBox(height: 30.0),
              Container(
                  width: 400,
                  child: customRaisedIconButton("Continue", Icons.send, context,
                      () async {
                    if (_formKey.currentState.validate()) {}
                  }))
            ],
          ),
        ),
      ),
    );
  }
}

