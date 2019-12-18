import 'package:flutter/material.dart';
import './my_home_page.dart';

class ProStatisPage extends StatefulWidget {
  @override
  _ProStatisPageState createState() => _ProStatisPageState();
}

class _ProStatisPageState extends State<ProStatisPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final initList = ['听评课统计', '资源统计'];
  @override
  void initState() {
    super.initState();
    this._tabController = new TabController(vsync: this, length: 2);
    // 监听函数
    this._tabController.addListener(() {
      // print(this._tabController.toString());
      // print(this._tabController.index);
      // print(this._tabController.length);
      // print(this._tabController.previousIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: initList.length,
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: TabBar(
                indicatorWeight: 2.0,
                indicatorSize: TabBarIndicatorSize.tab,
                labelPadding: EdgeInsets.all(15),
                labelColor: Color.fromRGBO(40, 114, 255, 1),
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelColor: Colors.black,
                // unselectedLabelStyle:,
                //设置为false tab 将平分宽度，为true tab 将会自适应宽度
                isScrollable: false,
                controller: this._tabController,
                tabs: _getTabs())),
        body: TabBarView(
          controller: this._tabController,
          children: <Widget>[MyHomePage(), Text('sas')],
        ),
      ),
    );
  }

  // 顶部tabBar
  List<Widget> _getTabs() => initList
      .map<Widget>((item) => Container(
            child: Text(
              item,
              // style: TextStyle(
              //     color: Color.fromRGBO(40, 114, 255, 1),
              //     fontWeight: FontWeight.bold),
            ),
          ))
      .toList();
}
