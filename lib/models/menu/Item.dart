
import 'Extra.dart';
import 'SideCollection.dart';

class Item {
  final int id;
  final String name;
  final double price;
  String coverPhoto;
  String description;

  Item({
    this.id,
    this.name,
    this.price,
    this.coverPhoto,
    this.description,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        coverPhoto: json['image'],
        description: json['description']
    );
  }
}



