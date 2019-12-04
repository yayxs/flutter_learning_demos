import 'package:flutter/material.dart';

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
        home: CustomScrollViewPage());
  }
}

class CustomScrollViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        //AppBar，包含一个导航栏
        // SliverAppBar(
        //   pinned: true,
        //   expandedHeight: 250.0,
        //   flexibleSpace: FlexibleSpaceBar(
        //       title: const Text('Demo'),
        //       background: Image.network('https://yayxs.github.io/head.jpg')),
        // ),

        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: new SliverGrid(
            //Grid
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, //Grid按两列显示
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                //创建子widget
                return Container(
                    padding: EdgeInsets.all(5),
                    width: 200,
                    height: 200,
                    child: Image.network('https://yayxs.github.io/head.jpg'));
              },
              childCount: 27,
            ),
          ),
        ),
        //List
        new SliverFixedExtentList(
          itemExtent: 50.0,
          delegate:
              new SliverChildBuilderDelegate((BuildContext context, int index) {
            //创建列表项
            return new Container(
              alignment: Alignment.center,
              color: Colors.lightBlue[100 * (index % 9)],
              child: new Text('list item $index'),
            );
          }, childCount: 50 //50个列表项
                  ),
        ),
      ],
    );
  }
}
