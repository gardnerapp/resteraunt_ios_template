import 'package:flutter/material.dart';
import 'package:resteraunt_starter/layouts/item/SideSwitchPanel.dart';
import 'package:resteraunt_starter/models/menu/Side.dart';

class SidesSwitchList extends StatefulWidget {
  final List<dynamic> sides;
  final Function(List<Side> selectedExtras) transmitSelectedSides;

  const SidesSwitchList({Key key, this.sides, this.transmitSelectedSides}) : super(key: key);

  @override
  _SidesSwitchListState createState() => _SidesSwitchListState();
}

class _SidesSwitchListState extends State<SidesSwitchList> {
  List<Side> selectedExtras = [];

  @override
  Widget build(BuildContext context) {
    List<SideSwitchPanel> sidePanels = List.generate(
        this.widget.sides.length,
        (i) => SideSwitchPanel(
            modifySelectedSides: modifyExtras,
            side: this.widget.sides[i])).toList();
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Please Select Any Extra Sides"),
          Wrap(
            children: sidePanels,
          )
        ],
      ),
    );
  }

  void modifyExtras(Side side, bool val) {
    setState(() {
      if (val) {
        selectedExtras.add(side);
      } else {
        if (selectedExtras.contains(side)) {
          selectedExtras.remove(side);
        }
      }
    });
    this.widget.transmitSelectedSides(this.selectedExtras);
  }
}
