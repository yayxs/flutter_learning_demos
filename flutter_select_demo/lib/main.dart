import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:direct_select_flutter/generated/i18n.dart';
import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:direct_select_flutter/direct_select_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> listData = ['北京', '上海', '深圳']; // 初始化列表数据
  int selectedIndex = 0; // 初始化默认索引
  final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey(); // 初始化Scaffold GlobalKey
  // PaddingItemController paddingItemController = PaddingItemController();
  // 创建DirectSelectList并使用itemBuilder填充项目

  @override
  Widget build(BuildContext context) {
    final dsl = DirectSelectList<String>(
        values: listData, // 数据源
        defaultItemIndex: selectedIndex, // 默认索引
        itemBuilder: (String value) => getDropDownMenuItem(value),
        focusedItemDecoration: _getDslDecoration(),
        onUserTappedListener: () {
          _showScaffold();
        },
        onItemSelectedListener: (item, index, context) {
          setState(() {
            selectedIndex = index;
          });
        });

    return MaterialApp(
        home: Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text('direct_select_flutter Demo'),
            ),
            body: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.yellow)),
              // height: 900,
              child: DirectSelectContainer(
                  // SingleChildScrollView 防止滚动溢出屏幕
                  child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    verticalDirection: VerticalDirection.down,
                    children: <Widget>[
                      SizedBox(height: 100.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Container(
                              alignment: AlignmentDirectional.centerStart,
                              margin: EdgeInsets.only(left: 4),
                              child: Text("City"),
                            ),
                            Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                child: Card(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          child: dsl, //
                                          padding: EdgeInsets.only(left: 12),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(right: 8),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.red)),
                                            child: IconButton(
                                              onPressed: () {
                                                print('点击了选择按钮--');
                                                _showScaffold();
                                              },
                                              icon: Icon(Icons.unfold_more),
                                            ),
                                          ))
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
            )));
  }

  // 每一条目
  DirectSelectItem<String> getDropDownMenuItem(String value) {
    return DirectSelectItem<String>(
        itemHeight: 56,
        value: value,
        itemBuilder: (context, value) {
          return Text(value);
        });
  }

  /// 展示
  _showScaffold() {
    final snackBar = SnackBar(content: Text('按住并拖动才会显示，按钮的点击事件不会显示'));
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  /// 展示showSnackBar
  // _showSnackBar(context, item) {
  //   Scaffold.of(context).showSnackBar(SnackBar(content: Text(item)));
  // }

  /// 构建装饰
  _getDslDecoration() {
    return BoxDecoration(
      border: BorderDirectional(
        bottom: BorderSide(width: 1, color: Colors.black12),
        top: BorderSide(width: 1, color: Colors.black12),
      ),
    );
  }
}
