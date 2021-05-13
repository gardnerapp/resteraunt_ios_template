import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static SharedPreferences _prefs;

  Prefs() {
    print("pre init");
    _init();
  }

  Future _init() async {
    _prefs = await SharedPreferences.getInstance();
    print("Initialized");
    print(_prefs);
  }

  void saveEmailToShared(String email) async {
    _prefs.setString("email", email);
  }

  void saveTokenToShared(String token) async {
    _prefs.setString("token", token);
  }

  Map<String, String> getPrefs() {
    var map = {};
    map["email"] = _prefs.get('email');
    print("pref email: ${_prefs.get('email')}");
    map["token"] = _prefs.get("token");
    print("pref token: ${_prefs.get('token')}");
    print("map: $map");
    return map;
  }
}
