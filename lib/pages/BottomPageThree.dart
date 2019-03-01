import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomPageThree extends StatefulWidget {
  @override
  BottomPageThreeState createState() => new BottomPageThreeState();
}

class BottomPageThreeState extends State<BottomPageThree> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Three'),
      ),
      body: new Container(
        padding: EdgeInsets.only(left: 10, top: 10, right: 10),
        child: new Column(
          children: <Widget>[
            new ListTile(
              leading: new Image(
                  image: AssetImage('images/clear.png'), width: 40, height: 40),
              title: new Text('设置'),
              onTap: () {
                print("点击了设置按钮--->");
              },
            ),
            new Padding(padding: EdgeInsets.only(top: 10)),
            new ListTile(
              leading: new Image(
                  image: AssetImage('images/clear.png'), width: 40, height: 40),
              title: new Text('清理缓存'),
              onTap: () {
                print("点击了清理缓存按钮--->");
              },
            )
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
  void didUpdateWidget(BottomPageThree oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
