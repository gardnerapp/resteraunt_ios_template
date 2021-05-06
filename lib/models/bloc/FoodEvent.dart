import 'package:resteraunt_starter/models/bloc/CheckoutItem.dart';

enum EventType{add, delete}


class FoodEvent{

  CheckOutItem item;
  EventType eventType;

  FoodEvent.add(CheckOutItem item){
    this.eventType = EventType.add;
    this.item = item;
  }

  FoodEvent.delete(CheckOutItem item){
    this.eventType = EventType.delete;
    this.item = item;
  }

}
