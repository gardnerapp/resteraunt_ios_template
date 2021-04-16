// Options for an item, can be free or cost something

class Extra {
  final String name;
  final double price;

  Extra(this.name, this.price);

  factory Extra.fromJson(Map<String, dynamic> json) {
    return Extra(json['name'], json['price']);
  }
}