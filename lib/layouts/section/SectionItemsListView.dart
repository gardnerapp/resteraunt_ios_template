import 'package:flutter/material.dart';
import 'package:resteraunt_starter/components/CustomAppBar.dart';
import 'package:resteraunt_starter/layouts/section/ItemPanel.dart';
import 'package:resteraunt_starter/models/menu/Section.dart';

class SectionItemsListView extends StatelessWidget {
  final Section sectionData;

  const SectionItemsListView({Key key, this.sectionData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(this.sectionData.title),
        body: ListView(
            padding: EdgeInsets.all(2.0),
            children: <Widget>[])); //getItemPanels(this.sectionData.items)));
  }

  List<Widget> getItemPanels(List<dynamic> itemList) {
    return itemList.map((item) => ItemPanel(item: item)).toList();
  }
}
