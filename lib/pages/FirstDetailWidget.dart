import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 第一个模块详情
 */
class FirstDetailWidget extends StatefulWidget {

  String name;
  String age;

  FirstDetailWidget(this.name, this.age);

  @override
  FirstDetailWidgetState createState() => new FirstDetailWidgetState();
}

class FirstDetailWidgetState extends State<FirstDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('详情'),
      ),
      body: new Container(
        color: Colors.yellow,
        padding: EdgeInsets.all(10),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('姓名:'+ widget.name,style: new TextStyle(fontSize:14)),
            Text('年龄:'+ widget.age,textAlign:TextAlign.right,style: new TextStyle(fontSize:14))
          ],
        ),
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
  void didUpdateWidget( oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}