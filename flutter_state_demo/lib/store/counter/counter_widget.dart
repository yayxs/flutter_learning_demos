/// 用于测试Mobx
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_state_demo/store/counter/counter.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CounterMobx counter = Counter();

    return Scaffold(
      appBar: AppBar(
        title: Text('mobx test'),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Observer(builder: (_) => Text('${counter.value}')),
              ),
              Container(
                  child: FlatButton.icon(
                icon: Icon(Icons.add),
                onPressed: counter.increment,
                label: Text("加"),
              )),
              Container(
                child: FlatButton.icon(
                  icon: Icon(Icons.remove),
                  onPressed: counter.minus,
                  label: Text("减"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
