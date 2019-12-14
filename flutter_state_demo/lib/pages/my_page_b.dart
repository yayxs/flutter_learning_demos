import 'package:flutter/material.dart';
import '../provider/money_provider.dart';
import 'package:provider/provider.dart';
// class MyPageB extends StatefulWidget {
//   MyPageB({Key key}) : super(key: key);

//   @override
//   _MyPageBState createState() => _MyPageBState();
// }

// class _MyPageBState extends State<MyPageB> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('B页面'),
//       ),
//       body: Container(
//         child: Center(
//           child: Column(),
//         ),
//       ),
//     );
//   }
// }

class MyPageB extends StatelessWidget {
  const MyPageB({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var moneyFromState =
        Provider.of<MoneyProvider>(context, listen: false).money;
    return Scaffold(
        appBar: AppBar(),
        body: Container(
            child: Column(
          children: <Widget>[
            Text('$moneyFromState'),
            Consumer<MoneyProvider>(
              builder: (context, state, child) {
                return Column(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        state.addMoneyAndShowOthers();
                      },
                      child: Text('我是一个按钮'),
                    ),
                    Text('${state.money}')
                  ],
                );
              },
            ),
          ],
        )));
  }
}
