import 'package:dialog_demo/draggable_widget.dart';
import 'package:dialog_demo/my_alert_dialog.dart';
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
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Offset offset = Offset(0.0, 0.0);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Column(
          children: <Widget>[
            Container(
              child: RaisedButton(
                onPressed: () async {
                  await _showDialog();
                },
                child: Text('我是一个按钮'),
              ),
            ),
          ],
        ),
      );

  Future<bool> _showDialog() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return Stack(
          children: <Widget>[
            Positioned(
              left: offset.dx,
              top: offset.dy,
              child: Draggable(
                  onDraggableCanceled: (Velocity velocity, Offset offset) {
                    //通过 setState() 来改变
                    setState(() {
                      this.offset = offset;
                    });
                  },
                  child: Container(
                    child: _myDialog(),
                  ),
                  feedback: Container(
                    child: _myDialog(),
                  )),
            )
          ],
        );
      },
    );
  }

  Widget _myDialog() => Container(
        child: AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除当前文件吗?"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                //关闭对话框并返回true
                Navigator.of(context).pop(true);
              },
            ),
          ],
        ),
      );
}
