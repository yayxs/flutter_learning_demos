import 'package:flutter/material.dart';
import 'package:spider_chart/spider_chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spider Chart Example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spider Chart Example'),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: SpiderChart(
              data: [49.98, 2.44, 0.82, 41.47, 5.29],
              maxValue: 100,
              colors: <Color>[
                Colors.red,
                Colors.orange,
                Colors.green,
                Colors.yellow,
                Colors.indigo,
              ],
              labels: <String>[
                "听讲",
                "举手",
                "学生互动",
                "读写",
                "应答",
              ]),
        ),
      ),
    );
  }
}
