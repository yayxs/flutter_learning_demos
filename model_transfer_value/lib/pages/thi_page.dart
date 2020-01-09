import 'package:flutter/material.dart';
import 'package:model_transfer_value/model/my_model.dart';

class ThiPage extends StatefulWidget {
  final DataListModel itemDataClassReview; // 从评课而来
  final itemDataStatis; // 从统计而来

  ThiPage({Key key, this.itemDataClassReview, this.itemDataStatis})
      : super(key: key);

  @override
  _ThiPageState createState() => _ThiPageState();
}

class _ThiPageState extends State<ThiPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Container(
            child: Column(
          children: <Widget>[
            Container(
              child: Text('第三个页面'),
            ),
            Container(
              child: Text('${widget.itemDataStatis}'),
            )
          ],
        )),
      );
}
