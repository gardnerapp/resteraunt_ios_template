import 'dart:convert';

import 'package:resteraunt_starter/api/BaseAPI.dart';
import 'package:http/http.dart' as http;

class OrderAPI extends BaseAPI {
  Future<http.Response> createOrder(int userId, String token, double total,
      Map<String, dynamic> items, Map<String, dynamic> sides) {
    var body = jsonEncode({
      'order': {
        'user_id': userId,
        'token': token,
        'total': total,
        'items': items,
        'sides': sides
      }
    });

    Future<http.Response> request =
        http.post(super.createOrderPath, body: body, headers: headers);

    return request;
  }
}