import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/biz/ResponseDataJson.dart';
import 'package:flutter_redux/pages/HomePage.dart';
import 'package:flutter_redux/widgets/InputWidget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _userName = "";
  var _password = "";

  final TextEditingController userController = new TextEditingController();
  final TextEditingController pwController = new TextEditingController();

  _LoginPageState() : super();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('登录'),
      ),
      body: new Container(
        color: Colors.black12,
        child: new Center(
          child: SafeArea(
              child: SingleChildScrollView(
            child: new Card(
              elevation: 5.0,
              shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              color: Colors.white,
              margin: EdgeInsets.only(left: 30, right: 30),
              child: new Padding(
                padding:
                    EdgeInsets.only(left: 30, top: 40, right: 30, bottom: 0),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Image.network(
                        'https://upload.jianshu.io/users/upload_avatars/3884536/d847a50f1da0.jpg?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240',
                        width: 90,
                        height: 90),
                    new Padding(padding: new EdgeInsets.all(10)),
                    new InputWidget(
                        hintText: "请输入账号",
                        iconData: Icons.account_circle,
                        onChanged: (String value) {
                          _userName = value;
                        },
                        controller: userController),
                    new Padding(padding: new EdgeInsets.all(10)),
                    new InputWidget(
                        hintText: "请输入密码",
                        iconData: Icons.phone_android,
                        obscureText: true,
                        onChanged: (String password) {
                          _password = password;
                        },
                        controller: pwController),
                    new Padding(padding: new EdgeInsets.all(30.0)),
                    new RaisedButton(
                        onPressed: () {
                          print("--->登录");
                          if (_userName == null || _userName.length == 0) {
                            Fluttertoast.showToast(msg: "账号不能为空");
                            return;
                          }
                          if (_password == null || _password.length == 0) {
                            Fluttertoast.showToast(msg: "密码不能为空");
                            return;
                          }
                          login(_userName, _password);
                        },
                        child: Text("登录")),
                    new Padding(padding: new EdgeInsets.all(10)),
                  ],
                ),
              ),
            ),
          )),
        ),
      ),
    );
  }

  void login(String name, String password) async {
    var api = 'https://www.easy-mock.com/mock/5c6a7acd5c189d024fa5ec6e/login';
    Dio dio = new Dio();
    print("开始请求--->");

//    Navigator.push<String>(
//        context, new MaterialPageRoute(builder: (context) => new HomePage()));

    Map<String, String> params = new HashMap();
    params["name"] = name;
    params["password"] = password;
    Response response = await dio.post(api, data: params);
    print(response.data);
    var data = ResponseDataJson.fromJson(response.data);
    if (data.code == "0") {
      Navigator.push<String>(
          context,
          new MaterialPageRoute(
              builder: (context) => new HomePage()));
    }
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
  void didUpdateWidget(LoginPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
