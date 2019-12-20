import 'package:wheel_chooser/wheel_chooser.dart';
import 'package:flutter/material.dart';

class WheelChooserPage extends StatefulWidget {
  WheelChooserPage({Key key}) : super(key: key);

  @override
  _WheelChooserPageState createState() => _WheelChooserPageState();
}

class _WheelChooserPageState extends State<WheelChooserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WheelChooser.custom(
        onValueChanged: (s) => print(s),
        children: <Widget>[
          Text("data1"),
          Text("data2"),
          Text("data3"),
        ],
      ),
    );
  }
}
