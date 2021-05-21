import 'package:resteraunt_starter/models/menu/Side.dart';

class CheckOutItem{

  String name;
  double price;
  String additionalInstructions;
  List<Side> sides;

  CheckOutItem({String name, double price, String additionalInstructions, List<Side> extras}){
    this.name = name;
    this.price = price;
    this.additionalInstructions = additionalInstructions;
    this.sides = sides;
  }


  double getTotal(){
   var total = this.price;
    if(this.sides != null){

      sides.forEach((element) {total += element.price; });
    }
    return total;
  }

}