import 'package:flutter/material.dart';
import './stacked_bar_chart.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: <Widget>[
          // 头部仨按钮

          // 统计图
          SliverToBoxAdapter(
              child: Container(
            height: 400,
            child: StackedBarChart.withSampleData(),
          ))
        ],
      ),
    );
  }
}
