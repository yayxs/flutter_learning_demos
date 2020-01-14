import 'package:flutter/material.dart';
import 'package:flutter_webview/my_home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Main());
  }
}

class Main extends StatefulWidget {
  Main({Key key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          RaisedButton(
              child: Text('sas'),
              onPressed: () {
                Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                  return MyHomePage(
                    url:
                        "http://blog.tangqq.cn/web/flutter-cha-jian-webview_flutter-shi-yong-zhi-bei",
                  );
                }));
              })
        ],
      ),
    );
  }
}
