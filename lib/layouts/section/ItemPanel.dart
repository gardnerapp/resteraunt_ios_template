import 'package:flutter/material.dart';
import 'package:resteraunt_starter/components/Panel.dart';
import 'package:resteraunt_starter/layouts/item/DisplayItem.dart';
import 'package:resteraunt_starter/models/menu/Item.dart';

class ItemPanel extends StatelessWidget {
  final Item item;

  const ItemPanel({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Panel(
      color: Colors.white,
      sideColor: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          itemPanelRowChild(this.item.name),
          itemPanelRowChild("\$${this.item.price.toString()}")
        ],
      ),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DisplayItem(item: this.item)));
      },
    );
  }

  Widget itemPanelRowChild(String text) {
    return  Directionality(
          textDirection: TextDirection.ltr,
          child: Text(
            text,
            style: TextStyle(color: Colors.black, fontSize: 20.0),
          )
    );
  }
}
