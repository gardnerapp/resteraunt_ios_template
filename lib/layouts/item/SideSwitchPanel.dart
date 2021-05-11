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
      margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 15.0),
      child: Card(elevation: 10.0,
        color: Colors.white70,
        child: SwitchListTile(
            title: Text(this.widget.side.name, style: TextStyle(
              fontSize: 25.0
            ),),
            subtitle: Text("\$${this.widget.side.price}", style: TextStyle(
                fontSize: 20.0
            ),),
            inactiveThumbColor: Colors.white,
            secondary: Icon(Icons.fastfood, size: 50.0, color: Theme.of(context).primaryColor,),
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
