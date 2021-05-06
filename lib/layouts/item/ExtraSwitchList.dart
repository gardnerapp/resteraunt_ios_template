import 'package:flutter/material.dart';
import 'package:resteraunt_starter/layouts/item/ExtraSwitchPanel.dart';
import 'package:resteraunt_starter/models/menu/Extra.dart';

class ExtrasSwitchList extends StatelessWidget {
  final List<Extra> extras;

  const ExtrasSwitchList({Key key, this.extras}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ExtraSwitchPanel> extraPanels = List.generate(
            this.extras.length, (i) => ExtraSwitchPanel(extra: this.extras[i]))
        .toList();
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
}
