
import 'dart:convert';

import 'Side.dart';


class Item {
  final int id;
  final String name;
  final double price;
  String coverPhoto;
  String description;
  List<dynamic> sides;

  Item(
      {this.id,
      this.name,
      this.price,
      this.coverPhoto,
      this.description,
      this.sides});

  factory Item.fromJson(Map<String, dynamic> json) {
    var x = json['sides'].map((e) => Side.fromJson(e)).toList();
    return Item(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        sides: x,
        coverPhoto: json['image'],
        description: json['description']);
  }
}
