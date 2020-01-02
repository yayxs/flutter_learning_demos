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

  ScrollController _controller;
  List _tabs = ["语文语文", "数学数学", "英语英语", "化学化学", '物理物理'];

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: _tabs.length, vsync: this);

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
  Widget build(BuildContext context) => DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        body: NestedScrollView(
            body: TabBarView(
              controller: _tabController,
              children: <Widget>[
                SafeArea(
                  top: false,
                  bottom: false,
                  child: Builder(
                    builder: (BuildContext context) => CustomScrollView(
                      key: PageStorageKey<String>('语文语文'),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                          // This is the flip side of the SliverOverlapAbsorber above.
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                        ),
                        SliverPadding(
                          padding: EdgeInsets.all(8),
                          sliver: SliverFixedExtentList(
                            itemExtent: 40,
                            delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                              return Text('SASA');
                            }, childCount: 32),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SafeArea(
                  top: false,
                  bottom: false,
                  child: Builder(
                    builder: (BuildContext context) => CustomScrollView(
                      key: PageStorageKey<String>('数学数学'),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                          // This is the flip side of the SliverOverlapAbsorber above.
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                        ),
                        SliverToBoxAdapter(
                          child: Container(
                            child: Text('数学数学'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SafeArea(
                  top: false,
                  bottom: false,
                  child: Builder(
                    builder: (BuildContext context) => CustomScrollView(
                      key: PageStorageKey<String>('英语英语'),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                          // This is the flip side of the SliverOverlapAbsorber above.
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                        ),
                        SliverToBoxAdapter(
                          child: Text('sas'),
                        )
                      ],
                    ),
                  ),
                ),
                SafeArea(
                  top: false,
                  bottom: false,
                  child: Builder(
                    builder: (BuildContext context) => CustomScrollView(
                      key: PageStorageKey<String>('化学化学'),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                          // This is the flip side of the SliverOverlapAbsorber above.
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                        ),
                        SliverToBoxAdapter(
                          child: Text('sas'),
                        )
                      ],
                    ),
                  ),
                ),
                SafeArea(
                  top: false,
                  bottom: false,
                  child: Builder(
                    builder: (BuildContext context) => CustomScrollView(
                      key: PageStorageKey<String>('物理物理'),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                          // This is the flip side of the SliverOverlapAbsorber above.
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                        ),
                        SliverToBoxAdapter(
                          child: Text('sas'),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            controller: _controller,
            // 头部的内容
            headerSliverBuilder: (BuildContext context,
                    bool innerBoxIsScrolled) =>
                <Widget>[
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    child: SliverAppBar(
                      backgroundColor: Colors.white,
                      title:
                          Text('分析分析', style: TextStyle(color: Colors.black)),
                      pinned: true,
                      expandedHeight: 120.0,
                      forceElevated: innerBoxIsScrolled,
                    ),
                  ),

                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _SliverPersistentHeaderDelegate(TabBar(
                        controller: _tabController,
                        labelColor: Colors.blue,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(
                              icon: Icon(Icons.home),
                              child: Container(
                                color: Colors.grey,
                                child: Text('sas'),
                              )),
                          Tab(icon: Icon(Icons.person), text: "tab2"),
                          Tab(icon: Icon(Icons.person), text: "tab2"),
                          Tab(icon: Icon(Icons.person), text: "tab2"),
                          Tab(icon: Icon(Icons.person), text: "tab2"),
                        ])),
                  )
                  // SliverOverlapAbsorber(
                  //   handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                  //       context),
                  //   child: SliverAppBar(
                  //     backgroundColor: Colors.white,
                  //     title:
                  //         Text('分析分析', style: TextStyle(color: Colors.black)),
                  //     pinned: true,
                  //     expandedHeight: 120.0,
                  //     forceElevated: innerBoxIsScrolled,
                  //     bottom: TabBar(
                  //         unselectedLabelStyle:
                  //             TextStyle(fontWeight: FontWeight.bold),
                  //         unselectedLabelColor: Colors.blue, // 未选中的颜色
                  //         labelPadding: EdgeInsets.all(10),
                  //         labelStyle: TextStyle(fontSize: 20),
                  //         labelColor: Colors.black, // 字体的颜色
                  //         indicatorSize: TabBarIndicatorSize.label,
                  //         // indicatorPadding: EdgeInsets.all(20),
                  //         indicatorWeight: 2, // 下划线宽度
                  //         indicatorColor: Colors.red, // 下划线的颜色
                  //         isScrollable: true,
                  //         controller: _tabController,
                  //         tabs: _tabs
                  //             .map((name) => Tab(
                  //                   text: name,
                  //                 ))
                  //             .toList()),
                  //   ),
                  // )
                ]),
      ));
}

class _SliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverPersistentHeaderDelegate(this._tabBar);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabBar,
      color: Colors.grey[100],
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
