import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:resteraunt_starter/models/bloc/FoodBloc.dart';
import 'package:resteraunt_starter/models/bloc/FoodBlocObserver.dart';
import 'package:resteraunt_starter/models/user/UserCubit.dart';
import 'package:resteraunt_starter/stripe/cards/CardForm.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';



import 'layouts/home/MyHomePage.dart';

void main() {
  Bloc.observer = FoodBlocObserver();
  Stripe.publishableKey = 'pk_test_51IxaNJCcwyYrj32C13AAUnqSBKhE7aIeyyAv9xzIuF0fJCGCigoTYyYDs8HLeTWWELH0z3FWZBRiCVm7vBLMmBGP00vNmk3WEF';
  runApp(MyApp());
}

/*TODOs
  web:

    add devise admin , dynamic links and rerotuing
    order index and show pages
    order api
    fix migrations for production

   iOS:
    add card to user
    place order api
    pickup or delivery
    switch to secure storage

*/


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:  [
        BlocProvider<FoodBloc>(
          create: (BuildContext context) => FoodBloc([]),
        ),
        BlocProvider<UserCubit>(
        create: (BuildContext context) => UserCubit(null)
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
        title: 'Restaurant Starter',
        theme: ThemeData(
          splashColor: Colors.orange,
          primarySwatch: Colors.orange,
          appBarTheme: AppBarTheme(elevation: 16.0,
          centerTitle: true
          ),
        ),
        routes: {
          '/add_card': (context) => CardForm(),
        },
        home: MyHomePage(),
      ),
    );
  }
}
