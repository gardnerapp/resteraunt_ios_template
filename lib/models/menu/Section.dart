import 'package:resteraunt_starter/models/menu/Item.dart';

class Section {
  final String title;
  final List<dynamic> items;

  Section({this.title, this.items});

// Todo Add Item panel and Item Model then route to Item List
  factory Section.fromJson(Map<String, dynamic> json) {
    var items = json['items'].map((e) => Item.fromJson(e)).toList();
    return Section(title: json['title'], items: items);
  }
}
