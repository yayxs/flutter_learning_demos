import 'package:flutter/material.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isShowFir = true;
  bool isShowSec = false;
  bool isShowThr = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                isShowFir = true;
                isShowSec = false;
                isShowThr = false;
              });
            },
            child: Container(
              width: 100,
              height: 100,
              decoration:
                  BoxDecoration(color: isShowFir ? Colors.pink : Colors.white),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isShowFir = false;
                isShowSec = true;
                isShowThr = false;
              });
            },
            child: Container(
              width: 100,
              height: 100,
              decoration:
                  BoxDecoration(color: isShowSec ? Colors.pink : Colors.white),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isShowFir = false;
                isShowSec = false;
                isShowThr = true;
              });
            },
            child: Container(
              width: 100,
              height: 100,
              decoration:
                  BoxDecoration(color: isShowThr ? Colors.pink : Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
