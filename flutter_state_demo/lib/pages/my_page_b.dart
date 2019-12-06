import 'package:flutter/material.dart';

class MyPageB extends StatefulWidget {
  MyPageB({Key key}) : super(key: key);

  @override
  _MyPageBState createState() => _MyPageBState();
}

class _MyPageBState extends State<MyPageB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('B页面'),
      ),
      body: Container(
        child: Center(
          child: Text('我是B页面'),
        ),
      ),
    );
  }
}
