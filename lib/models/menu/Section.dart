import 'package:resteraunt_starter/models/menu/Item.dart';

class Section {
  final int id;
  final String title;
  final String image;

  Section({this.id, this.image, this.title});

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      id: json['id'],
      title: json['title'],
      image: json['image']
    );
  }
}
