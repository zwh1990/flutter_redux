import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/widgets/CustomDialogCardItemWidget.dart';

class CustomDialogWidget extends StatefulWidget {
  final String title;
  final ValueChanged<String> editChanged;
  final VoidCallback onPressed;
  final TextEditingController editingController;

  CustomDialogWidget(
      this.title, this.editChanged, this.onPressed, this.editingController);

  @override
  CustomDialogWidgetState createState() => new CustomDialogWidgetState();
}

class CustomDialogWidgetState extends State<CustomDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.transparent,
      //解决刘海屏幕问题
      body: SafeArea(
          //超出父Widget 是可以滑动的
          child: SingleChildScrollView(
        child: new Container(
          //获取屏幕的高度和宽度
          height: MediaQuery.of(context).size.height,

          width: MediaQuery.of(context).size.width,
          color: Colors.black12,

          //触摸收起键盘
          child: new GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: new Center(
              child: new CustomDialogCardItemWidget(
                margin: EdgeInsets.only(left: 50, right: 50),
                shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: new Padding(
                  padding: EdgeInsets.all(12),
                  child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Padding(
                        padding: EdgeInsets.only(top: 5.0, bottom: 15.0),
                        child: new Center(
                          child: new Text(
                            "标题",
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      //编辑输入框
                      new Container(
                        height: MediaQuery.of(context).size.height * 3 / 4,
                        decoration: new BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                            color: Colors.white,
                            border: new Border.all(
                                color: Colors.black12, width: .3)),
                        padding: new EdgeInsets.only(
                            left: 20, top: 12, right: 20, bottom: 12),
                        child: new Column(
                          children: <Widget>[
                            new Expanded(
                              child: new TextField(
                                autofocus: false,
                                maxLines: 100,
                                controller: widget.editingController,
                                onChanged: widget.editChanged,
                                  decoration:new InputDecoration.collapsed(hintText: null)
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      )),
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
  void didUpdateWidget(CustomDialogWieget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
