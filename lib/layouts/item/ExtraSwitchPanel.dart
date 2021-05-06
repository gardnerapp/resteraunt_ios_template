import 'package:flutter/material.dart';
import 'package:resteraunt_starter/models/menu/Extra.dart';

class ExtraSwitchPanel extends StatefulWidget {
  final Extra extra;
  final Function(Extra extra, bool val) modifySelectedExtras;

  const ExtraSwitchPanel({Key key, this.extra, this.modifySelectedExtras}) : super(key: key);

  @override
  _ExtraSwitchPanelState createState() => _ExtraSwitchPanelState();
}

class _ExtraSwitchPanelState extends State<ExtraSwitchPanel> {
  bool _val = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.white70,
        child: SwitchListTile(
            title: Text(this.widget.extra.name),
            subtitle: Text("${this.widget.extra.price}"),
            inactiveThumbColor: Colors.white,
            secondary: Icon(Icons.fastfood),
            value: _val,
            onChanged: (bool newVal) {
              setState(() {
                _val = newVal;
              });
              this.widget.modifySelectedExtras(this.widget.extra, newVal);
            }),
      ),
    );
  }

}
