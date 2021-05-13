import 'dart:convert';

import 'package:resteraunt_starter/api/BaseAPI.dart';
import 'package:http/http.dart' as http;

class AuthAPI extends BaseAPI{

  Future<http.Response> signUpUser(String name, String email, String phone,
      String password, String passwordConfirmation) async {
    var body = jsonEncode({
      'user': {
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
        'password_confirmation': passwordConfirmation
      }
    });

    http.Response response =
        await http.post(super.usersPath, headers: headers, body: body);

    print(jsonDecode(response.body));
    print("\n STATUS CODE: ${response.statusCode}");
    return response;
  }

  Future<http.Response> createSession(String email, String password) async {
    var body = jsonEncode({
      'email': email, 'password': password
    });

    http.Response response =
        await http.post(super.sessionsPath, headers: headers, body: body);

    print(jsonDecode(response.body));
    print("\n STATUS CODE: ${response.statusCode}");
    return response;
  }


//TODO Reset Password, LOGOT

  Future<http.Response> destroySession(int id, String token) async {
    var body = jsonEncode({
      'id': id, 'token': token
    });
    //HOW TOD SEND DATA WITH DELETE
   // http.Response response = await http.

  }

}