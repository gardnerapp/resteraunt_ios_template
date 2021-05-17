import 'package:flutter/material.dart';
import 'package:resteraunt_starter/api/AuthAPI.dart';
import 'package:resteraunt_starter/layouts/authentication/Auth.dart';
import 'package:resteraunt_starter/layouts/home/MyCarousel.dart';
import 'package:resteraunt_starter/layouts/home/SectionListBuilder.dart';
import 'package:resteraunt_starter/layouts/shared/helpers.dart';
import 'package:resteraunt_starter/models/prefs/prefs.dart';
import 'package:resteraunt_starter/models/user/user.dart';

// create bloc to store user

class MyHomePage extends StatefulWidget {
  User user;

  MyHomePage({Key key, this.user}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Prefs _prefs = Prefs();
  AuthAPI _authAPI = AuthAPI();

  checkPrefsForUser() async {
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
  }

  @override
  Widget build(BuildContext context) {
    _prefs.init();
    // check if there is a user
    if(this.widget.user != null){ //user has authentication properties
      if(this.widget.user.id != null && this.widget.user.token != null){
        // save auth to prefrences
        _prefs.savePrefs(this.widget.user.id, this.widget.user.token);
      }
    }else{ // there is no user
      this.widget.user.printAttributes();
      _prefs.displayPrefs();
      checkPrefsForUser();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Corey\'s Corner"),
          leading: this.widget.user == null
              ? IconButton(
                  icon: Icon(Icons.login),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Auth()));
                  },
                )
              : null,
          actions: [
            IconButton(icon: Icon(Icons.shopping_cart_sharp), onPressed: () {}),
            this.widget.user != null
                ? IconButton(
                    icon: Icon(Icons.exit_to_app),
                    onPressed: () async {
                      try {
                        var req = await _authAPI.destroySession(
                           _prefs.id, _prefs.token);
                        if (req.statusCode == 202) {
                          _prefs.clearPrefs();
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
                : SizedBox(height: 0.0, width: 0.0)
          ],
        ),
        body: Column(
          children: [
            MyCarousel(),
           SectionListBuilder(),
          ],
        ));
  }
}
