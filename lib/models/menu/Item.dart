
import 'Extra.dart';


class Item {
  final int id;
  final String name;
  final double price;
  String coverPhoto;
  String description;
  List<Extra> extras;

  Item({
    this.id,
    this.name,
    this.price,
    this.coverPhoto,
    this.description,
    this.extras
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        extras: json['extras'],
        coverPhoto: json['image'],
        description: json['description']
    );
  }
}



