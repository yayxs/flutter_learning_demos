import 'package:flutter/material.dart';
import './page_b.dart';

class PageA extends StatefulWidget {
  PageA({Key key}) : super(key: key);

  @override
  _PageAState createState() => _PageAState();
}

class _PageAState extends State<PageA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => PageB()),
                );
              },
              child: Text('我是一个按钮'),
            )
          ],
        ));
  }
}
