import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import './my_model.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('sas'),
        ),
        body: Container(
          child: Text('sasas'),
        ));
  }

  fetchData() async {
    try {
      Response response =
          await Dio().get("http://rap2api.taobao.org/app/mock/236998/api/test");

      var res = Demojson.fromJson(response.data);
      print('${res.data[0].list[0].url}');
    } catch (e) {
      print(e);
    }
  }
}
