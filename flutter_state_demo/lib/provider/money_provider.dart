import 'package:flutter/material.dart';

// MoneyProvider 这个类继承自发布者
class MoneyProvider extends ChangeNotifier {
  /// 这里就不说是数据了咱们暂且称为私有数据，并_开头命名
  num _money = 0;
  //  把数据get 一下，类似于暴露
  num get money => _money;
  // 定义一个没有返回值的方法，主要是用来增加自己的压岁钱并展示给其他家里人
  void addMoneyAndShowOthers() {
    _money = _money + 1;
    // 该调用告诉正在侦听此模型的小部件进行重建。
    notifyListeners();
  }
}
