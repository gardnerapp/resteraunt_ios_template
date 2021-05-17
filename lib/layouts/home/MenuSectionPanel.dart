import 'package:flutter/material.dart';
import 'package:resteraunt_starter/components/Panel.dart';
import 'package:resteraunt_starter/layouts/section/SectionItemsListView.dart';
import 'package:resteraunt_starter/models/menu/Section.dart';
import 'package:resteraunt_starter/models/user/user.dart';

class MenuSectionPanel extends StatelessWidget {
  User user;
  final Section section;

  MenuSectionPanel({Key key, this.section, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Panel(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Container(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Material(
                  elevation: 16.0, child: Image.network(section.image)),
            ),
          )),
          Directionality(
              textDirection: TextDirection.ltr,
              child: Text(
                this.section.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32.0,
                ),
              )),
        ],
      ),
      color: Colors.white,
      sideColor: Theme.of(context).primaryColor,
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SectionItemsListView(
          user: this.user,
          section: this.section,
        )));
      },
    );
  }
}
