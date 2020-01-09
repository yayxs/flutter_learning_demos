import 'package:flutter/material.dart';
import 'package:model_transfer_value/pages/thi_page.dart';
import '../model/my_oth_model.dart';

class SecPage extends StatefulWidget {
  SecPage({Key key}) : super(key: key);

  @override
  _SecPageState createState() => _SecPageState();
}

class _SecPageState extends State<SecPage> {
  List<CurriculumsListModel> list;
  var json = {
    "code": 0,
    "msg": "成功",
    "data": {
      "total": 12,
      "list": [
        {
          "date": "2020-01-07",
          "curriculums": {
            "total": 1,
            "list": [
              {
                "date": "2020-01-07",
                "curriculumTime": "2020-01-07 09:27:00 - 2020-01-07 09:33:00",
                "noteViewFlag": null,
                "reviewScore": 30.0,
                "teacherName": "系统管理员",
                "level": "D，不合格",
                "videoType": 2,
                "subject": "语文",
                "cname": "测试知识点",
                "totalscore": 9.5,
                "noteFlag": null,
                "curriculumCode": "869bba457e0c49168f82463010be27af",
                "curriculumid": "0af3792299d74efeb617163b6560454c",
                "reviewFlag": "7afc48e73cec401d987247cae6c76817",
                "commentFlag": null,
                "userCount": 2,
                "grade": null,
                "reportFlag": "0",
                "schoolName": "中庆云平台",
                "reviewid": "b41aeee8aa2742d6983bab09df00372c",
                "classType": "4"
              }
            ]
          }
        }
      ]
    }
  };
  @override
  void initState() {
    super.initState();

    setState(() {
      list = CurriculumListModel.fromJson(json).data.list[0].curriculums.list;
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
                                ThiPage(itemDataStatis: list[index])),
                      );
                    },
                    child: Text('${list[index].curriculumCode}'),
                  );
                })),
      );
}
