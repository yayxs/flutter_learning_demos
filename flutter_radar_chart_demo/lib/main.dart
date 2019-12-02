import 'package:flutter/material.dart';
// import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import './radar_chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radar Chart Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool darkMode = false;
  double numberOfFeatures = 5;

  @override
  Widget build(BuildContext context) {
    const ticks = [20, 40, 60, 80, 100]; // 数字轴线
    var features = [
      "听讲",
      "举手",
      "生生互动",
      "读写",
      "应答",
    ];
    var data = [
      [52.33, 0.96, 0.04, 45.92, 0.75],
      [48.98, 2.44, 0.82, 41.47, 5.29]
    ];

    features = features.sublist(0, numberOfFeatures.floor());
    data = data
        .map((graph) => graph.sublist(0, numberOfFeatures.floor()))
        .toList();

    return Scaffold(
        appBar: AppBar(
          title: Text('Radar Chart Example'),
        ),
        body: Container(
          child: RadarChart.light(
            ticks: ticks,
            features: features,
            data: data,
            reverseAxis: true,
          ),
        ));
  }
}
