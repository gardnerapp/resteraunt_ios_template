import 'package:flutter/material.dart';
import 'package:resteraunt_starter/components/CustomAppBar.dart';
import 'package:resteraunt_starter/layouts/section/ItemPanel.dart';
import 'package:resteraunt_starter/models/menu/Item.dart';
import 'package:resteraunt_starter/models/menu/Section.dart';

class SectionItemsListView extends StatelessWidget {
  final Section section;
  final List<Item> sectionItems;

  const SectionItemsListView({Key key, this.sectionItems, this.section})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(this.section.title),
        body: ListView.separated(
          itemCount: sectionItems.length,
          padding: EdgeInsets.all(20.0),
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 30.0);
          },
          itemBuilder: (context, index) {
            return ItemPanel(item: sectionItems[index]);
          },
        ));
  }
}
