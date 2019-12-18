import 'package:flutter/material.dart';

class PageB extends StatefulWidget {
  PageB({Key key}) : super(key: key);

  @override
  _PageBState createState() => _PageBState();
}

class _PageBState extends State<PageB> with SingleTickerProviderStateMixin {
  TabController tabController;
  final List<Tab> titleTabs = <Tab>[
    Tab(
      text: '今日实时榜',
    ),
    Tab(
      text: '昨日排行榜',
    ),
    Tab(
      text: '上周积分榜',
    ),
  ];
  @override
  void initState() {
    print('来到了B页面');
    // setState(() {});
    super.initState();
    tabController = TabController(vsync: this, length: titleTabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color.fromRGBO(26, 172, 255, 1),
          title: TabBar(
              controller: tabController,
              isScrollable: true,
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(style: BorderStyle.none)),
              tabs: titleTabs),
        ),
        body: Container(
          child: TabBarView(
            controller: tabController,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[Text('aaa'), Text('bbb'), Text('ccc')],
          ),
        ),
      ),
    );
  }
}
