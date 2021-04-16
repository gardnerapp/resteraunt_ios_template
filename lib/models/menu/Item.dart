class Item{
  final String name;
  final String description;
  final double price;
  final int id;


  Item({this.id,this.name, this.description, this.price});

  factory Item.fromJson(Map<String,dynamic> json){
    return Item(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
    );
  }
}