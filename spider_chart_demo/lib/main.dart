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
              data: [49.98, 24.4, 8.2, 41.47, 15.29],
              maxValue: 100,
              colors: <Color>[
                Colors.red,
                Colors.orange,
                Colors.green,
                Colors.yellow,
                Colors.indigo,
              ],
              labels: <String>[
                "吃",
                "喝",
                "玩",
                "乐",
                "学",
              ]),
        ),
      ),
    );
  }
}
