import 'package:flutter/material.dart';
import 'package:resteraunt_starter/models/menu/SideCollection.dart';

class SideSelector extends StatefulWidget {
  final SideCollection sideCollection;

  const SideSelector({Key key, this.sideCollection}) : super(key: key);
  @override
  _SideSelectorState createState() => _SideSelectorState();
}

//TOOD add sized box or padding at bottom to give some room for the next elem
class _SideSelectorState extends State<SideSelector> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
