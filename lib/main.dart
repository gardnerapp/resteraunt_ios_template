import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resteraunt_starter/models/bloc/FoodBloc.dart';
import 'package:resteraunt_starter/models/bloc/FoodBlocObserver.dart';

import 'layouts/home/MyHomePage.dart';

void main() {
  Bloc.observer = FoodBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => FoodBloc([]),
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
        title: 'Restaurant Starter',
        theme: ThemeData(
          splashColor: Colors.orange,
          primarySwatch: Colors.orange,
          appBarTheme: AppBarTheme(elevation: 16.0),
        ),
        home: MyHomePage(),
      ),
    );
  }
}
