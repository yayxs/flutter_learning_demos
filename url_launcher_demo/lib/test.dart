import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Test extends StatefulWidget {
  Test({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        RaisedButton(child: Text('我是一个按钮'), onPressed: _launchURL)
      ],
    ));
  }

  _launchURL() async {
    String url = 'https://www.baidu.com/s?wd=';
    String keyWords = '中';
    String urlParams = '$url$keyWords';
    print('${urlParams}');
    if (await canLaunch(urlParams)) {
      await launch(urlParams);
    } else {
      throw 'Could not launch $url';
    }
  }
}
