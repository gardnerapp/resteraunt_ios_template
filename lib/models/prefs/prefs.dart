import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  int id;
  String token;
  static SharedPreferences _prefs;


  Future init() async {
    _prefs = await SharedPreferences.getInstance();
    setProps();
  }

   setProps() {
    bool checkId = _prefs.containsKey('id');
    if(checkId){
      id =  _prefs.getInt('id');
    }
    bool checkToken = _prefs.containsKey('token');
    if(checkToken){
      token = _prefs.getString("token");
    }
  }


  void clearPrefs(){
    _prefs.remove("id");
    _prefs.remove("token");
  }

  void savePrefs(int id, String token){
    _prefs.setInt("id", id);
    _prefs.setString("token", token);
  }

  void displayPrefs(){
    bool checkId = _prefs.containsKey('id');
    if(checkId){
      id =  _prefs.getInt('id');
      print("ID $id");
    } else {
      print("ID KEY is null ");
    }
    bool checkToken = _prefs.containsKey('token');
    if(checkToken){
      token = _prefs.getString("token");
      print("TOKEN $token");
    }else {
      print("TOKEN KEY is null");
    }
  }

}
