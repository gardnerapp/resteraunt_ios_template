import 'package:resteraunt_starter/models/menu/Side.dart';

class CheckOutItem{

  String name;
  double price;
  String additionalInstructions;
  List<Side> sides;

  CheckOutItem({String name, double price, String additionalInstructions, List<Side> sides}){
    this.name = name;
    this.price = price;
    this.additionalInstructions = additionalInstructions;
    this.sides = sides;
  }


  double sidesTotal(){
    var total = 0.0;
    if(this.sides != null && this.sides.isNotEmpty){
      this.sides.forEach((element) {total += element.price; });
    }
    return total;
  }

  double sidesAndPriceTotal(){
      return this.price + sidesTotal();
  }

  Map<String, dynamic> toJson(){
    var json = {
      'name': name,
      'total': sidesAndPriceTotal(),
      'sides': this.sides.map((side) => side.toJson()).toList(),
      'additional_instructions': additionalInstructions,
    };
    return json;
  }

}