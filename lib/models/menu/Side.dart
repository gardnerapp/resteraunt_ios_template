// A free side for an Item Ideally is grouped ie. sauces, toppings etc
class Side {
  final String name;

  Side(this.name);

  factory Side.fromJson(Map<String, dynamic> json) {
    return Side(json['name']);
  }
}
