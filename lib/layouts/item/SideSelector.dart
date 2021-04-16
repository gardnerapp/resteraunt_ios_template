import 'package:flutter/material.dart';
import 'package:resteraunt_starter/models/menu/SideCollection.dart';

class SideSelector extends StatefulWidget {
  final SideCollection sideCollection;
  final Function(String) selectionCallBack;

  const SideSelector({Key key, this.sideCollection, this.selectionCallBack})
      : super(key: key);

  @override
  _SideSelectorState createState() => _SideSelectorState();
}

//TOOD add sized box or padding at bottom to give some room for the next elem
class _SideSelectorState extends State<SideSelector> {
  int groupValue = -1;

  @override
  Widget build(BuildContext context) {
    var sideList = this.widget.sideCollection.sideList;
    return Container(
      child: Column(
        children: [
          Text(
            this.widget.sideCollection.title,
            textAlign: TextAlign.center,
          ),
          ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: sideList.length,
              itemBuilder: (BuildContext context, int i) {
                return Card(
                  color: Colors.white70,
                  shadowColor: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: RadioListTile(
                      activeColor: Theme.of(context).primaryColor,
                      value: i,
                      groupValue: groupValue,
                      onChanged: _handleRadioChange,
                      secondary: Text(sideList[i].name),
                    ),
                  ),
                );
              }),
          SizedBox(height: 10.0)
        ],
      ),
    );
  }

  void _handleRadioChange(int i) {
    setState(() {
      this
          .widget
          .selectionCallBack(this.widget.sideCollection.sideList[i].name);
      groupValue = i;
    });
  }
}
