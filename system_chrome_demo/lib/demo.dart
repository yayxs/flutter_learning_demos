import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // 第一部分
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.red)),
                width: 300,
                height: 100,
                child: Center(
                  child: Text('第一部分'),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.red)),
                width: 300,
                height: 100,
                child: Center(
                  child: Text('第二部分'),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.red)),
                height: 300,
                child: Center(
                  child: Text('第二部分'),
                ),
              )
            ],
          ),
        ));
  }
}
