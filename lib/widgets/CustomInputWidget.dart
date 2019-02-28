import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInputWidget extends StatefulWidget {
  final String name;
  final String hint;
  final ValueChanged<String> onChange;

  CustomInputWidget(this.name, this.hint, this.onChange);

  @override
  CustomInputWidgetState createState() => new CustomInputWidgetState();
}

class CustomInputWidgetState extends State<CustomInputWidget> {
  @override
  Widget build(BuildContext context) {
    Text title = new Text(widget.name, style: new TextStyle(fontSize: 14),textAlign:TextAlign.right);
    TextField textFiled = new TextField(
        onChanged: widget.onChange,
        style: new TextStyle(fontSize: 14, color: Colors.black),
        decoration: new InputDecoration(
            hintText: widget.hint, border: InputBorder.none));

    return new Container(
      color: Colors.black12,
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Expanded(flex: 1, child: title),
          new Padding(padding: EdgeInsets.only(left: 3)),
          new Expanded(flex: 3, child: textFiled)
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(CustomInputWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
