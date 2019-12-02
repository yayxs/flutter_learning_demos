import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Popup Menu Usage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Popup Menu Usage'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _count = 0;
  var _tapPosition;

  void _showCustomMenu() {
    final RenderBox overlay = Overlay.of(context).context.findRenderObject();

    showMenu(
            context: context,
            items: <PopupMenuEntry<int>>[PlusMinusEntry()],
            position: RelativeRect.fromRect(
                _tapPosition & Size(40, 40), // 较小的矩形，触摸区域
                Offset.zero & overlay.size // 矩形更大，整个屏幕
                ))
        //这是处理用户选择的方式
        .then<void>((int delta) {
      // 如果用户在弹出菜单之外点击，则增量为null （导致关闭而不进行选择）
      if (delta == null) return;

      setState(() {
        _count = _count + delta;
      });
    });

    // Another option:
    //
    // final delta = await showMenu(...);
    //
    // Then process `delta` however you want.
    // Remember to make the surrounding function `async`, that is:
    //
    // void _showCustomMenu() async { ... }
  }

  void _storePosition(TapDownDetails details) {
    _tapPosition = details.globalPosition;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              // This does not give the tap position ...
              onLongPress: _showCustomMenu,

              // Have to remember it on tap-down.
              onTapDown: _storePosition,

              child: Container(
                color: Colors.amberAccent,
                padding: const EdgeInsets.all(100.0),
                child: Text(
                  '$_count',
                  style: const TextStyle(
                      fontSize: 100, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
