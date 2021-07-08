import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // render dynamically based on user status
    return Drawer(
      elevation: 16.0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(child: Column(

          )),
         ListTile(
           title: Text("Edit My Card", style: drawText() ,),
           leading: Icon(Icons.credit_card),
           onTap: (){
             Navigator.pushNamed(context, '/add_card');
           }
         )
        ],
      ),
    );
  }
}

TextStyle drawText(){
  return TextStyle(

  );
}

