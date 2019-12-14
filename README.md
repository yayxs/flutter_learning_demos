#  Flutter 1.12 个人练手学习小案例
---
## 1. 前言

由于在实际的开发过程中会有遇到各式各样的效果，会把一些常见的界面布局与部件使用统一放在这个仓库下，如果有遇到和你需求一致的直接拿走即可，感觉有帮助，`star`一下更好，不迷路。

 - 仓库地址：[https://github.com/yayxs/flutter_learning_demos][1]
 - star数：**3**（截至发稿）
 - 特别说明：有些效果是借助于大佬的开源代码
 - 阅读预警：有表有图有代码

## 2. 仓库文件夹
由于是每个小案例新建的一个`flutter`项目，所以克隆下仓库`cd`到文件夹`flutter run`即可。部分说明如下


| 文件夹                    | 插件 / 技术点 /第三方包      | 其他说明                                                                     |
| ------------------------- | ---------------------------- | ---------------------------------------------------------------------------- |
| cached_network_image_demo | cached_network_image: ^1.1.3 | 这个主要用来验证网络图片批量加载的缓存效果                                   |
| color_decoration_test     | 布局的修饰                   | 这个主要是验证修饰的时候`color`与`decoration: BoxDecoration()`不能够同时使用 |
| custom_scroll_view_demo   |               flutter内置api          |   这个主要是滚动效果小案例                                                          |
| dismissible_demo | flutter内置api  | 主要是测试滑动删除的效果 |
| fl_chart_scatter_demo | fl_chart | 主要是图表相关 |
| flutter_bar_chart_demo | 图表 | 这个主要是bar统计图，我在上几个专栏也提到过 |
| flutter_dio_demo | dio | 网络请求库简单试水（没有参考价值） |
| flutter_radar_chart_demo | 图表 | 这个是雷达图效果的案例 |
| flutter_select_demo | direct_select_flutter: ^1.0.5 | 这个是选取效果 |
| flutter_state_demo | 状态管理 | 我有提到要书写一篇专栏分享一下我对状态管理的理解，由于周六加班鸽了 |
| json_to_model_demo | json_to_dart | 这个是AD一个json转模型的测试 |
| loading_demo |  loading: ^1.0.2 | 这个是loading加载的效果，就是网络请求的时候 |
| long_press_delete_demo |点击  | 这个主要是用户长按某块进行删除 |
| new_provider_demo |  provider| 这个是provider新版本更新过后废弃掉builder之后的demo |
| ok_toast_demo | ok_toast | 这个主要是toast案例 |
| search_demo | flutter 内置api| 这个主要是搜索框 |
| select_demo | 选取 | 这个主要是按住拖动选择 |
| selection_callback_example_bar |  | 这个主要是图表可以点击的回调测试 |
| sliver_demo | flutter sliver | 这个主要是滚动大家族顶梁柱 |
| spider_chart_demo | 图表 | 像个蜘蛛网一样 |
| url_launcher_demo | url_launcher | 更新频次比较快的一个跳转其他app的库 |

## 3. 演示效果
### 1. dismissible_demo
**这个有必要分享一下，也是参考了一位大佬的封装，是类似于微信的左滑删除等其他操作**

 - 案例演示、
 
![](https://ftp.bmp.ovh/imgs/2019/12/4185018b8efac288.gif)

 - 核心代码
 ```dart
   Widget _createListView() {
    return ListView.builder(
      itemCount: _listData.length,
      itemBuilder: (context, index) {
        return Dismissible(
          // Key
          key: Key('key${_listData[index]}'),
          // Child
          child: ListTile(
            title: Text('${_listData[index]}'),
          ),
          onDismissed: (direction) {
            var _snackStr;
            if (direction == DismissDirection.endToStart) {
              // 从右向左  也就是删除
              _snackStr = '删除了${_listData[index]}';
            } else if (direction == DismissDirection.startToEnd) {
              _snackStr = '收藏了${_listData[index]}';
            }

            // 展示 SnackBar
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(_snackStr),
              duration: Duration(milliseconds: 400),
            ));

            // 删除后刷新列表，以达到真正的删除
            setState(() {
              _listData.removeAt(index);
            });
          },
          background: Container(
            color: Colors.green,
            // 这里使用 ListTile 因为可以快速设置左右两端的Icon
            child: ListTile(
              leading: Icon(
                Icons.bookmark,
                color: Colors.white,
              ),
            ),
          ),

          secondaryBackground: Container(
            color: Colors.red,
            // 这里使用 ListTile 因为可以快速设置左右两端的Icon
            child: ListTile(
              trailing: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),

          confirmDismiss: (direction) async {
            var _confirmContent;

            var _alertDialog;

            if (direction == DismissDirection.endToStart) {
              // 从右向左  也就是删除
              _confirmContent = '确认删除${_listData[index]}？';
              _alertDialog = _createDialog(
                _confirmContent,
                () {
                  // 展示 SnackBar
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('确认删除${_listData[index]}'),
                    duration: Duration(milliseconds: 400),
                  ));
                  Navigator.of(context).pop(true);
                },
                () {
                  // 展示 SnackBar
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('不删除${_listData[index]}'),
                    duration: Duration(milliseconds: 400),
                  ));
                  Navigator.of(context).pop(false);
                },
              );
            } else if (direction == DismissDirection.startToEnd) {
              _confirmContent = '确认收藏${_listData[index]}？';
              _alertDialog = _createDialog(
                _confirmContent,
                () {
                  // 展示 SnackBar
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('确认收藏${_listData[index]}'),
                    duration: Duration(milliseconds: 400),
                  ));
                  Navigator.of(context).pop(true);
                },
                () {
                  // 展示 SnackBar
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('不收藏${_listData[index]}'),
                    duration: Duration(milliseconds: 400),
                  ));
                  Navigator.of(context).pop(false);
                },
              );
            }

            var isDismiss = await showDialog(
                context: context,
                builder: (context) {
                  return _alertDialog;
                });
            return isDismiss;
          },
        );
      },
    );
  }

 ```
### 2. long_press_delete_demo

**这个效果是长按的时候进行删除，有个小弹窗**

- 项目演示
- ![121210.gif](https://i.loli.net/2019/12/12/Ety7VlgBzmPfTFU.gif)
- 
- 核心代码

```dart
class PlusMinusEntry extends PopupMenuEntry<int> {
 @override
 final double height = 100;

 @override
 bool represents(int n) => n == 1 || n == -1;

 @override
 PlusMinusEntryState createState() => PlusMinusEntryState();
}

class PlusMinusEntryState extends State<PlusMinusEntry> {
 void _plus1() {
   // 这是关闭弹出菜单并返回用户选择的方式。 1 删除 -1 取消
   Navigator.pop<int>(context, 1);
 }

 void _minus1() {
   Navigator.pop<int>(context, -1);
 }

 @override
 Widget build(BuildContext context) {
   return Opacity(
     child: Container(
         color: Color.fromRGBO(0, 0, 0, 0.4),
         child: Row(
           children: <Widget>[
             Expanded(child: FlatButton(onPressed: _plus1, child: Text('删除'))),
             Expanded(
                 child: FlatButton(onPressed: _minus1, child: Text('取消'))),
           ],
         )),
     opacity: 0.3,
   );
 }
}

```

### 3.new_provider_demo

**这个是 provider 废弃掉 builder 之后的用法**

- 核心用法

```dart
providers: [
       ChangeNotifierProvider(create: (_) => Counter()),
     ],
```

### 4.ok_toast_demo

**这个是一个 toast,提醒时候用**

- 项目演示
![121208.gif](https://i.loli.net/2019/12/12/jdPoIpJ5nt9eETU.gif)

### 5. scatter_plot_chart

**这个主要是画点（没什么内容）**

- 效果演示
![121207.png](https://i.loli.net/2019/12/12/O5GdrBRASwiQ6qK.png)
- 核心代码

```dart
class MyPainter extends CustomPainter {
 @override
 void paint(Canvas canvas, Size size) {
   var paint = Paint();

   _myDrawCircle(double offsetX, double offsetY, double radius, Paint paint) {
     canvas.drawCircle(
       Offset(offsetX, offsetY),
       radius,
       paint,
     );
   }

   for (int i = 0; i <= listData.length; ++i) {
     paint
       ..style = PaintingStyle.fill
       ..color = Colors.lightBlue;
     if (i == 0) {
       _myDrawCircle(50.0, 50.0, 10.0, paint);
     } else {
       _myDrawCircle(50.0 + 50 * i, 50, 10.0, paint);
     }
   }
 }

 //在实际场景中正确利用此回调可以避免重绘开销
 @override
 bool shouldRepaint(CustomPainter oldDelegate) => true;
}

```

### 6. search_demo

**这个主要是搜索的效果，并不是在 appBar 上**

- 演示效果
![121206.gif](https://i.loli.net/2019/12/12/Yo4WeyiEZB3PAVU.gif)
- 核心代码

```dart
 Widget buildTextField() => TextField(
        cursorColor: Colors.black, // 光标颜色
        // 默认设置
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
            border: InputBorder.none,
            icon: Icon(Icons.search),
            hintText: "教师姓名",
            hintStyle: new TextStyle(
                fontSize: 14, color: Color.fromARGB(50, 0, 0, 0))),
        style: new TextStyle(fontSize: 14, color: Colors.black),
      );
```

### 7. select_demo

**这个主要是选择，滑动进行选择的效果**

- 演示效果
![121205.gif](https://i.loli.net/2019/12/12/ygSuk7opVE52vAF.gif)
- 核心代码

```dart
   body: DirectSelectContainer(
        child: SingleChildScrollView(
          child: Container(
            width: 150,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(children: <Widget>[
                      Expanded(
                          child: Container(
                        decoration: _getShadowDecoration(),
                        child: Card(
                            child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.only(left: 22),
                              child: DirectSelectList<String>(
                                  values: _dataList,
                                  defaultItemIndex: selectedIndex,
                                  itemBuilder: (String value) =>
                                      getDropDownMenuItem(value),
                                  focusedItemDecoration: _getDslDecoration(),
                                  onUserTappedListener: () {
                                    _showScaffold();
                                  },
                                  // 选中之后的回调
                                  onItemSelectedListener:
                                      (item, index, context) {
                                    setState(() {
                                      selectedIndex = index;
                                    });
                                  }),
                            )),
                            Padding(
                              padding: EdgeInsets.only(right: 8),
                              child: _getDropdownIcon(),
                            )
                          ],
                        )),
                      )),
                    ]),
                  ],
                ),
              ],
            ),
          ),
        ),
```

### 8. selection_callback_example_bar

**这个主要是条形统计图**

- 效果演示
  ![121204.png](https://i.loli.net/2019/12/12/uA6rEO5zHMQ4T9e.png)
- 核心代码

```dart
 child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.blueAccent)),
            width: double.infinity,
            height: ScreenUtil.getInstance().setHeight(500),
            child: charts.BarChart(
              //通过下面获取数据传入
              ChartFlutterBean.createSampleData(),
              //配置项，以及设置触发的函数
              selectionModels: [
                charts.SelectionModelConfig(
                  type: charts.SelectionModelType.info,
                  changedListener: _onSelectionChanged,
                )
              ],
            ),
          ),
          _showMask(flag, 4.0)
        ],
```

### 9. sliver_demo

**这个主要是滑动效果，Sliver,这个滑动效果，比 ta 其他的兄弟家族要顺滑很多**

- 没有使用第三方包
- 演示效果
![121203.gif](https://i.loli.net/2019/12/12/QqJc91wxhHVapXd.gif)
- 核心代码

```dart
SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: new SliverGrid(
            //Grid
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, //Grid按两列显示
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                //创建子widget
                return Container(
                    padding: EdgeInsets.all(5),
                    width: 200,
                    height: 200,
                    child: Image.network('https://yayxs.github.io/head.jpg'));
              },
              childCount: 27,
            ),
          ),
        ),
        //List
        new SliverFixedExtentList(
          itemExtent: 50.0,
          delegate:
              new SliverChildBuilderDelegate((BuildContext context, int index) {
            //创建列表项
            return new Container(
              alignment: Alignment.center,
              color: Colors.lightBlue[100 * (index % 9)],
              child: new Text('list item $index'),
            );
          }, childCount: 50 //50个列表项
                  ),
        ),
```

### 10. spider_chart_demo

**这个主要是图表相关的,类似于一个蜘蛛一样的雷达图**

- 第三方包 spider_chart: ^0.1.4
- 演示效果
![121202.png](https://i.loli.net/2019/12/12/pi59tKjysXWQd2h.png)
- 核心代码

```dart
  child: Container(
          width: 300,
          height: 300,
          child: SpiderChart(
              data: [49.98, 24.4, 8.2, 41.47, 15.29],
              maxValue: 100,
              colors: <Color>[
                Colors.red,
                Colors.orange,
                Colors.green,
                Colors.yellow,
                Colors.indigo,
              ],
              labels: <String>[
                "吃",
                "喝",
                "玩",
                "乐",
                "学",
              ]),
        ),
```

### 11. url_launcher_demo

**这个主要是外部连接到其他 app,也就是说在 Flutter 应用内跳转到浏览器，打电话，发短信等**

- 第三方包 url_launcher: ^5.2.7
- 演示效果
  ![121201.gif](https://i.loli.net/2019/12/12/zHKtN4GoIFqJfRl.gif)
- 核心代码

```dart
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
```
## 4. 写在最后
很高兴你能看到这儿，我也是今天看了下，`Flutter.dev`官网，其版本更新到1.12了，希望加油，最后也期待都有收获。我还想对你说

 - [Flutter 中恨不得直接贴来的布局效果][2]
 - [你有哪些写了Flutter 之后才知道的事儿][3]
 - [Flutter Packages 第三方包把玩Demos聚合地][4]
![121213.png](https://i.loli.net/2019/12/12/3yCuYZgx9a51dJO.png)
----------
Although it is over, thank you


  [1]: https://github.com/yayxs/flutter_learning_demos
  [2]: https://juejin.im/post/5de8eb98e51d45582972f809
  [3]: https://juejin.im/post/5de646836fb9a0160671477a
  [4]: https://juejin.im/post/5ddfb62951882506db5cb0e8