import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomPageFirst extends StatefulWidget {
  @override
  BottomPageFirstState createState() => new BottomPageFirstState();
}

class BottomPageFirstState extends State<BottomPageFirst> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('First'),
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
  void didUpdateWidget(BottomPageFirst oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}