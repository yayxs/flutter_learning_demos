import 'package:flutter/material.dart';

class APage extends StatefulWidget {
  APage({Key key}) : super(key: key);

  @override
  _APageState createState() => _APageState();
}

class _APageState extends State<APage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.red)),
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.red,
            height: 500,
          ),
          // Container(
          //   color: Colors.pink,
          //   height: 500,
          // )
        ],
      ),
    );
  }
}
