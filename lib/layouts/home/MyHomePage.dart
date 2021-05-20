import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resteraunt_starter/api/AuthAPI.dart';
import 'package:resteraunt_starter/cart/Cart.dart';
import 'package:resteraunt_starter/layouts/authentication/Auth.dart';
import 'package:resteraunt_starter/layouts/home/MyCarousel.dart';
import 'package:resteraunt_starter/layouts/home/SectionListBuilder.dart';
import 'package:resteraunt_starter/layouts/shared/helpers.dart';
import 'package:resteraunt_starter/models/prefs/prefs.dart';
import 'package:resteraunt_starter/models/user/UserCubit.dart';
import 'package:resteraunt_starter/models/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';


// User opens app -> checks saved preferences
// if saved get user, cubit added else normal

//user logins in prefs save, cubit added

// user logs out, cubit removed, faved prefs removed


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthAPI _authAPI = AuthAPI();
    return BlocBuilder<UserCubit, User>(
      buildWhen: (previous, current) => previous != current,
        builder: (BuildContext context, User state){
          checkPrefsForUser() async {
          SharedPreferences _prefs = await SharedPreferences.getInstance();
          var _sharedToken = _prefs.getString('token');
          var _sharedId = _prefs.getInt('id');
          if(_sharedToken != null && _sharedId != null){
            try{
              var req = await _authAPI.getUser(_sharedId, _sharedToken);
              if(req.statusCode == 202){
                var user = User.fromReqBody(req.body);
                BlocProvider.of<UserCubit>(context).login(user);
                upDateSharedPreferences(user.token, user.id);
              }
            }on Exception catch (e){

            }

          }
        }
        if(state == null){
          checkPrefsForUser();
        }
      return Scaffold(
          appBar: AppBar(
            title: Text("Corey\'s Corner"),
            leading:
            state == null ?
            IconButton(
              icon: Icon(Icons.login),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Auth()));
              },
            ) : null,
            actions: [
              IconButton(icon: Icon(Icons.shopping_cart_sharp), onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
              }),
               state != null ?
              IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: () async {
                    SharedPreferences _prefs = await SharedPreferences.getInstance();
                    _prefs.remove('id');
                    _prefs.remove('token');
                    try {
                      var req = await _authAPI.destroySession(
                          state.id, state.token);
                      if (req.statusCode == 202) {
                        BlocProvider.of<UserCubit>(context).logout();
                      } else {
                        pushError(context);
                      }
                    } on Exception catch (e) {
                      print(e);
                    }
                  }) : SizedBox(height: 0.0)

            ],
          ),
          body: Column(
            children: [
              MyCarousel(),
             SectionListBuilder(),
            ],
          ));
    });
  }
}

