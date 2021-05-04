import 'package:resteraunt_starter/models/menu/Item.dart';

class Section {
  final int id;
  final String title;
  final String image;

  Section({this.id, this.image, this.title});

// Todo Add Item panel and Item Model then route to Item List
  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      id: json['id'],
      title: json['title'],
      image: json['image']
    );
  }
}
