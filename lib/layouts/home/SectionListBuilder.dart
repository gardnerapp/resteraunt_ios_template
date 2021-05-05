import 'package:flutter/material.dart';
import 'package:resteraunt_starter/api/MenuAPI.dart';
import 'package:resteraunt_starter/layouts/home/MenuSectionPanel.dart';
import 'package:resteraunt_starter/layouts/shared/ErrorPage.dart';
import 'package:resteraunt_starter/layouts/shared/helpers.dart';


class SectionListBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MenuAPI menu = MenuAPI();
    return Expanded(
      child: FutureBuilder(
        future: menu.getMenuSections(),
        builder: (context, snapShot){
          if(snapShot.hasData){
            return ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 30.0,
                  );
                },
              padding: EdgeInsets.all(50.0),
              itemCount: snapShot.data.length,
              itemBuilder: (context, index){
                return MenuSectionPanel(section: snapShot.data[index]);
              });
          } else if(snapShot.hasError || !snapShot.hasData){
            return ErrorPage();
          }
          return Container(height: 50.0,
              child: CircularProgressIndicator());
        },
      ),
    );
  }
}
