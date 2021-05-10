import 'package:flutter/material.dart';
import 'package:resteraunt_starter/models/menu/Side.dart';

class SideSwitchPanel extends StatefulWidget {
  final Side side;
  final Function(Side side, bool val) modifySelectedSides;


  const SideSwitchPanel({Key key, this.side, this.modifySelectedSides}) : super(key: key);

  @override
  _SideSwitchPanelState createState() => _SideSwitchPanelState();
}

class _SideSwitchPanelState extends State<SideSwitchPanel> {
  bool _val = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.white70,
        child: SwitchListTile(
            title: Text(this.widget.side.name),
            subtitle: Text("${this.widget.side.price}"),
            inactiveThumbColor: Colors.white,
            secondary: Icon(Icons.fastfood),
            value: _val,
            onChanged: (bool newVal) {
              setState(() {
                _val = newVal;
              });
              this.widget.modifySelectedSides(this.widget.side, newVal);
            }),
      ),
    );
  }

}
