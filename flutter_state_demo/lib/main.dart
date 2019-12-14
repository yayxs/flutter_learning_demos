import 'package:flutter/material.dart';
import './pages/my_page_a.dart';
import './pages/my_page_b.dart';
import './pages/my_page_c.dart';
import 'package:provider/provider.dart';
import './provider/money_provider.dart';

// void main() => runApp(
//       ChangeNotifierProvider(
//         // builder: (context) => MoneyProvider(),
//         create: (context) => MoneyProvider(),
//         child: MyApp(),
//       ),
//     );

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MoneyProvider()),
        // Provider( create: (context) => MoneyProvider(),),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int money = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('我是父亲Home页'),
        ),
        body: Center(
          child: Container(
            width: 300,
            height: 300,
            decoration:
                BoxDecoration(border: Border.all(width: 3, color: Colors.red)),
            child: Center(
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => MyPageA(myCallBack)),
                      );
                    },
                    child: Text('我是跳转到大儿子A页面的按钮'),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context) => MyPageB()),
                      );
                    },
                    child: Text('我是跳转到二女儿B页面的按钮'),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(builder: (context) => MyPageC()),
                      );
                    },
                    child: Text('我是跳转到老小C页面的按钮'),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.black)),
                    width: 200,
                    height: 50,
                    child: Center(
                      child: Text('这是我没收来的钱-->$money'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void myCallBack(val) {
    print('我是父亲，这是我的收钱袋子，从孩子哪里没收的压岁钱是$val');
    setState(() {
      money = val;
    });
  }
}
