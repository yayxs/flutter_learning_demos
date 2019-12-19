import 'package:fl_chart_pie_demo/pie_chart_page.dart';
import 'package:flutter/material.dart';
import './samples/pie_chart_sample2.dart';

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
        home: Scaffold(appBar: AppBar(), body: PieChartSample2()));
  }
}
