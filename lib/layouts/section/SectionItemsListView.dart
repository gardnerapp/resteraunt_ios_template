import 'package:flutter/material.dart';
import 'package:resteraunt_starter/api/MenuAPI.dart';
import 'package:resteraunt_starter/components/CustomAppBar.dart';
import 'package:resteraunt_starter/layouts/section/ItemPanel.dart';
import 'package:resteraunt_starter/layouts/shared/ErrorPage.dart';
import 'package:resteraunt_starter/models/menu/Section.dart';
import 'package:resteraunt_starter/models/user/user.dart';



class SectionItemsListView extends StatelessWidget {
  final Section section;

  SectionItemsListView({Key key, this.section})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MenuAPI menuAPI = MenuAPI();
    return Scaffold(
        appBar: CustomAppBar(this.section.title, context),
        body: FutureBuilder(
              future: menuAPI.getSectionItems(this.section.id),
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  return ListView.separated(
                    itemCount: snapShot.data.length,
                    padding: EdgeInsets.all(20.0),
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 30.0);
                    },
                    itemBuilder: (context, index) {
                      return ItemPanel(item: snapShot.data[index]);
                    },
                  );
                } else if (snapShot.hasError) {
                  ErrorPage();
                }
                return Container(
                    height: 100.0,
                    child: Center(child: CircularProgressIndicator())
                );
              }),
        );
  }
}
