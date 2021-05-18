import 'package:flutter/material.dart';
import 'package:resteraunt_starter/components/Panel.dart';
import 'package:resteraunt_starter/layouts/item/DisplayItem.dart';
import 'package:resteraunt_starter/models/menu/Item.dart';
import 'package:resteraunt_starter/models/user/user.dart';

class ItemPanel extends StatelessWidget {
  final Item item;

  ItemPanel({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Panel(
      color: Colors.white,
      sideColor: Theme.of(context).primaryColor,
      child: this.item.coverPhoto == null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                itemPanelRowChild(this.item.name),
                itemPanelRowChild("\$${this.item.price.toString()}")
              ],
            )
          : Row(children: [
              Expanded(
                  child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Material(
                    elevation: 16.0,
                    child: Image.network(this.item.coverPhoto)),
              )),
              Column(
                children: [
                  itemPanelRowChild(this.item.name),
                  SizedBox(height: 10.0),
                  itemPanelRowChild("\$${this.item.price.toString()}")
                ],
              )
            ]
        ),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DisplayItem( item: this.item)));
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
