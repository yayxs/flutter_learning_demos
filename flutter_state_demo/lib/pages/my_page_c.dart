import 'package:flutter/material.dart';

class MyPageC extends StatefulWidget {
  MyPageC({Key key}) : super(key: key);

  @override
  _MyPageCState createState() => _MyPageCState();
}

class _MyPageCState extends State<MyPageC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('C页面'),
      ),
      body: Container(
        child: Center(
          child: Text('我是C页面'),
        ),
      ),
    );
  }
}
