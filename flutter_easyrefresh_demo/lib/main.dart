import 'package:flutter/material.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';

void main() {
  _configEasyRefresh();

  runApp(MyApp());
}

_configEasyRefresh() {
  EasyRefresh.defaultHeader = ClassicalHeader(
      enableInfiniteRefresh: false,
      refreshText: "拉动刷新",
      refreshReadyText: "释放刷新",
      refreshingText: "正在刷新...",
      refreshedText: "刷新完成",
      refreshFailedText: "刷新失败",
      noMoreText: "没有更多数据",
      infoText: "更新于 %T");
  EasyRefresh.defaultFooter = ClassicalFooter(
      enableInfiniteLoad: true,
      loadText: "拉动加载",
      loadReadyText: "释放加载",
      loadingText: "正在加载...",
      loadedText: "加载完成",
      loadFailedText: "加载失败",
      noMoreText: "没有更多数据",
      infoText: "更新于 %T");
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHome());
  }
}

class MyHome extends StatefulWidget {
  MyHome({Key key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  EasyRefreshController _controller = EasyRefreshController(); // 刷新控制器
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: EasyRefresh(
        controller: _controller,
        child: Text('sas'),
        onRefresh: () async {},
        onLoad: () async {},
      ),
    );
  }
}
