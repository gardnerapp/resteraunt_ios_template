
import 'Extra.dart';
import 'SideCollection.dart';

class Item {
  final int id;
  final String name;
  final double price;
  final String description;
  final List<SideCollection> sideCollections;
  final List<Extra> extras;

  Item(
      {this.id,
      this.name,
      this.price,
      this.description,
      this.sideCollections,
      this.extras});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        description: json['description'],
        sideCollections: json['sideCollections']
            .map((e) => SideCollection.fromJson(e))
            .toList(),
        extras: json['extras'].map((e) => Extra.fromJson(e)).toList());
  }
}
