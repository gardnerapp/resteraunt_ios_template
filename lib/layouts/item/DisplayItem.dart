import 'package:flutter/material.dart';
import 'package:resteraunt_starter/components/CustomAppBar.dart';
import 'package:resteraunt_starter/models/menu/Item.dart';

class DisplayItem extends StatefulWidget {
  final Item item;

  // Extras == one from many ie. sauces
  // can Have multiple groups of extras
  // Sides == many can be free or cost money

  const DisplayItem({Key key, this.item}) : super(key: key);

  @override
  _DisplayItemState createState() => _DisplayItemState();
}

class _DisplayItemState extends State<DisplayItem> {
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
            ],
          ),
        ));
  }
}
