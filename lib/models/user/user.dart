import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
class User{
  int id;
  String email;
  String phone;
  String name;
  String token;

  User({this.id, this.email, this.phone, this.name, this.token});

  factory User.fromReqBody(String body) {
    Map<String, dynamic> json = jsonDecode(body);
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      token: json['token'],
    );
  }

  void printAttributes(){
    print("id: ${this.id}\n");
    print("email: ${this.email}\n");
    print("phone: ${this.phone}\n");
    print("name: ${this.name}\n");
    print("token: ${this.token}\n");
  }

  // update shared preferences
  void updateSharedPreferences() async {
    saveEmailToShared();
    saveTokenToShared();
  }

  void saveEmailToShared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", this.email);
  }

  void saveTokenToShared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", this.token);
  }


}