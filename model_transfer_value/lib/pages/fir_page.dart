import 'package:flutter/material.dart';
import 'package:model_transfer_value/pages/thi_page.dart';
import '../model/my_model.dart'; // item Model

class FirPage extends StatefulWidget {
  FirPage({Key key}) : super(key: key);

  @override
  _FirPageState createState() => _FirPageState();
}

class _FirPageState extends State<FirPage> {
  var json = {
    "code": 0,
    "msg": "成功",
    "data": {
      "count": 2,
      "list": [
        {
          "code": "111111",
          "curriculum_name": "测试8",
          "teacher_name": "admin",
          "level": "B",
          "totalscore": "53.00",
          "starttime": "2019-04-19 10:20:16",
          "curriculumid": "d8b4845cbd0c4a07b68ce8c3f3e05ff5",
          "classType": 0
        },
        {
          "code": "2222",
          "curriculum_name": "测试4",
          "teacher_name": "admin",
          "level": "C",
          "totalscore": "45",
          "starttime": "2019-04-19 13:38:00",
          "curriculumid": "a2560368ac1b4a90a9e6115b48816d1b",
          "classType": 0
        }
      ]
    }
  };
  List<DataListModel> list;
  @override
  void initState() {
    super.initState();
    setState(() {
      list = MyModel.fromJson(json).data.list;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Container(
            child: ListView.builder(
                itemCount: list.length,
                itemExtent: 50.0, //强制高度为50.0
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) =>
                                ThiPage(itemDataClassReview: list[index])),
                      );
                    },
                    child: Text('${list[index].code}'),
                  );
                })),
      );
}
