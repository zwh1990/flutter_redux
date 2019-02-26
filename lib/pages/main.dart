import 'package:flutter/material.dart';
import 'package:flutter_redux/pages/LoginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(title: 'Splash Page'),
      routes: {},
    );
  }
}

class SplashPage extends StatefulWidget {
  SplashPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new Stack(
          children: <Widget>[
            new Container(
              margin:
                  new EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
              color: Colors.yellow,
//              child: new Image(image: new AssetImage('static/images/welcome.png')),
            ),
            new Offstage(
                offstage: false,
                child: new Container(
                  alignment: Alignment.topRight,
                  margin: EdgeInsets.all(20.0),
                  child: InkWell(
                    onTap: () {
                      _goLoginPage();
                    },
                    child: new Container(
                      padding: EdgeInsets.all(12.0),
                      child: new Text('跳过',
                          style: new TextStyle(
                              fontSize: 14.0, color: Colors.black)),
                      decoration: new BoxDecoration(
                          color: Color(0x66000000),
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          border: new Border.all(
                              width: 0.33, color: Color(0xffe5e5e5))),
                    ),
                  ),
                ))
          ],
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    new Future.delayed(const Duration(seconds: 3), () {
      Navigator.push<String>(context,
          new MaterialPageRoute(builder: (context) => new LoginPage()));
      return true;
    });
  }

  void _goLoginPage() {
    Navigator.push<String>(
        context, new MaterialPageRoute(builder: (context) => new LoginPage()));
  }
}
