import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

final List listData = [
  {
    "date": "2019-12-05",
    "list": [
      {
        "pictureURL": "https://yayxs.github.io/head.jpg",
      },
      {
        "pictureURL": "https://yayxs.github.io/head.jpg",
      },
      {
        "pictureURL": "https://yayxs.github.io/head.jpg",
      },
      {
        "pictureURL": "https://yayxs.github.io/head.jpg",
      },
      {
        "pictureURL": "https://yayxs.github.io/head.jpg",
      },
      {
        "pictureURL": "https://yayxs.github.io/head.jpg",
      }
    ]
  },
  {
    "date": "2019-12-04",
    "list": [
      {
        "pictureURL": "https://yayxs.github.io/head.jpg",
      }
    ]
  },
];

class AllPicPage extends StatefulWidget {
  AllPicPage({Key key}) : super(key: key);

  @override
  _AllPicPageState createState() => _AllPicPageState();
}

class _AllPicPageState extends State<AllPicPage> {
  ScrollController _controller = new ScrollController();

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) => Container(
            child: Container(
              child: Column(
                children: <Widget>[
                  _dateTitle(listData[index]['date']),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.red)),
                      child: Wrap(
                          spacing: 8.0, // 主轴(水平)方向间距
                          runSpacing: 4.0, // 纵轴（垂直）方向间距
                          alignment: WrapAlignment.spaceEvenly, //沿主轴方向居中
                          children: (listData[index]['list'])
                              .map<Widget>((item) => Container(
                                    child: _onePic(item['pictureURL']),
                                  ))
                              .toList())),
                ],
              ),
            ),
          ),
          childCount: listData.length,
        ))
      ],
    );
  }

  // 标题
  Widget _dateTitle(String date) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Text(
          date,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  // 每张图片
  Widget _onePic(url) {
    return Container(
      width: 200,
      height: 200,
      padding: EdgeInsets.all(5),
      child: CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
