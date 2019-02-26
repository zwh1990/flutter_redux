import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/biz/FistModuleBean.dart';
import 'package:flutter_redux/biz/ResponseDataJson.dart';

class BottomPageFirst extends StatefulWidget {
  @override
  BottomPageFirstState createState() => new BottomPageFirstState();
}

class BottomPageFirstState extends State<BottomPageFirst> {
  ScrollController _controller = new ScrollController();
  List<FistModuleBean> list = new List();
  var currentPage = 1;

  BottomPageFirstState() {
    _controller.addListener(() {
      var maxScroll = _controller.position.maxScrollExtent;
      var pixels = _controller.position.pixels;

      if (maxScroll == pixels && list.length < 100) {
        setState(() {
          _pullData();
        });
      }
    });
  }


  void _pullData() async {
    var api = 'https://www.easy-mock.com/mock/5c6a7acd5c189d024fa5ec6e/getList';

    Dio dio = new Dio();
    print("开始请求--->");
    Response response = await dio.post(api);
    print(response.data);
    var data = ResponseDataJson.fromJson(response.data);
    setState(() {
      for (var value in data.result) {
        list.add(FistModuleBean.fromJson(value));
      }
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pullData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('First'),
      ),
      body: RefreshIndicator(
          child: listViewLayoutSeparated(list), onRefresh: _onRefresh),
    );
  }

  /**
   * 列表
   */
  Widget listViewLayoutSeparated(List<FistModuleBean> list) {
    return ListView.separated(
        itemBuilder: (content, i) {
          return new InkWell(
            child: new Container(
                height: 90.0,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Text(
                      "${"姓名:"+ list[i].name}",
                      style: new TextStyle(fontSize: 14.0, color: Colors.red),
                    ),
                    new Text(
                      "${"年龄:"+ list[i].age}",
                      style: new TextStyle(fontSize: 14.0, color: Colors.green),
                    ),
                    new Text(
                      "${"性别:"+ list[i].sex}",
                      style: new TextStyle(fontSize: 14.0, color: Colors.blue),
                    ),
                  ],
                )),
            onTap: () {
              print("---> $i");
            },
          );
//      return ;
        },
        controller: _controller,
        separatorBuilder: (context, index) {
          if (index == 2) {
            return new Container(
              height: 40.0,
              child: new Center(
                child: new Text("类型1"),
              ),
              color: Colors.red,
            );
          } else if (index == 7) {
            return new Container(
              height: 40.0,
              child: new Center(
                child: new Text("类型2"),
              ),
              color: Colors.blue,
            );
          } else if (index == 14) {
            return new Container(
              height: 40.0,
              child: new Center(
                child: new Text("类型3"),
              ),
              color: Colors.yellow,
            );
          } else {
            return Divider(height: 1.0, color: Colors.blue);
          }
        },
        itemCount: list.length);
  }


  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      print("开始刷新");
      setState(() {
        list.clear();
        _pullData();
      });
    });
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

