import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resteraunt_starter/components/CustomAppBar.dart';
import 'package:resteraunt_starter/layouts/item/SideSwitchList.dart';
import 'package:resteraunt_starter/models/bloc/CheckoutItem.dart';
import 'package:resteraunt_starter/models/bloc/FoodBloc.dart';
import 'package:resteraunt_starter/models/bloc/FoodEvent.dart';
import 'package:resteraunt_starter/models/menu/Side.dart';
import 'package:resteraunt_starter/models/menu/Item.dart';

class DisplayItem extends StatefulWidget {
  final Item item;

  const DisplayItem({Key key, this.item}) : super(key: key);

  @override
  _DisplayItemState createState() => _DisplayItemState();
}

class _DisplayItemState extends State<DisplayItem> {
  String additionalInstructions;
  List<Side> selectedSides;

  @override
  Widget build(BuildContext context) {
    CheckOutItem _checkOutItem = new CheckOutItem(
        name: this.widget.item.name,
        price: this.widget.item.price,
        extras: this.selectedSides,
        additionalInstructions: this.additionalInstructions);

    return Scaffold(
        appBar: CustomAppBar(this.widget.item.name),
        body: Container(
          child: ListView(
            padding: EdgeInsets.all(10.0),
            children: [
              this.widget.item.description.isNotEmpty
                  ? Text(
                      this.widget.item.description,
                      style: TextStyle(fontSize: 20.0),
                      textAlign: TextAlign.center,
                    )
                  : SizedBox(height: 0.0),
              TextFormField(
                onChanged: (val) {
                  setState(() => additionalInstructions = val);
                },
              ),
              this.widget.item.sides != null || this.widget.item.sides != []
                  ? SidesSwitchList(
                      sides: this.widget.item.sides,
                      transmitSelectedSides: transmitSelectedSides,
                    )
                  : SizedBox(height: 0.0),
              ElevatedButton.icon(
                icon: Icon(Icons.shopping_cart_sharp),
                label: Text("Add To Card"),
                onPressed: () {
                  BlocProvider.of<FoodBloc>(context)
                      .add(FoodEvent.add(_checkOutItem));
                },
              )
            ],
          ),
        ));
  }

  void transmitSelectedSides(List<Side> sides) {
    setState(() {
      this.selectedSides = sides;
    });
  }
}
