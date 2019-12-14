import 'package:flutter/material.dart';
import './loading.dart';
import 'package:oktoast/oktoast.dart';

class LoadingDemo extends StatefulWidget {
  @override
  _LoadingDemoState createState() => _LoadingDemoState();
}

class _LoadingDemoState extends State<LoadingDemo> {
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ProgressDialog(
        loading: _loading,
        msg: '正在加载...',
        child: Center(
          child: RaisedButton(
            onPressed: () => _onRefresh(),
            child: Text('显示加载动画'),
          ),
        ),
      ),
    );
  }

  _onRefresh() async {
    setState(() {
      _loading = !_loading;
    });
    await Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _loading = !_loading;
        showToast("加载完成");
      });
    });
  }
}
