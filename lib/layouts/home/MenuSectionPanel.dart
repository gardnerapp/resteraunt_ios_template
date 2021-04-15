import 'package:flutter/material.dart';
import 'package:resteraunt_starter/components/Panel.dart';
import 'package:resteraunt_starter/layouts/section/SectionItemsListView.dart';
import 'package:resteraunt_starter/models/menu/Section.dart';

class MenuSectionPanel extends StatelessWidget {
  final Section sectionData;

  const MenuSectionPanel({Key key, this.sectionData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Panel(
      child: Directionality(
          textDirection: TextDirection.ltr,
          child: Text(
            this.sectionData.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 32.0,
            ),
          )),
      color: Theme.of(context).primaryColor,
      sideColor: Colors.white,
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SectionItemsListView(
                      sectionData: this.sectionData,
                    )));
      },
    );
  }
}
