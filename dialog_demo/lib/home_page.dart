import 'package:flutter/material.dart';

/// @Desc 用于显示可拖拽的对话框 弹窗
/// @Author 掘金洋小洋同学

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey[100]),
            color: Color.fromRGBO(242, 242, 242, 0.9)),
        width: 0.9 * screenWidth,
        height: 0.3 * screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        child: Text('评价',
                            style: TextStyle(fontWeight: FontWeight.bold)))
                  ]),
            ),
            // 评价 多行文本
            Container(
              child: TextField(
                controller: _controller,
                onChanged: (val) {}, // 文本框改变的时候触发的事件
                maxLines: 2, //设置此参数可以将文本框改为多行文本框
                decoration: InputDecoration(
                  hintText: '评价...', // 占位文字
                  labelText: "请输入评价的内容",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            // 取消确定
            Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            child: Text('取消'),
                            color: Colors.blue,
                            onPressed: () {/** */},
                          ),
                          FlatButton(
                            child: Text('确定'),
                            color: Colors.blue,
                            onPressed: () {/** */},
                          ),
                        ],
                      ),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
