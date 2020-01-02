import 'package:flutter/material.dart';
import './pages/a_page.dart';

import './pages/b_page.dart';
import './pages/c_page.dart';
import './pages/f_page.dart';
import './pages/e_page.dart';

class DemoPage extends StatefulWidget {
  DemoPage({Key key}) : super(key: key);

  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController; //需要定义一个Controller
  List tabs = ["语文语文", "数学数学", "英语英语", "化学化学", '物理物理'];

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);

    _tabController.addListener(() {
      switch (_tabController.index) {
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            '分析分析',
            style: TextStyle(color: Colors.black),
          ),
          bottom: TabBar(
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.blue, // 未选中的颜色
              labelPadding: EdgeInsets.all(10),
              labelStyle: TextStyle(fontSize: 20),
              labelColor: Colors.black, // 字体的颜色
              indicatorSize: TabBarIndicatorSize.label,
              // indicatorPadding: EdgeInsets.all(20),
              indicatorWeight: 2, // 下划线宽度
              indicatorColor: Colors.red, // 下划线的颜色
              isScrollable: true,
              controller: _tabController,
              tabs: tabs
                  .map((e) => Tab(
                        text: e,
                      ))
                  .toList()),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            APage(),
            BPage(),
            CPage(),
            EPage(),
            FPage(),
          ],
        ),
      );
}
