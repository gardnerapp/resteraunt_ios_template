
import 'Side.dart';


class Item {
  final int id;
  final String name;
  final double price;
  String coverPhoto;
  String description;
  List<Side> sides;

  Item({
    this.id,
    this.name,
    this.price,
    this.coverPhoto,
    this.description,
    this.sides
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        sides: json['extras'], //TODO MAP
        coverPhoto: json['image'],
        description: json['description']
    );
  }
}



