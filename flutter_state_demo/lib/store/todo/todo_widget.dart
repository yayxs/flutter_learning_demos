/// 页面
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_state_demo/store/todo/todo_store.dart';
import 'package:provider/provider.dart';

class ToDoPage extends StatelessWidget {
  const ToDoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Consumer<TodoStore>(
        builder: (_, store, __) => Observer(
            builder: (_) => Column(
                  children: <Widget>[
                    Container(
                      child: Text('${store.imgUrl}'),
                    ),
                    Container(
                      child: FlatButton(
                        child: Text('改变url'),
                        onPressed: () {
                          store.setImgUrl('121212');
                        },
                      ),
                    )
                  ],
                )),
      );
}
