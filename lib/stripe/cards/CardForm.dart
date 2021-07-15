import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:resteraunt_starter/api/CardAPI.dart';
import 'package:resteraunt_starter/components/RaisedIconButton.dart';
import 'package:resteraunt_starter/models/user/UserCubit.dart';
import 'package:resteraunt_starter/models/user/user.dart';

class CardForm extends StatefulWidget {

  @override
  _CardFormState createState() => _CardFormState();
}

class _CardFormState extends State<CardForm> {
  @override
  Widget build(BuildContext context) {

    CardAPI cardAPI = CardAPI();

    return BlocBuilder<UserCubit, User>(
      buildWhen: (previous, current) => previous != current,
        builder: (BuildContext context, User user){
      return Scaffold(
        appBar: AppBar(
          title: Text("Add Payment Info"),
          actions: [
            IconButton(icon: Icon(Icons.home), onPressed: (){
              Navigator.pushNamed(context, '/');
            })
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CardField(
                onCardChanged: (card) {},
            ),
                SizedBox(height: 40),
                Container(
                    width: 400,
                    child: customRaisedIconButton(
                        "Confirm Payment", Icons.credit_card, context,
                        () async {
                      final paymentMethod = await Stripe.instance
                          .createPaymentMethod(PaymentMethodParams.card());
                      final  req = await cardAPI.createCard(
                          user.id, user.token, paymentMethod.id);
                      print(req);
                      if(req.statusCode == 202){
                        Navigator.pushNamed(context, '/');
                      }
                    }))
              ],
            ),
          );
        });
  }
}