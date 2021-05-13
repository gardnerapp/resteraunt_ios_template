import 'dart:convert';

class User{
  // todo next render user obj from json in view and begin sign in processs
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
}