import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/biz/FistModuleBean.dart';
import 'package:flutter_redux/biz/ResponseDataJson.dart';
import 'package:flutter_redux/pages/InputWidget.dart';
import 'package:flutter_redux/widgets/FirstSearchWidget.dart';
import 'package:flutter_redux/widgets/material_search.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class BottomPageFirst extends StatefulWidget {
  @override
  BottomPageFirstState createState() => new BottomPageFirstState();
}

class BottomPageFirstState extends State<BottomPageFirst>
    with AutomaticKeepAliveClientMixin {
  ScrollController _controller = new ScrollController();
  List<FistModuleBean> list = new List();
  var currentPage = 1;

  final _names = ['张三', '李四'];
  var _name;

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
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new Scaffold(
      appBar: new AppBar(
        title: FirstSearchWidget("Fitst", Icons.search, () {
          print("点击了搜索按钮");
          Navigator.of(context)
              .push(new MaterialPageRoute<String>(
              settings: new RouteSettings(
                name: 'material_search',
                isInitialRoute: false,
              ),
              builder: (BuildContext context) {
                return new Material(
                  child: new MaterialSearch<String>(
                    placeholder: '请输入内容',
                    results: _names
                        .map((String v) =>
                    new MaterialSearchResult<String>(
                      icon: Icons.person,
                      value: v,
                      text: "$v",
                    ))
                        .toList(),
                    filter: (dynamic value, String criteria) {
                      return value.toLowerCase().trim().contains(new RegExp(
                          r'' + criteria.toLowerCase().trim() + ''));
                    },
                    onSelect: (dynamic value) =>
                        Navigator.of(context).pop(value),
                    onSubmit: (String value) =>
                        Navigator.of(context).pop(value),
                  ),
                );
              }))
              .then((dynamic value) {
            print("返回值value--->" + value);
            if (!_names.contains(value)) {
              _names.add(value);
            }

            setState(() {

            });
          });
        }),
      ),
      body: LazyLoadScrollView(
          onEndOfPage: () => _pullData(), child: listViewLayoutSeparated(list)),
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
                padding:
                EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
                child: new Row(
                  children: <Widget>[
                    new Image.network(
                        'https://upload.jianshu.io/users/upload_avatars/3884536/d847a50f1da0.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240',
                        width: 60,
                        height: 60),
                    Padding(
                        padding: EdgeInsets.only(
                            left: 10, top: 0, right: 0, bottom: 0)),
                    new Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Row(
                          children: <Widget>[
                            new Text(
                              "${"姓名:" + list[i].name}",
                              style: new TextStyle(
                                  fontSize: 14.0, color: Colors.red),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 5, top: 0, right: 0, bottom: 0)),
                            new Text(
                              "${"年龄:" + list[i].age}",
                              style: new TextStyle(
                                  fontSize: 14.0, color: Colors.green),
                            ),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 5, top: 0, right: 0, bottom: 0)),
                            new Text(
                              "${"性别:" + list[i].sex}",
                              style: new TextStyle(
                                  fontSize: 14.0, color: Colors.blue),
                            ),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 0, top: 5, right: 0, bottom: 0)),
                        Text(
                          '身份证号码:123456789123456789',
                          style:
                          new TextStyle(fontSize: 14.0, color: Colors.blue),
                        )
                      ],
                    )
                  ],
                )),
            onTap: () {
              Navigator.push<String>(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new InputWidget()));
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
