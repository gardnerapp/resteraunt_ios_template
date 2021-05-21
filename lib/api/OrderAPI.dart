import 'dart:convert';

import 'package:resteraunt_starter/api/BaseAPI.dart';
import 'package:http/http.dart' as http;

class OrderAPI extends BaseAPI {
  Future<http.Response> createOrder(int userId, String token, double total,
      List<Map<String, dynamic>> items) {
    var body = jsonEncode({
      'order': {
        'user_id': userId,
        'token': token,
        'total': total,
        'items': items,
      }
    });

    Future<http.Response> request =
        http.post(super.createOrderPath, body: body, headers: headers);

    return request;
  }
}