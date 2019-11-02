import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

class DemoPage extends StatefulWidget {
  DemoPage({Key key}) : super(key: key);

  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  // 声明controller
  TextEditingController _unameController = TextEditingController();
  //
  String textCon = 'haha';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('demo'),
        ),
        body: Column(
          children: <Widget>[
            TextField(
              controller: _unameController,
              decoration: InputDecoration(contentPadding: EdgeInsets.all(20.0)),
            ),
            RaisedButton(
              onPressed: () {
                _fetchData();
              },
              child: Text('sdasdsa'),
            ),
            Text(
              textCon,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }

//
  void _fetchData() {
    print('sssssssssssssssssssssssssssssssssssss');
    getHttp().then((res) {
      print(res);

      setState(() {
        textCon = res;
      });
    });
  }

  //请求
  Future getHttp() async {
    try {
      Response response;
      response = await Dio().get('https://jsonplaceholder.typicode.com/users');
      return response;
    } catch (e) {
      return print(e);
    }
  }
}
