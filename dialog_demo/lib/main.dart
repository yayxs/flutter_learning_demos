import 'package:dialog_demo/home_page.dart';
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
        home: Scaffold(
            appBar: AppBar(),
            body: Stack(
              children: <Widget>[
                Container(
                  child: Center(
                    child: RaisedButton(
                      onPressed: () {},
                      child: Text('用于唤起弹窗'),
                    ),
                  ),
                ),
                Positioned(
                  child: HomePage(),
                )
              ],
            )));
  }
}
