import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/widgets/CustomInputWidget.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InputWidget extends StatefulWidget {
  @override
  InputWidgetState createState() => new InputWidgetState();
}

class InputWidgetState extends State<InputWidget> {

  String TAG = "InputWidgetState";

  String _name;
  String _age;
  String _idCode;
  String _phone;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('输入页面'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(10),
        child: new Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new CustomInputWidget('姓名:', '请输入姓名', (String value) {
              _name = value;
              print("_name--->" + _name);
            }),
            Padding(padding: EdgeInsets.only(top: 3)),
            new CustomInputWidget('年龄:', '请输入年龄', (String value) {
              _age = value;
              print("_age--->" + _age);
            }),
            Padding(padding: EdgeInsets.only(top: 3)),
            new CustomInputWidget('身份证号码:', '请输入身份证号码', (String value) {
              _idCode = value;
              print("_idCode--->" + _idCode);
            }),
            Padding(padding: EdgeInsets.only(top: 3)),
            new CustomInputWidget('手机号:', '请输入手机号', (String value) {
              _phone = value;
              print("_phone--->" + _phone);
            }),

            new Expanded(child: new Container(
              padding: EdgeInsets.only(bottom: 30),
              alignment: Alignment.bottomCenter,
              child: new RaisedButton(onPressed: (){
                print("提交--->");
                //正则判断填写的数据
                judgeInput();
              },child:new Text("提交")),
            ))

          ],
        ),
      ),
    );
  }

  /**
   * 判断填写的数据
   */
  void judgeInput() {
    if(_name == null|| _name.length == 0){
      Fluttertoast.showToast(msg: "姓名不能为空");
      return;
    }
    if(_age == null|| _age.length == 0){
      Fluttertoast.showToast(msg: "年龄不能为空");
      return;
    }
    bool idCodeRegex = RegexUtil.isIDCard(_idCode);
    if(!idCodeRegex){
      Fluttertoast.showToast(msg: "身份证号码不正确");
      return;
    }
    bool phoneRegex = RegexUtil.isMobileExact(_phone);
    if(!phoneRegex){
      Fluttertoast.showToast(msg: "手机号码不正确");
      return;
    }

    LogUtil.v("提交--->",tag:TAG);
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
