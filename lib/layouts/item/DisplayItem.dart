import 'package:flutter/material.dart';
import 'package:resteraunt_starter/components/CustomAppBar.dart';
import 'package:resteraunt_starter/layouts/item/ExtraSwitchList.dart';
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

  @override
  Widget build(BuildContext context) {
    var description = this.widget.item.description;
    return Scaffold(
        appBar: CustomAppBar(this.widget.item.name),
        body: Container(
          child: ListView(
            padding: EdgeInsets.all(10.0),
            children: [
              description.isNotEmpty
                  ? Text(
                      description,
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
                  ? ExtrasSwitchList(extras: this.widget.item.extras)
                  : SizedBox(height: 0.0),
              ElevatedButton.icon(
                icon: Icon(Icons.shopping_cart_sharp),
                label: Text("Add To Card"),
                onPressed: (){

                },
              )
            ],
          ),
        ));
  }
}
