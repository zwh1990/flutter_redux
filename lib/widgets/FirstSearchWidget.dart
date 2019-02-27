import 'package:flutter/material.dart';

class FirstSearchWidget extends StatelessWidget {
  final String title;
  final IconData iconData;
  final VoidCallback onPressed;

  FirstSearchWidget(this.title, this.iconData, this.onPressed);

  @override
  Widget build(BuildContext context) {
    Widget widget = new IconButton(
        icon: new Icon(iconData, size: 19, color: Colors.white),
        onPressed: onPressed);
    return new Container(
      child: new Row(
        children: <Widget>[
          new Expanded(
              child: new Text(title,
                  maxLines: 1, overflow: TextOverflow.ellipsis)),
          widget
        ],
      ),
    );
  }
}
