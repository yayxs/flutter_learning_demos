import 'package:flutter/material.dart';

class MyAlertDialog extends StatefulWidget {
  MyAlertDialog({Key key}) : super(key: key);

  @override
  _MyAlertDialogState createState() => _MyAlertDialogState();
}

class _MyAlertDialogState extends State<MyAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除当前文件吗?"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(), //关闭对话框
            ),
            FlatButton(
              child: Text("删除"),
              onPressed: () {
                // ... 执行删除操作
                Navigator.of(context).pop(true); //关闭对话框
              },
            ),
          ],
        ));
  }
}
