import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/pages/BottomPageFirst.dart';
import 'package:flutter_redux/pages/BottomPageThree.dart';
import 'package:flutter_redux/pages/BottomPageTwo.dart';
import 'package:flutter_redux/widgets/BottomTabsWidget.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  final PageController topPageControl = new PageController();
  List<String> tabs = ["动态", "打印", "我的"];
  List<IconData> icons = [
    Icons.print,
    Icons.card_membership,
    Icons.settings_ethernet
  ];

  _renderTab() {
    List<Widget> list = new List();
    for (int i = 0; i < tabs.length; i++) {
      list.add(new FlatButton(
        onPressed: () {
          topPageControl.jumpTo(MediaQuery.of(context).size.width * i);
        },
        child: new Container(
          height: 72,
          child: Tab(icon: new Icon(icons[i], size: 20), text: tabs[i]),
        ),
      ));
    }
    return list;
  }

  _renderPage() {
    return [
      new BottomPageFirst(),
      new BottomPageTwo(),
      new BottomPageThree(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new BottomTabsWidget(

        ///渲染tab
        tabItems: _renderTab(),

        ///渲染页面
        tabViews: _renderPage(),
        topPageControl: topPageControl,
        backgroundColor: Colors.black45,
        indicatorColor: Colors.white);
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
  void didUpdateWidget(HomePage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
