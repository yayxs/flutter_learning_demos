import 'package:mobx/mobx.dart';

part 'todo_store.g.dart';

class TodoStore = _TodoStore with _$TodoStore;

abstract class _TodoStore with Store {
  @observable
  List todoLost = [];
  @observable
  String imgUrl = 'https://yayxs.github.io/head.jpg';

  @action
  void addTodo() {}
  @action
  void setImgUrl(String url) {
    imgUrl = url;
  }
}
