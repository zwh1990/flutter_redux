import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_redux/src/config.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BottomPageTwo extends StatefulWidget {
  @override
  BottomPageTwoState createState() => new BottomPageTwoState();
}

class BottomPageTwoState extends State<BottomPageTwo> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('打印'),
      ),
      body: new Column(
        children: <Widget>[
          new Container(
            height: 180,
            child: new Swiper(
              itemBuilder: (BuildContext context, int index) {
                return new Image.asset(
                  images[index],
                  fit: BoxFit.fill,
                );
              },
              indicatorLayout: PageIndicatorLayout.COLOR,
              autoplay: true,
              itemCount: images.length,
              pagination: new SwiperPagination(),
              control: new SwiperControl(),
              containerHeight: 120,
            ),
          ),
          new Padding(padding: EdgeInsets.all(20)),
          new Container(
            height: 120,
            margin: new EdgeInsets.only(left: 10,right: 10),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              color: Colors.white,
              border: new Border.all(
                color: Colors.black12,
              ),
            ),
            padding: new EdgeInsets.all(10),
            child: new Row(
              children: <Widget>[


              ],
            ),
          ),
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
