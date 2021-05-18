import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resteraunt_starter/api/AuthAPI.dart';
import 'package:resteraunt_starter/layouts/authentication/Auth.dart';
import 'package:resteraunt_starter/layouts/home/MyCarousel.dart';
import 'package:resteraunt_starter/layouts/home/SectionListBuilder.dart';
import 'package:resteraunt_starter/layouts/shared/helpers.dart';
import 'package:resteraunt_starter/models/prefs/prefs.dart';
import 'package:resteraunt_starter/models/user/UserCubit.dart';
import 'package:resteraunt_starter/models/user/user.dart';


// User opens app -> checks saved preferences
// if saved get user, cubit added else normal

//user logins in prefs save, cubit added

// user logs out, cubit removed, faved prefs removed


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Prefs _prefs = Prefs();
    AuthAPI _authAPI = AuthAPI();
    _prefs.init();
    /*    if(this.widget.user != null){ //user has authentication properties
      if(this.widget.user.id != null && this.widget.user.token != null){
        // save auth to prefrences
        _prefs.savePrefs(this.widget.user.id, this.widget.user.token);
      }
    }else{ // there is no user
      this.widget.user.printAttributes();
      _prefs.displayPrefs();
      checkPrefsForUser();
    }*/
    return BlocBuilder<UserCubit, User>(builder: (context, state){
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
            ) : SizedBox(height: 0.0),
            actions: [
              IconButton(icon: Icon(Icons.shopping_cart_sharp), onPressed: () {}),
              IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: () async {
                    try {
                      var req = await _authAPI.destroySession(
                          _prefs.id, _prefs.token);
                      if (req.statusCode == 202) {
                        _prefs.clearPrefs();
                        BlocProvider.of<UserCubit>(context).logout();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()));
                      } else {
                        pushError(context);
                      }
                    } on Exception catch (e) {
                      print(e);
                    }
                  })

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
/*  checkPrefsForUser() async {
    // do saved preferences have authentication properties
      if(_prefs.token != null && _prefs.id != null){ // if so get user  else no user
        try{
          var req =
          await _authAPI.getUser(_prefs.id, _prefs.token);
          if (req.statusCode == 202) {
            setState(() {
              this.widget.user = User.fromReqBody(req.body);
            });}
        } on Exception catch (e) {
          print(e);
        }

      }
  }*/
}

