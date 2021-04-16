import 'package:flutter/material.dart';
import 'package:resteraunt_starter/components/CustomAppBar.dart';
import 'package:resteraunt_starter/layouts/item/ExtraSwitchList.dart';
import 'package:resteraunt_starter/layouts/item/SideSelector.dart';
import 'package:resteraunt_starter/models/menu/Item.dart';

class DisplayItem extends StatefulWidget {
  final Item item;

  const DisplayItem({Key key, this.item}) : super(key: key);

  @override
  _DisplayItemState createState() => _DisplayItemState();
}

class _DisplayItemState extends State<DisplayItem> {
  List<String> selectedSides = [];

  @override
  Widget build(BuildContext context) {
    var description = this.widget.item.description;
    var sideCollections = this.widget.item.sideCollections;
    var extras = this.widget.item.extras;

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
              sideCollections != null || sideCollections != []
                  ? sideCollections.map((e) => SideSelector(
                        sideCollection: e,
                        selectionCallBack: (String selectedSide) {
                          setState(() {
                            print(selectedSides);
                            selectedSides.add(selectedSide);
                            print(selectedSides);
                          });
                        },
                      ))
                  : SizedBox(height: 0.0),
              extras != null || extras != []
                  ? ExtrasSwitchList(
                      extras: extras,
                    )
                  : SizedBox(
                      height: 0.0,
                    )
            ],
          ),
        ));
  }
}
