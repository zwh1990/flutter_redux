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
        body: new Container(
          color: Colors.yellow,
          height: 200,
          width: 300,
          alignment: Alignment.center,
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    new Future.delayed(const Duration(seconds: 3), () {
      Navigator.push<String>(
          context,
          new MaterialPageRoute(
              builder: (context) => new LoginPage()));
      return true;
    });
  }
}
