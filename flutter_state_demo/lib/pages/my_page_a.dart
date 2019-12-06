import 'package:flutter/material.dart';

class MyPageA extends StatefulWidget {
  final Function callback;
  MyPageA(this.callback);

  @override
  _MyPageAState createState() => _MyPageAState();
}

class _MyPageAState extends State<MyPageA> {
  int money = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('A页面大儿子'),
        ),
        body: Center(
          child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                  border: Border.all(width: 3, color: Colors.blue)),
              child: Column(
                children: <Widget>[
                  Container(
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          money = money + 1;
                        });
                        // 调用回调
                        widget.callback(money);
                      },
                      child: Text('+'),
                    ),
                  ),
                  Container(
                    child: Text('大儿子我现在的压岁钱的值是$money 元'),
                  ),
                ],
              )),
        ));
  }
}
