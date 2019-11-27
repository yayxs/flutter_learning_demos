import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:direct_select_flutter/generated/i18n.dart';
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
  List<String> listData = ['北京', '上海', '深圳'];
  PaddingItemController paddingItemController = PaddingItemController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('direct_select_flutter Demo'),
            ),
            body: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.yellow)),
                // height: 900,
                child: SingleChildScrollView(
                    child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.green)),
                  child: DirectSelectContainer(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        verticalDirection: VerticalDirection.down,
                        children: <Widget>[
                          SizedBox(height: 800.0),
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
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                    child: Card(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Expanded(
                                            child: Padding(
                                              child: DirectSelectList<String>(
                                                  values: listData,
                                                  defaultItemIndex: 0,
                                                  itemBuilder: (String value) =>
                                                      getDropDownMenuItem(
                                                          value),
                                                  focusedItemDecoration:
                                                      _getDslDecoration(),
                                                  onUserTappedListener: () {
                                                    print('点击了每一项--');
                                                  },
                                                  onItemSelectedListener:
                                                      (item, index, context) {
                                                    print(
                                                        '${item}============${index}');
                                                    Scaffold.of(context)
                                                        .showSnackBar(SnackBar(
                                                            content:
                                                                Text(item)));
                                                  }),
                                              padding:
                                                  EdgeInsets.only(left: 12),
                                            ),
                                          ),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(right: 8),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 1,
                                                        color: Colors.red)),
                                                child: IconButton(
                                                  onPressed: () {
                                                    print('点击了选择按钮--');
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
                  ),
                )))));
  }

  DirectSelectItem<String> getDropDownMenuItem(String value) {
    return DirectSelectItem<String>(
        itemHeight: 56,
        value: value,
        itemBuilder: (context, value) {
          return Text(value);
        });
  }

  _changeCity() {}
  _getDslDecoration() {
    return BoxDecoration(
      border: BorderDirectional(
        bottom: BorderSide(width: 1, color: Colors.black12),
        top: BorderSide(width: 1, color: Colors.black12),
      ),
    );
  }

  // List<String> _getVals() {
  //   return ['北京', '上海', '广州', '深圳'];
  // }
}
