import 'package:flutter/material.dart';
import 'package:resteraunt_starter/api/MenuAPI.dart';
import 'package:resteraunt_starter/components/Panel.dart';
import 'package:resteraunt_starter/layouts/section/SectionItemsListView.dart';
import 'package:resteraunt_starter/models/menu/Section.dart';

class MenuSectionPanel extends StatelessWidget {
  final Section section;

  const MenuSectionPanel({Key key, this.section}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MenuAPI menuAPI = MenuAPI();
    return Panel(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child:Material(elevation: 16.0,
                      child:  Image.network(section.image)),
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
        try{
          var items = menuAPI.getSectionItems(this.section.id);
          if (items == null){
            Navigator.pushNamed(context, '/error');
          } else{
            Navigator.push(context, MaterialPageRoute(builder: (context) => SectionItemsListView()));
          }
        } catch (e) {
          print("${e.toString()}");
          Navigator.pushNamed(context, '/error');
        }
      },
    );
  }
}
