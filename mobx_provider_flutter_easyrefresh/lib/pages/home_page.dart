import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:mobx_provider_flutter_easyrefresh/stores/home_store.dart';
import 'package:provider/provider.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Text('sas'),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeStore homeStore;
  EasyRefreshController _controller;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();

    Future(() {
      homeStore = Provider.of<HomeStore>(context, listen: false);
      homeStore.getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text('sas'),
    );
  }

  // @override
  // bool get wantKeepAlive => true;
}
