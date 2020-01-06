import 'package:flutter/material.dart';
import 'package:flutter_state_demo/store/counter/counter_widget.dart';
import 'package:flutter_state_demo/store/todo/todo_widget.dart';

class MobxPage extends StatefulWidget {
  MobxPage({Key key}) : super(key: key);

  @override
  _MobxPageState createState() => _MobxPageState();
}

class _MobxPageState extends State<MobxPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Container(
          child: ToDoPage(),
        ),
      );
}
