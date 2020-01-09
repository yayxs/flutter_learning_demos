import 'package:mobx/mobx.dart';

import 'package:dio/dio.dart';
import 'package:mobx_provider_flutter_easyrefresh/api/http.dart';
import '../model/home_model.dart'; // 首页的数据
import '../model/home_model1.dart';
// Include generated file
part 'home_store.g.dart';

// This is the class used by rest of your codebase
class HomeStore = _HomeStore with _$HomeStore;

// The store-class
abstract class _HomeStore with Store {
  // @observable
  // bool tile = false;
  // 推荐列表

  // 热门图书
  // @observable
  // CommonDataList hotBooksData;
  // 最受欢迎
  // @observable
  // CommonDataList popularBookData;
  // 版本信息
  // @observable
  // VersionData versionData;

  // @action
  // void setTile(String key, dynamic value) => tile = value;

  // @action
  // num counter() => this.count++;
  @observable
  bool loading = true;
  @observable
  List<DataX> data;
  @observable
  Data obj;
  @observable
  Map<String, int> params = {'index': 1, 'size': 2};
  // 修改页面参数
  @action
  void changePage(int index) {
    params['index'] = index;
  }

  // 首页数据
  @action
  Future getData() async {
    Response response = await
        // Future.wait([
        // 获取推荐
        HttpRequest().dio.get('/api/book_info/recommend', queryParameters: {
      "index": params['index'],
      "size": params['size']
    });
    print('<<<<<<<<<<${response.data['data']['data']}');
    // data = HomeModel.fromJson(response.data).data.data;
    // 最受欢迎
    // HttpRequest().dio.get('/api/book_info/popular_book?',
    //     queryParameters: {"index": 1, "size": 10}),
    // // 最受欢迎
    // HttpRequest().dio.get('/api/book_info/hot_book',
    //     queryParameters: {"index": 1, "size": 10}),
    // ]);
    if (obj == null || params['index'] == 1) {
      obj = HomeModel.fromJson(response.data).data;
    } else {
      obj.data.addAll(HomeModel.fromJson(response.data).data.data);
    }
    // if (mapData == null || params['index'] == 1) {
    //   print('${mapData}>>>>>>>'); // 空值
    //   mapData = CommonDataList.fromJson(response.data['data']);
    //   print('${mapData.data}>>>>>>>'); // 真正的数组

    // } else {
    //   print('${CommonDataList.fromJson(response.data['data']).data}');
    //   mapData.data.addAll(CommonDataList.fromJson(response.data['data']).data);
    // }
    // recommendData = CommonDataList.fromJson(response[0].data['data']);
    // popularBookData = CommonDataList.fromJson(response[1].data['data']);
    // hotBooksData = CommonDataList.fromJson(response[2].data['data']);

    loading = false;
  }

  // 获取版本更新通知
  @action
  Future getVersion() async {
    // Response response = await HttpRequest().dio.get('/api/public/version');
    // versionData = VersionData.fromJson(response.data);
  }
}

// HomeStore $store = HomeStore();
