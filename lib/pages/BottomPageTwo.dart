import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomPageTwo extends StatefulWidget {
  @override
  BottomPageTwoState createState() => new BottomPageTwoState();
}

class BottomPageTwoState extends State<BottomPageTwo> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Two'),
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
  void didUpdateWidget(BottomPageTwo oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}