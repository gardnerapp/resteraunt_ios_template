import 'package:flutter/material.dart';
import 'package:resteraunt_starter/api/MenuAPI.dart';
import 'package:resteraunt_starter/layouts/home/MenuSectionPanel.dart';

//todo next begin item page w contigents for description adds , sides not being present

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
                    height: 25,
                  );
                },
              padding: EdgeInsets.all(50.0),
              itemCount: snapShot.data.length,
              itemBuilder: (context, index){
                return MenuSectionPanel(section: snapShot.data[index]);
              });
          } else if(snapShot.hasError || !snapShot.hasData){
            //print(snapShot.error);
            return Center(child: Text("Something Went Wrong\n Please Contact"
                "Customer Service For Help", style: TextStyle(
              color: Colors.black,
              fontSize: 20.0
            ),));
          }
          return Container(height: 50.0,
              child: CircularProgressIndicator());
        },
      ),
    );
  }
}
