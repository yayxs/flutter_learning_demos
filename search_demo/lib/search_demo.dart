import 'package:flutter/material.dart';

class MySearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // 修饰搜索框, 白色背景与圆角
      width: 200,
      height: 36,
      decoration: new BoxDecoration(
        color: Colors.grey[200],
        borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      child: buildTextField(),
    );
  }

  Widget buildTextField() => TextField(
        cursorColor: Colors.black, // 光标颜色
        // 默认设置
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
            border: InputBorder.none,
            icon: Icon(Icons.search),
            hintText: "教师姓名",
            hintStyle: new TextStyle(
                fontSize: 14, color: Color.fromARGB(50, 0, 0, 0))),
        style: new TextStyle(fontSize: 14, color: Colors.black),
      );
}
