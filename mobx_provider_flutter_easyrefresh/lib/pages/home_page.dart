import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
  HomeStore _store;
  EasyRefreshController _controller;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();

    _store = HomeStore();
    _store.getData(); // 获取数据
    print('<<<<<<<${_store.loading}');
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Observer(builder: (_) {
          var resData = _store.obj?.data;
          return resData == null
              ? Text("<${resData}")
              : EasyRefresh(
                  enableControlFinishRefresh: false,
                  enableControlFinishLoad: false,
                  child: _store.loading
                      ? Align(
                          child: Text("${_store.loading}"),
                        )
                      : ListView.builder(
                          itemCount: _store.obj.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              child: Text('${_store.obj.data[index].author}'),
                            );
                          },
                        ),
                  onRefresh: () async {
                    _store.changePage(1);
                    _store.getData();
                    if (!_store.loading) {
                      _controller.finishRefresh(success: true);
                    }
                  },
                  // 如果超过了总的条数就不要拉刷新了
                  onLoad:
                      (_store.obj?.totalElements ?? 0 / _store.params['size'])
                                  .ceil() >
                              _store.params['index']
                          ? () async {
                              _store.changePage(_store.params['index'] + 1);
                              _store.getData();
                              if (!_store.loading) {
                                _controller.finishLoad(noMore: true);
                              }
                            }
                          : null,
                );
        }));
  }
}
