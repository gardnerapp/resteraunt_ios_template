import 'dart:convert';
import 'package:resteraunt_starter/models/prefs/prefs.dart';

class User {
  int id;
  String email;
  String phone;
  String name;
  String token;

  User({this.id, this.email, this.phone, this.name, this.token});

  factory User.fromReqBody(String body) {
    Map<String, dynamic> json = jsonDecode(body);

    User user = User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      token: json['token'],
    );

    user.updateSharedPreferences();
    return user;
  }

  void printAttributes() {
    print("id: ${this.id}\n");
    print("email: ${this.email}\n");
    print("phone: ${this.phone}\n");
    print("name: ${this.name}\n");
    print("token: ${this.token}\n");
  }

  // update shared preferences
  void updateSharedPreferences() async {
    Prefs().saveEmailToShared(this.email);
    Prefs().saveTokenToShared(this.token);
  }
}
