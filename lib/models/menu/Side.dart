// Options for an item, can be free or cost something

class Side {
  final String name;
  final double price;

  Side(this.name, this.price);

  factory Side.fromJson(Map<String, dynamic> json) {
    return Side(json['name'], json['price']);
  }
}