import 'package:flutter/material.dart';
import 'package:resteraunt_starter/layouts/item/ExtraSwitchPanel.dart';
import 'package:resteraunt_starter/models/menu/Extra.dart';

class ExtrasSwitchList extends StatefulWidget {
  final List<Extra> extras;
  final Function(List<Extra> selectedExtras) transmitSelectedExtras;

  const ExtrasSwitchList({Key key, this.extras, this.transmitSelectedExtras}) : super(key: key);

  @override
  _ExtrasSwitchListState createState() => _ExtrasSwitchListState();
}

class _ExtrasSwitchListState extends State<ExtrasSwitchList> {
  List<Extra> selectedExtras = [];

  @override
  Widget build(BuildContext context) {
    List<ExtraSwitchPanel> extraPanels = List.generate(
        this.widget.extras.length,
        (i) => ExtraSwitchPanel(
            modifySelectedExtras: modifyExtras,
            extra: this.widget.extras[i])).toList();
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Please Select Any Extra Sides"),
          Wrap(
            children: extraPanels,
          )
        ],
      ),
    );
  }

  void modifyExtras(Extra extra, bool val) {
    setState(() {
      if (val) {
        selectedExtras.add(extra);
      } else {
        if (selectedExtras.contains(extra)) {
          selectedExtras.remove(extra);
        }
      }
    });
    this.widget.transmitSelectedExtras(this.selectedExtras);
  }
}
