import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resteraunt_starter/components/CustomAppBar.dart';
import 'package:resteraunt_starter/layouts/item/ExtraSwitchList.dart';
import 'package:resteraunt_starter/models/bloc/CheckoutItem.dart';
import 'package:resteraunt_starter/models/bloc/FoodBloc.dart';
import 'package:resteraunt_starter/models/bloc/FoodEvent.dart';
import 'package:resteraunt_starter/models/menu/Extra.dart';
import 'package:resteraunt_starter/models/menu/Item.dart';

//TODO ADD PICTURE

class DisplayItem extends StatefulWidget {
  final Item item;

  const DisplayItem({Key key, this.item}) : super(key: key);

  @override
  _DisplayItemState createState() => _DisplayItemState();
}

class _DisplayItemState extends State<DisplayItem> {
  String additionalInstructions;
  List<Extra> selectedExtras;

  @override
  Widget build(BuildContext context) {
    CheckOutItem _checkOutItem = new CheckOutItem(
        name: this.widget.item.name,
        price: this.widget.item.price,
        extras: this.selectedExtras,
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
              this.widget.item.extras != null || this.widget.item.extras != []
                  ? ExtrasSwitchList(
                      extras: this.widget.item.extras,
                      transmitSelectedExtras: transmitSelectedExtras,
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

  void transmitSelectedExtras(List<Extra> extras) {
    setState(() {
      this.selectedExtras = extras;
    });
  }
}
