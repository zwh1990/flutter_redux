import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 登陆输入框
 */

class InputWidget extends StatefulWidget {
  final bool obscureText;
  final String hintText;
  final IconData iconData;
  final ValueChanged<String> onChanged;
  final TextStyle textStyle;
  final TextEditingController controller;

  InputWidget(
      {Key key,
      this.obscureText = false,
      this.hintText,
      this.iconData,
      this.onChanged,
      this.textStyle,
      this.controller})
      : super(key: key);

  @override
  InputWidgetState createState() => new InputWidgetState();
}

class InputWidgetState extends State<InputWidget> {
  InputWidgetState() : super();

  @override
  Widget build(BuildContext context) {
    return new TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: widget.obscureText,
      autofocus: true,
      decoration: new InputDecoration(
          hintText: widget.hintText,
          icon: widget.iconData == null ? null : new Icon(widget.iconData)),
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
  void didUpdateWidget(InputWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
