import 'package:flutter/material.dart';
import 'package:resteraunt_starter/layouts/item/SideSwitchPanel.dart';
import 'package:resteraunt_starter/models/menu/Side.dart';

class SidesSwitchList extends StatefulWidget {
  final List<dynamic> sides;
  final Function(List<Side> selectedSides) transmitSelectedSides;

  const SidesSwitchList({Key key, this.sides, this.transmitSelectedSides}) : super(key: key);

  @override
  _SidesSwitchListState createState() => _SidesSwitchListState();
}

class _SidesSwitchListState extends State<SidesSwitchList> {
  List<Side> selectedSides = [];

  @override
  Widget build(BuildContext context) {
    List<SideSwitchPanel> sidePanels = List.generate(
        this.widget.sides.length,
        (i) => SideSwitchPanel(
            modifySelectedSides: modifySides,
            side: this.widget.sides[i])).toList();
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Please Select Any Extra Sides",
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(height: 12.0),
          Wrap(
            children: sidePanels,
          )
        ],
      ),
    );
  }

  void modifySides(Side side, bool val) {
    setState(() {
      if (val) {
        selectedSides.add(side);
      } else {
        if (selectedSides.contains(side)) {
          selectedSides.remove(side);
        }
      }
    });
    this.widget.transmitSelectedSides(this.selectedSides);
  }
}
