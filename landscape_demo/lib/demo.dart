import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  Demo({Key key}) : super(key: key);

  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: OrientationBuilder(builder: (context, orientation) {
        return GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20.0),
          crossAxisSpacing: 10.0,
          crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
          children: <Widget>[
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.pink)),
            ),
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.pink)),
            ),
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.pink)),
            ),
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.pink)),
            )
          ],
        );
      }),
    );
  }
}
