import 'package:resteraunt_starter/models/menu/Extra.dart';

class CheckOutItem{

  String name;
  double price;
  String additionalInstructions;
  List<Extra> extras;

  CheckOutItem({String name, double price, String additionalInstructions, List<Extra> extras}){
    this.name = name;
    this.price = price;
    this.additionalInstructions = additionalInstructions;
    this.extras = extras;
  }

}