import 'package:flutter/material.dart';


//generic panel for MenuSectionPanel & ItemPanel
class Panel extends StatelessWidget {
  final Widget child;
  final Color color;
  final Color sideColor;
  final Function onPressed;

  const Panel({Key key, this.color, this.sideColor, this.onPressed, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed,
    child: child,
      color: color,
      colorBrightness: Brightness.dark,
      textTheme: ButtonTextTheme.primary,
      elevation: 16.0,
      padding: EdgeInsets.all(25.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
        side: BorderSide(
          color: sideColor,
          width: 2.0
        )
      ),
    );
  }
}
