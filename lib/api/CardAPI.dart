import 'dart:convert';

import 'package:resteraunt_starter/api/BaseAPI.dart';
import 'package:http/http.dart' as http;

class CardAPI extends BaseAPI {
  Future<http.Response> createCard(
    int userId,
    String token,
    String paymentMethodId,
  ) async {
    var body = jsonEncode(
        {'id': userId, 'token': token, 'payment_method_id': paymentMethodId});

    http.Response response = await (http.post(super.createCardPath,
        headers: super.headers, body: body));

    return response;
  }
}
