import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resteraunt_starter/models/bloc/CheckoutItem.dart';
import 'package:resteraunt_starter/models/bloc/FoodEvent.dart';

class FoodBloc extends Bloc<FoodEvent, List<CheckOutItem>> {
  FoodBloc(List<CheckOutItem> initialState) : super(initialState);

  List<CheckOutItem> get initialState =>
      List.filled(0, CheckOutItem(), growable: true);

  @override
  Stream<List<CheckOutItem>> mapEventToState(FoodEvent event) async* {
   switch(event.eventType){
     case EventType.add:
       List<CheckOutItem> newState = List.from(state);
       newState.add(event.item);
       yield newState;
       break;
     case EventType.delete:
       List<CheckOutItem> newState = List.from(state);
       newState.remove(event.item);
       yield newState;
       break;
     default:
       throw Exception("Event Not Found: $event");
   }
  }
}