import 'dart:convert';
import 'package:resteraunt_starter/api/BaseAPI.dart';
import 'package:http/http.dart' as http;
import 'package:resteraunt_starter/models/menu/Section.dart';


class MenuAPI extends BaseAPI{

  Future<List<dynamic>> getMenuSections() async {
      final response = await http.get(super.sectionsPath, headers: headers);

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      var sections = body.map((e) => Section.fromJson(e)).toList();
      return sections;
    } else {
      return null;
    }
  }
}